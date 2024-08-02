import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:furniture_app/core/app_constants.dart';

import '../widgets/home_page_widgets/all_furnitures.dart';
import '../widgets/home_page_widgets/main_app_bar.dart';
import '../widgets/home_page_widgets/custom_corousal_widget.dart';
import '../widgets/home_page_widgets/explore_furniture_section.dart';
import '../widgets/home_page_widgets/inspiration_room_section.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  List<String> images = ["", "", ""];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cFirstColor, cFirstColor.withOpacity(0.2)],
          ),
        ),
      ),
      openRatio: 0.5,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 1,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Container(
          child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 64.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Profile'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.favorite),
                    title: Text('Favourites'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ))),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: 'Home',
                  onDrawerTap: () {
                    _advancedDrawerController.showDrawer();
                  },
                  onScannerTap: () {},
                  onSearchTap: () {},
                ),
                Expanded(
                  child: FadingEdgeScrollView.fromSingleChildScrollView(
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Align children to start
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: "New Collection\n",
                                style: TextStyle(
                                  fontSize: 30, // Adjust font size
                                  color: Colors.black, // Adjust text color
                                ),
                                children: [
                                  TextSpan(
                                    text: "with ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        height: 1.6),
                                  ),
                                  TextSpan(
                                    text: "15%",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: cCarrotColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " discount",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomCarousalWidget(imagesLinks: images),
                          const SizedBox(
                            height: 20,
                          ),
                          const InspirationRoomSection(),
                          const SizedBox(height: 20),
                          const AllFurnitureSection(),
                          const SizedBox(
                            height: 20,
                          ),
                          const ExploreFurnitureSection()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
