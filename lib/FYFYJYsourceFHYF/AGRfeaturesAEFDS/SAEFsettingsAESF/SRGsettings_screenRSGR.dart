import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/EZSEFmystery_init_audioZSF/SZEFaudio_modelSZFE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/TYJScustom_snackbarTYJ.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/SAEFsettingsAESF/RDSGad_screenSDRG.dart';

class SAEFSettingsScreenAF extends StatelessWidget {
  const SAEFSettingsScreenAF({super.key});

  @override
  Widget build(BuildContext context) {
    final model = HTDSAudioProviderASFRG.watch(context);
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: Colors.white10,
    );
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(SGRAppImagesSTW4W.backgroundSGS),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          toolbarHeight: 120.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SDGTHAppColorsSRGS.backgroundAGRS,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(SG5SAppIconsAGS.leftArrowAFEA,
                        width: 16.w),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Text('Settings  ', style: GSA3AppTextStylesAAA.header16GYS),
            ],
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              DecoratedBox(
                decoration: decoration,
                child: Row(
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      'Sound',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      inactiveTrackColor: const Color(0xFF100C22),
                      inactiveThumbColor: Colors.grey,
                      activeTrackColor: const Color(0xFF18FE4B),
                      activeColor: Colors.white,
                      value: model.music,
                      onChanged: (value) async {
                        await model.toggleMusic();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              DecoratedBox(
                decoration: decoration,
                child: Row(
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      'Get coins',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SRGSAdScreenASRG(
                              videoAsset: switch (Random().nextInt(3)) {
                                1 => 'assets/fortunevideos/fortuneGameAd1.mp4',
                                2 => 'assets/fortunevideos/fortuneGameAd2.mp4',
                                _ => 'assets/fortunevideos/fortuneGameAd3.mp4',
                              },
                            ),
                          ),
                        );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SRGCustomSnackbarGSRS.callSnackbarAFRGS(50, context),
                        );
                      },
                      icon:
                          SvgPicture.asset('assets/icons/next.svg', width: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
