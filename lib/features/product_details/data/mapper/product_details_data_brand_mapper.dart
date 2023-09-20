
import '../../domain/model/product_details_data_brand_model.dart';
import '../response/product_details_data_brand_response.dart';
import 'package:service/core/extensions/extensions.dart';
extension ProductDetailsDataBrandMapper on ProductDetailsDataBrandResponse {
  ProductDetailsDataBrandModel toDomain() {
    return ProductDetailsDataBrandModel(
      id: id.onNull(),
      name: name.onNull(),
      logo: logo.onNull(),
    );
  }
}
