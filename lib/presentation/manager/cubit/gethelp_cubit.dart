import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/presentation/manager/states/gethelp_states.dart';

class GetHelpCubit extends Cubit<GetHelpStates> {
  GetHelpCubit() : super(GetHelpInitStates());

  static GetHelpCubit get(context) => BlocProvider.of(context);
}
