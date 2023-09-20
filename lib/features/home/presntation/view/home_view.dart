import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_icon_sizes.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/core/resources/manager_text_style.dart';
import 'package:service/core/widgets/slider_drawer.dart';
import 'package:service/features/home/presntation/controller/home_controller.dart';
import 'package:service/features/home/presntation/model/home_model.dart';
import 'package:service/features/home/presntation/view/widget/category_list.dart';
import 'package:service/features/home/presntation/view/widget/product_card_item.dart';
import 'package:service/features/home/presntation/view/widget/section_title.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../../../../core/constants.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_width.dart';
import '../model/category_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SlideDrawer(
        drawer: SliderDrawer(),
        child: Scaffold(
          backgroundColor: ManagerColors.white,
          appBar: AppBar(
            backgroundColor: ManagerColors.transparent,
            elevation: Constants.appBarElevation,
            title: Text(
              ManagerStrings.home.toUpperCase(),
              style: TextStyle(
                fontSize: ManagerFontSizes.s18,
              ),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_scanner,
                size: ManagerIconSizes.s26,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_shopping_cart,
                  size: ManagerIconSizes.s26,
                ),
              ),
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
            margin: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
            ),
            child: GetBuilder<HomeController>(
              builder: (controller) {
                return Stack(
                  children: [
                    ListView(
                      children: [
                        SizedBox(height: ManagerHeight.h56),
                        Column(
                          children: [
                            categoriesList(controller),
                            SizedBox(height: ManagerHeight.h20),
                            sectionTitle(),
                            Container(
                              height: ManagerHeight.h320,
                              width: ManagerWidth.w300,
                              alignment: Alignment.center,
                              margin: EdgeInsetsDirectional.only(
                                end: ManagerWidth.w12,
                              ),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.bestItemsCard(
                                  controller.homeModel.data.length,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  HomeDataModel homeDataModel =
                                      controller.homeModel.data[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.productDetails(context,homeDataModel.id);
                                    },
                                    child: LayoutBuilder(
                                      builder: (
                                        BuildContext context,
                                        BoxConstraints constraints,
                                      ) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  ManagerRadius.r10,
                                                ),
                                                child: controller.image(
                                                  courseAvatar: homeDataModel
                                                      .thumbnailImage
                                                      .toString(),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    homeDataModel.name,
                                                    style: getMediumTextStyle(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    controller.productPrice(
                                                        homeDataModel.basePrice
                                                            .toString(),
                                                        homeDataModel.unit),
                                                    style: getMediumTextStyle(
                                                      fontSize:
                                                          ManagerFontSizes.s12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: ManagerWidth.w10,
                                  mainAxisSpacing: ManagerHeight.h10,
                                ),
                              ),
                            ),

                            // Features Items In GridView
                            sectionTitle(
                              title: ManagerStrings.home,
                            ),
                            Container(
                              height: ManagerHeight.h210,
                              margin: const EdgeInsets.only(left: 20),
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1.35,
                                ),
                                itemBuilder: (context, index) {
                                  HomeDataModel item =
                                      controller.featuredProducts[index];
                                  return ProductCardItem(item: item);
                                },
                                itemCount: controller.featuredProducts.length,
                              ),
                            ),

                            // Discounted Items In GridView
                            sectionTitle(
                              title: ManagerStrings.home,
                            ),
                            Container(
                              height: ManagerHeight.h210,
                              margin: const EdgeInsets.only(left: 20),
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1.35,
                                ),
                                itemBuilder: (context, index) {
                                  HomeDataModel item =
                                      controller.discountedProducts[index];
                                  return ProductCardItem(item: item);
                                },
                                itemCount: controller.discountedProducts.length,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ManagerColors.white,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r100,
                        ),
                      ),
                      margin: EdgeInsetsDirectional.only(
                        end: ManagerWidth.w20,
                        top: ManagerHeight.h4,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          SizedBox(width: ManagerWidth.w16),
                          Expanded(
                            child: Text(
                              ManagerStrings.search,
                              style: getMediumTextStyle(
                                color: ManagerColors.gray,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_list_rounded,
                              color: ManagerColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
