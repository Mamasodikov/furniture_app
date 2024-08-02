import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/app_constants.dart';
import 'package:furniture_app/generated/assets.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllFurnitureSection extends StatefulWidget {
  const AllFurnitureSection({super.key});

  @override
  State<AllFurnitureSection> createState() => _AllFurnitureSectionState();
}

class _AllFurnitureSectionState extends State<AllFurnitureSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Furniture Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                "View All",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: FadingEdgeScrollView.fromScrollView(
              child: ListView.builder(
                controller: ScrollController(),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: cGrayBorderColor),
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: cLightGreenColor,
                            radius: 54,
                            child: SvgPicture.asset(Assets.assetsPlaceholder),
                          ),
                          const Spacer(),
                          const Text("FLINSHULT"),
                          SizedBox(height: 5),
                          const Text("20 Items"),
                          const Spacer(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
