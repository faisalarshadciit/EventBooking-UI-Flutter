import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:event_book_app/ui/components/text_field_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  bool isObscureText = true;

  RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator,
    this.textEditingController,
    this.focusNode,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        obscureText: widget.isObscureText,
        obscuringCharacter: "*",
        cursorColor: AppColors.kPrimaryColorDark,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: AppColors.kPrimaryColor,
          ),
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
          border: InputBorder.none,
        ),
        // decoration: InputDecoration(
        //   border: OutlineInputBorder(
        //       borderRadius:
        //           const BorderRadius.all(const Radius.circular(10.0))),
        //   labelText: "Password",
        //   alignLabelWithHint: true,
        //   hintText: "Enter Password",
        //   floatingLabelBehavior: FloatingLabelBehavior.always,
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
        // ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
