import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DGTcustom_buttonUJY.dart';

class ASEFLoseDialogAEFAS extends StatelessWidget {
  const ASEFLoseDialogAEFAS({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
                image:
                    AssetImage('assets/fortuneimages/fortunelose_dialog.png')),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 18.h),
                  Text(
                    'Game over',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'You missed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 173.w,
                    height: 44.h,
                    child: SAGRSuperCustomButtonASEFSA(
                      onPressed: () => Navigator.pop(context),
                      text: 'Try again',
                    ),
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
