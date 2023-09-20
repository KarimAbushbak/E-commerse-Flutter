import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_text_style.dart';
import 'package:service/core/resources/manager_width.dart';
import 'package:service/core/widgets/slider_drawer.dart';
import 'package:service/features/home/presntation/controller/home_controller.dart';
import 'package:service/features/product_details/presntation/view/widget/rating_star.dart';

import 'package:slide_drawer/slide_drawer.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/resources/manager_icon_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/page_view_indicator.dart';
import '../../../../route/routes.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool rating = false;
  late PageController _pageController;
  int currentPageIndex = 0;
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SlideDrawer(
          drawer: SliderDrawer(),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                ManagerStrings.productInfo,
                style: TextStyle(
                    fontWeight: ManagerFontWeight.w600,
                    fontSize: ManagerFontSizes.s18,
                    fontFamily: "Gilroy"),
              ),
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
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: ManagerHeight.h50,
                    left: ManagerWidth.w30,
                    right: ManagerWidth.w30,
                    bottom: 40),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: ManagerWidth.w200,
                        height: ManagerHeight.h40,
                        child: Text(
                         controller.productDetailsModel.data.first.name,
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: ManagerFontSizes.s24,
                              fontWeight: ManagerFontWeight.regular),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    Container(
                      width: ManagerWidth.w315,
                      height: ManagerHeight.h56,
                      child: Text(
                        ManagerStrings.productDescription,
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontWeight: ManagerFontWeight.regular,
                            fontSize: ManagerFontSizes.s14),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h26,
                    ),
                    Container(
                      width: ManagerWidth.w315,
                      height: ManagerHeight.h254,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            currentPageIndex = index;
                          });
                        },
                        children: [
                          ...List.generate(
                            controller
                                .productDetailsModel.data.first.photos.length,
                                (index) => Image.network(
                              controller.productDetailsModel.data.first
                                  .photos[index].path,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),

                    ),
                    SizedBox(
                      height: ManagerHeight.h19,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: ManagerWidth.w156,
                        height: ManagerHeight.h16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingStar(),

                            RatingStar(),

                            RatingStar(),

                            RatingStar(),

                            RatingStar(),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h56,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: ManagerFontSizes.s24,
                            fontWeight: ManagerFontWeight.regular),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    ReadMoreText(
                      " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum   ",
                      trimCollapsedText: "Read More",
                      moreStyle: TextStyle(
                        fontFamily: "Gilroy",
                        fontWeight: ManagerFontWeight.w600,
                        fontSize: ManagerFontSizes.s16,
                        color: ManagerColors.ratingStarColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
