import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AEFCardWidgetAEFSF extends StatefulWidget {
  final int value;
  final bool isFlipped;
  final Function onPressed;
  final Color color;
  final bool isDone;

  const AEFCardWidgetAEFSF({
    super.key,
    required this.value,
    required this.isFlipped,
    required this.onPressed,
    required this.color,
    required this.isDone,
  });

  @override
  State<AEFCardWidgetAEFSF> createState() => _ASEFSFCardWidgetStateAEFSFA();
}

class _ASEFSFCardWidgetStateAEFSFA extends State<AEFCardWidgetAEFSF>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isFront = true;
  bool _isFlipping = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _isFront = !widget.isFlipped;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AEFCardWidgetAEFSF oldWidget) {
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (_isFlipping || widget.isDone) return;
      if (_isFront) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isFlipping = true;
      Future.delayed(const Duration(milliseconds: 150), () {
        if (!mounted) return;
        _isFront = !_isFront;
        _isFlipping = false;
        setState(() {});
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * pi;
          final frontOpacity = _isFront ? 1.0 : 0.0;
          final backOpacity = _isFront ? 0.0 : 1.0;

          return Padding(
            padding: EdgeInsets.all(1.w),
            child: Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: frontOpacity,
                    child: const AEFAFrontCardASEF(),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle + pi),
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: backOpacity,
                    child: EFAEBackCardAEF(
                      isDone: widget.isDone,
                      color: widget.color,
                      value: widget.value,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AEFAFrontCardASEF extends StatelessWidget {
  const AEFAFrontCardASEF({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.w,
      height: 56.w,
      child: Image.asset(
        'assets/fortuneimages/fortunepair_element/closed.png',
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class EFAEBackCardAEF extends StatelessWidget {
  const EFAEBackCardAEF({
    super.key,
    required this.isDone,
    required this.color,
    required this.value,
  });

  final bool isDone;
  final Color color;
  final int value;

  @override
  Widget build(BuildContext context) {
    return (isDone)
        ? Container(
            padding: EdgeInsets.all(0.5.w),
            width: 56.w,
            height: 56.w,
          )
        : Container(
            padding: EdgeInsets.all(5.w),
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: color,
                border: Border.all(
                  color: color == const Color(0xFF005B14)
                      ? const Color(0xFF18FE4B)
                      : color == const Color(0xFF5F0000)
                          ? const Color(0xFFFF0000)
                          : Colors.transparent,
                )),
            child: Image.asset(
              'assets/fortuneimages/fortunepair_element/$value.png',
              width: 40.w,
              height: 40.h,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          );
  }
}
