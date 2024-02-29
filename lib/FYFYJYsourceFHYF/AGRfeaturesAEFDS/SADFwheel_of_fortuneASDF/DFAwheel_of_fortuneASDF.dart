import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/AEXbackground_imageHYR.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DYcustom_bottom_sheetDFGH.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/TYJScustom_snackbarTYJ.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/SRGcustom_titleSRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/XZCVblock_button_controllerVZX.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/SAEFsettingsAESF/SRGsettings_screenRSGR.dart';

class AEFASASWheelGameScreenASEFAF extends StatefulWidget {
  const AEFASASWheelGameScreenASEFAF({super.key});

  @override
  State<AEFASASWheelGameScreenASEFAF> createState() =>
      _AEFASASWheelGameScreenASEFAFState();
}

class _AEFASASWheelGameScreenASEFAFState
    extends State<AEFASASWheelGameScreenASEFAF> with TickerProviderStateMixin {
  late AnimationController _controller;
  DateTime? dateTime;

  final List<dynamic> items = [1.5, 1, 10, 5, 2.5, 2, 1.5, 1, 10, 5, 2.5, 2];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(animate);
  }

  @override
  void dispose() async {
    _controller.removeListener(animate);
    _controller.dispose();
    super.dispose();
  }

  void animate() {
    if (!mounted) return;
    setState(() {});
  }

  void _spinAdventureWheelAFASEF(int money) async {
    _controller.repeat();
    final random = Random();
    final nextInt = random.nextInt(1000) + 2000;
    final duration = Duration(milliseconds: nextInt);
    await Future.delayed(duration);
    if (!mounted) return;
    _controller.stop();
    final value = 1 - _controller.value;
    for (int i = 0; i < items.length; i++) {
      if (i / items.length <= value && value <= (i + 1) / items.length) {
        final amount = (items[i] * money).toInt();
        await context.read<EFAEMoneyCubitASEFAE>().setMoney(amount);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SRGCustomSnackbarGSRS.callSnackbarAFRGS(amount, context),
        );
      }
    }
    MysteryAppProvider.blockButton.setBlockButton(false);
  }

  @override
  Widget build(BuildContext context) {
    return ASEFBackgroundImageAEFAS(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: const ASEFCustomTitleAEFA(text: 'Wheel of Fortune'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: SDGTHAppColorsSRGS.backgroundAGRS,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SAEFSettingsScreenAF(),
                ),
              ),
              child:
                  SvgPicture.asset(SG5SAppIconsAGS.settingsGSSA, width: 24.w),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/fortuneimages/fortunecat.png',
                          width: 150.w),
                      Transform.rotate(
                        angle: _controller.value * 2 * pi,
                        child: Container(
                          width: double.infinity,
                          height: 400.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/fortuneimages/fortunewheel.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: pi,
                        child: Image.asset(
                          'assets/fortuneimages/fortunetriangle_wheel.png',
                          width: 30.w,
                        ),
                      ),
                      SizedBox(height: 60.w),
                      Image.asset(
                        'assets/fortuneimages/fortunetriangle_wheel.png',
                        width: 30.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet: const SRGSSpeenWheelBottomSheetRSGS(),
      ),
    );
  }
}

class SRGSSpeenWheelBottomSheetRSGS extends StatelessWidget {
  const SRGSSpeenWheelBottomSheetRSGS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SAFECustomBottomSheetAEFSAF(
      onButtonPressed: (money) async {
        MysteryAppProvider.blockButton.setBlockButton(true);
        await context.read<EFAEMoneyCubitASEFAE>().setMoney(-money);
        if (!context.mounted) return;
        context
            .findAncestorStateOfType<_AEFASASWheelGameScreenASEFAFState>()!
            ._spinAdventureWheelAFASEF(money);
      },
    );
  }
}
