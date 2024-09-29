import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // This removes the back arrow
      backgroundColor: AppColors.transparent,
      title: const Text('E-Commerce'),
      bottom: PreferredSize(
        preferredSize: Size(100.w, 60.h),
        child: Padding(
          padding: EdgeInsets.all(17.r),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: AppColors.primary,
                    ),
                    hintText: "what do you search for?",
                    iconColor: AppColors.primary,
                    hintStyle: getMediumStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              ImageIcon(
                AssetImage(
                  IconsAssets.icCart,
                ),
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(152.h);

}
