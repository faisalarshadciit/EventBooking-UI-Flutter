import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/models/halls_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_slider/image_slider.dart';
import 'components/rounded_button.dart';

// region Global Variables
int numOfRatings = 0;
int totalRating = 5;
double averageRating = 0;
double totalReviews = 0;
// endregion

class DetailsScreen extends StatefulWidget {
  DetailsScreen({this.hallDetails});
  HallsModel hallDetails;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  final List<String> imagesList = [];

  TabController _tabController;
  Color iconColor = AppColors.kGreyColor;
  double width;

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

    print("Avg : " + averageRating.toString());
    _tabController = TabController(length: imagesList.length, vsync: this);
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
                  children: imagesList.map((String imageUrl) {
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
                          widget.hallDetails.itemName,
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
                          widget.hallDetails.location,
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
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        averageRating.toStringAsFixed(2),
                                        //style: AppStyles.kAvgRatingsStyle,
                                      ),
                                      Text(
                                        "/",
                                        //style: AppStyles.kRatingsStyle,
                                      ),
                                      Text(
                                        "$totalRating",
                                        //style: AppStyles.kRatingsStyle,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                RatingBarIndicator(
                                  rating: averageRating,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  itemCount: 5,
                                  itemSize: 18.0,
                                  direction: Axis.horizontal,
                                )
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
                        length: 4,
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
                                Tab(
                                  text: 'Location',
                                ),
                              ],
                            ),
                            Container(
                              height: 450,
                              child: TabBarView(
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
                                          itemCount: widget.hallDetails
                                              .listHallAvailability.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: widget
                                                        .hallDetails
                                                        .listHallAvailability[
                                                            index]
                                                        .day,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextSpan(
                                                    text: widget
                                                        .hallDetails
                                                        .listHallAvailability[
                                                            index]
                                                        .time,
                                                  )
                                                ],
                                              ),
                                              textScaleFactor: 0.6,
                                            );
                                          })),
                                  Center(
                                      child: ListView.builder(
                                          itemCount: widget.hallDetails
                                              .listHallReviews.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return reviewWidget(
                                              widget
                                                  .hallDetails
                                                  .listHallReviews[index]
                                                  .username,
                                              widget
                                                  .hallDetails
                                                  .listHallReviews[index]
                                                  .feedback,
                                              widget.hallDetails
                                                  .listHallReviews[index].date,
                                              widget
                                                  .hallDetails
                                                  .listHallReviews[index]
                                                  .review,
                                            );
                                          })),
                                  Center(child: Text('Location')),
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

  Widget reviewWidget(
      String name, String reviewText, String dateText, double review) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: AppColors.kWhiteColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(0)),
        color: AppColors.kSmokeWhiteColor,
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name != null ? name : "",
                //style: AppStyles.kDarkGreyStyle,
              ),
              Spacer(),
              RatingBarIndicator(
                rating: review,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
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
          Text(
            dateText != null ? dateText : "",
            //style: AppStyles.kDarkGreyStyle,
          ),
        ],
      ),
    );
  }
}
