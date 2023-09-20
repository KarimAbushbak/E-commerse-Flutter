
import 'package:service/features/product_details/data/mapper/product_details_data_brand_mapper.dart';
import 'package:service/features/product_details/data/mapper/product_details_data_choice_options_mapper.dart';
import 'package:service/features/product_details/data/mapper/product_details_data_photo_mapper.dart';

import '../../domain/model/product_details_data_model.dart';
import '../response/product_details_data_response.dart';
import 'package:service/core/extensions/extensions.dart';
extension ProductDetailsDataMapper on ProductDetailsDataResponse {
  ProductDetailsDataModel toDomain() {
    return ProductDetailsDataModel(
      id: id.onNull(),
      name: name.onNull(),
      addedBy: addedBy.onNull(),
      sellerId: sellerId.onNull(),
      shopId: shopId.onNull(),
      shopName: shopName.onNull(),
      shopLogo: shopLogo.onNull(),
      photos: photos!.map((e) => e.toDomain()).toList(),
      thumbnailImage: thumbnailImage.onNull(),
      tags: tags.onNull(),
      choiceOptions: choiceOptions!.map((e) => e.toDomain()).toList(),
      colors: colors.onNull(),
      hasDiscount: hasDiscount.onNull(),
      strokedPrice: strokedPrice.onNull(),
      mainPrice: mainPrice.onNull(),
      calculablePrice: calculablePrice.onNull(),
      currencySymbol: currencySymbol.onNull(),
      currentStock: currentStock.onNull(),
      unit: unit.onNull(),
      rating: rating.onNull(),
      ratingCount: ratingCount.onNull(),
      earnPoint: earnPoint.onNull(),
      description: description.onNull(),
      videoLink: videoLink.onNull(),
      link: link.onNull(),
      brand: brand!.toDomain(),
    );
  }
}
