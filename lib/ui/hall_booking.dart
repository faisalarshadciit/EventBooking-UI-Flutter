import 'package:event_book_app/config/size_config.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'components/outlined_input_field.dart';
import 'components/rounded_button.dart';

class HallBooking extends StatefulWidget {
  @override
  _HallBookingState createState() => _HallBookingState();
}

class _HallBookingState extends State<HallBooking> {
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
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                children: [
                  OutlinedInputField(
                    inputAction: "next",
                    hintText: "Enter Your Name",
                    labelText: "Your Name",
                    onChanged: (value) {
                      setState(() {});
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
                    hintText: "Enter Your Email",
                    labelText: "Your Email",
                    onChanged: (value) {
                      setState(() {});
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
                  SizedBox(height: 20),
                  OutlinedInputField(
                    inputAction: "next",
                    hintText: "Enter Your Phone",
                    labelText: "Your Phone",
                    onChanged: (value) {
                      setState(() {});
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
                  OutlinedInputField(
                    inputAction: "next",
                    labelText: "No. of Guests",
                    hintText: "Enter No. of Guests",
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Empty";
                      } else {
                        return null;
                      }
                    },
                    icon: Icons.person_add_sharp,
                    type: "number",
                  ),
                  SizedBox(height: 20),
                  OutlinedInputField(
                    inputAction: "next",
                    labelText: "No. of Chairs",
                    hintText: "Enter No. of Chairs",
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Empty";
                      } else {
                        return null;
                      }
                    },
                    icon: Icons.person_add_sharp,
                    type: "number",
                  ),
                  SizedBox(height: 10),
                ],
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
              Navigator.pushNamed(context, '/hall_booking2');
            },
          )),
    );
  }
}
