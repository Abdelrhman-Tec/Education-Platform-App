import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final Color progressBarColor;
  final Color controlsColor;

  const ProfessionalVideoPlayer({
    super.key,
    required this.videoUrl,
    this.thumbnailUrl,
    this.progressBarColor = Colors.blue,
    this.controlsColor = Colors.white,
  });

  @override
  State<ProfessionalVideoPlayer> createState() =>
      _ProfessionalVideoPlayerState();
}

class _ProfessionalVideoPlayerState extends State<ProfessionalVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isMuted = false;
  bool _isFullScreen = false;
  double _playbackSpeed = 1.0;
  bool _showControls = true;
  Timer? _hideTimer;
  bool _videoStarted = false;
  bool _isDisposed = false;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;
  bool _isBuffering = false;
  bool _isDragging = false;
  double _dragValue = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() async {
    try {
      setState(() {
        _isLoading = true;
        _hasError = false;
        _errorMessage = null;
      });

      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      _controller.addListener(_controllerListener);
      _controller.addListener(_videoListener);

      await _controller.initialize();

      if (_isDisposed) {
        _controller.dispose();
        return;
      }

      _controller.setLooping(true);

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      log('Error initializing video controller: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
          _errorMessage = _getUserFriendlyError(e);
        });
      }
    }
  }

  String _getUserFriendlyError(dynamic error) {
    final errorStr = error.toString();

    if (errorStr.contains('Cleartext') || errorStr.contains('cleartext')) {
      return 'يرجى تفعيل HTTP في إعدادات Android للتطوير';
    } else if (errorStr.contains('404') || errorStr.contains('Not Found')) {
      return 'لم يتم العثور على الفيديو';
    } else if (errorStr.contains('Network') || errorStr.contains('Socket')) {
      return 'مشكلة في الاتصال بالشبكة';
    } else {
      return 'حدث خطأ في تحميل الفيديو';
    }
  }

  void _controllerListener() {
    if (_isDisposed || !mounted) return;

    final isPlaying = _controller.value.isPlaying;
    final isBuffering = _controller.value.isBuffering;

    if (isPlaying != _isPlaying && !_isDragging) {
      setState(() => _isPlaying = isPlaying);
    }

    if (isBuffering != _isBuffering) {
      setState(() => _isBuffering = isBuffering);
    }
  }

  void _videoListener() {
    if (_isDisposed || !mounted) return;

    if (_controller.value.hasError) {
      log('Video error: ${_controller.value.errorDescription}');
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = _controller.value.errorDescription;
        });
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _hideTimer?.cancel();
    _controller.removeListener(_controllerListener);
    _controller.removeListener(_videoListener);
    _controller.dispose();
    _exitFullScreen();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isDisposed || !mounted || _hasError) return;

    try {
      if (!_videoStarted) {
        setState(() => _videoStarted = true);
      }

      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _startHideTimer();
    } catch (e) {
      log('Error in togglePlayPause: $e');
      setState(() {
        _hasError = true;
        _errorMessage = e.toString();
      });
    }
  }

  void _toggleMute() {
    if (_isDisposed || !mounted) return;

    _controller.setVolume(_isMuted ? 1 : 0);
    setState(() => _isMuted = !_isMuted);
    _startHideTimer();
  }

  void _changeSpeed(double speed) {
    if (_isDisposed || !mounted) return;

    _controller.setPlaybackSpeed(speed);
    setState(() => _playbackSpeed = speed);
    _startHideTimer();
  }

  void _toggleFullScreen() {
    if (_isDisposed || !mounted) return;

    setState(() => _isFullScreen = !_isFullScreen);
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      _exitFullScreen();
    }
  }

  void _exitFullScreen() {
    if (_isDisposed) return;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (mounted && !_isDisposed) setState(() => _isFullScreen = false);
  }

  void _startHideTimer() {
    if (_isDisposed || !mounted) return;

    _hideTimer?.cancel();
    setState(() => _showControls = true);

    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (!_isDisposed && mounted && _isPlaying && !_isDragging) {
        setState(() => _showControls = false);
      }
    });
  }

  void _retryVideo() {
    setState(() {
      _hasError = false;
      _errorMessage = null;
      _isLoading = true;
    });
    _initializeController();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$minutes:$seconds";
  }

  void _onDragStart(double value) {
    if (_isDisposed || !mounted) return;

    setState(() {
      _isDragging = true;
      _dragValue = value;
    });
    _hideTimer?.cancel();
  }

  void _onDragUpdate(double value) {
    if (_isDisposed || !mounted) return;

    setState(() {
      _dragValue = value;
    });
  }

  void _onDragEnd(double value) {
    if (_isDisposed || !mounted) return;

    final duration = _controller.value.duration;

    final newPosition = value * duration.inMilliseconds;
    _controller.seekTo(Duration(milliseconds: newPosition.round()));

    setState(() {
      _isDragging = false;
      _dragValue = 0.0;
    });

    _startHideTimer();
  }

  double _getCurrentProgress() {
    if (_isDragging) {
      return _dragValue;
    }

    final duration = _controller.value.duration;
    final position = _controller.value.position;

    if (duration.inMilliseconds == 0) {
      return 0.0;
    }

    return position.inMilliseconds / duration.inMilliseconds;
  }

  Duration _getCurrentPosition() {
    if (_isDragging) {
      final duration = _controller.value.duration;
      return Duration(
        milliseconds: (_dragValue * duration.inMilliseconds).round(),
      );
    }

    return _controller.value.position;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AspectRatio(
        aspectRatio: _controller.value.isInitialized && !_hasError
            ? _controller.value.aspectRatio
            : 16 / 9,
        child: GestureDetector(
          onTap: () {
            if (_videoStarted) {
              setState(() => _showControls = !_showControls);
              if (_showControls) _startHideTimer();
            } else {
              _togglePlayPause();
            }
          },
          onDoubleTap: _togglePlayPause,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // عرض الصورة المصغرة قبل بدء الفيديو
              if (!_videoStarted && widget.thumbnailUrl != null && !_hasError)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox.expand(
                    child: widget.thumbnailUrl!.startsWith('http')
                        ? Image.network(
                            widget.thumbnailUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: Icon(
                                  Icons.play_circle_filled,
                                  size: 80.r,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              );
                            },
                          )
                        : Image.asset(
                            widget.thumbnailUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: Icon(
                                  Icons.play_circle_filled,
                                  size: 80.r,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              );
                            },
                          ),
                  ),
                ),

              // عرض الفيديو
              if (_videoStarted &&
                  _controller.value.isInitialized &&
                  !_hasError)
                VideoPlayer(_controller),

              // مؤشر التحميل والتخزين المؤقت
              if (_isLoading || _isBuffering)
                Container(
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.progressBarColor,
                        ),
                        strokeWidth: 3.r,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        _isBuffering ? 'جاري التحميل...' : 'جاري الإعداد...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

              // عرض رسالة الخطأ
              if (_hasError)
                Container(
                  color: Colors.black87,
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 50.r,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        _errorMessage ?? 'حدث خطأ في تحميل الفيديو',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        onPressed: _retryVideo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.progressBarColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'إعادة المحاولة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // زر التشغيل الكبير في المنتصف
              if (!_isPlaying &&
                  _controller.value.isInitialized &&
                  !_hasError &&
                  !_isLoading &&
                  _videoStarted)
                AnimatedOpacity(
                  opacity: _showControls ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: _togglePlayPause,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(16.r),
                      child: Icon(
                        Icons.play_arrow,
                        size: 60.r,
                        color: widget.controlsColor,
                      ),
                    ),
                  ),
                ),

              // زر التشغيل على الصورة المصغرة
              if (!_videoStarted && !_hasError && !_isLoading)
                GestureDetector(
                  onTap: _togglePlayPause,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(20.r),
                    child: Icon(
                      Icons.play_arrow,
                      size: 50.r,
                      color: widget.controlsColor,
                    ),
                  ),
                ),

              // عناصر التحكم
              if (_videoStarted &&
                  _showControls &&
                  _controller.value.isInitialized &&
                  !_hasError &&
                  !_isLoading)
                _buildControlsOverlay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlsOverlay() {
    final progress = _getCurrentProgress();
    final currentPosition = _getCurrentPosition();
    final totalDuration = _controller.value.duration;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
        ),
        child: Column(
          children: [
            // زر الخروج من الشاشة الكاملة في الأعلى
            if (_isFullScreen)
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 16.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: widget.controlsColor,
                      size: 28.r,
                    ),
                    onPressed: _toggleFullScreen,
                  ),
                ),
              ),

            // شريط التقدم السلس - تم تعديل المحاذاة لليمين
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  // الوقت الحالي على اليمين
                  Text(
                    _formatDuration(currentPosition),
                    style: TextStyle(
                      color: widget.controlsColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // شريط التقدم في المنتصف
                  Expanded(
                    child: GestureDetector(
                      onHorizontalDragStart: (details) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        final localPosition = renderBox.globalToLocal(
                          details.globalPosition,
                        );
                        final relativePosition =
                            localPosition.dx / renderBox.size.width;
                        _onDragStart(relativePosition.clamp(0.0, 1.0));
                      },
                      onHorizontalDragUpdate: (details) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        final localPosition = renderBox.globalToLocal(
                          details.globalPosition,
                        );
                        final relativePosition =
                            localPosition.dx / renderBox.size.width;
                        _onDragUpdate(relativePosition.clamp(0.0, 1.0));
                      },
                      onHorizontalDragEnd: (details) {
                        _onDragEnd(progress);
                      },
                      onTapDown: (details) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        final localPosition = renderBox.globalToLocal(
                          details.globalPosition,
                        );
                        final relativePosition =
                            localPosition.dx / renderBox.size.width;
                        _onDragStart(relativePosition.clamp(0.0, 1.0));
                        _onDragEnd(relativePosition.clamp(0.0, 1.0));
                      },
                      child: SizedBox(
                        height: 30.h,
                        child: Stack(
                          children: [
                            // خلفية شريط التقدم
                            Container(
                              height: 4.h,
                              margin: EdgeInsets.symmetric(vertical: 13.h),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            // الجزء المكتمل من شريط التقدم
                            AnimatedContainer(
                              duration: _isDragging
                                  ? Duration.zero
                                  : Duration(milliseconds: 100),
                              height: 4.h,
                              margin: EdgeInsets.symmetric(vertical: 13.h),
                              width:
                                  progress *
                                  (MediaQuery.of(context).size.width - 32.w),
                              decoration: BoxDecoration(
                                color: widget.progressBarColor,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            // مؤشر السحب
                            AnimatedPositioned(
                              duration: _isDragging
                                  ? Duration.zero
                                  : Duration(milliseconds: 600),
                              right:
                                  progress *
                                  (MediaQuery.of(context).size.width -
                                      32.w -
                                      12.r),
                              child: Container(
                                width: 12.r,
                                height: 12.r,
                                decoration: BoxDecoration(
                                  color: widget.progressBarColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 2.r),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // الوقت الكلي على اليسار
                  Text(
                    _formatDuration(totalDuration),
                    style: TextStyle(
                      color: widget.controlsColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // أزرار التحكم - تم تعديل المحاذاة لليمين
            Container(
              color: Colors.black.withOpacity(0.4),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // الجانب الأيسر: الشاشة الكاملة
                  IconButton(
                    icon: Icon(
                      _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                      color: widget.controlsColor,
                      size: 24.r,
                    ),
                    onPressed: _toggleFullScreen,
                  ),

                  Row(
                    children: [
                      PopupMenuButton<double>(
                        initialValue: _playbackSpeed,
                        onSelected: _changeSpeed,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 0.25,
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 18.r),
                                SizedBox(width: 8.w),
                                Text("0.25x"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 0.5,
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 18.r),
                                SizedBox(width: 8.w),
                                Text("0.5x"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 0.75,
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 18.r),
                                SizedBox(width: 8.w),
                                Text("0.75x"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 1.0,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.speed,
                                  size: 18.r,
                                  color: widget.progressBarColor,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "1.0x",
                                  style: TextStyle(
                                    color: widget.progressBarColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 1.25,
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 18.r),
                                SizedBox(width: 8.w),
                                Text("1.25x"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 1.5,
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 18.r),
                                SizedBox(width: 8.w),
                                Text("1.5x"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2.0,
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 18.r),
                                SizedBox(width: 8.w),
                                Text("2.0x"),
                              ],
                            ),
                          ),
                        ],
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.speed,
                                color: widget.controlsColor,
                                size: 16.r,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "${_playbackSpeed}x",
                                style: TextStyle(
                                  color: widget.controlsColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                          color: widget.controlsColor,
                          size: 24.r,
                        ),
                        onPressed: _toggleMute,
                      ),
                      SizedBox(width: 8.w),
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: widget.controlsColor,
                          size: 28.r,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
