import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/data.dart';

part 'random_user_service.g.dart';

@RestApi(baseUrl: 'https://randomuser.me') //Se deja en duro de momento
abstract class RandomUserService {
  factory RandomUserService(Dio dio, {String? baseUrl}) = _RandomUserService;

  @GET('/api/')
  Future<Data> getUser();
}
