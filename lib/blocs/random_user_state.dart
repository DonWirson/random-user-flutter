part of 'random_user_bloc.dart';

abstract class RandomUserState extends Equatable {
  const RandomUserState();

  @override
  List<Object> get props => [];
}

class RandomUserInitial extends RandomUserState {}

//Estados de GotRandomUser
class GotRandomUserInProgress extends RandomUserState {}

class GotRandomUserSuccessfull extends RandomUserState {
  final User randomUser;

  const GotRandomUserSuccessfull({
    required this.randomUser,
  });
}

class GotRandomUserFailure extends RandomUserState {
  final String errorMessage;

  const GotRandomUserFailure({
    required this.errorMessage,
  });
}

//Estados de InsertedNewUser
class InsertedNewUserInProgress extends RandomUserState {}

class InsertedNewUserSuccessfull extends RandomUserState {
  final User newUser;

  const InsertedNewUserSuccessfull({
    required this.newUser,
  });
}

class InsertedNewUserUserFailure extends RandomUserState {
  final String errorMessage;

  const InsertedNewUserUserFailure({
    required this.errorMessage,
  });
}

//Estados de GotLocalUsers
class GotLocalUsersInProgress extends RandomUserState {}

class GotLocalUsersSuccessfull extends RandomUserState {
  final List<User> users;

  const GotLocalUsersSuccessfull({
    required this.users,
  });
}

class GotLocalUsersUserFailure extends RandomUserState {
  final String errorMessage;

  const GotLocalUsersUserFailure({
    required this.errorMessage,
  });
}
