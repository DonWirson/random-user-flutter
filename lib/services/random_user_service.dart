import 'package:dio/dio.dart';
import 'package:random_user/model/result.dart';
import 'package:retrofit/retrofit.dart';

import '../model/data.dart';

part 'random_user_service.g.dart';

@RestApi(baseUrl: 'https://randomuser.me')
abstract class RandomUserService {
  factory RandomUserService(Dio dio, {String? baseUrl}) = _RandomUserService;
  // static const String _apiUrl = "https://randomuser.me/api/";

  @GET('/api/')
  Future<Data> getUser();
}
