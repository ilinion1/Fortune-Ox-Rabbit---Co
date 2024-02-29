import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/AEXbackground_imageHYR.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DFTHcustom_animated_dialogUMUG.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DYcustom_bottom_sheetDFGH.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/TYJScustom_snackbarTYJ.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/AEFAgapEFA.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/SRGcustom_titleSRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/DTlose_dialogDFGH.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ZSEFdialogsZSEF/DTBDwon_dialog.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASDFfortune_cardsSADF/SDGRlevelGR.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/SAEFsettingsAESF/SRGsettings_screenRSGR.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASEFfield_of_fortuneASEF/DSRfield_of_fortuneRGDR.dart';

class AESFAFFortuneCardsScreenAEFASF extends StatefulWidget {
  const AESFAFFortuneCardsScreenAEFASF({super.key});

  @override
  State<AESFAFFortuneCardsScreenAEFASF> createState() =>
      _AESFAFFortuneCardsScreenAEFASFState();
}

class _AESFAFFortuneCardsScreenAEFASFState
    extends State<AESFAFFortuneCardsScreenAEFASF> {
  late List<int> type;
  late int selectedItem;

  // Card flipped or not
  late List<bool> cardFlips;

  // Card flipped & is done
  late List<bool> isDone;

  // for check
  int selectedIndex = -1;
  bool? success;
  bool isPause = true;
  bool isGameStarted = false;
  bool showCard = false;

  // score
  int score = 0;
  int money = 0;

  int seconds = 25;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    type = List.generate(25, (index) => index + 1);
    cardFlips = List.filled(25, false);
    isDone = List.filled(25, false);
    selectedItem = type[Random().nextInt(25)];
    type.shuffle();
  }

  void _mysteryRefreshLevel() {
    type = List.generate(25, (index) => index + 1);
    cardFlips = List.filled(25, false);
    isDone = List.filled(25, false);
    type.shuffle();
    _mysteryShowCards();
  }

  void _mysteryShowCards() {
    isPause = true;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      cardFlips = switch (5) {
        5 => List.filled(25, true),
        _ => List.generate(8, (index) => true),
      };
      setState(() {});
    });
    setState(() {});
    Future.delayed(const Duration(seconds: 6), () {
      if (!mounted) return;
      isPause = false;
      cardFlips = List.filled(25, false);
      timer?.cancel();
      showCard = true;
      seconds = 25;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          if (seconds == 0) {
            timer.cancel();
            _mysteryIsLose();
          }
          seconds--;
          setState(() {});
        },
      );
      setState(() {});
    });
  }

  // Game Status
  Future<void> _mysteryIsWon() async {
    if (isDone.where((element) => element == false).isNotEmpty) return;

    final totalMoney = (money + score * 0.5 * money).toInt();
    //! await SettingsProvider.read(context)!.model.setMoney(totalMoney);
    isGameStarted = false;
    setState(() {});
    _mysteryOnTryAgainPressed();
    timer?.cancel();
    seconds = 25;
    setState(() {});
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => ASEFWonDialogEFAS(
        money: totalMoney,
      ),
    );
    showAnimatedDialogGSRDG(context, ASEFWonDialogEFAS(money: totalMoney));
  }

  void _mysteryIsLose() {
    isGameStarted = false;
    _mysteryOnTryAgainPressed();
    isDone = List.filled(25, false);
    cardFlips = List.filled(25, false);
    timer?.cancel();
    seconds = 25;
    setState(() {});
    showAnimatedDialogGSRDG(context, const ASEFLoseDialogAEFAS());
  }

  void _mysteryOnItemPressed(int itemIndex) async {
    if (isPause || isDone[itemIndex] || selectedIndex == itemIndex) return;
    setState(() {
      cardFlips[itemIndex] = !cardFlips[itemIndex];
    });
    if (selectedItem == type[itemIndex]) {
      success = true;
      Future.delayed(const Duration(milliseconds: 500), () async {
        selectedItem = type[Random().nextInt(25)];
        isPause = false;
        isDone[itemIndex] = true;
        success = null;
        score++;
        seconds = 25;
        setState(() {});
        await _mysteryIsWon();
      });
    } else {
      success = false;
      // if items isn't same
      success = false;
      isPause = true;
      Future.delayed(const Duration(milliseconds: 500), () async {
        isPause = false;
        cardFlips[itemIndex] = false;
        setState(() {});
        _mysteryIsLose();
      });
    }
    setState(() {});
  } // Buttons pressed

  void _mysteryOnTryAgainPressed() {
    selectedIndex = -1;
    success = null;
    isPause = true;
    money = 0;
    score = 0;
    showCard = false;
    selectedItem = type[Random().nextInt(25)];
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final moneys = <int>[10, 25, 50, 100, 200, 500];
  final colors = <Color>[
    const Color(0xFF15084D).withAlpha(60),
    const Color(0xFF1B70A0).withAlpha(60),
    const Color(0xFFA416A6).withAlpha(60),
    const Color(0xFF7F9B10).withAlpha(60),
    const Color(0xFFFFE792).withAlpha(60),
    const Color(0xFF00EAC0).withAlpha(60),
  ];

  void onPlayOrReceiveButtonPressed(int money) async {
    if (isGameStarted) {
      if (isPause) return;
      final totalMoney = (this.money + score * 0.5 * this.money).toInt();
      await context.read<EFAEMoneyCubitASEFAE>().setMoney(totalMoney);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SRGCustomSnackbarGSRS.callSnackbarAFRGS(totalMoney, context),
      );
      isGameStarted = false;
      isDone = List.filled(25, false);
      cardFlips = List.filled(25, false);
      _mysteryOnTryAgainPressed();
      timer?.cancel();
      seconds = 25;
      setState(() {});
    } else {
      _mysteryRefreshLevel();
      await context.read<EFAEMoneyCubitASEFAE>().setMoney(-money);
      isGameStarted = true;
      this.money = money;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ASEFBackgroundImageAEFAS(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: const ASEFCustomTitleAEFA(text: 'Fortune Cards'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            ASEFAGuideButtonFEAFA(
              title: 'Fortune Cards',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'In 25 seconds, remember the location of the elements and where they are.',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  FSEGapEAFFASE.height(8.h),
                  Text(
                    'Your task is to find the elements hidden under the cards and earn points for them.',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  FSEGapEAFFASE.height(8.h),
                  Text(
                    'Multiply your winnings using additional odds.',
                    style: GSA3AppTextStylesAAA.text14TDH,
                  ),
                  FSEGapEAFFASE.height(8.h),
                  Text(
                    'Test your memory and attention!',
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('00:${(seconds % 60).toString().padLeft(2, '0')}'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.w),
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: const Color(0xFF1F1D3E),
                      ),
                      child: Image.asset(
                        showCard
                            ? 'assets/fortuneimages/fortunepair_element/$selectedItem.png'
                            : 'assets/fortuneimages/fortunepair_element/closed.png',
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    const Text('Find an element')
                  ],
                ),
                Text('$score/25'),
              ],
            ),
            SizedBox(height: 8.h),
            MFAEASELevelAFES(
              type: type,
              cardFlips: cardFlips,
              isDone: isDone,
              success: success,
              onItemPressed: (int itemIndex) =>
                  _mysteryOnItemPressed(itemIndex),
            ),
          ],
        ),
        bottomSheet: SAFECustomBottomSheetAEFSAF(
          receiveMoney: (money + score * 0.5 * money).toInt() == 0
              ? null
              : (money + score * 0.5 * money).toInt(),
          onButtonPressed: (money) => onPlayOrReceiveButtonPressed(money),
        ),
      ),
    );
  }
}
