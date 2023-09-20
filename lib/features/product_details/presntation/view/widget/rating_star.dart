import 'package:flutter/material.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_height.dart';
import 'package:service/core/resources/manager_width.dart';

import '../../../../../core/resources/manager_icon_sizes.dart';


class RatingStar extends StatefulWidget {
  const RatingStar({super.key});

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  bool rating = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.w16,
      height: ManagerHeight.h16,
      child: IconButton(onPressed: (){
        setState(() {
          rating = !rating;
        });
      }, icon: rating
          ? Icon(
        Icons.star,
        color: Colors.white,
        size: ManagerIconSizes.s36,
      )
          : const Icon(
        Icons.star,
        color: ManagerColors.ratingStarColor,
        size: ManagerIconSizes.s36,
      ),),
    );
  }
}
