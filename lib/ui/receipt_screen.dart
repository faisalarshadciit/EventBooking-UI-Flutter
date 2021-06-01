import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/ui/widgets/colored_text_widget.dart';
import 'package:event_book_app/ui/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'components/rounded_button.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key key}) : super(key: key);

  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  // String name = "Faisal Arshad";
  // String phone = "+92308-8649850";
  // int noOfChairs = 250;
  // double perHeadCharges = 600;
  // double bridalRoomCharges = 4000;
  // double stageDecorationCharges = 5500;
  // String date = "24/05/2020";
  // String time = "Day";
  // String selectedMenu = "Deal 1";
  double totalCharges = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalCharges =
        (StringAssets.kUserNoOfChairs * StringAssets.kPerHeadCharges) +
            StringAssets.kEventACCharges +
            StringAssets.kEventBRCharges +
            StringAssets.kEventSDCharges;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Receipt",
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
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.maxFinite,
          child: Card(
            elevation: 5.0,
            color: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    StringAssets.kHallName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.account_circle,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(StringAssets.kUserName, 15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.call, AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(StringAssets.kUserPhone, 15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.airline_seat_legroom_normal,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(
                              StringAssets.kUserNoOfChairs.toString(),
                              15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.calendar_today_outlined,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(StringAssets.kEventDate, 15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(
                              Icons.wb_sunny, AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(StringAssets.kEventTime, 15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.calendar_today_outlined,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(
                              StringAssets.kEventACCharges.toStringAsFixed(2),
                              15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.calendar_today_outlined,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(
                              StringAssets.kEventBRCharges.toStringAsFixed(2),
                              15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.calendar_today_outlined,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(
                              StringAssets.kEventSDCharges.toStringAsFixed(2),
                              15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconWidget(Icons.restaurant_menu_outlined,
                              AppColors.kPrimaryColor, 20.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          coloredTextWidget(StringAssets.kDealName, 15.0,
                              AppColors.kPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 30),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Total Charges : ",
                              style: TextStyle(
                                  fontSize: 28.0,
                                  color: AppColors.kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "Rs. ${totalCharges.toStringAsFixed(2)}",
                            )
                          ],
                        ),
                        textScaleFactor: 0.6,
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
          text: "CONFIRM BOOKING",
          press: () {
            Navigator.of(context).pushNamed('/home_page');
          },
        ),
      ),
    );
  }
}
