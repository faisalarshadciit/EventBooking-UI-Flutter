import 'package:event_book_app/config/screen_size.dart';
import 'package:event_book_app/config/size_config.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/ui/widgets/colored_text_widget.dart';
import 'package:event_book_app/ui/widgets/icon_widget.dart';
import 'package:event_book_app/ui/widgets/simple_icon_widget.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/models/halls_model.dart';
import 'package:event_book_app/ui/widgets/align_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_slider/image_slider.dart';
import 'components/rounded_button.dart';

// region Global Variables
int numOfRatings = 0;
int totalRating = 5;
double averageRating = 0;
double totalReviews = 0;
double defaultHeight, defaultWidth;
double safeHeight, safeWidth;
// endregion

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  DetailsScreen({this.hallDetails});
  HallsModel hallDetails;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  final List<String> imagesList = [];

  TabController tabController;
  Color iconColor = AppColors.kGreyColor;
  double _width;
  double _height;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.hallDetails.listHallImages.length; i++) {
      imagesList.add(widget.hallDetails.listHallImages[i].iUrl);
    }

    numOfRatings = widget.hallDetails.listHallReviews.length;
    if (averageRating != 0) {
      averageRating = 0;
    }
    if (totalReviews != 0) {
      totalReviews = 0;
    }

    for (int i = 0; i < widget.hallDetails.listHallReviews.length; i++) {
      totalReviews =
          totalReviews + (widget.hallDetails.listHallReviews[i].review);
    }

    setState(() {
      averageRating = totalReviews / numOfRatings;
    });

    tabController = TabController(length: imagesList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
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
    // endregion

    ScreenUtil.init(BoxConstraints(maxWidth: _width, maxHeight: _height),
        designSize: Size(360, 690), orientation: Orientation.portrait);

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
                  tabController: tabController,
                  curve: Curves.fastOutSlowIn,
                  width: _width,
                  autoSlide: true,
                  duration: Duration(seconds: 10),
                  allowManualSlide: true,
                  height: 220,
                  children: imagesList.map((String imageUrl) {
                    return new ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imageUrl,
                        width: _width,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon:
                          simpleIconWidget(Icons.arrow_back_ios, Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: simpleIconWidget(Icons.favorite, iconColor),
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
            padding: EdgeInsets.all(2),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: coloredTextWidget(widget.hallDetails.itemName,
                            20.0, AppColors.kPrimaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: alignWidget(widget.hallDetails.location, 14.0,
                          AppColors.kBlackColor, Alignment.centerLeft),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                alignWidget(
                                    'Rating',
                                    14.0,
                                    AppColors.kPrimaryColor,
                                    Alignment.centerLeft),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        averageRating.toStringAsFixed(2),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "/",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "$totalRating",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                RatingBarIndicator(
                                    rating: averageRating,
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return simpleIconWidget(
                                          Icons.star, Colors.yellow);
                                    })
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                icon: simpleIconWidget(
                                    Icons.share, AppColors.kGreyColor),
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                    DefaultTabController(
                        length: 4,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            _buildTabBar(),
                            Container(
                              height: _height,
                              child: _buildTabBarView(),
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
        child: RoundedButton(
          text: "BOOK NOW",
          press: () {
            StringAssets.kHallName = widget.hallDetails.itemName;
            Navigator.of(context).pushNamed('/hall_booking');
          },
        ),
      ),
    );
  }

  Widget buildStarIcons(index) {
    List<Widget> widgets = [];

    for (int i = 0; i < int.tryParse(index); i++) {
      widgets.add(iconWidget(Icons.star, Colors.yellow, 18.0));
    }
    return Row(children: widgets);
  }

  Widget _buildReviewWidget(
      String name, String reviewText, String dateText, double review) {
    return Padding(
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: 0.0,
      //     color: AppColors.kWhiteColor,
      //   ),
      //   borderRadius: BorderRadius.all(Radius.circular(0)),
      //   color: AppColors.kSmokeWhiteColor,
      // ),
      // margin: EdgeInsets.symmetric(vertical: 5),
      // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      padding: EdgeInsets.all(5.0),
      child: Card(
        elevation: 5.0,
        color: AppColors.kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name != null ? name : "",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.bold)
                          //style: AppStyles.kDarkGreyStyle,
                          ),
                      Spacer(),
                      RatingBarIndicator(
                        rating: review,
                        itemBuilder: (context, index) =>
                            simpleIconWidget(Icons.star, Colors.yellow),
                        itemCount: 5,
                        itemSize: 18.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    reviewText != null ? reviewText : "",
                    //style: AppStyles.kDarkGreyStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      iconWidget(Icons.calendar_today_outlined,
                          AppColors.kPrimaryColor, 15.0),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        dateText != null ? dateText : "",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      indicatorColor: AppColors.kPrimaryColor,
      labelColor: AppColors.kPrimaryColor,
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
        Tab(
          text: 'Location',
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(
              widget.hallDetails.details != null
                  ? widget.hallDetails.details
                  : "",
              style: TextStyle(color: Colors.black),
            )),
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: widget.hallDetails.listHallAvailability.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/day_${index + 1}.svg",
                          height: 22,
                          width: 22,
                          color: AppColors.kPrimaryColor,
                        ),
                        SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 30),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.hallDetails
                                    .listHallAvailability[index].time,
                              )
                            ],
                          ),
                          textScaleFactor: 0.6,
                        ),
                      ],
                    ),
                  );
                })),
        Container(
            child: ListView.builder(
                itemCount: widget.hallDetails.listHallReviews.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _buildReviewWidget(
                    widget.hallDetails.listHallReviews[index].username,
                    widget.hallDetails.listHallReviews[index].feedback,
                    widget.hallDetails.listHallReviews[index].date,
                    widget.hallDetails.listHallReviews[index].review,
                  );
                })),
        Center(child: Text('Location')),
      ],
    );
  }
}
