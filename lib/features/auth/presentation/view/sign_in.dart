import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/core/resources/manager_width.dart';
import 'package:service/core/widgets/base_button.dart';
import 'package:service/features/auth/presentation/conrtoller/auth_controller.dart';
import 'package:service/route/routes.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ManagerColors.transparent,
          title: Text(
            ManagerStrings.signIn,
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
                    width: ManagerWidth.w100,
                    height: ManagerHeight.h145,
                    child: Image.asset(ManagerAssets.loginLogo),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h50,
                ),
                Container(
                  padding: EdgeInsets.all(ManagerWidth.w8),
                  color: ManagerColors.textFieldBackGroundColor,
                  width: ManagerWidth.w315,
                  height: ManagerHeight.h60,
                  child: TextField(
                    controller: controller.emailTextEditingController,
                    cursorColor: ManagerColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
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
                //password
                Container(
                  padding: EdgeInsets.all(ManagerWidth.w8),
                  color: ManagerColors.textFieldBackGroundColor,
                  width: ManagerWidth.w315,
                  height: ManagerHeight.h60,
                  child: TextField(
                    cursorColor: ManagerColors.primaryColor,
                    controller: controller.passwordTextEditingController,
                    decoration: InputDecoration(
                        errorText: controller.passwordError,
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: ManagerColors.error,
                        )),
                        suffixIcon: IconButton(
                          onPressed: () => controller.changePasswordVisibility(),
                          icon: controller.showPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(
                            Icons.visibility,
                            color: ManagerColors.primaryColor ,
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
                  height: ManagerHeight.h14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: ManagerWidth.w184,
                      height: ManagerHeight.h22,
                      child: Text(
                        ManagerStrings.forgotYourPassword,
                        style: TextStyle(
                            fontSize: ManagerFontSizes.s16,
                            fontFamily: 'Gilroy',
                            color: ManagerColors.miniTextColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h50,
                ),
                BaseButton(
                  onPressed: () {
                    controller.preformLogin(context);
                  },
                  width: ManagerWidth.w315,
                  height: ManagerHeight.h60,
                  title: ManagerStrings.signIn,
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
                      height: ManagerHeight.h60,
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
                      height: ManagerHeight.h60,
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
                      height: ManagerHeight.h60,
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
                  height: ManagerHeight.h51,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.donNotHaveAnAccount,
                      style: TextStyle(
                          color: ManagerColors.miniTextColor,
                          fontFamily: 'Gilroy'),
                    ),
                    InkWell(
                      child: Text(
                        ManagerStrings.signUp,
                        style: TextStyle(
                            color: ManagerColors.primaryColor,
                            fontFamily: 'Gilroy'),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.signUp);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
