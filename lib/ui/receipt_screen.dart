import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key key}) : super(key: key);

  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  String name = "Faisal Arshad";
  String phone = "+92308-8649850";
  int noOfChairs = 250;
  double perHeadCharges = 600;
  double bridalRoomCharges = 4000;
  double stageDecorationCharges = 5500;
  String date = "24/05/2020";
  String time = "10:00AM - 04:00PM";
  String selectedMenu = "Deal 1";
  double totalCharges = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalCharges = (noOfChairs * perHeadCharges) +
        bridalRoomCharges +
        stageDecorationCharges;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Receipt",
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
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.maxFinite,
          child: Card(
            elevation: 5.0,
            color: AppColors.kSmokeWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: name,
                      )
                    ],
                  ),
                  textScaleFactor: 0.6,
                ),
                Text("Phone: $phone"),
                Text("No. Of Chairs: $noOfChairs"),
                Text("Date: $date"),
                Text("Time: $time"),
                Text("Bridal Room: $bridalRoomCharges"),
                Text("Stage Decoration: $stageDecorationCharges"),
                Text("Selected Menu: $selectedMenu"),
                Text("Total Amount: Rs. $totalCharges"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
