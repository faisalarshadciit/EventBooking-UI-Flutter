import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OutlinedInputField extends StatelessWidget {
  final String inputAction;
  final String hintText;
  final String labelText;
  final String type;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  TextEditingController textEditingController;
  final TextCapitalization textCapitalization;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  TextInputType textInputType;

  OutlinedInputField({
    Key key,
    this.inputAction,
    this.hintText,
    this.labelText,
    this.type,
    this.icon,
    this.onChanged,
    this.validator,
    this.textEditingController,
    this.textCapitalization,
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
    } else if (type == "number") {
      textInputType = TextInputType.number;
    }

    // region FocusNode Change
    void fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
    // endregion

    return TextFormField(
      textCapitalization: textCapitalization,
      controller: textEditingController,
      textInputAction:
          inputAction == "next" ? TextInputAction.next : TextInputAction.done,
      cursorColor: AppColors.kPrimaryColorDark,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kPrimaryColor),
            borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: Icon(
          icon,
          color: AppColors.kPrimaryColor,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
