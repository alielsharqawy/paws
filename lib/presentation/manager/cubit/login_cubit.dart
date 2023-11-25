import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/config/network/constant.dart';
import 'package:save/models/user_model.dart';
import 'package:save/presentation/manager/states/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitStates());
  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void userLogin({required String email, required String password}) async {
    emit(LoginLoadingStates());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uId = value.user!.uid;
      setIsLogin();
      emit(LoginSucessStates());
    }).catchError((err) {
      emit(LoginErrStates());
    });
  }

  void getUserData() {
    emit(LoginLoadingStates());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJason(value.data()!);
      emit(LoginSucessStates());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrStates());
    });
  }

  void setIsLogin() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", true);
  }

  bool? isLogin;

  void getIsLogin() async {
    final pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool("isLogin") ?? false;
  }
}
