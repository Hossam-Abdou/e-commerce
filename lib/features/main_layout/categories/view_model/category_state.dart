part of 'category_cubit.dart';

abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryToggleState extends CategoryState {}

final class GetCategoriesLoadingState extends CategoryState {}
final class GetCategoriesSuccessState extends CategoryState {}
final class GetCategoriesErrorState extends CategoryState {}

final class GetSubCategoriesLoadingState extends CategoryState {}
final class GetSubCategoriesSuccessState extends CategoryState {}
final class GetSubCategoriesErrorState extends CategoryState {}


