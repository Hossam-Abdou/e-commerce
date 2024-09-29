import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/features/main_layout/categories/model/CategoriesModel.dart';
import 'package:e_commerce/features/main_layout/categories/model/SubCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  CategoriesModel? categoriesModel;
  SubCategoryModel? subCategoriesModel;
  int isSelected = 0;

  categoryToggle(value) {
    isSelected = value;
    emit(CategoryToggleState());
  }

  getAllCategories() {
    emit(GetCategoriesLoadingState());
    ApiManager().getData(endPoint: EndPoints.category).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      debugPrint('the error ${error.toString()}');
      emit(GetCategoriesErrorState());
    });
  }

  getSubCategories(dynamic id) {
    emit(GetSubCategoriesLoadingState());
    ApiManager().getData(
        endPoint: '${EndPoints.category}/$id/subcategories',
    ).then((value) {
      subCategoriesModel = SubCategoryModel.fromJson(value.data);
      emit(GetSubCategoriesSuccessState());
    }).catchError((error) {
      debugPrint('the error ${error.toString()}');
      emit(GetSubCategoriesErrorState());
    });
  }
}
