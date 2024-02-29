// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/AEXbackground_imageHYR.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DFTHcustom_animated_dialogUMUG.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DGTcustom_buttonUJY.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/DTFdaily_dialogDHT.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/DFHTfirst_dialogYNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ERGdate_time_controllerFRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/VZDfirst_time_controllerDEF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASDFfortune_cardsSADF/SDRGfortune_cardsSGR.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/SAEFsettingsAESF/SRGsettings_screenRSGR.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/SADFwheel_of_fortuneASDF/DFAwheel_of_fortuneASDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASEFfield_of_fortuneASEF/DSRfield_of_fortuneRGDR.dart';

class ASEFDailyBonusItemAEFAS {
  final String title;
  final String description;
  final String image;
  ASEFDailyBonusItemAEFAS({
    required this.title,
    required this.description,
    required this.image,
  });
}

class AEFASAMainScreenASEF extends StatefulWidget {
  const AEFASAMainScreenASEF({super.key});

  @override
  State<AEFASAMainScreenASEF> createState() => _AEFASAMainScreenASEFState();
}

class _AEFASAMainScreenASEFState extends State<AEFASAMainScreenASEF> {
  @override
  void initState() {
    super.initState();
    showFirstTimePrize();
  }

  void showFirstTimePrize() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted && context.read<ASEFAFirstTimeCubitAEFAS>().state) {
      showAnimatedDialogGSRDG(context, const ASFEFirstDialogAEFA());
    }
  }

  Widget openScreen(int index) {
    return switch (index) {
      0 => const AESFAFFortuneCardsScreenAEFASF(),
      1 => const AEFASASWheelGameScreenASEFAF(),
      2 => const FEAFEFieldOfFortuneScreenASFEEAF(),
      _ => const AESFAFFortuneCardsScreenAEFASF(),
    };
  }

  String nameScreens(int index) {
    return switch (index) {
      0 => 'Fortune Cards',
      1 => 'Wheel of Fortune',
      2 => 'Field of Fortune',
      _ => 'Fortune Cards',
    };
  }

  ASEFDailyBonusItemAEFAS getDaily(bool isDailyOn, Duration myDuration) {
    final formattedDuration =
        "${myDuration.inHours}:${(myDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(myDuration.inSeconds % 60).toString().padLeft(2, '0')}";

    return isDailyOn
        ? ASEFDailyBonusItemAEFAS(
            title: 'Daily bonus is ready',
            description: 'Click to get',
            image: 'on',
          )
        : ASEFDailyBonusItemAEFAS(
            title: 'Next reward',
            description: formattedDuration,
            image: 'off',
          );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AFEADateTimeCubitAEFAE>();
    final difference = model.state.difference(DateTime.now());
    final myDuration = (const Duration(days: 1) + difference);

    final daily = getDaily(model.checkDailyLogin(), myDuration);

    return ASEFBackgroundImageAEFAS(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: SvgPicture.asset(SG5SAppIconsAGS.logoGZR, width: 110.w),
          centerTitle: false,
          actions: [
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(SG5SAppIconsAGS.moneyAFA),
                        SizedBox(width: 4.w),
                        BlocBuilder<EFAEMoneyCubitASEFAE, int>(
                          builder: (context, state) {
                            return Text('$state',
                                style: GSA3AppTextStylesAAA.text14TDH);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
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
                  child: SvgPicture.asset(SG5SAppIconsAGS.settingsGSSA,
                      width: 24.w),
                ),
                SizedBox(width: 16.w),
              ],
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            ...List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 16.w),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/fortuneimages/fortunegame_${index + 1}.png',
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 17.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameScreens(index),
                            style: GSA3AppTextStylesAAA.header16GYS,
                          ),
                          SizedBox(height: 18.h),
                          SAGRSuperCustomButtonASEFSA(
                            text: 'Play',
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => openScreen(index),
                              ),
                            ),
                            isSmall: true,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showAnimatedDialogGSRDG(context, const ASEFDailyDialogAEFAS());
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/fortuneimages/fortunedaily_bonus/${daily.image}.png',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                      children: [
                        Text(
                          daily.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          daily.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
