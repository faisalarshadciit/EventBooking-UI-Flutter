import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/ui/widgets/default_container.dart';
import 'package:event_book_app/ui/widgets/custome_radiolisttile.dart';
import 'package:event_book_app/ui/widgets/richtext_widget.dart';
import 'package:event_book_app/ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'components/rounded_button.dart';

class DateTimeSelection extends StatefulWidget {
  @override
  _DateTimeSelectionState createState() => _DateTimeSelectionState();
}

class _DateTimeSelectionState extends State<DateTimeSelection> {
  GroupController controller = GroupController();
  GlobalKey<FormState> _dateTimeSelectionFormKey = GlobalKey<FormState>();
  var dateFormat = new DateFormat('dd-MM-yyyy');
  String eventTime = "";
  String currentDate, startTime, endTime;
  Color brTileColor = AppColors.kPrimaryColor;
  Color acTileColor = AppColors.kPrimaryColor;
  Color sdTileColor = AppColors.kPrimaryColor;
  Color etTileColor = AppColors.kPrimaryColor;
  int brTileValue = 1, acTileValue = 1, sdTileValue = 1, etTileValue = 1;
  int selectedImage = 0;
  double decorationPrice = 4100;
  double bridalRoomPrice = 3000;
  double acPrice = 12000;
  bool isDecoration = true;
  bool isBridalRoom = true;
  bool isAC = true;

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
    acTileValue = 1;
    sdTileValue = 1;
    etTileValue = 1;
  }

  setBridalRoomRadioTile(int val) {
    setState(() {
      brTileValue = val;
    });
  }

  setACRadioTile(int val) {
    setState(() {
      acTileValue = val;
    });
  }

  setStageDecorationRadioTile(int val) {
    setState(() {
      sdTileValue = val;
    });
  }

  setTimeRadioTile(int val) {
    setState(() {
      etTileValue = val;
    });
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = dateFormat.format(dateParse);

    setState(() {
      currentDate = formattedDate.toString();
      StringAssets.kEventDate = currentDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, StringAssets.kTextHallBooking),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _dateTimeSelectionFormKey,
              child: Column(
                children: [
                  defaultContainer(StringAssets.kTextEventDate),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            currentDate.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              inherit: true,
                              fontSize: 24.0,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: TextButton.icon(
                          label: Text(
                            StringAssets.kTextDate,
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
                  defaultContainer(StringAssets.kTextEventTime),
                  Row(
                    children: <Widget>[
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: true,
                          value: 1,
                          tileValue: etTileValue,
                          tileColor: etTileColor,
                          tileColorValue: 1,
                          text: StringAssets.kTextDay,
                          onChange: (value) {
                            setTimeRadioTile(value);
                          }),
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: false,
                          value: 2,
                          tileValue: etTileValue,
                          tileColor: etTileColor,
                          tileColorValue: 2,
                          text: StringAssets.kTextNight,
                          onChange: (value) {
                            setTimeRadioTile(value);
                          }),
                    ],
                  ),
                  SizedBox(height: 10),
                  defaultContainer(StringAssets.kTextBridalRoom),
                  Row(
                    children: <Widget>[
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: true,
                          value: 1,
                          tileValue: brTileValue,
                          tileColor: brTileColor,
                          tileColorValue: 1,
                          text: StringAssets.kTileTextYes,
                          onChange: (value) {
                            setBridalRoomRadioTile(value);
                            setState(() {
                              isBridalRoom = true;
                            });
                          }),
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: false,
                          value: 2,
                          tileValue: brTileValue,
                          tileColor: brTileColor,
                          tileColorValue: 2,
                          text: StringAssets.kTileTextNo,
                          onChange: (value) {
                            setBridalRoomRadioTile(value);
                            setState(() {
                              isBridalRoom = false;
                            });
                          }),
                    ],
                  ),
                  Container(
                    child: isBridalRoom == true
                        ? richTextWidget(bridalRoomPrice)
                        : Container(),
                  ),
                  SizedBox(height: 10),
                  defaultContainer(StringAssets.kTextAC),
                  Row(
                    children: <Widget>[
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: true,
                          value: 1,
                          tileValue: acTileValue,
                          tileColor: acTileColor,
                          tileColorValue: 1,
                          text: StringAssets.kTileTextYes,
                          onChange: (value) {
                            setACRadioTile(value);
                            setState(() {
                              isAC = true;
                            });
                          }),
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: false,
                          value: 2,
                          tileValue: acTileValue,
                          tileColor: acTileColor,
                          tileColorValue: 2,
                          text: StringAssets.kTileTextNo,
                          onChange: (value) {
                            setACRadioTile(value);
                            setState(() {
                              isAC = false;
                            });
                          }),
                    ],
                  ),
                  Container(
                    child: isAC == true ? richTextWidget(acPrice) : Container(),
                  ),
                  SizedBox(height: 10),
                  defaultContainer(StringAssets.kTextStageDecoration),
                  Row(
                    children: <Widget>[
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: true,
                          value: 1,
                          tileValue: sdTileValue,
                          tileColor: sdTileColor,
                          tileColorValue: 1,
                          text: StringAssets.kTileTextYes,
                          onChange: (value) {
                            setStageDecorationRadioTile(value);
                            setState(() {
                              isDecoration = true;
                            });
                          }),
                      CustomRadioListTile(
                          flexFit: FlexFit.loose,
                          isSelected: false,
                          value: 2,
                          tileValue: sdTileValue,
                          tileColor: sdTileColor,
                          tileColorValue: 2,
                          text: StringAssets.kTileTextNo,
                          onChange: (value) {
                            setStageDecorationRadioTile(value);
                            setState(() {
                              isDecoration = false;
                            });
                          }),
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
                    child: isDecoration == true
                        ? richTextWidget(decorationPrice)
                        : Container(),
                  ),
                  SizedBox(height: 20),
                ],
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
              if (etTileValue == 1) {
                StringAssets.kEventTime = StringAssets.kTextDay;
              } else {
                StringAssets.kEventTime = StringAssets.kTextNight;
              }

              if (brTileValue == 1) {
                StringAssets.kEventBRCharges = bridalRoomPrice;
              } else {
                StringAssets.kEventBRCharges = 0;
              }

              if (acTileValue == 1) {
                StringAssets.kEventACCharges = acPrice;
              } else {
                StringAssets.kEventACCharges = 0;
              }

              if (sdTileValue == 1) {
                StringAssets.kEventSDCharges = decorationPrice;
              } else {
                StringAssets.kEventSDCharges = 0;
              }

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
      firstDate: new DateTime.now().subtract(new Duration(days: 0)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kPrimaryColor, // header background color
              onPrimary: AppColors.kWhiteColor, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child,
        );
      },
    );
    if (pickedDate != null && pickedDate != dateTime)
      setState(() {
        var dateParse = DateTime.parse(pickedDate.toString());
        var formattedDate = dateFormat.format(dateParse);
        currentDate = formattedDate.toString();
        StringAssets.kEventDate = currentDate;
      });
  }
  // endregion

  Container buildSmallImagePreview(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedImage = index;
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
