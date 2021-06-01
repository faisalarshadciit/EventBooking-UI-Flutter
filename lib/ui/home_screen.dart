import 'details_screen.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/font_family.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/models/halls_model.dart';
import 'package:event_book_app/ui/widgets/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width;
  double _height;

  @override
  void initState() {
    super.initState();
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
              pinned: false,
              backgroundColor: AppColors.kPrimaryColor,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                titlePadding: EdgeInsets.only(top: 20.0),
                title: Center(
                  child: fontTextWidget("Event Booking", 16.0, Colors.white,
                      FontFamily.kFontPoppinsSemiBold),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 0.0, bottom: 0),
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
                  child: FutureBuilder(
                    future: readGetRequest("Halls"),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              HallsModel hallsModel = snapshot.data[index];
                              return _buildCircleHalls(hallsModel);
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
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: fontTextWidget('Recommended for you', 18.0,
                            Colors.black, FontFamily.kFontPoppinsRegular)),
                    SizedBox(height: 10),
                    Container(
                        height: 200,
                        child: FutureBuilder(
                          future: readGetRequest("Halls"),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    HallsModel hallsModel =
                                        snapshot.data[index];
                                    return _buildRecommendedHalls(
                                      hallsModel,
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
                        )),
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
                        child: fontTextWidget('Experiences for you', 18.0,
                            Colors.black, FontFamily.kFontPoppinsRegular)),
                    SizedBox(height: 10),
                    Container(
                      height: _height * 0.22,
                      child: FutureBuilder(
                        future: readGetRequest("Halls"),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  HallsModel hallsModel = snapshot
                                      .data[snapshot.data.length - index - 1];
                                  return _buildDiscountedHalls(hallsModel);
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
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleHalls(HallsModel mHallsModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      hallDetails: mHallsModel,
                    )));
      },
      child: Container(
        color: Colors.white,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(70.0),
                child: Image.asset(
                  mHallsModel.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Text(
            //     hallName,
            //     style: TextStyle(
            //         fontWeight: FontWeight.w500,
            //         fontSize: 12,
            //         color: Colors.grey[600]),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedHalls(HallsModel mHallsModel) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamed('/details_page');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      hallDetails: mHallsModel,
                    )));
      },
      child: Container(
        width: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Container(
                    height: _height * 0.20,
                    width: _width,
                    child: Image.asset(
                      mHallsModel.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      mHallsModel.itemName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   address,
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w400),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountedHalls(HallsModel mHallsModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      hallDetails: mHallsModel,
                    )));
      },
      child: Container(
        width: 150,
        height: _height * 0.20,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: new BorderRadius.all(Radius.circular(10)),
            child: Container(
                height: _height * 0.20,
                width: _width,
                child: Image.asset(
                  mHallsModel.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
