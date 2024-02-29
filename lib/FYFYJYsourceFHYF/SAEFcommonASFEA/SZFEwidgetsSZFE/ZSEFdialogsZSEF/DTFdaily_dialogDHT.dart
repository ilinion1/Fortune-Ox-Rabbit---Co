import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/ZVDwon_daily_dialogZDZD.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ERGdate_time_controllerFRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';

class ASEFDailyDialogAEFAS extends StatelessWidget {
  const ASEFDailyDialogAEFAS({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/fortuneimages/fortunedialogs/win_dialog.png',
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Daily Bonus',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Click on the secret box and discover what awaits you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (ctx) => const ASEFWonDailyDialogAEFASF(),
                    );
                    await context.read<AFEADateTimeCubitAEFAE>().setDateTime();
                    if (!context.mounted) return;
                    await context.read<EFAEMoneyCubitASEFAE>().setMoney(100);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'assets/icons/gift.svg',
                          width: 64.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
