import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_slider/image_slider.dart';

import 'components/rounded_button.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  final List<String> imgList = [
    'assets/images/marriage_hall_2.jpg',
    'assets/images/marriage_hall_5.jpg',
    'assets/images/marriage_hall_8.jpg',
  ];

  TabController _tabController;
  Color iconColor = AppColors.kGreyColor;
  double width;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: <Widget>[
                ImageSlider(
                  tabIndicatorColor: AppColors.inActiveIconColor,
                  tabIndicatorSelectedColor: AppColors.kPrimaryColor,
                  tabIndicatorHeight: 12.0,
                  tabIndicatorSize: 12.0,
                  tabController: _tabController,
                  curve: Curves.fastOutSlowIn,
                  width: width,
                  autoSlide: true,
                  duration: Duration(seconds: 10),
                  allowManualSlide: true,
                  height: 250.0,
                  children: imgList.map((String imageUrl) {
                    return new ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imageUrl,
                        width: width,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: iconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          if (iconColor == AppColors.kGreyColor) {
                            iconColor = AppColors.kProductFavouriteColor;
                          } else if (iconColor ==
                              AppColors.kProductFavouriteColor) {
                            iconColor = AppColors.kGreyColor;
                          }
                        });
                      }),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Shan Marriage Hall',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.kPrimaryColor),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Johar Town, Lahore',
                          style: TextStyle(
                              color: AppColors.kGreyColor, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: Text(
                                    'Rate',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.kGreyColor),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Text(
                                  'Rs 1200',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.kPrimaryColor),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Align(
                                  child: Text(
                                    'Rating',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.kGreyColor,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                buildStarIcons('5'),
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: AppColors.kGreyColor,
                                ),
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                    DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              indicatorColor: AppColors.kPrimaryColor,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              tabs: [
                                Tab(
                                  text: 'Details',
                                ),
                                Tab(
                                  text: 'Availability',
                                ),
                                Tab(
                                  text: 'Reviews',
                                ),
                              ],
                            ),
                            Container(
                              height: 450,
                              child: TabBarView(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'This is a marriage hall hotel',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Center(child: Text('Availability here')),
                                  Center(child: Text('Reviews here')),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        // child: ElevatedButton.icon(
        //   icon: Icon(FontAwesomeIcons.book),
        //   label: Text("Like"),
        //   onPressed: () => print("it's pressed"),
        //   style: ElevatedButton.styleFrom(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(30.0),
        //     ),
        //   ),
        // ),
        child: RoundedButton(
          text: "BOOK",
          press: () {
            Navigator.of(context).pushNamed('/hall_booking');
          },
        ),
      ),
    );
  }

  Widget buildStarIcons(index) {
    List<Widget> widgets = [];

    for (int i = 0; i < int.tryParse(index); i++) {
      widgets.add(Icon(
        Icons.star,
        color: Colors.yellow,
        size: 18,
      ));
    }
    return Row(children: widgets);
  }
}
