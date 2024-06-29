import 'package:home/api/client.dart';

class UserApi {
  final DioClient client;

  UserApi({required this.client});
}

class ApiException {
  final String message;

  ApiException(this.message);
}
