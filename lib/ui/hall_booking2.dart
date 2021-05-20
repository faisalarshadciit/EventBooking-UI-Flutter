import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'components/outlined_input_field.dart';
import 'components/rounded_button.dart';

class HallBooking2 extends StatefulWidget {
  @override
  _HallBooking2State createState() => _HallBooking2State();
}

class _HallBooking2State extends State<HallBooking2> {
  var dateFormat = new DateFormat('dd-MM-yyyy');
  String currentDate, startTime, endTime;
  Color brTileColor = AppColors.kPrimaryColor;
  Color sdTileColor = AppColors.kPrimaryColor;
  int brTileValue = 1, sdTileValue = 1;
  int selectedImage = 0;
  double decorationPrice = 0;
  bool isDecoration = true;

  final List<String> imagesList = [
    'assets/decoration/stage_decoration_1.jpg',
    'assets/decoration/stage_decoration_2.jpg',
    'assets/decoration/stage_decoration_3.jpg',
    'assets/decoration/stage_decoration_4.jpg',
    'assets/decoration/stage_decoration_5.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentDate();
    brTileValue = 1;
    sdTileValue = 1;
  }

  setBridalRoomRadioTile(int val) {
    setState(() {
      brTileValue = val;
      print(brTileValue);
    });
  }

  setStageDecorationRadioTile(int val) {
    setState(() {
      sdTileValue = val;
      print(sdTileValue);
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
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                          groupValue: brTileValue,
                          title: Text("Yes",
                              style: TextStyle(
                                  color: brTileValue == 1
                                      ? brTileColor
                                      : Colors.black)),
                          onChanged: (value) {
                            setBridalRoomRadioTile(value);
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          activeColor: AppColors.kPrimaryColor,
                          selected: false,
                          value: 2,
                          groupValue: brTileValue,
                          title: Text("No",
                              style: TextStyle(
                                  color: brTileValue == 2
                                      ? brTileColor
                                      : Colors.black)),
                          onChanged: (value) {
                            setBridalRoomRadioTile(value);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Stage Decoration",
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
                          groupValue: sdTileValue,
                          title: Text("Yes",
                              style: TextStyle(
                                  color: sdTileValue == 1
                                      ? sdTileColor
                                      : Colors.black)),
                          onChanged: (value) {
                            setStageDecorationRadioTile(value);
                            setState(() {
                              isDecoration = true;
                            });
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          activeColor: AppColors.kPrimaryColor,
                          selected: false,
                          value: 2,
                          groupValue: sdTileValue,
                          title: Text("No",
                              style: TextStyle(
                                  color: sdTileValue == 2
                                      ? sdTileColor
                                      : Colors.black)),
                          onChanged: (value) {
                            setStageDecorationRadioTile(value);
                            setState(() {
                              isDecoration = false;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: isDecoration == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(imagesList.length,
                                  (index) => buildSmallImagePreview(index)),
                            ],
                          )
                        : Container(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Charges : ',
                              style: TextStyle(color: AppColors.kPrimaryColor),
                            ),
                            TextSpan(text: 'Rs. '),
                            TextSpan(
                              text: '$decorationPrice',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                    ),
                  )
                  // Container(
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: 'Charges ',
                  //       style: DefaultTextStyle.of(context).style,
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //             text: 'Rs. ',
                  //             style: TextStyle(fontWeight: FontWeight.bold)),
                  //         TextSpan(text: '2500'),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
              Navigator.pushNamed(context, '/hall_booking3');
            },
          )),
    );
  }

  // region Date Selection
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
  // endregion

  // region Time (From-To) Selection
  Future<void> _selectTime(BuildContext context) async {
    showTimeRangePicker(
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
  }
  // endregion

  Container buildSmallImagePreview(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedImage = index;
            //_showMyDialog(selectedImage, imagesList[selectedImage]);

            switch (selectedImage) {
              case 0:
                decorationPrice = 4100;
                break;

              case 1:
                decorationPrice = 1800;
                break;

              case 2:
                decorationPrice = 3300;
                break;

              case 3:
                decorationPrice = 2500;
                break;

              case 4:
                decorationPrice = 5000;
                break;

              default:
                decorationPrice = 0;
            }

            showDialog(
                context: context,
                builder: (_) => ImageDialog(imagesList[selectedImage]));
          });
        },
        onDoubleTap: () {
          setState(() {
            //selectedImage = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.all(5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 3,
                color: AppColors.kPrimaryColor
                    .withOpacity(selectedImage == index ? 1 : 0)),
          ),
          child: Image.asset(imagesList[index], fit: BoxFit.fill),
        ),
      ),
    );
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

class ImageDialog extends StatelessWidget {
  ImageDialog(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
