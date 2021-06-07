import 'package:event_book_app/config/size_config.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/font_family.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/methods/toast_methods.dart';
import 'package:event_book_app/shared_preference/SharedPrefs.dart';
import 'package:flutter/material.dart';
import 'color_text_widget.dart';
import 'dart:convert';
import 'package:event_book_app/storage.dart';
import 'package:event_book_app/models/user_model.dart';

bool login = false;
bool logout = false;
Storage storage = new Storage();
UserModel user = new UserModel();
String username = "";
String email = "";
bool boolValue = false;

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserLogin().then((value) async {
      if (value == false) {
        setState(() {
          logout = false;
          login = true;
        });
      } else {
        if (!await SharedPrefs().getBoolValuesSF("login")) {
          setState(() {
            logout = false;
            login = true;
          });
        } else {
          setState(() {
            logout = true;
            login = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.screenWidth * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(),
            ListTile(
              title: colorTextWidget('Profile', 16.0, AppColors.kPrimaryColor),
              leading: Icon(Icons.face, color: AppColors.kPrimaryColor),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile_page');
              },
            ),
            Divider(),
            ListTile(
              title: colorTextWidget(
                  'Booked Halls', 16.0, AppColors.kPrimaryColor),
              leading: Icon(Icons.supervised_user_circle_outlined,
                  color: AppColors.kPrimaryColor),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/booked_halls');
              },
            ),
            Divider(),
            Visibility(
              visible: login,
              child: ListTile(
                leading: Icon(Icons.lock_open, color: AppColors.kPrimaryColor),
                title: colorTextWidget('Login', 16.0, AppColors.kPrimaryColor),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/login_page');
                },
              ),
            ),
            Visibility(
              visible: logout,
              child: ListTile(
                leading: Icon(Icons.logout, color: AppColors.kPrimaryColor),
                title: colorTextWidget('Logout', 16.0, AppColors.kPrimaryColor),
                onTap: () {
                  Navigator.pop(context);
                  setUserLogout();
                },
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  // region DrawerHeader
  Widget _buildDrawerHeader() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(87.5),
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 3.0),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/marriage_hall_11.jpg'))),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              username,
              style: TextStyle(
                  fontFamily: FontFamily.kFontPoppinsRegular,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
      ),
    );
  }
// endregion

  // region CheckUserLogin Method
  checkUserLogin() async {
    bool bValue = await SharedPrefs().getBoolValuesSF("login");
    if (bValue == true) {
      login = false;
      logout = true;

      storage.readData().then((value) async {
        if (value != "") {
          setState(() {
            user = UserModel.fromJson(json.decode(value));
            username = user.userName;
          });
        } else {
          user.userId = "123";
          username = StringAssets.kLoginUserName;
        }
      });
    } else {
      username = StringAssets.kLoginUserName;
      login = true;
      logout = false;
    }
  }
  // endregion

  // region User Logout Method
  setUserLogout() async {
    SharedPrefs().addBoolToSF("login", false);
    ToastMethod.simpleToastMessages("User logout");
    initState();
  }
  // endregion
}
