import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DGTcustom_buttonUJY.dart';

class ASEFWonDailyDialogAEFASF extends StatelessWidget {
  const ASEFWonDailyDialogAEFASF({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/fortuneimages/fortunedialogs/win_dialog.png'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Daily Bonus',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Your reward:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SG5SAppIconsAGS.moneyAFA, width: 22.w),
                  SizedBox(width: 10.w),
                  Text(
                    '100',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 173.w,
                height: 44.h,
                child: SAGRSuperCustomButtonASEFSA(
                  onPressed: () => Navigator.pop(context),
                  text: 'Get a bonus',
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ],
      ),
    );
  }
}
