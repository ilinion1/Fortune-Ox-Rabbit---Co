import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';

enum ASEFSuperButtonStyleEnumAEFAS { common, cancel }

class SAGRSuperCustomButtonASEFSA extends StatelessWidget {
  const SAGRSuperCustomButtonASEFSA({
    super.key,
    required this.text,
    this.buttonStyleEnum = ASEFSuperButtonStyleEnumAEFAS.common,
    this.onPressed,
    this.isSmall = false,
  });

  final String text;
  final ASEFSuperButtonStyleEnumAEFAS buttonStyleEnum;
  final VoidCallback? onPressed;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: buttonStyleEnum == ASEFSuperButtonStyleEnumAEFAS.common
            ? SDGTHAppColorsSRGS.mainGradientSGRA
            : null,
        color: buttonStyleEnum == ASEFSuperButtonStyleEnumAEFAS.cancel
            ? SDGTHAppColorsSRGS.greySRF
            : null,
      ),
      child: SizedBox(
        width: isSmall ? 99.w : double.infinity,
        height: isSmall ? 28.h : 54.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GSA3AppTextStylesAAA.text14TDH.copyWith(
              color: buttonStyleEnum == ASEFSuperButtonStyleEnumAEFAS.cancel
                  ? Colors.black54
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
