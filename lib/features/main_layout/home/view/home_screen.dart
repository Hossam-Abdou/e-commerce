import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/constants_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/features/main_layout/categories/view_model/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(17.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Image.asset(AppConstants.adsImages[1]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: getMediumStyle(
                    fontSize: 18.sp,
                    color: AppColors.darkBlue,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'view all',
                    style: getMediumStyle(color: AppColors.darkBlue),
                  ),
                ),
              ],
            ),
            BlocProvider(
              create: (context) => CategoryCubit()..getAllCategories(),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  var cubit = CategoryCubit.get(context);
                  return GridView.builder(
                    itemCount: cubit.categoriesModel?.data?.length ?? 0,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 14 / 28,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              final categoryId =  cubit.categoriesModel?.data?[index].id;
                              Navigator.pushNamed(
                                context,
                                Routes.productRoute,
                                arguments: cubit.categoriesModel?.data?[index].id,
                              );
                              debugPrint('home id is ${cubit.categoriesModel?.data?[index].id}');
                              debugPrint('home id type is ${cubit.categoriesModel?.data?[index].id.runtimeType}');
                            },
                            child: CachedNetworkImage(
                              height: 100.h,
                              width: 100.w,
                              fit: BoxFit.cover,
                              imageUrl:
                                  cubit.categoriesModel?.data?[index].image ??
                                      '',
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            cubit.categoriesModel?.data?[index].name ?? '',
                            style: getRegularStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
