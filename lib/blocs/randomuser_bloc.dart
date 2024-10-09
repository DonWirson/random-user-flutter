import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'randomuser_event.dart';
part 'randomuser_state.dart';

class RandomuserBloc extends Bloc<RandomuserEvent, RandomuserState> {
  RandomuserBloc() : super(RandomuserInitial()) {
    on<RandomuserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
