import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../database/user_db_provider.dart';
import '../model/user.dart';
import '../services/random_user_service.dart';

part 'random_user_event.dart';
part 'random_user_state.dart';

class RandomUserBloc extends Bloc<RandomUserEvent, RandomUserState> {
  int rowsPerPage = 4; //TODO: vincular esto a dropdown?

  RandomUserBloc() : super(RandomUserInitial()) {
    on<RandomUserEvent>((event, emit) {});
    on<GotRandomUser>(getRandomUser);
    on<InsertedNewUser>(insertNewUser);
    on<GotLocalUsers>(getUsersLocally);
  }

  getUsersLocally(
    GotLocalUsers event,
    Emitter<RandomUserState> emit,
  ) async {
    try {
      emit(
        GotLocalUsersInProgress(),
      );
      final users = await UserDbProvider().getUsers();

      emit(
        GotLocalUsersSuccessfull(
          users: users,
        ),
      );
    } catch (e) {
      //Emite mensaje de error
      emit(
        GotLocalUsersUserFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  insertNewUser(
    InsertedNewUser event,
    Emitter<RandomUserState> emit,
  ) async {
    try {
      emit(
        InsertedNewUserInProgress(),
      );
      final newUser = await UserDbProvider().insert(
        event.user,
      );
      emit(
        InsertedNewUserSuccessfull(newUser: newUser),
      );
    } catch (e) {
      //Emite mensaje de error
      emit(
        InsertedNewUserUserFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  getRandomUser(
    GotRandomUser event,
    Emitter<RandomUserState> emit,
  ) async {
    try {
      emit(GotRandomUserInProgress());
      final dio =
          Dio(); //Debería usar esto con un service locator, pero es muy pequeña la app.
      var service = RandomUserService(dio);
      final apiResult = await service.getUser();

      //Mapea respuesta de api a modelo de datos Usuario
      final user = User.usuarioMapper(apiResult.results.first);

      emit(
        GotRandomUserSuccessfull(
          randomUser: user,
        ),
      );
    } catch (e) {
      //Emite mensaje de error
      emit(
        GotRandomUserFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
