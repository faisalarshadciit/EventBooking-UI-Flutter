import 'dart:convert';
import 'package:event_book_app/models/user_model.dart';
import 'package:event_book_app/shared_preference/SharedPrefs.dart';
import 'package:event_book_app/storage.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/constants/images_assets.dart';
import 'package:event_book_app/ui/widgets/simple_icon_widget.dart';
import 'package:event_book_app/ui/widgets/aligned_text_widget.dart';
import 'package:event_book_app/ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Storage storage = new Storage();
  UserModel user = new UserModel();
  String username = "";
  String email = "";
  String phone = "";
  bool boolValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //region read data for profile
    checkUserLogin();
    //endregion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, StringAssets.kTextProfile),
        backgroundColor: AppColors.kWhiteColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              profileHeaderWidget(),
              SizedBox(height: 20),
              _profileMenuWidget(
                context,
                StringAssets.kLabelUserName,
                boolValue ? user.userName : username,
                FontAwesomeIcons.userCircle,
                () => {},
              ),
              _profileMenuWidget(
                context,
                StringAssets.kLabelUserEmail,
                boolValue ? user.userEmail : email,
                Icons.email,
                () => {},
              ),
              _profileMenuWidget(
                context,
                StringAssets.kLabelUserPhone,
                boolValue ? user.userPhone : phone,
                Icons.phone,
                () => {},
              ),
              // region MyAccount
              // endregion
            ],
          ),
        ));
  }

  Widget profileHeaderWidget() {
    return SizedBox(
      height: 115.0,
      width: 115.0,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(ImageAssets.imagesProfileImage),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: AppColors.kPrimaryColor),
                ),
                color: AppColors.kPrimaryColor,
                child: SvgPicture.asset(
                  ImageAssets.iconsCameraImage,
                  color: AppColors.kWhiteColor,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileMenuWidget(String text, String icon, VoidCallback press) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: AppColors.kProfileColor,
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: AppColors.kPrimaryColor,
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              children: [Text(text), Text(text)],
            )),
            //Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }

  Widget _profileMenuWidget(BuildContext context, String text, String textValue,
      IconData icon, VoidCallback press) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: AppColors.kSmokeWhiteColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: AppColors.kPrimaryColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: [
          simpleIconWidget(icon, AppColors.kWhiteColor),
          SizedBox(width: 10),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                alignedTextWidget(
                    text, 16.0, AppColors.kWhiteColor, TextAlign.start),
                SizedBox(
                  height: 5.0,
                ),
                alignedTextWidget(
                    textValue, 12.0, AppColors.kWhiteColor, TextAlign.start),
              ]))
        ],
      ),
    );
  }

  // region CheckLogin Method
  checkUserLogin() async {
    boolValue = await SharedPrefs().getBoolValuesSF("login");

    storage.readData().then((value) async {
      if (value != "") {
        setState(() {
          user = UserModel.fromJson(json.decode(value));
        });
      } else {
        user.userId = "123";
        username = StringAssets.kLoginUserName;
        email = StringAssets.kLoginUserEmail;
        phone = StringAssets.kLabelUserPhone;
      }
    });
  }
  // endregion

}
