import 'package:event_book_app/config/size_config.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/models/MenuData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'components/outlined_input_field.dart';
import 'components/rounded_button.dart';

class HallBooking3 extends StatefulWidget {
  @override
  _HallBooking3State createState() => _HallBooking3State();
}

class _HallBooking3State extends State<HallBooking3> {
  var menuData = MenuData.getData;
  int selectedCard = 0;

  String menuTitle, perHeadCharges, item;

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
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Menu Selection",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: menuData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedCard == index + 1) {
                                  selectedCard = 0;
                                } else {
                                  selectedCard = index + 1;
                                }

                                if (selectedCard != 0) {
                                  menuTitle =
                                      menuData[selectedCard - 1]["menuTitle"];
                                  perHeadCharges =
                                      menuData[selectedCard - 1]["perHead"];
                                  item = menuData[selectedCard - 1]["menuItem"];

                                  print(menuTitle);
                                  print(perHeadCharges);
                                  print(item);
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              height: 150,
                              width: double.maxFinite,
                              child: Card(
                                elevation: 5.0,
                                color: selectedCard == index + 1
                                    ? AppColors.kLightColor
                                    : AppColors.kSmokeWhiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Deal Name : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: AppColors.kPrimaryColor),
                                          ),
                                          Text(menuData[index]["menuTitle"]),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Per Head : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: AppColors.kPrimaryColor),
                                          ),
                                          Text(
                                              "Rs. ${menuData[index]["perHead"]}"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Item : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: AppColors.kPrimaryColor),
                                          ),
                                          Text(menuData[index]["menuItem"]),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "View Details",
                                            ),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                              color: AppColors.kPrimaryColor,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // child: Stack(children: <Widget>[
                                  //   Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Stack(
                                  //       children: <Widget>[
                                  //         Padding(
                                  //             padding: const EdgeInsets.only(
                                  //                 left: 10, top: 5),
                                  //             child: Column(
                                  //               children: <Widget>[
                                  //                 Row(
                                  //                   children: <Widget>[
                                  //                     Padding(
                                  //                       padding:
                                  //                           const EdgeInsets.only(
                                  //                               left: 15.0),
                                  //                       child: Align(
                                  //                           alignment: Alignment
                                  //                               .centerLeft,
                                  //                           child: Text(
                                  //                             menuData[index]
                                  //                                 ["menuTitle"],
                                  //                           )),
                                  //                     )
                                  //                   ],
                                  //                 )
                                  //               ],
                                  //             ))
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          child: RoundedButton(
            text: "NEXT",
            press: () {},
          )),
    );
  }
}
