import 'package:ecommerce_app/Features/Splash/Presentation/Views/Splash_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/manager/sign%20in%20cubit/sign_in_cubit.dart';
import 'package:ecommerce_app/Features/auth/presentations/manager/sign%20up%20cubit/user_data_cubit.dart';
import 'package:ecommerce_app/bloc_observer.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const ECommerceApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDataCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.kanitTextTheme(),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
