import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/features/auth/presentation/conrtoller/auth_controller.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/widgets/base_button.dart';
import '../../../../route/routes.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ManagerColors.transparent,
            title: Text(
              ManagerStrings.signUp,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: ManagerFontWeight.w600,
              ),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Align(
                    child: Container(
                      margin: EdgeInsets.only(top: ManagerHeight.h111),
                      alignment: Alignment.center,
                      width: ManagerWidth.w138,
                      height: ManagerHeight.h141,
                      child: Image.asset(ManagerAssets.signupLogo),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  //username
                  Container(
                    padding: EdgeInsets.all(ManagerWidth.w8),
                    color: ManagerColors.textFieldBackGroundColor,
                    width: ManagerWidth.w315,
                    height: ManagerHeight.h60,
                    child: TextField(
                      controller: controller.userNameTextEditingController,
                      cursorColor: ManagerColors.primaryColor,
                      decoration: InputDecoration(
                          errorText: controller.nameError,
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ManagerColors.error,
                          )),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelText: ManagerStrings.username,
                          labelStyle: TextStyle(
                              color: ManagerColors.textFieldlabelcolor,
                              fontFamily: 'Gilroy',
                              fontSize: ManagerFontSizes.s16)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  //password
                  Container(
                    padding: EdgeInsets.all(ManagerWidth.w8),
                    color: ManagerColors.textFieldBackGroundColor,
                    width: ManagerWidth.w315,
                    height: ManagerHeight.h60,
                    child: TextField(
                      controller: controller.passwordTextEditingController,
                      cursorColor: ManagerColors.primaryColor,
                      obscureText: controller.showPassword,
                      decoration: InputDecoration(
                          errorText: controller.passwordError,
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ManagerColors.error,
                          )),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.changePasswordVisibility(),
                            icon: controller.showPassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(
                                    Icons.visibility,
                                    color: ManagerColors.primaryColor,
                                  ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelText: ManagerStrings.password,
                          labelStyle: TextStyle(
                              color: ManagerColors.textFieldlabelcolor,
                              fontFamily: 'Gilroy',
                              fontSize: ManagerFontSizes.s16)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  // confirm password
                  Container(
                    padding: EdgeInsets.all(ManagerWidth.w8),
                    color: ManagerColors.textFieldBackGroundColor,
                    width: ManagerWidth.w315,
                    height: ManagerHeight.h60,
                    child: TextField(
                      obscureText: controller.showConfirmPassword,
                      controller: controller.confirmPasswordTextEditingController,
                      cursorColor: ManagerColors.primaryColor,
                      decoration: InputDecoration(
                          errorText: controller.confirmPasswordError,
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ManagerColors.error,
                          )),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.changeConfirmPasswordVisibility(),
                            icon: controller.showConfirmPassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(
                                    Icons.visibility,
                                    color: ManagerColors.primaryColor,
                                  ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelText: ManagerStrings.confirmPassword,
                          labelStyle: TextStyle(
                              color: ManagerColors.textFieldlabelcolor,
                              fontFamily: 'Gilroy',
                              fontSize: ManagerFontSizes.s16)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  //email
                  Container(
                    padding: EdgeInsets.all(ManagerWidth.w8),
                    color: ManagerColors.textFieldBackGroundColor,
                    width: ManagerWidth.w315,
                    height: ManagerHeight.h60,
                    child: TextField(
                      controller: controller.emailTextEditingController,
                      cursorColor: ManagerColors.primaryColor,
                      decoration: InputDecoration(
                          errorText: controller.emailError,
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ManagerColors.error,
                          )),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelText: ManagerStrings.email,
                          labelStyle: TextStyle(
                              color: ManagerColors.textFieldlabelcolor,
                              fontFamily: 'Gilroy',
                              fontSize: ManagerFontSizes.s16)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  Container(
                    padding: EdgeInsets.all(ManagerWidth.w8),
                    color: ManagerColors.textFieldBackGroundColor,
                    width: ManagerWidth.w315,
                    height: ManagerHeight.h60,
                    child: TextField(
                      controller: controller.phoneTextEditingController,
                      cursorColor: ManagerColors.primaryColor,
                      decoration: InputDecoration(
                          errorText: controller.phoneError,
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ManagerColors.error,
                          )),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelText: ManagerStrings.phone,
                          labelStyle: TextStyle(
                              color: ManagerColors.textFieldlabelcolor,
                              fontFamily: 'Gilroy',
                              fontSize: ManagerFontSizes.s16)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  BaseButton(
                    onPressed: () {
                      controller.performRegister(context);
                    },
                    width: ManagerWidth.w315,
                    height: ManagerHeight.h40,
                    title: ManagerStrings.signUp,
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: ManagerWidth.w16,
                      height: ManagerHeight.h19,
                      child: Text(
                        ManagerStrings.or,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: ManagerFontSizes.s16,
                            color: ManagerColors.miniTextColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: ManagerWidth.w100,
                        height: ManagerHeight.h30,
                        alignment: Alignment.center,
                        child: Image.asset(ManagerAssets.facebook),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: ManagerColors.borderColor,
                          width: 1,
                        )),
                      ),
                      Container(
                        width: ManagerWidth.w100,
                        height: ManagerHeight.h30,
                        alignment: Alignment.center,
                        child: Image.asset(ManagerAssets.twitter),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: ManagerColors.borderColor,
                          width: 1,
                        )),
                      ),
                      Container(
                        width: ManagerWidth.w100,
                        height: ManagerHeight.h30,
                        alignment: Alignment.center,
                        child: Image.asset(ManagerAssets.linkedin),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: ManagerColors.borderColor,
                          width: 1,
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ManagerStrings.alreadyHaveAccount,
                        style: TextStyle(
                            color: ManagerColors.miniTextColor,
                            fontFamily: 'Gilroy'),
                      ),
                      InkWell(
                        child: Text(
                          ManagerStrings.signIn,
                          style: TextStyle(
                              color: ManagerColors.primaryColor,
                              fontFamily: 'Gilroy'),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Routes.signIn);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}
