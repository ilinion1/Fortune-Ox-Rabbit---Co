import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DGTcustom_buttonUJY.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/VZDfirst_time_controllerDEF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';

class ASFEFirstDialogAEFA extends StatelessWidget {
  const ASFEFirstDialogAEFA({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/fortuneimages/fortunedialogs/gift_dialog.png'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SG5SAppIconsAGS.moneyAFA, width: 22.w),
                  SizedBox(width: 10.w),
                  Text(
                    '5000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  'We\'re giving you 5,000 coins to celebrate the opening of the game. You can drop them from any test',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 173.w,
                height: 44.h,
                child: SAGRSuperCustomButtonASEFSA(
                  onPressed: () async {
                    Navigator.pop(context);

                    await context
                        .read<ASEFAFirstTimeCubitAEFAS>()
                        .setFirstTime(false);
                    if (!context.mounted) return;
                    await context.read<EFAEMoneyCubitASEFAE>().setMoney(5000);
                  },
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
