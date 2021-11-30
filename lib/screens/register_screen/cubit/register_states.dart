abstract class RegisterStates{}
class RegisterInitState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}
class ChangeEyeState extends RegisterStates{}