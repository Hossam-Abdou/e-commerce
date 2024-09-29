import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends BottomNavigationBarItem {
  String label = '';
  String? iconPath;

  CustomBottomBar({required this.label, required this.iconPath})
      : super(
            activeIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: ImageIcon(
                AssetImage(
                  iconPath!,
                ),
                color: AppColors.primary,
              ),
            ),
            icon: ImageIcon(AssetImage(iconPath)),
            label: label);
}
