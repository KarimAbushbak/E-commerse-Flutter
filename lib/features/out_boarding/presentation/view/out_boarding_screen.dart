import 'package:flutter/material.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/core/resources/manager_width.dart';
import 'package:service/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../core/constants.dart';
import '../../../../core/widgets/base_button.dart';
import '../../../../route/routes.dart';
import '../widget/out_boarding_content.dart';
import '../widget/progress_indicator.dart';
class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({super.key});

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  final AppSettingsSharedPreferences _appSettingsSharedPreferences=AppSettingsSharedPreferences();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:  EdgeInsets.symmetric(
          horizontal: ManagerWidth.w30,
          vertical: ManagerHeight.h34,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(//m
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: (int value) {
                  setState(() {
                    _currentPageIndex = value;
                  });
                },
                children:  [
                  OutBoardingContent(
                    image: ManagerAssets.outBoarding1,
                    title1: ManagerStrings.outBoardingTitle11,
                    title2: ManagerStrings.outBoardingTitle12,
                    subTitle1: ManagerStrings.outBoardingSubTitle11,
                    subTitle2: ManagerStrings.outBoardingSubTitle12,
                  ),
                  OutBoardingContent(
                    image: ManagerAssets.outBoarding2,
                    title1: ManagerStrings.outBoardingTitle21,
                    title2: ManagerStrings.outBoardingTitle22,
                    subTitle1: ManagerStrings.outBoardingSubTitle21,
                    subTitle2: ManagerStrings.outBoardingSubTitle22,
                  ),
                  OutBoardingContent(
                    image: ManagerAssets.outBoarding3,
                    title1: ManagerStrings.outBoardingTitle31,
                    title2: ManagerStrings.outBoardingTitle32,
                    subTitle1: ManagerStrings.outBoardingSubTitle31,
                    subTitle2: ManagerStrings.outBoardingSubTitle32,
                  ),
                  OutBoardingContent(
                    image: ManagerAssets.outBoarding4,
                    title1: ManagerStrings.outBoardingTitle41,
                    title2: ManagerStrings.outBoardingTitle42,
                    subTitle1: ManagerStrings.outBoardingSubTitle41,
                    subTitle2: ManagerStrings.outBoardingSubTitle42,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                progressIndicator(
                  color: _currentPageIndex == 0
                      ? ManagerColors.black
                      : ManagerColors.progressIndicatorColor,
                  width: _currentPageIndex == 0
                      ? ManagerWidth.w20
                      : ManagerWidth.w8,
                ),
                progressIndicator(
                  color: _currentPageIndex == 1
                      ? ManagerColors.black
                      : ManagerColors.progressIndicatorColor,
                  width: _currentPageIndex == 1
                      ? ManagerWidth.w20
                      : ManagerWidth.w8,
                ),
                progressIndicator(
                  color: _currentPageIndex == 2
                      ? ManagerColors.black
                      : ManagerColors.progressIndicatorColor,
                  width: _currentPageIndex == 2
                      ? ManagerWidth.w20
                      : ManagerWidth.w8,
                ),
                progressIndicator(
                  color: _currentPageIndex == 3
                      ? ManagerColors.black
                      : ManagerColors.progressIndicatorColor,
                  width: _currentPageIndex == 3
                      ? ManagerWidth.w20
                      : ManagerWidth.w8,
                ),
              ],
            ),
             SizedBox(height: ManagerHeight.h40),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: ManagerWidth.w40,
              ),
              child: Visibility(
                visible: isLastPage(),
                replacement: BaseButton(
                  isVisibleIcon: true,
                  textStyle: TextStyle(
                    fontSize: ManagerFontSizes.s16,
                    color: ManagerColors.white,
                  ),
                  onPressed: () {
                    _appSettingsSharedPreferences.saveViewedOutBoarding();
                    _pageController.animateToPage(
                      Constants.outBoardingLastPage,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  title: ManagerStrings.next,
                ),
                child:ElevatedButton(
                  onPressed: () {
                    _appSettingsSharedPreferences.saveViewedOutBoarding();
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    minimumSize: Size(
                      ManagerWidth.w82,
                      ManagerHeight.h82
                    ),
                    backgroundColor: ManagerColors.primaryColor, // <-- Button color
                    foregroundColor: Colors.red, // <-- Splash color
                  ),
                  child: Icon(Icons.add, color: ManagerColors.white),
                )
              ),
            ),
          ],
        ),
      ),
    );}
  bool isNotFirstPage() {
    return _currentPageIndex != 0;
  }

  bool isFirstPage() {
    return _currentPageIndex == 0;
  }

  bool isSecondPage() {
    return _currentPageIndex == 1;
  }

  bool isThirdPage() {
    return _currentPageIndex == 2;
  }

  bool isLastPage() {
    return _currentPageIndex == Constants.outBoardingLastPage;
  }

  bool isNotLastPage() {
    return _currentPageIndex != Constants.outBoardingLastPage;
  }
}


