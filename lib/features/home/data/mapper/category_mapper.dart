
import '../../presntation/model/category_model.dart';
import '../response/category_response.dart';
import 'package:service/core/extensions/extensions.dart';
extension CategoryMapper on CategoryResponse {
  CategoryModel toDomain() {
    return CategoryModel(
      id: id.onNull(),
      name: name.onNull(),
      banner: banner.onNull(),
      icon: icon.onNull(),
      numberOfChildren: numberOfChildren.onNull(),
      links: links!.toDomain(),
    );
  }
}

extension CategoryLinksMapper on CategoryResponseLinks {
  Links toDomain() {
    return Links(
      products: products.onNull(),
      subCategories: subCategories.onNull(),
    );
  }
}
