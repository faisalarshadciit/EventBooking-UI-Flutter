import 'package:event_book_app/ModelClass.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawerWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width;
  double _height;
  List<ModelClass> hallsList;

  @override
  void initState() {
    super.initState();
    hallsList = [
      new ModelClass('assets/images/marriage_hall_1.jpg', 'Hall 1'),
      new ModelClass('assets/images/marriage_hall_2.jpg', 'Hall 2'),
      new ModelClass('assets/images/marriage_hall_3.jpg', 'Hall 3'),
      new ModelClass('assets/images/marriage_hall_4.jpg', 'Hall 4'),
      new ModelClass('assets/images/marriage_hall_5.jpg', 'Hall 5'),
      new ModelClass('assets/images/marriage_hall_6.jpg', 'Hall 6'),
      new ModelClass('assets/images/marriage_hall_7.jpg', 'Hall 7'),
      new ModelClass('assets/images/marriage_hall_8.jpg', 'Hall 8'),
      new ModelClass('assets/images/marriage_hall_9.jpg', 'Hall 9'),
      new ModelClass('assets/images/marriage_hall_10.jpg', 'Hall 10'),
      new ModelClass('assets/images/marriage_hall_11.jpg', 'Hall 11'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: AppDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login_page');
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Icon(FontAwesomeIcons.user)),
                  ),
                  SizedBox(
                    width: 12,
                  )
                ],
                expandedHeight: _height / 5.5,
                floating: false,
                pinned: true,
                backgroundColor: AppColors.kPrimaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: 30.0),
                  title: Center(
                    child: Text(
                      "Event Booking",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontFamily.kFontPoppinsBold,
                          fontSize: 18),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 10, left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      width: _width,
                      //height: _height/15,
                      alignment: Alignment.topCenter,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15.0, top: 0.0, bottom: 0),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.grey,
                            ),
                            hintText: "Search for Hall, City or Location",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                                fontFamily: FontFamily.kFontPoppinsRegular),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    preferredSize: Size(_width, _height / 45)),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: _height / 8,
                  child: ListView.builder(
                      itemCount: hallsList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildCircleHalls(hallsList[index]);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: Text(
                          'Recommended for you',
                          style: TextStyle(
                              fontFamily: FontFamily.kFontPoppinsRegular,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildRecommendedHalls(
                                "Abc Hall",
                                'assets/images/marriage_hall_1.jpg',
                                'Model Town, Lahore'),
                            _buildRecommendedHalls(
                                "Xyz Hall",
                                'assets/images/marriage_hall_3.jpg',
                                'Ichra, Lahore'),
                            _buildRecommendedHalls(
                                "Lmn Hall",
                                'assets/images/marriage_hall_5.jpg',
                                'Gujranwala'),
                            _buildRecommendedHalls("Bxd Hall",
                                'assets/images/marriage_hall_7.jpg', 'Sahiwal'),
                            _buildRecommendedHalls(
                                "Pst Hall",
                                'assets/images/marriage_hall_9.jpg',
                                'Thokar Niaz Baig, Lahore'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        height: 180.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 2,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(5.0),
                              child: Image.asset(
                                'assets/others/discount_1.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: Text(
                          'Experiences for you',
                          style: TextStyle(
                              fontFamily: FontFamily.kFontPoppinsRegular,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: _height * 0.22,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildDiscountedHalls(
                                'assets/images/marriage_hall_2.jpg'),
                            _buildDiscountedHalls(
                                'assets/images/marriage_hall_4.jpg'),
                            _buildDiscountedHalls(
                                'assets/images/marriage_hall_6.jpg'),
                            _buildDiscountedHalls(
                                'assets/images/marriage_hall_8.jpg'),
                            _buildDiscountedHalls(
                                'assets/images/marriage_hall_10.jpg'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        height: 180.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 2,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(5.0),
                              child: Image.asset(
                                'assets/others/discount_2.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildRecommendedHalls(String title, String imageUrl, String city) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        height: 200,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Container(
                    height: _height * 0.15,
                    width: _width,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      city,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountedHalls(String imageUrl) {
    return Container(
      width: 180,
      height: _height * 0.20,
      child: Card(
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
          child: Container(
              height: _height * 0.20,
              width: _width,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }

  Widget _buildCircleHalls(ModelClass item) {
    return Container(
      color: Colors.white,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(70.0),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              item.name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
