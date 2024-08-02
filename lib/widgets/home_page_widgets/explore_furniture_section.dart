import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/app_constants.dart';
import 'package:furniture_app/generated/assets.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ExploreFurnitureSection extends StatefulWidget {
  const ExploreFurnitureSection({super.key});

  @override
  State<ExploreFurnitureSection> createState() => _ExploreFurnitureSectionState();
}

class _ExploreFurnitureSectionState extends State<ExploreFurnitureSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Explore Furniture",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: 5,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.77,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ZoomTapAnimation(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: cLightGreenColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: cGrayBorderColor),
                        ),
                        child: SvgPicture.asset(Assets.assetsPlaceholder),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Arm Chair",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "\$124.00",
                      style: TextStyle(color: cPriceColor),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}