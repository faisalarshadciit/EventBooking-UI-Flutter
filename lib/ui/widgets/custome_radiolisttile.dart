import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

// Widget radioListTileWidget(FlexFit _flexFit, bool isSelected, int value, int tileValue, Color tileColor, String stringAsset, String text) {
//   return Flexible(
//     fit: _flexFit,
//     child: RadioListTile(
//       activeColor: AppColors.kPrimaryColor,
//       selected: isSelected,
//       value: 1,
//       groupValue: tileValue,
//       title: Text(text,
//           style: TextStyle(
//               color: tileValue == 1
//                   ? tileColor
//                   : Colors.black)),
//       onChanged: (value) {
//         //setTimeRadioTile(value);
//         stringAsset = text;
//       },
//     ),
//   );
// }

class CustomRadioListTile extends StatelessWidget {
  final FlexFit flexFit;
  final bool isSelected;
  final int value, tileValue, tileColorValue;
  final Function onChange;
  final String text;
  final Color tileColor;

  CustomRadioListTile({
    Key key,
    this.flexFit,
    this.isSelected,
    this.value,
    this.tileValue,
    this.tileColorValue,
    this.tileColor,
    this.text,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: flexFit,
      child: RadioListTile(
        activeColor: AppColors.kPrimaryColor,
        selected: isSelected,
        value: value,
        groupValue: tileValue,
        title: Text(text,
            style: TextStyle(
                color: tileValue == tileColorValue ? tileColor : Colors.black)),
        onChanged: onChange,
      ),
    );
  }
}
