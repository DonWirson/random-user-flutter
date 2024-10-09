part of 'random_user_bloc.dart';

abstract class RandomUserState extends Equatable {
  const RandomUserState();

  @override
  List<Object> get props => [];
}

class RandomUserInitial extends RandomUserState {}

class GotRandomUserSuccessfull extends RandomUserState {}

class GotRandomUserFailure extends RandomUserState {}
