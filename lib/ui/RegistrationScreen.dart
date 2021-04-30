import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/ui/LoginScreen.dart';
import 'package:event_book_app/ui/components/signup_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/already_have_an_account_acheck.dart';
import 'components/or_divider.dart';
import 'components/rounded_button.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_password_field.dart';
import 'components/social_icon.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _name;
  String _email;
  String _phone;
  String _password;
  GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  // region TextControllers
  TextEditingController cName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPhone = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  // endregion

  // region FocusNode
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  // endregion

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SignUpBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _signUpFormKey,
            child: Column(children: [
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                textEditingController: cName,
                hintText: "Your Name",
                onChanged: (value) {
                  setState(() {
                    _name = value;
                    if (value.isNotEmpty) {
                      _name = value;
                      return null;
                    }
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Empty";
                  } else {
                    return null;
                  }
                },
                icon: FontAwesomeIcons.user,
                type: "name",
              ),
              RoundedInputField(
                textEditingController: cEmail,
                hintText: "Your Email",
                onChanged: (value) {
                  setState(() {
                    _email = value;
                    if (value.isNotEmpty) {
                      _email = value;
                      return null;
                    }
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
              RoundedInputField(
                textEditingController: cPhone,
                hintText: "Phone Number",
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      _phone = value;
                      return null;
                    }
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Empty";
                  } else {
                    return null;
                  }
                },
                icon: Icons.phone,
                type: "phone",
              ),
              RoundedPasswordField(
                textEditingController: cPassword,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      _password = value;
                      return null;
                    }
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
              RoundedButton(
                text: "Register",
                press: () {
                  if (_signUpFormKey.currentState.validate()) {
                    _signUpFormKey.currentState.save();
                  } else {
                    print('Empty Values...');
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushReplacementNamed(context, '/login_page');
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
            ]),
          ),
        ),
      ),
    );
  }
}
