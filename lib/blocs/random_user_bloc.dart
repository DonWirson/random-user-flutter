import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:random_user/model/user.dart';
import 'package:random_user/services/random_user_service.dart';

part 'random_user_event.dart';
part 'random_user_state.dart';

class RandomUserBloc extends Bloc<RandomUserEvent, RandomUserState> {
  int rowsPerPage = 4;

  RandomUserBloc() : super(RandomUserInitial()) {
    on<RandomUserEvent>((event, emit) {});
    on<GotRandomUser>(getRandomUser);
  }

  getRandomUser(
    GotRandomUser event,
    Emitter<RandomUserState> emit,
  ) async {
    try {
      final dio =
          Dio(); //Debería usar esto con un service locator, pero es muy pequeña la app.
      var service = RandomUserService(dio);

      final apiResult = await service.getUser();
      //Mapea respuesta de api a modelo de datos Usuario
      final user = User.usuarioMapper(apiResult.results.first);
      emit(
        GotRandomUserSuccessfull(),
      );
    } catch (e) {
      emit(
        GotRandomUserFailure(),
      );
    }
  }
}
