
import '../../domain/model/product_details_data_photo_model.dart';
import '../response/product_details_data_photo_response.dart';
import 'package:service/core/extensions/extensions.dart';
extension ProductDetailsDataPhotoMapper on ProductDetailsDataPhotoResponse {
  ProductDetailsDataPhotoModel toDomain() {
    return ProductDetailsDataPhotoModel(
      variant: variant.onNull(),
      path: path.onNull(),
    );
  }
}
