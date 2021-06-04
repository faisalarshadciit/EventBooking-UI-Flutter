import 'dart:convert';
import 'package:event_book_app/storage.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/outlined_input_field.dart';
import 'widgets/appbar_widget.dart';
import 'components/rounded_button.dart';

class HallBooking extends StatefulWidget {
  @override
  _HallBookingState createState() => _HallBookingState();
}

class _HallBookingState extends State<HallBooking> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  Storage storage = new Storage();
  UserModel user = new UserModel();
  GlobalKey<FormState> _hallBookingFormKey = GlobalKey<FormState>();
  String username, userEmail, userPhone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    storage.readData().then((value) async {
      if (value != "") {
        setState(() {
          user = UserModel.fromJson(json.decode(value));

          nameController.value = TextEditingValue(text: user.userName);
          emailController.value = TextEditingValue(text: user.userEmail);
          phoneController.value = TextEditingValue(text: user.userPhone);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, StringAssets.kTextHallBooking),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _hallBookingFormKey,
                child: Column(
                  children: [
                    OutlinedInputField(
                      textEditingController: nameController,
                      textCapitalization: TextCapitalization.words,
                      inputAction: "next",
                      textInputType: TextInputType.name,
                      hintText: StringAssets.kHintUserName,
                      labelText: StringAssets.kLabelUsername,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserName = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return StringAssets.kNameNullError;
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.person,
                      type: "name",
                    ),
                    SizedBox(height: 20),
                    OutlinedInputField(
                      textEditingController: emailController,
                      textCapitalization: TextCapitalization.none,
                      inputAction: "next",
                      textInputType: TextInputType.emailAddress,
                      hintText: StringAssets.kHintEmail,
                      labelText: StringAssets.kLabelEmail,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserEmail = value;
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
                    OutlinedInputField(
                      textEditingController: phoneController,
                      textCapitalization: TextCapitalization.none,
                      inputAction: "next",
                      hintText: StringAssets.kHintPhone,
                      labelText: StringAssets.kLabelPhone,
                      textInputType: TextInputType.phone,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserPhone = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return StringAssets.kPhoneNullError;
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.phone,
                      type: "phone",
                    ),
                    SizedBox(height: 20),
                    OutlinedInputField(
                      textCapitalization: TextCapitalization.none,
                      inputAction: "next",
                      labelText: StringAssets.kLabelGuests,
                      hintText: StringAssets.kHintGuests,
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserNoOfGuests = int.parse(value);
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return StringAssets.kGuestsNullError;
                        } else {
                          return null;
                        }
                      },
                      icon: FontAwesomeIcons.users,
                      type: "number",
                    ),
                    SizedBox(height: 20),
                    OutlinedInputField(
                      textCapitalization: TextCapitalization.none,
                      inputAction: "done",
                      labelText: StringAssets.kLabelChairs,
                      hintText: StringAssets.kHintChairs,
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserNoOfChairs = int.parse(value);
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return StringAssets.kChairsNullError;
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.airline_seat_legroom_normal,
                      type: "number",
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          child: RoundedButton(
            text: StringAssets.kTextNext.toUpperCase(),
            press: () {
              if (_hallBookingFormKey.currentState.validate()) {
                _hallBookingFormKey.currentState.save();

                Navigator.pushNamed(context, '/hall_booking2');
              }
            },
          )),
    );
  }
}
