import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onDrawerTap;
  final VoidCallback onScannerTap;
  final VoidCallback onSearchTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onDrawerTap,
    required this.onScannerTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(
            onTap: onDrawerTap,
            asset: Assets.assetsDrawer,
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withAlpha(50)),
              borderRadius: BorderRadius.circular(200),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              _buildIcon(
                onTap: onScannerTap,
                asset: Assets.assetsScanner,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              _buildIcon(
                onTap: onSearchTap,
                asset: Assets.assetsSearch,
                width: 30,
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required VoidCallback onTap,
    required String asset,
    required double width,
    required double height,
    BoxDecoration? decoration,
  }) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: decoration,
          child: SvgPicture.asset(
            asset,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}