import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/main_layout/categories/widgets/categories_list.dart';
import 'package:e_commerce/features/main_layout/categories/widgets/sub_categories_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? selectedCategoryId;

    return Padding(
      padding: EdgeInsets.all(17.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align top of Row
        children: [
          // Container with ListView
          CategoriesList(id: selectedCategoryId,),
          SizedBox(width: 10.w),
          SubCategoriesGrid(id:selectedCategoryId),

        ],
      ),
    );
  }
}
