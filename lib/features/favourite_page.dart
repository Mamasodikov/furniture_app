import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/app_constants.dart';
import 'package:furniture_app/generated/assets.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../widgets/fav_page_widgets/wishlist_item.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Spacer(),
                Text(
                  "Wishlist",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 26,
                        child: SvgPicture.asset(Assets.assetsBag),
                        backgroundColor: cLightYellowColor,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        child: Text(
                          "2",
                          style: (TextStyle(fontSize: 10, color: Colors.white)),
                        ),
                        backgroundColor: cCarrotColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Wishlist (4)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: cWoodenColorDark),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FadingEdgeScrollView.fromScrollView(
              child: ListView(
                controller: ScrollController(),
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 100),
                physics: BouncingScrollPhysics(),
                children: List.generate(
                    3, (index) => ZoomTapAnimation(child: WishlistItem())),
              ),
            ),
          )
        ],
      ),
    );
  }
}
