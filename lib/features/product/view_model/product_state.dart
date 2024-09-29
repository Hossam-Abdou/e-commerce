part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductsLoadingState extends ProductState {}
final class GetProductsSuccessState extends ProductState {}
final class GetProductsErrorState extends ProductState {}
