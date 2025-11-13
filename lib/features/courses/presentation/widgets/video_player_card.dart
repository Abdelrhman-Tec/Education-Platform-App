import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final bool autoPlay;
  final bool looping;

  const ProfessionalVideoPlayer({
    super.key,
    required this.videoUrl,
    this.thumbnailUrl,
    this.autoPlay = false,
    this.looping = false,
  });

  @override
  State<ProfessionalVideoPlayer> createState() =>
      _ProfessionalVideoPlayerState();
}

class _ProfessionalVideoPlayerState extends State<ProfessionalVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });

      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
        showControls: true,
        allowFullScreen: true,

        placeholder: widget.thumbnailUrl != null
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.thumbnailUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : null,

        errorBuilder: (context, errorMessage) {
          return Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.white, size: 50),
                SizedBox(height: 16.h),
                Text(
                  'فشل تحميل الفيديو',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: _initializeVideoPlayer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        },
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      log('Error initializing video: $e');
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return _buildLoadingWidget();
    if (_hasError) return _buildErrorWidget();
    if (_chewieController == null) return _buildErrorWidget();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController!),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            if (widget.thumbnailUrl != null)
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.thumbnailUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Container(
              color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'جاري تحميل الفيديو...',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            if (widget.thumbnailUrl != null)
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.thumbnailUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(color: Colors.black54),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.white, size: 50),
                SizedBox(height: 16.h),
                Text(
                  'فشل تحميل الفيديو',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'تأكد من اتصال الإنترنت وصحة رابط الفيديو',
                    style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton.icon(
                  onPressed: _initializeVideoPlayer,
                  icon: const Icon(Icons.refresh),
                  label: const Text('إعادة المحاولة'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
