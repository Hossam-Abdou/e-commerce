import 'package:e_commerce/features/main_layout/categories/view/categories_screen.dart';
import 'package:e_commerce/features/main_layout/favourite/view/favourite_screen.dart';
import 'package:e_commerce/features/main_layout/home/view/home_screen.dart';
import 'package:e_commerce/features/main_layout/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial());
  static BottomBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    emit(ChangeIndexState());
  }

  List<Widget> layouts = [
      HomeScreen(),
      CategoriesScreen(),
      FavouriteScreen(),
    ProfileScreen()
  ];
}
