
import '../../domain/model/product_details_data_choice_options_model.dart';
import '../response/product_details_data_choice_options_response.dart';
import 'package:service/core/extensions/extensions.dart';
extension ProductDetailsDataChoiceOptionsMapper
    on ProductDetailsDataChoiceOptionsResponse {
  ProductDetailsDataChoiceOptionsModel toDomain() {
    return ProductDetailsDataChoiceOptionsModel(
      name: name.onNull(),
      options: options.onNull(),
      title: title.onNull(),
    );
  }
}
