import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/core/resources/manager_width.dart';
import 'package:service/features/profile/presntation/controller/profile_controller.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../../../../core/resources/manager_icon_sizes.dart';
import '../../../../core/widgets/slider_drawer.dart';
import '../../../../route/routes.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return SlideDrawer(
        drawer: SliderDrawer(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeView);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
            actions: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    SlideDrawer.of(context)?.toggle();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: ManagerIconSizes.s26,
                  ),
                );
              }),
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: ManagerHeight.h150,
                    width: ManagerWidth.w156,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(ManagerAssets.profileImage),
                      radius: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h26,
                ),
                Text(
                  controller.appSettingsSharedPreferences.userName
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: ManagerFontSizes.s24,
                    fontWeight: ManagerFontWeight.regular,
                    fontFamily: "Ubuntu",
                  ),
                ),
                Text(
                  "ID: ${controller.appSettingsSharedPreferences.userId}",
                  style: TextStyle(
                      fontSize: ManagerFontSizes.s16,
                      fontWeight: ManagerFontWeight.regular,
                      fontFamily: "Gilroy",
                      color: ManagerColors.miniTextColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 443.42,
                    width: double.infinity,
                    color: ManagerColors.slideDrawerColor,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                              top: ManagerHeight.h40),
                          width: ManagerWidth.w315,
                          height: ManagerHeight.h80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: ManagerColors.borderColor)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.phone,
                                      color: ManagerColors.ratingStarColor,
                                      size: ManagerIconSizes.s26,
                                    )),
                              ),
                              VerticalDivider(
                                width: ManagerWidth.w40,
                                thickness: 1,
                                color: ManagerColors.dividerColor,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: ManagerHeight.h17),
                                    child: Text(
                                      ManagerStrings.phone,
                                      style: TextStyle(
                                          fontSize: ManagerFontSizes.s14,
                                          fontFamily: "Gilroy",
                                          fontWeight: ManagerFontWeight.regular,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Text(
                                    controller
                                        .appSettingsSharedPreferences.userPhone,
                                    style:
                                        TextStyle(color: ManagerColors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h16,
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(
                              top: ManagerHeight.h40),
                          width: ManagerWidth.w315,
                          height: ManagerHeight.h80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: ManagerColors.borderColor)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.email,
                                      color: ManagerColors.ratingStarColor,
                                      size: ManagerIconSizes.s26,
                                    )),
                              ),
                              VerticalDivider(
                                width: ManagerWidth.w40,
                                thickness: 1,
                                color: ManagerColors.dividerColor,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsetsDirectional.only(top: ManagerHeight.h17),
                                    child: Text(
                                      ManagerStrings.email,
                                      style: TextStyle(
                                        fontSize: ManagerFontSizes.s14,
                                        fontFamily: "Gilroy",
                                        fontWeight: ManagerFontWeight.regular,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controller.appSettingsSharedPreferences.userEmail,
                                    style: TextStyle(
                                        color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s16,
                                      fontFamily: "Gilroy"


                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h16,
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(
                              top: ManagerHeight.h40),
                          width: ManagerWidth.w315,
                          height: ManagerHeight.h80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: ManagerColors.borderColor)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.circle,
                                      color: ManagerColors.ratingStarColor,
                                      size: ManagerIconSizes.s26,
                                    )),
                              ),
                              VerticalDivider(
                                width: ManagerWidth.w40,
                                thickness: 1,
                                color: ManagerColors.dividerColor,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsetsDirectional.only(top: ManagerHeight.h17),
                                    child: Text(
                                      "Projects",
                                      style: TextStyle(
                                        fontSize: ManagerFontSizes.s14,
                                        fontFamily: "Gilroy",
                                        fontWeight: ManagerFontWeight.regular,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "15",
                                    style: TextStyle(
                                        color: ManagerColors.white,
                                        fontSize: ManagerFontSizes.s16,
                                        fontFamily: "Gilroy"


                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
