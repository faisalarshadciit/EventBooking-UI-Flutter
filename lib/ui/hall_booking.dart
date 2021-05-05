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
  var dateFormat = new DateFormat('dd-MM-yyyy');
  String currentDate, startTime, endTime;
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
    var formattedDate = dateFormat.format(dateParse);

    //var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

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
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: OutlinedInputField(
                            // hintText: currentDate.toString(),
                            ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: TextButton.icon(
                          label: Text(
                            "Time",
                            style: TextStyle(
                              color: AppColors.kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.clock,
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
                            _selectTime(context);
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
        currentDate: dateTime,
        initialDatePickerMode: DatePickerMode.day,
        initialEntryMode: DatePickerEntryMode.calendar,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));

    if (pickedDate != null && pickedDate != dateTime)
      setState(() {
        var dateParse = DateTime.parse(pickedDate.toString());
        var formattedDate = dateFormat.format(dateParse);
        currentDate = formattedDate.toString();
        print(currentDate);
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeRangePicker timePicked = showTimeRangePicker(
      context: context,
      start: TimeOfDay(hour: 9, minute: 0),
      end: TimeOfDay(hour: 12, minute: 0),
      onStartChange: (start) {
        startTime = start.toString();
        print("start time " + start.toString());
      },
      onEndChange: (end) {
        endTime = end.toString();
        print("end time " + end.toString());
      },
      disabledTime: TimeRange(
          startTime: TimeOfDay(hour: 22, minute: 0),
          endTime: TimeOfDay(hour: 8, minute: 0)),
      disabledColor: Colors.red.withOpacity(0.5),
      interval: Duration(minutes: 30),
      use24HourFormat: false,
      padding: 30,
      strokeWidth: 12,
      handlerRadius: 14,
      ticks: 12,
      strokeColor: Colors.orange,
      handlerColor: Colors.orange[700],
      selectedColor: Colors.amber,
      backgroundColor: Colors.black.withOpacity(0.3),
      ticksColor: Colors.white,
      snap: true,
      labels: ["12 pm", "3 am", "6 am", "9 am", "12 am", "3 pm", "6 pm", "9 pm"]
          .asMap()
          .entries
          .map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      labelOffset: -35,
      rotateLabels: false,
      labelStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      timeTextStyle: TextStyle(
          color: Colors.orange[700],
          fontSize: 22,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      activeTimeTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 24,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );

    print("Hello");
    if (timePicked != null) {
      print("Start Time -> " + startTime);
      print("End Time -> " + endTime);
    }
  }

  // Future<void> showTimeRangePicker(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Choose event time"),
  //           content: TimeRangePicker(
  //             initialFromHour: DateTime.now().hour,
  //             initialFromMinutes: DateTime.now().minute,
  //             initialToHour: DateTime.now().hour,
  //             initialToMinutes: DateTime.now().minute,
  //             backText: "Back",
  //             nextText: "Next",
  //             cancelText: "Cancel",
  //             selectText: "Select",
  //             onSelect: (from, to) {
  //               _messangerKey.currentState.showSnackBar(
  //                   SnackBar(content: Text("From : $from, To : $to")));
  //               print("From : $from, To : $to");
  //               Navigator.pop(context);
  //             },
  //             onCancel: () => Navigator.pop(context),
  //           ),
  //         );
  //       });
  // }
}
