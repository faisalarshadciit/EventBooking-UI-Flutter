import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/ui/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/already_have_an_account_acheck.dart';
import 'components/login_background.dart';
import 'components/outlined_input_field.dart';
import 'components/outlined_password_field.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_password_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _loginFormKey,
              child: Column(children: [
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                OutlinedInputField(
                  inputAction: "next",
                  hintText: "Enter Email",
                  labelText: "Email",
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    } else {
                      return null;
                    }
                  },
                  icon: Icons.person,
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
                      return "Empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                RoundedButton(
                  text: "Sign In",
                  press: () {
                    if (_loginFormKey.currentState.validate()) {
                      _loginFormKey.currentState.save();
                    } else {
                      print('Empty Values...');
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
