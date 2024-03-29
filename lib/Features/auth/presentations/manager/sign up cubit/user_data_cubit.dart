import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  static UserDataCubit get(context) => BlocProvider.of(context);
  bool isPass = true;
  IconData suffix = Icons.visibility_outlined;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(CreateUserLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      createUser(email: email, name: name, phone: phone, uId: user.user?.uid);
    } catch (error) {
      emit(CreateUserFailureState(error.toString()));
    }
  }

  void createUser({
    required String? email,
    required String name,
    required String phone,
    required String? uId,
  }) {
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSucessState(uId));
      print(uId);
    }).catchError((error) {
      emit(CreateUserFailureState(error.toString()));
    });
  }

  void changePasswordVisibility() {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassVisibilityState());
  }
}
