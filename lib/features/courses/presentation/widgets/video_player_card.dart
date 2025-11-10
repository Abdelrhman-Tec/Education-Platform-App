import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;

  const ProfessionalVideoPlayer({
    super.key,
    required this.videoUrl,
    this.thumbnailUrl,
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
    if (isPlaying != _isPlaying) {
      setState(() => _isPlaying = isPlaying);
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
      if (!_isDisposed && mounted) setState(() => _showControls = false);
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

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.isInitialized && !_hasError
          ? _controller.value.aspectRatio
          : 16 / 9,
      child: GestureDetector(
        onTap: () {
          if (_videoStarted) _startHideTimer();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            // عرض الصورة المصغرة قبل بدء الفيديو
            if (!_videoStarted && widget.thumbnailUrl != null && !_hasError)
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: SizedBox.expand(
                  child: widget.thumbnailUrl!.startsWith('http')
                      ? Image.network(
                          ((widget.thumbnailUrl!)),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image),
                            );
                          },
                        )
                      : Image.asset(
                          widget.thumbnailUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image),
                            );
                          },
                        ),
                ),
              ),

            // عرض الفيديو
            if (_videoStarted && _controller.value.isInitialized && !_hasError)
              VideoPlayer(_controller),

            // عرض مؤشر التحميل
            if (_isLoading)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),

            // عرض رسالة الخطأ - مع إصلاح مشكلة overflow
            if (_hasError)
              Container(
                color: Colors.black54,
                padding: EdgeInsets.all(16.r),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 40.r,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        _errorMessage ?? 'حدث خطأ في تحميل الفيديو',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: _retryVideo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: Text(
                          'إعادة المحاولة',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // زر التشغيل عندما لا يكون الفيديو مشغلاً
            if (!_isPlaying &&
                _controller.value.isInitialized &&
                !_hasError &&
                !_isLoading)
              GestureDetector(
                onTap: _togglePlayPause,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 60.r,
                    color: Colors.white70,
                  ),
                ),
              ),

            // عناصر التحكم
            if (_videoStarted &&
                _showControls &&
                _controller.value.isInitialized &&
                !_hasError &&
                !_isLoading)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildControlsOverlay(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlsOverlay() {
    return Container(
      color: Colors.black38,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // شريط التقدم
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  _formatDuration(_controller.value.position),
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
              Expanded(
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: const VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Colors.white54,
                    backgroundColor: Colors.white24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  _formatDuration(_controller.value.duration),
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
            ],
          ),
          // أزرار التحكم
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 30.r,
                ),
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 25.r,
                ),
                onPressed: _toggleMute,
              ),
              PopupMenuButton<double>(
                initialValue: _playbackSpeed,
                onSelected: _changeSpeed,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 0.5, child: Text("0.5x")),
                  PopupMenuItem(value: 1.0, child: Text("1x")),
                  PopupMenuItem(value: 1.5, child: Text("1.5x")),
                  PopupMenuItem(value: 2.0, child: Text("2x")),
                ],
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  color: Colors.black45,
                  child: Text(
                    "${_playbackSpeed}x",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  color: Colors.white,
                  size: 25.r,
                ),
                onPressed: _toggleFullScreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
