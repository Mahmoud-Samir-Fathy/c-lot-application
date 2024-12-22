abstract class UserReqPassStates{}

class UserReqPassInitialState extends UserReqPassStates{}
class UserReqPassLoadingState extends UserReqPassStates{}
class UserReqPassSuccessState extends UserReqPassStates{}
class UserReqPassErrorState extends UserReqPassStates{
  final String message;

  UserReqPassErrorState(this.message);
}

