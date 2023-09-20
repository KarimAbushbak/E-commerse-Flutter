import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../../features/home/presntation/controller/home_controller.dart';
import '../../route/routes.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_font_sizes.dart';
import '../resources/manager_height.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_text_style.dart';
import '../resources/manager_width.dart';

class SliderDrawer extends StatefulWidget {
  SliderDrawer({Key? key}) : super(key: key);

  @override
  State<SliderDrawer> createState() => _SliderDrawerState();
}

class _SliderDrawerState extends State<SliderDrawer> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.slideDrawerColor,
      body: Container(
        margin: EdgeInsetsDirectional.only(
            top: ManagerHeight.h132, start: ManagerWidth.w98,end: ManagerWidth.w98),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeView);
                setState(() {
                  isPressed1=true;
                  isPressed2=false;
                  isPressed3=false;
                  isPressed4=false;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                minimumSize: Size(ManagerWidth.w82, ManagerHeight.h82),
                backgroundColor: isPressed1?ManagerColors.primaryColor:ManagerColors.transparent,
                foregroundColor: Colors.white, // <-- Button color
              ),
              child: Icon(Icons.home),
            ),
            SizedBox(
              height: ManagerHeight.h14,
            ),
            Text(
              ManagerStrings.home,
              style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  fontWeight: ManagerFontWeight.w600,
                  color: ManagerColors.white,
                  fontFamily: "Gilroy"),
            ),
            SizedBox(
              height: ManagerHeight.h43,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPressed1=false;
                  isPressed2=true;
                  isPressed3=false;
                  isPressed4=false;
                });
                Navigator.pushNamed(context, Routes.profileView);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                minimumSize: Size(ManagerWidth.w82, ManagerHeight.h82),
                backgroundColor: isPressed2?ManagerColors.primaryColor:ManagerColors.transparent,
                foregroundColor: Colors.white, // <-- Button color
              ),
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: ManagerHeight.h14,
            ),
            Text(
              ManagerStrings.profile,
              style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  fontWeight: ManagerFontWeight.w600,
                  color: ManagerColors.white,
                  fontFamily: "Gilroy"),
            ),
            SizedBox(
              height: ManagerHeight.h43,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.language);
                setState(() {
                  isPressed1=false;
                  isPressed2=false;
                  isPressed3=true;
                  isPressed4=false;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                minimumSize: Size(ManagerWidth.w82, ManagerHeight.h82),
                backgroundColor: isPressed3?ManagerColors.primaryColor:ManagerColors.transparent,
                foregroundColor: Colors.white, // <-- Button color
              ),
              child: Icon(Icons.settings),
            ),
            SizedBox(
              height: ManagerHeight.h14,
            ),
            Text(
              ManagerStrings.settings,
              style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  fontWeight: ManagerFontWeight.w600,
                  color: ManagerColors.white,
                  fontFamily: "Gilroy"),
            ),
            SizedBox(
              height: ManagerHeight.h43,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPressed1=false;
                  isPressed2=false;
                  isPressed3=false;
                  isPressed4=true;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                minimumSize: Size(ManagerWidth.w82, ManagerHeight.h82),
                backgroundColor: isPressed4?ManagerColors.primaryColor:ManagerColors.transparent,
                foregroundColor: Colors.white, // <-- Button color
              ),
              child: Icon(Icons.mail),
            ),
            SizedBox(
              height: ManagerHeight.h14,
            ),
            Text(
              ManagerStrings.messages,
              style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  fontWeight: ManagerFontWeight.w600,
                  color: ManagerColors.white,
                  fontFamily: "Gilroy"),
            ),
          ],
        ),
      ),
    );
  }
}
