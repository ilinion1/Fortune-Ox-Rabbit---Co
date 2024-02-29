import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/AEFAgapEFA.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/AEXbackground_imageHYR.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DFTHcustom_animated_dialogUMUG.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DYcustom_bottom_sheetDFGH.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/TYJScustom_snackbarTYJ.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/SRGcustom_titleSRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/DTlose_dialogDFGH.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/DTBDwon_dialog.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/SRGcustom_help_screenHTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/SAEFsettingsAESF/SRGsettings_screenRSGR.dart';

enum AEFASFFieldOfFortuneASEFA { stars, trash }

class FEAFEFieldOfFortuneScreenASFEEAF extends StatefulWidget {
  const FEAFEFieldOfFortuneScreenASFEEAF({super.key});

  @override
  State<FEAFEFieldOfFortuneScreenASFEEAF> createState() =>
      _FEAFEFieldOfFortuneScreenASFEEAFState();
}

class _FEAFEFieldOfFortuneScreenASFEEAFState
    extends State<FEAFEFieldOfFortuneScreenASFEEAF> {
  late final List<AEFASFFieldOfFortuneASEFA?> items;
  List<bool> opened = List.generate(25, (index) => false);

  int money = 0;
  int friends = 0;
  bool isGameStarted = false;

  @override
  void initState() {
    super.initState();
    items = List.generate(3, (index) => AEFASFFieldOfFortuneASEFA.trash);
    items.addAll(List.generate(12, (index) => AEFASFFieldOfFortuneASEFA.stars));
    items.addAll(List.generate(10, (index) => null));
    items.shuffle();
  }

  void restartGame() {
    money = 0;
    friends = 0;
    isGameStarted = false;
    opened = List.filled(25, false);
    items.shuffle();
    setState(() {});
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
          title: const ASEFCustomTitleAEFA(text: 'Field of Fortune'),
          actions: [
            ASEFAGuideButtonFEAFA(
              title: 'Field of Fortune',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You must collect all the diamonds that are hidden in this field.',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  FSEGapEAFFASE.height(8.h),
                  Text(
                    'For each diamond, you will receive x0.2 on your bet. But there are also traps in the field, and if you fall into them, your bet will be burned.',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  FSEGapEAFFASE.height(8.h),
                  Text(
                    'Be careful and very careful. Let\'s hit the road!',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 40.w,
              height: 30.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SDGTHAppColorsSRGS.backgroundAGRS,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.zero,
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
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.h,
                mainAxisExtent: 65.h,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                if (opened[index]) {
                  final item = items[index];
                  return Image.asset(
                    'assets/fortuneimages/fortune${item == null ? 'empty' : item.name}.png',
                    fit: BoxFit.contain,
                  );
                } else {
                  return GestureDetector(
                    onTap: () async {
                      if (!isGameStarted) return;
                      opened[index] = true;
                      setState(() {});
                      if (items[index] == AEFASFFieldOfFortuneASEFA.trash) {
                        log('Game over');
                        restartGame();
                        showAnimatedDialogGSRDG(
                          context,
                          const ASEFLoseDialogAEFAS(),
                        );
                      } else if (items[index] ==
                          AEFASFFieldOfFortuneASEFA.stars) {
                        log('x0.2');
                        friends++;
                        setState(() {});
                        if (friends == 12) {
                          final totalMoney =
                              (money + friends * 0.2 * money).toInt();
                          await context
                              .read<EFAEMoneyCubitASEFAE>()
                              .setMoney(totalMoney);
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SRGCustomSnackbarGSRS.callSnackbarAFRGS(
                                totalMoney, context),
                          );
                          restartGame();
                          if (!mounted) return;
                          showAnimatedDialogGSRDG(
                            context,
                            ASEFWonDialogEFAS(
                              money: totalMoney,
                            ),
                          );
                        }
                      }
                    },
                    child: Image.asset(
                      'assets/fortuneimages/fortuneclosed.png',
                      fit: BoxFit.contain,
                    ),
                  );
                }
              },
            ),
            FSEGapEAFFASE.height(14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/fortuneimages/fortunestars.png',
                    width: 65.w),
                Text('${12 - friends}',
                    style: GSA3AppTextStylesAAA.header16GYS),
                Text(
                  '< Left on the field >',
                  style: GSA3AppTextStylesAAA.caption12SGRA.copyWith(
                    color: const Color(0xFF7591F3),
                  ),
                ),
                Text('3', style: GSA3AppTextStylesAAA.header16GYS),
                Image.asset('assets/fortuneimages/fortunetrash.png',
                    width: 65.w),
              ],
            ),
          ],
        ),
        bottomSheet: SAFECustomBottomSheetAEFSAF(
          receiveMoney: (money + friends * 0.2 * money).toInt() == 0
              ? null
              : (money + friends * 0.2 * money).toInt(),
          onButtonPressed: (money) async {
            if (isGameStarted) {
              final totalMoney =
                  (this.money + friends * 0.2 * this.money).toInt();
              await context.read<EFAEMoneyCubitASEFAE>().setMoney(totalMoney);
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SRGCustomSnackbarGSRS.callSnackbarAFRGS(totalMoney, context),
              );
              restartGame();
            } else {
              await context.read<EFAEMoneyCubitASEFAE>().setMoney(-money);
              isGameStarted = true;
              this.money = money;
              setState(() {});
            }
          },
        ),
      ),
    );
  }
}

class ASEFAGuideButtonFEAFA extends StatelessWidget {
  const ASEFAGuideButtonFEAFA({
    super.key,
    required this.child,
    required this.title,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFF3D2E77),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          padding: const EdgeInsets.all(4),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ASFECustomHelpScreenAEFAS(
                title: title,
                child: child,
              ),
            ),
          );
        },
        icon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Guide',
              style: GSA3AppTextStylesAAA.caption12SGRA,
            ),
            SizedBox(width: 4.w),
            SvgPicture.asset(SG5SAppIconsAGS.guideGSR, width: 16.w),
          ],
        ),
      ),
    );
  }
}
