class CreateUserStates {}

class CreateUserInitState extends CreateUserStates {}

class CreatUserLoadingState extends CreateUserStates {}

class CreatUserSuccessState extends CreateUserStates {}

class CreatUserErrState extends CreateUserStates {
  late final String error;
  CreatUserErrState(this.error);
}
