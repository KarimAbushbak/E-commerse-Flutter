import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:service/core/constants.dart';

import '../../../features/product_details/data/response/product_details_response.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: ApiRequest.baseUrl)
abstract class AppApi{
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;
  
  @GET(ApiRequest.productDetails)
  Future<ProductDetailsResponse> productDetails(@Path(ApiConstants.id) int id);
}