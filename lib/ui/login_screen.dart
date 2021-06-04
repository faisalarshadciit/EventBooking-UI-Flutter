import 'dart:convert';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/constants/images_assets.dart';
import 'package:event_book_app/methods/toast_methods.dart';
import 'package:event_book_app/models/user_model.dart';
import 'package:event_book_app/shared_preference/SharedPrefs.dart';
import 'package:event_book_app/storage.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:event_book_app/ui/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/already_have_an_account_acheck.dart';
import 'components/login_background.dart';
import 'components/outlined_input_field.dart';
import 'components/outlined_password_field.dart';
import 'widgets/appbar_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Storage storage = new Storage();
  ProgressDialog progressDialog;
  String _email;
  String _password;
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  // region TextControllers
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  // endregion

  // region FocusNode
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  // endregion

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // region Progress Dialog
    progressDialog = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    progressDialog.style(message: StringAssets.kDialogTextSignIn);
    // endregion

    return Scaffold(
      appBar: customAppBar(context, StringAssets.kTextLogin),
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _loginFormKey,
              child: Column(children: [
                SvgPicture.asset(
                  ImageAssets.iconsSignInIcon,
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                OutlinedInputField(
                  textCapitalization: TextCapitalization.none,
                  inputAction: "next",
                  labelText: StringAssets.kLabelEmail,
                  hintText: StringAssets.kHintEmail,
                  textInputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return StringAssets.kEmailNullError;
                    } else {
                      return null;
                    }
                  },
                  icon: Icons.email,
                  type: "email",
                ),
                SizedBox(height: 20),
                OutlinedPasswordField(
                  inputAction: "done",
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return StringAssets.kPasswordNullError;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                RoundedButton(
                  text: StringAssets.kTextSignIn,
                  press: () async {
                    if (_loginFormKey.currentState.validate()) {
                      _loginFormKey.currentState.save();

                      await progressDialog.show();

                      storage.readData().then((value) async {
                        if (value != "") {
                          UserModel users =
                              UserModel.fromJson(json.decode(value));

                          if (users.userEmail == _email &&
                              users.userPassword == _password) {
                            await progressDialog.hide();
                            await SharedPrefs().addBoolToSF('login', true);
                            ToastMethod.successToastMessage(
                                "User Login Successfully....");
                            Navigator.pop(context);
                          } else {
                            await progressDialog.hide();
                            ToastMethod.errorToastMessage(
                                "Invalid Email or Password.");
                          }
                        } else {
                          await progressDialog.hide();
                          ToastMethod.errorToastMessage("No user exists.");
                        }
                      });
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: true,
                  press: () {
                    Navigator.pushReplacementNamed(
                        context, '/registration_page');
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
