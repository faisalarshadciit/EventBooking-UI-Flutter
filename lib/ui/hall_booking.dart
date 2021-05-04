import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'components/outlined_input_field.dart';
import 'components/rounded_button.dart';

class HallBooking extends StatefulWidget {
  @override
  _HallBookingState createState() => _HallBookingState();
}

class _HallBookingState extends State<HallBooking> {
  String currentDate;
  Color tileColor = AppColors.kPrimaryColor;
  int tileValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentDate();
    tileValue = 1;
  }

  setRadioTile(int val) {
    setState(() {
      tileValue = val;
      print(tileValue);
    });
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      currentDate = formattedDate.toString();
    });
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
                  Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: Text(
                        "Bridal Room",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          activeColor: AppColors.kPrimaryColor,
                          selected: true,
                          value: 1,
                          groupValue: tileValue,
                          title: Text("Yes",
                              style: TextStyle(
                                  color: tileValue == 1
                                      ? tileColor
                                      : Colors.black)),
                          onChanged: (value) {
                            setRadioTile(value);
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          activeColor: AppColors.kPrimaryColor,
                          selected: false,
                          value: 2,
                          groupValue: tileValue,
                          title: Text("No",
                              style: TextStyle(
                                  color: tileValue == 2
                                      ? tileColor
                                      : Colors.black)),
                          onChanged: (value) {
                            setRadioTile(value);
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: OutlinedInputField(
                          hintText: currentDate.toString(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: TextButton.icon(
                          label: Text(
                            "Date",
                            style: TextStyle(
                              color: AppColors.kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(
                            Icons.date_range,
                            color: AppColors.kWhiteColor,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.kPrimaryColorLight),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          child: RoundedButton(
            text: "BOOK NOW",
            press: () {},
          )
          // TextButton(
          //   child: Text(
          //     "BOOK NOW",
          //     style: TextStyle(
          //       color: AppColors.kWhiteColor,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
          //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30.0),
          //         //side: BorderSide(color: Colors.red),
          //       ),
          //     ),
          //   ),
          //   onPressed: () {
          //     ;
          //   },
          // ),
          ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime dateTime = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != dateTime)
      setState(() {
        var dateParse = DateTime.parse(pickedDate.toString());
        var formattedDate =
            "${dateParse.day}-${dateParse.month}-${dateParse.year}";
        currentDate = formattedDate.toString();
        print(currentDate);
      });
  }
}
