import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/ui/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:event_book_app/ui/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String type;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextEditingController textEditingController;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  TextInputType textInputType;

  RoundedInputField({
    Key key,
    this.hintText,
    this.labelText,
    this.type,
    this.icon,
    this.onChanged,
    this.validator,
    this.textEditingController,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == "email") {
      textInputType = TextInputType.emailAddress;
    } else if (type == "name") {
      textInputType = TextInputType.name;
    } else if (type == "phone") {
      textInputType = TextInputType.phone;
    }

    // region FocusNode Change
    void fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
    // endregion

    return TextFieldContainer(
      child: TextFormField(
        controller: textEditingController,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.kPrimaryColorDark,
        keyboardType: textInputType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        // decoration: InputDecoration(
        //   border: OutlineInputBorder(
        //       borderRadius:
        //           const BorderRadius.all(const Radius.circular(10.0))),
        //   labelText: labelText,
        //   alignLabelWithHint: true,
        //   hintText: hintText,
        //   floatingLabelBehavior: FloatingLabelBehavior.always,
        //   icon: Icon(
        //     icon,
        //     color: AppColors.kPrimaryColor,
        //   ),
        // ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
