import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/models/custom_menu_model.dart';
import 'package:event_book_app/ui/receipt_screen.dart';
import 'package:flutter/material.dart';

import 'components/rounded_button.dart';

class CustomMenuSelection extends StatefulWidget {
  const CustomMenuSelection({Key key}) : super(key: key);

  @override
  _CustomMenuSelectionState createState() => _CustomMenuSelectionState();
}

class _CustomMenuSelectionState extends State<CustomMenuSelection> {
  // value set to false
  bool _value = false;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Custom Menu",
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
        child: Column(
          children: [
            FutureBuilder(
              future: readGetRequest("CustomMenu"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        CustomMenuModel customMenuModel = snapshot.data[index];
                        return Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Container(
                            //         margin:
                            //             EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                            //         padding: EdgeInsets.all(8.0),
                            //         width: double.infinity,
                            //         decoration: BoxDecoration(
                            //           color: Colors.grey.shade200,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         child: Text(
                            //           customMenuModel.menuName,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //     SizedBox(width: 10),
                            //     Container(
                            //       height: 50,
                            //       width: 50,
                            //       margin: EdgeInsets.symmetric(horizontal: 10),
                            //       child: AnimatedContainer(
                            //         duration: Duration(milliseconds: 250),
                            //         margin: EdgeInsets.only(right: 5),
                            //         padding: EdgeInsets.all(5),
                            //         height: 50,
                            //         width: 50,
                            //         decoration: BoxDecoration(
                            //           color: AppColors.kWhiteColor,
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //               width: 2,
                            //               color: AppColors.kPrimaryColor),
                            //         ),
                            //         child: Image.asset(
                            //             customMenuModel.itemImage,
                            //             fit: BoxFit.fill),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Container(
                                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                padding: EdgeInsets.all(8.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  customMenuModel.menuName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.kWhiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 2, color: AppColors.kPrimaryColor),
                                ),
                                child: Image.asset(customMenuModel.itemImage,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    customMenuModel.menuItemsList.length,
                                    (position) => _buildCheckBoxItems(
                                        customMenuModel.menuItemsList,
                                        position)),
                              ],
                            ),
                            // RadioListTile(
                            //   activeColor: AppColors.kPrimaryColor,
                            //   selected: true,
                            //   value: 1,
                            //   groupValue: customMenuModel.menuItemsList[0].itemName,
                            //   title: Text(
                            //       customMenuModel.menuItemsList.length.toString() +
                            //           " " +
                            //           customMenuModel.menuItemsList[0].itemName),
                            //   onChanged: (value) {},
                            // )
                          ],
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
            ),
            SizedBox(height: 20),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Total: Rs. $totalPrice",
                  textAlign: TextAlign.end,
                ),
              ),
            )
          ],
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

  Widget _buildCheckBoxItems(
      List<CustomMenuItemsModel> menuItemsList, int index) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: AppColors.kPrimaryColor,
        checkColor: Colors.white,
        autofocus: false,
        dense: true,
        selected: menuItemsList[index].isChecked,
        value: menuItemsList[index].isChecked,
        title: Text(menuItemsList[index].itemName),
        // onChanged: (bool value) {
        //   setState(() {
        //     _value = value;
        //   });
        // },
        onChanged: (bool val) {
          //itemChange(val, index);
          setState(() {
            menuItemsList[index].isChecked = val;
          });
        });
  }

  // void itemChange(bool val, int index) {
  //   setState(() {
  //     menuItemsList[index].isCheck = val;
  //   });
  // }
}
