import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/app_constants.dart';

import '../../generated/assets.dart';

class CustomCarousalWidget extends StatefulWidget {
  final List<String> imagesLinks;

  const CustomCarousalWidget({super.key, required this.imagesLinks});

  @override
  State<CustomCarousalWidget> createState() => _CustomCarousalWidgetState();
}

class _CustomCarousalWidgetState extends State<CustomCarousalWidget> {
  List<Widget> imageSliders = [];
  CarouselController carouselController = CarouselController();
  int _current = 0;
  ValueNotifier valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    imageSliders = widget.imagesLinks
        .map((item) => Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cLightGreenColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: SvgPicture.asset(Assets.assetsPlaceholder),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.90,
                  aspectRatio: 1.5,
                  onPageChanged: (index, reason) {
                    _current = index;
                    valueNotifier.value = index;
                  }),
            ),
            Positioned(
              bottom: 70,
              child: ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, child, value) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageSliders.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: _current == entry.key ? 30.0 : 20,
                              height: 6,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: _current == entry.key
                                      ? cCarrotColor
                                      : cGrayColor),
                            ),
                          );
                        }).toList());
                  }),
            ),
            Positioned(
                bottom: 0,
                child: MaterialButton(
                  child: Text(
                    "Shop now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  minWidth: 150,
                  height: 50,
                  color: cFirstColor,
                ))
          ],
        ));
  }
}
