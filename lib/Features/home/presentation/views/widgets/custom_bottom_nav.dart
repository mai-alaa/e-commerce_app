import 'package:ecommerce_app/Features/home/presentation/manager/BNB%20cubit/bottom_n_b_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNBCubitCubit(),
      child: BlocConsumer<BottomNBCubitCubit, BottomNBState>(
        listener: (context, state) {},
        builder: (context, state) {
          BottomNBCubitCubit cubit = BottomNBCubitCubit().get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.onChangeBottomNavBar(index);
                },
                currentIndex: cubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favourites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.ellipsis), label: 'More')
                ]),
          );
        },
      ),
    );
  }
}
