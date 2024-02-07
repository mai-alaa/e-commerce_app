import 'package:ecommerce_app/Core/network/local/cache_helper.dart';
import 'package:ecommerce_app/Features/Splash/Presentation/Views/Splash_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/manager/sign%20in%20cubit/sign_in_cubit.dart';
import 'package:ecommerce_app/Features/auth/presentations/manager/sign%20up%20cubit/user_data_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/manager/BNB%20cubit/bottom_n_b_cubit_cubit.dart';
import 'package:ecommerce_app/Features/home/presentation/manager/get%20user%20cubit/get_user_cubit.dart';
import 'package:ecommerce_app/bloc_observer.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserCubit(),
          child: BlocConsumer<GetUserCubit, GetUserState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container();
            },
          ),
        ),
        BlocProvider(
          create: (context) => UserDataCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNBCubitCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.kanitTextTheme(),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 10,
              selectedItemColor: KPrimaryColor,
              unselectedItemColor: KSecColor,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(color: KPrimaryColor),
              unselectedLabelStyle: TextStyle(color: KSecColor)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
