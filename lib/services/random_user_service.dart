import 'package:dio/dio.dart';
import '../model/data.dart';
import 'package:retrofit/retrofit.dart';

part 'random_user_service.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/api/')
abstract class RandomUserService {
  factory RandomUserService(Dio dio, {String? baseUrl}) = _RandomUserService;
  // static const String _apiUrl = "https://randomuser.me/api/";

  @GET('/tasks')
  Future<Data> getUser();
}
