part of 'random_user_bloc.dart';

abstract class RandomUserEvent extends Equatable {
  const RandomUserEvent();

  @override
  List<Object> get props => [];
}

class GotRandomUser extends RandomUserEvent {}

class InsertedNewUser extends RandomUserEvent {
  final User user;

  const InsertedNewUser({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class GotLocalUsers extends RandomUserEvent {}
