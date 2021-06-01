import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/outlined_input_field.dart';
import 'components/rounded_button.dart';

class HallBooking extends StatefulWidget {
  @override
  _HallBookingState createState() => _HallBookingState();
}

class _HallBookingState extends State<HallBooking> {
  GlobalKey<FormState> _hallBookingFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hall Booking",
          style: AppStyles.kAppBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
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
                      textCapitalization: TextCapitalization.words,
                      inputAction: "next",
                      textInputType: TextInputType.name,
                      hintText: "Enter Your Name",
                      labelText: "Your Name",
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserName = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Name Required";
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.person,
                      type: "name",
                    ),
                    SizedBox(height: 20),
                    OutlinedInputField(
                      textCapitalization: TextCapitalization.none,
                      inputAction: "next",
                      textInputType: TextInputType.emailAddress,
                      hintText: "Enter Your Email",
                      labelText: "Your Email",
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserEmail = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email Required";
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.email,
                      type: "email",
                    ),
                    SizedBox(height: 20),
                    OutlinedInputField(
                      textCapitalization: TextCapitalization.none,
                      inputAction: "next",
                      hintText: "Enter Your Phone",
                      labelText: "Your Phone",
                      textInputType: TextInputType.phone,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserPhone = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Phone Required";
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
                      labelText: "No. of Guests",
                      hintText: "Enter No. of Guests",
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserNoOfGuests = int.parse(value);
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "No. Of Guests Required";
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
                      labelText: "No. of Chairs",
                      hintText: "Enter No. of Chairs",
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          StringAssets.kUserNoOfChairs = int.parse(value);
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "No. Of Chairs Required";
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
            text: "NEXT",
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
