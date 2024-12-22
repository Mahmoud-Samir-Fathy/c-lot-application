abstract class SignUpStates{}
class SignUpInitialState extends SignUpStates{}
class SignUpGenderChangedState extends SignUpStates{}
class SignUpAgeRangeChangedState extends SignUpStates{}
class SignUpLoading extends SignUpStates{}



class SignUpSuccessState extends SignUpStates{}

class SignUpErrorState extends SignUpStates{
  final String message;

  SignUpErrorState(this.message);
}

