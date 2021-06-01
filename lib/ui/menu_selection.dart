import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/models/menu_data.dart';
import 'package:event_book_app/models/menu_model.dart';
import 'package:event_book_app/ui/receipt_screen.dart';
import 'package:event_book_app/ui/widgets/colored_text_widget.dart';
import 'package:event_book_app/ui/widgets/default_container.dart';
import 'package:event_book_app/ui/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'components/rounded_button.dart';
import 'custom_menu.dart';

class MenuSelection extends StatefulWidget {
  @override
  _MenuSelectionState createState() => _MenuSelectionState();
}

class _MenuSelectionState extends State<MenuSelection> {
  var menuData = MenuData.getData;
  int selectedCard = 0;

  String menuTitle, perHeadCharges, item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Selection",
          style: AppStyles.kAppBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                defaultContainer("Menu Selection"),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: readGetRequest("MenuDetails"),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    MenuModel menuSelectionModel =
                                        snapshot.data[index];
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (selectedCard == index + 1) {
                                            selectedCard = 0;
                                          } else {
                                            selectedCard = index + 1;
                                          }

                                          if (selectedCard != 0) {
                                            menuTitle =
                                                menuData[selectedCard - 1]
                                                    ["menuTitle"];
                                            perHeadCharges =
                                                menuData[selectedCard - 1]
                                                    ["perHead"];
                                            item = menuData[selectedCard - 1]
                                                ["menuItem"];
                                          }

                                          StringAssets.kDealName =
                                              menuSelectionModel.menuTitle;

                                          StringAssets.kPerHeadCharges =
                                              menuSelectionModel.perHeadCharges;

                                          if (index ==
                                              snapshot.data.length - 1) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomMenuSelection()));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    SelectedDealDialog(
                                                        menuSelectionModel
                                                            .menuTitle));
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        height: 150,
                                        width: double.maxFinite,
                                        child: Card(
                                          elevation: 5.0,
                                          color: selectedCard == index + 1
                                              ? AppColors.kLightColor
                                              : AppColors.kWhiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(60),
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            ),
                                          ),
                                          child: _buildMenu(menuSelectionModel),
                                        ),
                                      ),
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
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          child: RoundedButton(
            text: "NEXT",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReceiptPage()));
            },
          )),
    );
  }

  Widget _buildMenu(MenuModel mSelectionModel) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              coloredTextWidget("Deal Name : ", 14.0, AppColors.kPrimaryColor),
              Text(mSelectionModel.menuTitle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              coloredTextWidget("Per Head : ", 14.0, AppColors.kPrimaryColor),
              Text("Rs. ${mSelectionModel.perHeadCharges}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              coloredTextWidget("Item : ", 14.0, AppColors.kPrimaryColor),
              Text(mSelectionModel.menuItem),
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "View Details",
                ),
                SizedBox(width: 5),
                iconWidget(
                    Icons.arrow_forward_ios, AppColors.kPrimaryColor, 20.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SelectedDealDialog extends StatelessWidget {
  SelectedDealDialog(this.dealName);
  final String dealName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Text(dealName),
          ],
        ),
      ),
      content: Text("Alert Dialog body"),
      actions: <Widget>[
        FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
