import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Core/network/local/cache_helper.dart';
import 'package:ecommerce_app/Features/auth/data/models/user_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());
  static GetUserCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void getUser() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }
}
