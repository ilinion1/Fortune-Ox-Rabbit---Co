import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/AEFAgapEFA.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/JUYcustom_text_fieldSRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';

class SAFECustomBottomSheetAEFSAF extends StatelessWidget {
  const SAFECustomBottomSheetAEFSAF({
    super.key,
    required this.onButtonPressed,
    this.receiveMoney,
  });

  final int? receiveMoney;

  final Function(int) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF28255F),
              Color(0xFF20263E),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FSEGapEAFFASE.height(22.h),
              Row(
                children: [
                  Text(
                    'Your Bet:',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  const Spacer(),
                  Text(
                    'Balance:',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  FSEGapEAFFASE.width(4.w),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(SG5SAppIconsAGS.moneyAFA,
                              width: 24.w),
                          FSEGapEAFFASE.width(4.w),
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
                ],
              ),
              FSEGapEAFFASE.height(16.h),
              SAEFCustomTextFieldASEFAS(
                text: receiveMoney != null ? 'Receive: $receiveMoney' : 'Play',
                onButtonPressed: onButtonPressed,
              ),
              FSEGapEAFFASE.height(15.h),
            ],
          ),
        ),
      ),
    );
  }
}
