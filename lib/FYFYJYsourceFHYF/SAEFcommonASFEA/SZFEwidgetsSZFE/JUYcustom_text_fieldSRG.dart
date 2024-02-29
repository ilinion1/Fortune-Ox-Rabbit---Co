import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DFTDapp_colorsZZE.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/FDTHDapp_text_stylesHDTD.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/AEFAgapEFA.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/DGTcustom_buttonUJY.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/XZCVblock_button_controllerVZX.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';

class SAEFCustomTextFieldASEFAS extends StatefulWidget {
  const SAEFCustomTextFieldASEFAS({
    super.key,
    required this.onButtonPressed,
    this.text,
  });

  final Function(int) onButtonPressed;
  final String? text;

  @override
  State<SAEFCustomTextFieldASEFAS> createState() =>
      _SAEFCustomTextFieldASEFASState();
}

class _SAEFCustomTextFieldASEFASState extends State<SAEFCustomTextFieldASEFAS> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;
  String? errorText;

  final moneys = <int>[2, 5, 10, 20];

  void isValid() {
    if (_controller.text.isEmpty) {
      errorText = null;
      setState(() {});
      return;
    }
    final money = int.parse(_controller.text);
    final userMoney = context.read<EFAEMoneyCubitASEFAE>().state;
    if (money < 10) {
      errorText = 'You can\'t put money less than 10';
    } else if (money > userMoney) {
      errorText = 'Your balance less than your bet!';
    } else {
      errorText = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '10');
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 65.h,
          child: Form(
            key: _formKey,
            child: TextField(
              controller: _controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              cursorColor: SDGTHAppColorsSRGS.blueSRT,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => isValid(),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: SvgPicture.asset(SG5SAppIconsAGS.moneyAFA),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 10.w,
                ),
                filled: true,
                fillColor: const Color(0xFF100C22),
                suffixIcon: (_controller.text.isEmpty)
                    ? null
                    : IconButton(
                        onPressed: () => setState(() {
                          _controller.text = '10';
                          errorText = null;
                        }),
                        icon: SvgPicture.asset(SG5SAppIconsAGS.removeFSR),
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:
                      const BorderSide(color: SDGTHAppColorsSRGS.blueSRT),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:
                      const BorderSide(color: SDGTHAppColorsSRGS.pinkSG4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:
                      const BorderSide(color: SDGTHAppColorsSRGS.pinkSG4),
                ),
                errorText: errorText,
                errorStyle: GSA3AppTextStylesAAA.caption12SGRA.copyWith(
                  color: SDGTHAppColorsSRGS.pinkSG4,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: List.generate(
            moneys.length,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 8.w),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    final money = int.tryParse(_controller.text);
                    _controller.text =
                        ((money ?? 0) * moneys[index]).toString();
                    isValid();
                  },
                  icon: Text('${moneys[index]}x',
                      style: GSA3AppTextStylesAAA.caption12SGRA),
                ),
              ),
            ),
          ),
        ),
        FSEGapEAFFASE.height(8.h),
        ValueListenableBuilder(
            valueListenable: MysteryAppProvider.blockButton,
            builder: (context, bool value, _) {
              return SAGRSuperCustomButtonASEFSA(
                text: widget.text ?? 'Play',
                buttonStyleEnum:
                    _controller.text.isEmpty || errorText != null || value
                        ? ASEFSuperButtonStyleEnumAEFAS.cancel
                        : ASEFSuperButtonStyleEnumAEFAS.common,
                onPressed: () {
                  if (_controller.text.isEmpty || errorText != null || value) {
                    return;
                  }
                  if (context.read<EFAEMoneyCubitASEFAE>().state <
                      int.parse(_controller.text)) {
                    setState(() {
                      errorText = 'Your balance less than your bet!';
                    });
                    return;
                  }
                  widget.onButtonPressed(int.parse(_controller.text));
                },
              );
            }),
      ],
    );
  }
}
