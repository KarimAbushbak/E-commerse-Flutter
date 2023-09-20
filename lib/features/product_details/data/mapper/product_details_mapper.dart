

import 'package:service/features/product_details/data/mapper/product_details_data_mapper.dart';

import '../../domain/model/product_details_model.dart';
import '../response/product_details_response.dart';
import 'package:service/core/extensions/extensions.dart';
extension ProductDetailsMapper on ProductDetailsResponse {
  ProductDetailsModel toDomain() {
    return ProductDetailsModel(
      data: data!.map((e) => e.toDomain()).toList(),
      status: status.onNull(),
      success: success.onNull(),
    );
  }
}
