import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookedHall extends StatefulWidget {
  @override
  _BookedHallState createState() => _BookedHallState();
}

class _BookedHallState extends State<BookedHall> {
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
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.account_circle,
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    ordersModel.customerName,
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: AppColors
                                                            .kPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.phone,
                                                      color: AppColors
                                                          .kPrimaryColor,
                                                      size: 20.0),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    ordersModel.customerPhone,
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: AppColors
                                                            .kPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    ordersModel.eventDate,
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: AppColors
                                                            .kPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                        Icon(
                                                          Icons
                                                              .airline_seat_legroom_normal,
                                                          color: AppColors
                                                              .kPrimaryColor,
                                                          size: 20.0,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          ordersModel.noOfChairs
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              color: AppColors
                                                                  .kPrimaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
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
                                                        Icon(
                                                          Icons.wb_sunny,
                                                          color: AppColors
                                                              .kPrimaryColor,
                                                          size: 14.0,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          ordersModel.eventTime
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              color: AppColors
                                                                  .kPrimaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
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
