import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/models/orders_model.dart';
import 'package:event_book_app/ui/widgets/colored_text_widget.dart';
import 'package:event_book_app/ui/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookedHall extends StatefulWidget {
  @override
  _BookedHallState createState() => _BookedHallState();
}

class _BookedHallState extends State<BookedHall> {
  Color statusColor = AppColors.kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booked Halls",
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
        child: Column(
          children: [
            FutureBuilder(
              future: readGetRequest("Orders"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.length);
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        OrdersModel ordersModel = snapshot.data[index];

                        if (ordersModel.orderStatus == "Pending") {
                          statusColor = Colors.orange;
                        } else if (ordersModel.orderStatus == "Accepted") {
                          statusColor = Colors.green;
                        } else if (ordersModel.orderStatus == "Rejected") {
                          statusColor = Colors.red;
                        } else if (ordersModel.orderStatus == "Completed") {
                          statusColor = AppColors.kPrimaryColorDark;
                        }

                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (ordersModel.orderStatus == "Completed") {
                                    Navigator.pushReplacementNamed(
                                        context, '/rating_page');
                                  } else {
                                    print("Pressed...");
                                  }
                                },
                                child: Card(
                                  elevation: 5.0,
                                  color: AppColors.kWhiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(60),
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: 80,
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.red[300],
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                padding: EdgeInsets.all(10),
                                                child: Image.asset(
                                                    "assets/decoration/stage_decoration_1.jpg",
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 20),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    iconWidget(
                                                        Icons.account_circle,
                                                        AppColors.kPrimaryColor,
                                                        20.0),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    coloredTextWidget(
                                                        ordersModel
                                                            .customerName,
                                                        15.0,
                                                        AppColors
                                                            .kPrimaryColor),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    iconWidget(
                                                        Icons.phone,
                                                        AppColors.kPrimaryColor,
                                                        20.0),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    coloredTextWidget(
                                                        ordersModel
                                                            .customerPhone,
                                                        15.0,
                                                        AppColors
                                                            .kPrimaryColor),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    iconWidget(
                                                        Icons
                                                            .calendar_today_outlined,
                                                        AppColors.kPrimaryColor,
                                                        20.0),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    coloredTextWidget(
                                                        ordersModel.eventDate,
                                                        15.0,
                                                        AppColors
                                                            .kPrimaryColor),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    iconWidget(
                                                        FontAwesomeIcons
                                                            .firstOrder,
                                                        AppColors.kPrimaryColor,
                                                        20.0),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    coloredTextWidget(
                                                        ordersModel.orderStatus,
                                                        15.0,
                                                        statusColor),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Container(
                                                      child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          iconWidget(
                                                              Icons
                                                                  .airline_seat_legroom_normal,
                                                              AppColors
                                                                  .kPrimaryColor,
                                                              20.0),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          coloredTextWidget(
                                                              ordersModel
                                                                  .noOfChairs
                                                                  .toString(),
                                                              15.0,
                                                              AppColors
                                                                  .kPrimaryColor),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                                SizedBox(
                                                  width: 40.0,
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          iconWidget(
                                                              Icons.wb_sunny,
                                                              AppColors
                                                                  .kPrimaryColor,
                                                              14.0),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          coloredTextWidget(
                                                              ordersModel
                                                                  .eventTime,
                                                              15.0,
                                                              AppColors
                                                                  .kPrimaryColor),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                return Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
