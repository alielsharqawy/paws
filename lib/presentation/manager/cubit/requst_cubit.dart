import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/models/requset_model.dart';
import 'package:save/presentation/manager/states/request_states.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitState());
  static RequestCubit get(context) => BlocProvider.of(context);

  void requestMethod({
    required String age,
    required String color,
    required String gender,
    required String kind,
    required String phone,
  }) {
    RequestModel model = RequestModel(
      age: age,
      color: color,
      gender: gender,
      kind: kind,
      phone: phone,
    );

    FirebaseFirestore.instance
        .collection('requests')
        .doc("${DateTime.now()}")
        .set(model.toMap())
        .then((value) {
      emit(RequestSuccessState());
    }).catchError((error) {
      emit(RequestErrState());
    });
  }
}
