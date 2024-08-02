import 'package:flutter/material.dart';
import 'package:furniture_app/generated/assets.dart';

class BottomNavigationCanvas extends StatelessWidget {
  const BottomNavigationCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 50),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.assetsBottombar),
          fit: BoxFit.fill,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Container(),
    );
  }
}