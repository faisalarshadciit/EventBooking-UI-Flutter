import 'dart:convert';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/methods/toast_methods.dart';
import 'package:event_book_app/models/user_model.dart';
import 'package:event_book_app/shared_preference/SharedPrefs.dart';
import 'package:event_book_app/storage.dart';
import 'package:event_book_app/ui/components/signup_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'components/already_have_an_account_acheck.dart';
import 'components/or_divider.dart';
import 'components/outlined_input_field.dart';
import 'components/outlined_password_field.dart';
import 'components/rounded_button.dart';
import 'components/social_icon.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Storage storage = new Storage();
  ProgressDialog progressDialog;
  String _name;
  String _email;
  String _gender;
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

    // region Progress Dialog
    progressDialog = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    progressDialog.style(message: "Registering User");
    // endregion

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _signUpFormKey,
              child: Column(children: [
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                OutlinedInputField(
                  inputAction: "next",
                  textEditingController: cName,
                  labelText: "Your Name",
                  hintText: "Enter Your Name",
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
                  icon: Icons.person,
                  type: "name",
                ),
                SizedBox(height: 20),
                OutlinedInputField(
                  inputAction: "next",
                  textEditingController: cEmail,
                  labelText: "Your Email",
                  hintText: "Enter Your Email",
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
                  icon: Icons.email,
                  type: "email",
                ),
                getGenderWidget(true, false),
                OutlinedInputField(
                  inputAction: "next",
                  textEditingController: cPhone,
                  labelText: "Phone Number",
                  hintText: "Enter Your Phone Number",
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
                SizedBox(height: 20),
                OutlinedPasswordField(
                  inputAction: "done",
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
                SizedBox(height: 20),
                RoundedButton(
                  text: "Register",
                  press: () async {
                    if (_signUpFormKey.currentState.validate()) {
                      _signUpFormKey.currentState.save();

                      await progressDialog.show();

                      storage.readData().then((value) async {
                        if (value != "") {
                          UserModel users =
                              UserModel.fromJson(json.decode(value));
                          if (users.userEmail != _email) {
                            progressDialog.hide();

                            UserModel user = new UserModel(
                                userId: "user101",
                                userName: _name,
                                userEmail: _email,
                                userPhone: _phone,
                                userGender: _gender,
                                userPassword: _password);

                            await storage.writeData(json.encode(user));
                            await SharedPrefs().addBoolToSF('login', true);
                            ToastMethod.successToastMessage(
                                "User Registered Successfully....");
                            Navigator.pop(context);
                          } else {
                            await progressDialog.hide();
                            ToastMethod.errorToastMessage(
                                "Error: Email already exists.");
                          }
                        } else {
                          await progressDialog.hide();
                          UserModel user = new UserModel(
                              userId: "user101",
                              userName: _name,
                              userEmail: _email,
                              userPhone: _phone,
                              userGender: _gender,
                              userPassword: _password);
                          await storage.writeData(json.encode(user));
                          await SharedPrefs().addBoolToSF('login', true);
                          ToastMethod.successToastMessage(
                              "User Registered Successfully....");
                          Navigator.pop(context);
                        }
                      });
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
      ),
    );
  }

  Widget getGenderWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,
        selectedGender: Gender.Male,
        selectedGenderTextStyle: TextStyle(
            color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender gender) {
          _gender = gender.toString();
        },
        //Alignment between icons
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }
}
