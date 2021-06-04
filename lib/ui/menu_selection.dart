import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/models/menu_data.dart';
import 'package:event_book_app/models/menu_model.dart';
import 'package:event_book_app/ui/receipt_screen.dart';
import 'package:event_book_app/ui/widgets/colored_text_widget.dart';
import 'package:event_book_app/ui/widgets/default_container.dart';
import 'package:event_book_app/ui/widgets/appbar_widget.dart';
import 'package:event_book_app/ui/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
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
      appBar: customAppBar(context, StringAssets.kTextMenuSelection),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                defaultContainer(StringAssets.kTextMenuSelection),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: readGetRequestMenu(),
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
                                                        menuSelectionModel,
                                                        menuSelectionModel
                                                            .itemsList.length));
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        width: double.maxFinite,
                                        child: Card(
                                          elevation: 5.0,
                                          color: selectedCard == index + 1
                                              ? AppColors.kLightColor
                                              : AppColors.kWhiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(60),
                                              bottomLeft: Radius.circular(10),
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
            text: StringAssets.kTextNext.toUpperCase(),
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReceiptPage()));
            },
          )),
    );
  }

  // region Build Men Item
  Widget _buildMenu(MenuModel mSelectionModel) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              coloredTextWidget(StringAssets.kTextMenuDealName, 14.0,
                  AppColors.kPrimaryColor),
              Text(mSelectionModel.menuTitle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              coloredTextWidget(
                  StringAssets.kTextMenuPerHead, 14.0, AppColors.kPrimaryColor),
              Text("Rs. ${mSelectionModel.perHeadCharges}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              coloredTextWidget(
                  StringAssets.kTextMenuItem, 14.0, AppColors.kPrimaryColor),
              Text(mSelectionModel.menuItem),
            ],
          ),
          // SizedBox(height: 10),
          // GestureDetector(
          //   onTap: () {},
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text(
          //         StringAssets.kTextViewDetails,
          //       ),
          //       SizedBox(width: 5),
          //       iconWidget(
          //           Icons.arrow_forward_ios, AppColors.kPrimaryColor, 20.0)
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
  // endregion
}

class SelectedDealDialog extends StatelessWidget {
  SelectedDealDialog(this.menuModel, this.length);
  MenuModel menuModel;
  int length;

  @override
  Widget build(BuildContext context) {
    print(length);

    return AlertDialog(
      title: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            coloredTextWidget(
                menuModel.menuTitle, 20.0, AppColors.kPrimaryColor)
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              itemCount: length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 0.0, 4.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 35,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.all(3),
                                child: Image.asset(menuModel.menuImage,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
                            padding: EdgeInsets.fromLTRB(4.0, 4.0, 0.0, 4.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: coloredTextWidget(
                                menuModel.itemsList[index].menuName,
                                14.0,
                                AppColors.kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_buildCheckBoxes(menuModel.itemsList, index)],
                    ),
                  ],
                );
              })
        ]),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(StringAssets.kDialogTextOK),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildCheckBoxes(List<MenuItemsModel> menuItemsList, int index) {
    return CheckboxGroup(
        labels: <String>[menuItemsList[index].menuItemName],
        activeColor: AppColors.kPrimaryColor,
        checkColor: Colors.white,
        checked: <String>[menuItemsList[index].menuItemName],
        onChange: (bool isChecked, String label, int index) => {},
        onSelected: (List selected) => {});
  }
}
