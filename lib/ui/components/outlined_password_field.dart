import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OutlinedPasswordField extends StatefulWidget {
  String inputAction;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  bool isObscureText = true;

  OutlinedPasswordField({
    inputAction,
    Key key,
    this.onChanged,
    this.validator,
    this.textEditingController,
    this.focusNode,
  }) : super(key: key);

  @override
  _OutlinedPasswordFieldState createState() => _OutlinedPasswordFieldState();
}

class _OutlinedPasswordFieldState extends State<OutlinedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      obscureText: widget.isObscureText,
      obscuringCharacter: "*",
      cursorColor: AppColors.kPrimaryColorDark,
      textInputAction: widget.inputAction == "next"
          ? TextInputAction.next
          : TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      // decoration: InputDecoration(
      //   hintText: "Password",
      //   icon: Icon(
      //     Icons.lock,
      //     color: AppColors.kPrimaryColor,
      //   ),
      //   suffixIcon: IconButton(
      //     icon: widget.isObscureText == true
      //         ? Icon(Icons.visibility)
      //         : Icon(Icons.visibility_off),
      //     color: AppColors.kPrimaryColor,
      //     onPressed: () {
      //       setState(() {
      //         widget.isObscureText = !widget.isObscureText;
      //       });
      //     },
      //   ),
      //   border: InputBorder.none,
      // ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kPrimaryColor),
            borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
        labelText: "Password",
        alignLabelWithHint: true,
        hintText: "Enter Password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: IconButton(
          icon: widget.isObscureText == true
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          color: AppColors.kPrimaryColor,
          onPressed: () {
            setState(() {
              widget.isObscureText = !widget.isObscureText;
            });
          },
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
