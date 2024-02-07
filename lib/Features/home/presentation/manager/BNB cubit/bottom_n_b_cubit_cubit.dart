import 'package:ecommerce_app/Features/home/presentation/views/home_screen_view.dart';
import 'package:ecommerce_app/Features/home/presentation/views/profile_view.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/favourites_view.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/menu_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_n_b_cubit_state.dart';

class BottomNBCubitCubit extends Cubit<BottomNBState> {
  BottomNBCubitCubit() : super(BottomNBCubitInitial());
  BottomNBCubitCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const FavouritesView(),
    const ProfileView(),
    const MenuView(),
  ];

  List<String> titles = [
    'Home',
    'Favourites',
    'Profile',
    'More',
  ];
  void onChangeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
