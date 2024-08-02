import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/app_constants.dart';
import 'package:furniture_app/widgets/home_page_widgets/bottom_navigation_canvas.dart';

import 'features/favourite_page.dart';
import 'generated/assets.dart';
import 'features/home_page.dart';
import 'widgets/item_navigation_view.dart';
import 'widgets/navigation_view.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State {
  int _selectedTab = 0;

  List _pages = [
    HomePage(),
    FavouritePage(),
    Container(
      color: cFirstColor.withAlpha(10),
      child: Center(
        child: Text("Main"),
      ),
    ),
    Container(
      color: cFirstColor.withAlpha(10),
      child: Center(
        child: Text("Cart"),
      ),
    ),
    Container(
      color: cFirstColor.withAlpha(10),
      child: Center(
        child: Text("Profile"),
      ),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              _pages[_selectedTab],
              Positioned(bottom: -1, child: BottomNavigationCanvas()),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationView(
                    onChangePage: (c) {
                      _changeTab(c);
                    },
                    durationAnimation: const Duration(milliseconds: 400),
                    color: cFirstColor,
                    backgroundColor: Colors.transparent,
                    borderTopColor: Colors.transparent,
                    gradient: LinearGradient(
                        colors: [
                          cFirstColor.withOpacity(0.4),
                          cFirstColor.withAlpha(0),
                        ],
                        begin: const FractionalOffset(0.0, 1),
                        end: const FractionalOffset(0.0, 0.7),
                        stops: const [0, 200],
                        tileMode: TileMode.decal),
                    items: [
                      ItemNavigationView(
                          childAfter: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.person,
                              color: cFirstColor,
                              size: 30,
                            ),
                          ),
                          childBefore: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.person_outline,
                              color: cFirstColor,
                              size: 30,
                            ),
                          )),
                      ItemNavigationView(
                          childAfter: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.shopping_bag_rounded,
                              color: cFirstColor,
                              size: 30,
                            ),
                          ),
                          childBefore: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: cFirstColor,
                              size: 30,
                            ),
                          )),
                      ItemNavigationView(
                          childAfter: Padding(
                            padding: EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: SvgPicture.asset(Assets.assetsMain),
                          ),
                          childBefore: Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: SvgPicture.asset(Assets.assetsMain),
                          )),
                      ItemNavigationView(
                          childAfter: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.favorite,
                              color: cFirstColor,
                              size: 30,
                            ),
                          ),
                          childBefore: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.favorite_outline,
                              color: cFirstColor,
                              size: 30,
                            ),
                          )),
                      ItemNavigationView(
                          childAfter: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.home_rounded,
                              color: cFirstColor,
                              size: 30,
                            ),
                          ),
                          childBefore: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Icon(
                              Icons.home_outlined,
                              color: cFirstColor,
                              size: 30,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
