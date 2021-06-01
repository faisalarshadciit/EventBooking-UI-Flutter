import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/ui/components/rounded_button.dart';
import 'package:event_book_app/ui/widgets/rating_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

double ratingTotal;

class RatingPage extends StatefulWidget {
  const RatingPage({Key key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  // region Variables
  TextEditingController ratingController;
  GlobalKey<FormState> _ratingFormKey = GlobalKey<FormState>();
  String feedBack;
  int charLength = 0;
  // endregion

  // region CommentBox Change
  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }
  // endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rating",
          style: AppStyles.kAppBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: AppColors.kWhiteColor,
      body: Container(
          color: AppColors.kWhiteColor,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    updateOnDrag: true,
                    initialRating: 0,
                    itemCount: 5,
                    minRating: 0,
                    maxRating: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                    allowHalfRating: true,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return ratingIconWidget(
                              Icons.sentiment_very_dissatisfied, Colors.red);
                        case 1:
                          return ratingIconWidget(
                              Icons.sentiment_dissatisfied, Colors.redAccent);
                        case 2:
                          return ratingIconWidget(
                              Icons.sentiment_neutral, Colors.amber);
                        case 3:
                          return ratingIconWidget(
                              Icons.sentiment_satisfied, Colors.lightGreen);
                        case 4:
                          return ratingIconWidget(
                              Icons.sentiment_very_satisfied, Colors.green);
                      }
                    },
                    onRatingUpdate: (rating) {
                      ratingTotal = rating;
                    },
                  ),
                  Form(
                    key: _ratingFormKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                          child: TextFormField(
                            autofocus: false,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            obscureText: false,
                            cursorColor: AppColors.kPrimaryColor,
                            maxLines: null,
                            maxLength: 200,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              alignLabelWithHint: true,
                              labelText: StringAssets.kLabelComments,
                              hintText: StringAssets.kHintComments,
                              counterStyle: charLength < 200
                                  ? AppStyles.kMinCounterStyle
                                  : AppStyles.kMaxCounterStyle,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return StringAssets.kCommentNullError;
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              feedBack = value;
                            },
                            onFieldSubmitted: (_) {},
                            onChanged: _onChanged,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: RoundedButton(
                            text: StringAssets.kTextSubmit.toUpperCase(),
                            press: () {
                              if (_ratingFormKey.currentState.validate()) {
                                _ratingFormKey.currentState.save();
                                Navigator.pushNamed(context, '/home_page');
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
