import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/app_constants.dart';
import 'package:furniture_app/generated/assets.dart';

class WishlistItem extends StatefulWidget {
  const WishlistItem({super.key});

  @override
  State<WishlistItem> createState() => _WishlistItemState();
}

class _WishlistItemState extends State<WishlistItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
          alignment: Alignment.topCenter,
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: cLightGreenColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SvgPicture.asset(Assets.assetsPlaceholder),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "VEDBO",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Armchair, Gunnared",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: cBlackWood),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            if (index < 4) {
                              return SvgPicture.asset(Assets.assetsStar5);
                            } else {
                              return SvgPicture.asset(Assets.assetsStar5, color: cWoodenColor,);
                            }
                          }),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "(53)",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: cBlackWood),
                        ),

                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 24,
                          child: SvgPicture.asset(Assets.assetsBag, color: cCarrotColor,),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          )),
    );
  }
}
