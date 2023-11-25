import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/models/user_model.dart';
import 'package:save/presentation/manager/states/register_states.dart';

class RegisterCubit extends Cubit<CreateUserStates> {
  RegisterCubit() : super(CreateUserInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
  }) {
    emit(CreatUserLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(email: email, uId: value.user!.uid);
    }).catchError((err) {
      emit(CreatUserErrState(err.toString()));
    });
  }

  void userCreate({
    required String email,
    required String uId,
  }) {
    UserModel model = UserModel(
      email: email,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreatUserSuccessState());
    }).catchError((error) {
      emit(CreatUserErrState(error.toString()));
    });
  }
}
