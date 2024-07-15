import 'package:dio/dio.dart';

class AppServices {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://hp-api.onrender.com/api"));

  Future<ApiResponse> getData(String endpoint) async {
    try {
      var response = await dio.get(endpoint);
      if (response.statusCode == 200 && response.data != null) {
        return ApiResponse(
            success: true,
            data: response.data,
            message: response.statusMessage);
      } else {
        return ApiResponse(
            success: false, data: [], message: response.statusMessage);
      }
    } catch (e) {
      return ApiResponse(
          success: false, data: [], message: "Unexpected error occurred");
    }
  }
}

class ApiResponse {
  bool success;
  List<dynamic> data;
  int? totalCount;
  String? message;
  int? rowsAffected;
  Map? row;
  int? primaryKey;
  int? statusCode;

  ApiResponse(
      {required this.success,
      required this.data,
      this.totalCount,
      this.message,
      this.rowsAffected,
      this.row,
      this.statusCode,
      this.primaryKey});
}
