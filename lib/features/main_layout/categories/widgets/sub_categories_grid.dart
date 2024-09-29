import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/constants_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/features/main_layout/categories/view_model/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesGrid extends StatelessWidget {
String? id;
  SubCategoriesGrid({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    print('the grid is $id');
    return BlocProvider(
      create: (context) => CategoryCubit()..getSubCategories('6439d5b90049ad0b52b90048'),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          print(cubit.subCategoriesModel?.data?[0].name);
          return Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    'Mens Fashion',
                    style: getMediumStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16.h,
                  ),
                ),
                SliverToBoxAdapter(
                    child: Image.asset(
                      AppConstants.adsImages[2],
                      width: MediaQuery
                          .sizeOf(context)
                          .width * 0.55,
                    )),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20
                      ..h,
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.productRoute);
                          },
                          child: Container(
                            height: 85.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  AppConstants.adsImages[0],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        Text(
                    cubit.subCategoriesModel?.data?[index].name ?? '',
                          style: getRegularStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,

                          ),
                        ),
                      ],
                    );
                  }, childCount: cubit.subCategoriesModel?.data?.length??0,),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 10 / 22,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
