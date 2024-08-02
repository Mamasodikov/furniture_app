import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/app_constants.dart';
import 'package:furniture_app/generated/assets.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class InspirationRoomSection extends StatefulWidget {
  const InspirationRoomSection({super.key});

  @override
  State<InspirationRoomSection> createState() => _InspirationRoomSectionState();
}

class _InspirationRoomSectionState extends State<InspirationRoomSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Inspiration by Room",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                "View All",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ZoomTapAnimation(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: cLightGreenColor,
              ),
              child: SvgPicture.asset(Assets.assetsPlaceholder),
            ),
          ),
        ],
      ),
    );
  }
}