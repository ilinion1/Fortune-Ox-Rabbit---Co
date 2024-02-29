import 'package:flutter/material.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASDFfortune_cardsSADF/SDGRcard_widgetFSDGR.dart';

class MFAEASELevelAFES extends StatelessWidget {
  const MFAEASELevelAFES({
    super.key,
    required this.type,
    required this.cardFlips,
    required dynamic Function(int) onItemPressed,
    required this.isDone,
    this.success,
  }) : _mysteryonItemPressed = onItemPressed;

  final List<int> type;
  final List<bool> cardFlips;
  final List<bool> isDone;
  final bool? success;

  final Function(int) _mysteryonItemPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisExtent: 56,
      ),
      itemBuilder: (context, index) => AEFCardWidgetAEFSF(
        value: type[index],
        isFlipped: cardFlips[index],
        isDone: isDone[index],
        color: (success == null)
            ? Colors.black
            : success!
                ? const Color(0xFF005B14)
                : const Color(0xFF5F0000),
        onPressed: () => _mysteryonItemPressed(index),
      ),
      itemCount: type.length,
    );
  }
}
