import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/ASDFscreensASDF/DSFGmain_screenFGS.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/ASDFscreensASDF/REGEonboarding_screenSDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/VZDfirst_time_controllerDEF.dart';

class FAESProgressBarSAEFDS extends StatefulWidget {
  const FAESProgressBarSAEFDS({super.key});

  @override
  State<FAESProgressBarSAEFDS> createState() => _FAESProgressBarSAEFDSState();
}

class _FAESProgressBarSAEFDSState extends State<FAESProgressBarSAEFDS>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addStatusListener(splashListener);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  void splashListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      final first = context.read<ASEFAFirstTimeCubitAEFAS>().state;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => first
              ? const ASEFOnboardingScreenAEFS()
              : const AEFASAMainScreenASEF(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(splashListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fortuneimages/fortunesplash.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: 195,
                            height: 8,
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: Colors.white54,
                              color: Colors.white,
                              value: _animation.value,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
