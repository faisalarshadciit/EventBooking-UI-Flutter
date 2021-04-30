import 'package:event_book_app/config/size_config.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/font_family.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
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
              title: Text('Invite and Earn'),
              leading: Icon(Icons.whatshot),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.face),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.lock_open),
              onTap: () {
                Navigator.pop(context);
              },
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Marriage Halls',
                  style: TextStyle(
                      fontFamily: FontFamily.kFontPoppinsRegular,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
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
}
