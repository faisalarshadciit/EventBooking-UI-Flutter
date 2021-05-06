import 'package:event_book_app/config/size_config.dart';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'components/outlined_input_field.dart';
import 'components/rounded_button.dart';

class HallBooking3 extends StatefulWidget {
  @override
  _HallBooking3State createState() => _HallBooking3State();
}

class _HallBooking3State extends State<HallBooking3> {
  int selectedImage = 0;
  final List<String> imagesList = [
    'assets/decoration/stage_decoration_1.jpg',
    'assets/decoration/stage_decoration_2.jpg',
    'assets/decoration/stage_decoration_3.jpg',
    'assets/decoration/stage_decoration_4.jpg',
    'assets/decoration/stage_decoration_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hall Booking",
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
            child: Form(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Menu Selection",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(imagesList.length,
                            (index) => buildSmallImagePreview(index)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          child: RoundedButton(
            text: "NEXT",
            press: () {},
          )),
    );
  }

  Container buildSmallImagePreview(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedImage = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.all(5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 3,
                color: AppColors.kPrimaryColor
                    .withOpacity(selectedImage == index ? 1 : 0)),
          ),
          child: Image.asset(imagesList[index], fit: BoxFit.fill),
        ),
      ),
    );
  }
}
