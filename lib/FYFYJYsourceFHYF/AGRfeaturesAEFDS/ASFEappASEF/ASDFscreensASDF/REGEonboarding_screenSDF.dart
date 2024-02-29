// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/AEXbackground_imageHYR.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/ASDFscreensASDF/DSFGmain_screenFGS.dart';

class ASEFAOnboardingItemsAEFA {
  final String title;
  final String? subtitle;
  final String description;
  ASEFAOnboardingItemsAEFA({
    required this.title,
    this.subtitle,
    required this.description,
  });
}

class ASEFOnboardingScreenAEFS extends StatefulWidget {
  const ASEFOnboardingScreenAEFS({super.key});

  @override
  State<ASEFOnboardingScreenAEFS> createState() =>
      _ASEFOnboardingScreenAEFSState();
}

class _ASEFOnboardingScreenAEFSState extends State<ASEFOnboardingScreenAEFS> {
  late final PageController _controller;

  int page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <ASEFAOnboardingItemsAEFA>[
      ASEFAOnboardingItemsAEFA(
        title: 'Fortune\n',
        subtitle: 'Ox, Rabbit & Co',
        description:
            'Choose different adventures and dive into the world of excitement. Test your skills with different challenges',
      ),
      ASEFAOnboardingItemsAEFA(
        title: 'Daily bonuses',
        description:
            'Receive daily bonuses that await you in gift boxes. You can use them in any of the tests. The draw is held once a day',
      ),
      ASEFAOnboardingItemsAEFA(
        title: 'First bonus',
        description:
            'Receive your first bonus of 5,000 coins when you open the game for the first time. You can use them in various challenges',
      ),
    ];

    return ASEFBackgroundImageAEFAS(
      image: 'assets/fortuneimages/fortuneonboarding/${page + 1}.png',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const AEFASAMainScreenASEF(),
                    ),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (value) => setState(() {
                        page = value;
                      }),
                      children: List.generate(
                        3,
                        (index) {
                          final item = items[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    height: 1,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: item.title,
                                      style: TextStyle(fontSize: 36.sp),
                                    ),
                                    TextSpan(
                                      text: item.subtitle,
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: Text(
                                  item.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: page == index ? 40 : 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: page == index
                                    ? Colors.white
                                    : Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          if (page == 2) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const AEFASAMainScreenASEF(),
                              ),
                            );
                            return;
                          }
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/next.svg',
                          width: 56.w,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
