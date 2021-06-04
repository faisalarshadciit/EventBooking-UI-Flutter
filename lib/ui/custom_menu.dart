import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/methods/json_method.dart';
import 'package:event_book_app/methods/toast_methods.dart';
import 'package:event_book_app/models/custom_menu_model.dart';
import 'package:event_book_app/ui/receipt_screen.dart';
import 'package:event_book_app/ui/widgets/colored_text_widget.dart';
import 'package:flutter/material.dart';
import 'components/rounded_button.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'widgets/appbar_widget.dart';

class CustomMenuSelection extends StatefulWidget {
  const CustomMenuSelection({Key key}) : super(key: key);

  @override
  _CustomMenuSelectionState createState() => _CustomMenuSelectionState();
}

class _CustomMenuSelectionState extends State<CustomMenuSelection> {
  // value set to false
  bool _value = false;
  double totalPrice = 0;

  List<String> _checked = [];
  List<int> _indexed = [];

  @override
  void initState() {
    // TODO: implement initState
    totalPrice = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, StringAssets.kTextCustomMenu),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: readGetRequestCustomMenu(),
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
                            Container(
                              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                              padding: EdgeInsets.all(8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[300],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: EdgeInsets.all(3),
                                        child: Image.asset(
                                            customMenuModel.itemImage,
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: coloredTextWidget(
                                        customMenuModel.menuName,
                                        16.0,
                                        AppColors.kPrimaryColor),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    customMenuModel.menuItemsList.length,
                                    (position) => _buildCheckBoxes(
                                        customMenuModel.menuItemsList,
                                        position)),
                              ],
                            ),
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
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: StringAssets.kTextTotal,
                        style: TextStyle(
                            fontSize: 28.0,
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Rs. ${totalPrice.toStringAsFixed(2)}",
                      )
                    ],
                  ),
                  textScaleFactor: 0.6,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          child: RoundedButton(
            text: StringAssets.kTextNext.toUpperCase(),
            press: () {
              if (_checked.length != 0) {
                StringAssets.kPerHeadCharges = totalPrice;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReceiptPage()));
              } else {
                ToastMethod.errorToastMessage(
                    "Please select at least one item");
              }
            },
          )),
    );
  }

  Widget _buildCheckBoxes(List<CustomMenuItemsModel> menuItemsList, int index) {
    return CheckboxGroup(
      labels: <String>[menuItemsList[index].itemName],
      activeColor: AppColors.kPrimaryColor,
      checkColor: Colors.white,
      checked: _checked,
      onChange: (bool isChecked, String label, int index) => {
        setState(() {
          if (isChecked == false) {
            _checked.removeAt(index);
            totalPrice = totalPrice - menuItemsList[index].perHeadPrice;
          } else {
            totalPrice = totalPrice + menuItemsList[index].perHeadPrice;
          }
        })
      },
      onSelected: (List selected) => setState(() {
        _checked = selected;

        print(totalPrice);
        totalPrice = totalPrice + menuItemsList[index].perHeadPrice;
      }),
    );
  }

  // void itemChange(bool val, int index) {
  //   setState(() {
  //     menuItemsList[index].isCheck = val;
  //   });
  // }
}
