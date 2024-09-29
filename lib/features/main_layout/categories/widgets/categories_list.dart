import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/features/main_layout/categories/view_model/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  String? id;

  CategoriesList({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.containerGray,
                border: Border(
                    // set the border for only 3 sides
                    top: BorderSide(
                        width: 2.w, color: AppColors.primary.withOpacity(0.3)),
                    left: BorderSide(
                        width: 2.w, color: AppColors.primary.withOpacity(0.3)),
                    bottom: BorderSide(
                        width: 2.w, color: AppColors.primary.withOpacity(0.3))),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount:  cubit.categoriesModel?.data?.length??0,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    cubit.categoryToggle(index);
                    id=cubit.categoriesModel?.data?[index].id;
                    print('is is ${cubit.categoriesModel?.data?[index].id}');
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        color: cubit.isSelected == index
                            ? AppColors.primary.withOpacity(0.3)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.r))),
                    duration: const Duration(milliseconds: 300),
                    child: Row(
                      children: [
                         Container(
                          margin: EdgeInsets.all(10.r),
                          color: cubit.isSelected == index
                              ? AppColors.primary:Colors.transparent,
                          width: 8.w,
                          height: 60.h,
                        ),
                        Expanded(
                          child: Text(
                            cubit.categoriesModel?.data?[index].name ?? '',
                            style: getMediumStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ), // Dynamic text
                      ],
                    ),
                  ),
                ),

              ),
            ),
          );
        },
      ),
    );
  }
}
