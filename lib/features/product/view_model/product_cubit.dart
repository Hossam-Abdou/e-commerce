import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/features/product/model/GetAllProducts.dart';
import 'package:e_commerce/features/product/model/GetProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  GetAllProductsModel? getAllProductsModel;
  GetProductDetailsModel? getProductDetailsModel;

  getAllProducts(id) {
    emit(GetProductsLoadingState());
    ApiManager().getData(
      endPoint: EndPoints.products,
      param: {
        'category[in]':'$id'
      }
    ).then((value) {
      getAllProductsModel = GetAllProductsModel.fromJson(value.data);

      emit(GetProductsSuccessState());
    }).catchError((error) {
      debugPrint('the error ${error.toString()}');
      emit(GetProductsErrorState());
    });
  }






}
