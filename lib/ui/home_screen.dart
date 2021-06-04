import 'package:event_book_app/config/screen_size.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/methods/toast_methods.dart';
import 'package:event_book_app/shared_preference/SharedPrefs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:event_book_app/config/size_config.dart';

// region Global Variables
double defaultHeight, defaultWidth;
double safeHeight, safeWidth;
// endregion

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width, _height, thirtyHeight, twentyHeight, tenHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // region Screen Height & Width
    SizeConfig().init(context);
    defaultHeight = SizeConfig.screenHeight;
    defaultWidth = SizeConfig.screenWidth;
    safeHeight = SizeConfig.safeBlockHorizontal;
    safeWidth = SizeConfig.safeBlockVertical;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    ScreenUtil.init(BoxConstraints(maxWidth: _width, maxHeight: _height),
        designSize: Size(360, 690), orientation: Orientation.portrait);
    // endregion

    return Scaffold(
      appBar: AppBar(
        title: fontTextWidget(StringAssets.kAppName, 22.0, Colors.white,
            FontFamily.kFontPoppinsSemiBold),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.kWhiteColor),
        backgroundColor: AppColors.kPrimaryColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              checkUserLogin();
            },
            icon: Icon(FontAwesomeIcons.user),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 80,
                child: FutureBuilder(
                  future: readGetRequestHalls(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                      child: fontTextWidget(StringAssets.kRecommendedHalls,
                          18.0, Colors.black, FontFamily.kFontPoppinsRegular)),
                  SizedBox(height: 10),
                  Container(
                      height: ScreenSizeResponsive.screenHeight(context,
                          dividedBy: 3.5),
                      child: FutureBuilder(
                        future: readGetRequestHalls(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  HallsModel hallsModel = snapshot.data[index];
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
                      child: fontTextWidget(StringAssets.kDiscountedHalls, 18.0,
                          Colors.black, FontFamily.kFontPoppinsRegular)),
                  SizedBox(height: 10),
                  Container(
                    height: ScreenSizeResponsive.screenHeight(context,
                        dividedBy: 4.0),
                    child: FutureBuilder(
                      future: readGetRequestHalls(),
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
    );
  }

  // region Circular Halls
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
          ],
        ),
      ),
    );
  }
  // endregion

  // region Recommended Halls
  Widget _buildRecommendedHalls(HallsModel mHallsModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      hallDetails: mHallsModel,
                    )));
      },
      child: Container(
        width: 180.0,
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
                    height: ScreenSizeResponsive.screenHeight(context,
                            dividedBy: 3.0) /
                        2,
                    width: _width,
                    child: Image.asset(
                      mHallsModel.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      mHallsModel.itemName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // endregion

  // region Discounted Halls
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
        width: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: new BorderRadius.all(Radius.circular(10)),
            child: Container(
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
  // endregion

  // region CheckUserLogin Method
  checkUserLogin() async {
    bool boolValue = await SharedPrefs().getBoolValuesSF("login");
    if (boolValue == true) {
      ToastMethod.simpleToastMessages("User already login");
    } else {
      Navigator.pushNamed(context, '/login_page');
    }
  }
  // endregion
}
