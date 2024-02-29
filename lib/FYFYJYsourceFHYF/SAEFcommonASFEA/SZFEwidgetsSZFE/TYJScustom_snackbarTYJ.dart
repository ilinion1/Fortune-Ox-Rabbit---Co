import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/AEFAgapEFA.dart';

abstract class SRGCustomSnackbarGSRS {
  static SnackBar callSnackbarAFRGS(int money, BuildContext context) {
    return SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: const Color(0xFF4F9F00),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      content: SizedBox(
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'You recieved',
                style: GSA3AppTextStylesAAA.text14TDH
                    .copyWith(color: Colors.white),
              ),
              const Spacer(),
              Text(
                '$money',
                style: GSA3AppTextStylesAAA.text14TDH
                    .copyWith(color: Colors.white),
              ),
              FSEGapEAFFASE.width(4.w),
              SvgPicture.asset(SG5SAppIconsAGS.moneyAFA, width: 24.w),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 180.h,
        left: 10.w,
        right: 10.w,
      ),
    );
  }
}
