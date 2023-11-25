import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/config/network/constant.dart';
import 'package:save/models/help_model.dart';
import 'package:save/presentation/manager/states/help_them_states.dart';

class HelpCubit extends Cubit<HelpStates> {
  HelpCubit() : super(HelpInitState());
  static HelpCubit get(context) => BlocProvider.of(context);


  void helpFun({
    required String address,
    required String gender,
    required String phone,
    required String postImage,
  }) async {
    emit(HelpLoadingState());
    HelpModel model = HelpModel(
      phone: phone,
      uId: uId,
      address: address,
      image: postImage,
      gender: gender,
    );
    await FirebaseFirestore.instance
        .collection('Helps')
        .doc("${DateTime.now()}")
        .set(model.toMap())
        .then((value) {
      emit(HelpSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HelpErrState());
    });
  }
}
