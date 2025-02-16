import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/font_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
 final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading??false,
      title: SvgPicture.asset(
        SvgAssets.routeLogo,
        height: 25.h,
        width: 25.w,
        colorFilter:
            const ColorFilter.mode(AppColors.textColor, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
          preferredSize: const Size(100,60),
          child: Padding(
            padding:  EdgeInsets.all(8.r),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColors.primary,
                    style: getRegularStyle(
                        color: AppColors.primary, fontSize: 16.sp,),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width:1.w, color: AppColors.error)),
                      prefixIcon: ImageIcon(
                        AssetImage(IconsAssets.icSearch),
                        color: AppColors.primary,
                      ),
                      hintText: "what do you search for?",
                      hintStyle: getRegularStyle(
                          color: AppColors.primary, fontSize: 16.sp,),
                    ),
                  ),
                ),
                // IconButton(
                //     onPressed: () =>
                //         Navigator.pushNamed(context, Routes.cartRoute),
                //     icon: ImageIcon(
                //       AssetImage(IconsAssets.icCart),
                //       color: AppColors.primary,
                //     )),
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
