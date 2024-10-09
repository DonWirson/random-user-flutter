part of 'random_user_bloc.dart';

abstract class RandomUserEvent extends Equatable {
  const RandomUserEvent();

  @override
  List<Object> get props => [];
}

class GotRandomUser extends RandomUserEvent{}
