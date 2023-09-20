import 'package:flutter/material.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/core/resources/manager_width.dart';
class OutBoardingContent extends StatelessWidget {
  final String image;
  final String? title1;
  final String? title2;
  final String? subTitle1;
  final String? subTitle2;

  const OutBoardingContent({
    super.key,
    this.image = ManagerAssets.outBoarding1,
    this.title1,
    this.title2,
    this.subTitle1,
    this.subTitle2,
  });
  Widget build(BuildContext context){
    return Scaffold(

      body: Align(
          alignment: Alignment.center,
          child:Column(
            children: [
              Container(

                margin: EdgeInsets.only(top: 60),
                child: Column(
                  children: [

                    Container(
                      height: ManagerHeight.h50,
                      width: ManagerWidth.w138,
                      child: Text(

                        title1 ?? ManagerStrings.outBoardingTitle11,
                        style: TextStyle(
                            color: ManagerColors.secondaryColor,
                            fontWeight: ManagerFontWeight.regular,
                            fontSize: ManagerFontSizes.s36,
                            fontFamily: 'Ubuntu'
                        ),
                      ),
                    ),

                    Container(
                      height: ManagerHeight.h50,
                      width: ManagerWidth.w138,
                      child: Text(
                       title2 ?? ManagerStrings.outBoardingTitle12,
                        style: TextStyle(
                            color: ManagerColors.secondaryColor,
                            fontWeight: ManagerFontWeight.regular,
                            fontSize: ManagerFontSizes.s36,
                            fontFamily: 'Ubuntu'
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    Container(
                      width:ManagerWidth.w238,
                      height: ManagerHeight.h285,
                      child: Image.asset(
                      image ?? ManagerAssets.outBoarding1,
                      ),
                    ),
                    SizedBox(height: 60,),
                    Container(
                      alignment: Alignment.center,
                      width: ManagerWidth.w275,
                      height: ManagerHeight.h22,
                      child: Text(
                       subTitle1 ?? ManagerStrings.outBoardingSubTitle12,
                        style: TextStyle(
                            color: ManagerColors.secondaryColor,
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.regular,
                          fontFamily: 'Gilroy'
                        ),

                      ),
                    ),Container(
                      alignment: Alignment.center,
                      width: ManagerWidth.w275,
                      height: ManagerHeight.h22,
                      child: Text(
                       subTitle2 ?? ManagerStrings.outBoardingSubTitle12,
                        style: TextStyle(
                            color: ManagerColors.secondaryColor,
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.regular,
                            fontFamily: 'Gilroy'
                        ),

                      ),
                    ),
                  ],
                ),

              ),
            ],
          )
      ),
    );
  }
  }