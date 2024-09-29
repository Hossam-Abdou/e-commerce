import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/features/bottom_nav_bar/view_model/bottom_bar_cubit.dart';
import 'package:e_commerce/features/bottom_nav_bar/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/bottom_nav_bar/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  static String routeName = 'bottomBar';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BottomBarCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.118,
              child: BottomNavigationBar(
                backgroundColor: AppColors.primary,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.white,
                showUnselectedLabels: true,
                items: [
                  CustomBottomBar(
                    label: '',
                    iconPath: IconsAssets.icHome,
                  ),
                  CustomBottomBar(
                    label: '',
                    iconPath: IconsAssets.icCategory,
                  ),
                  CustomBottomBar(
                    label: '',
                    iconPath: IconsAssets.icHeart,
                  ),
                  CustomBottomBar(
                    label: '',
                    iconPath: IconsAssets.icProfile,
                  ),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (currentIndex) => cubit.changeIndex(currentIndex),
              ),
            ),
          ),
          body: cubit.layouts[cubit.currentIndex],
        );
      },
    );
  }
}
