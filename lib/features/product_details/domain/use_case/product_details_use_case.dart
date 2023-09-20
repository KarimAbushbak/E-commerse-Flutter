import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/request/product_details_request.dart';
import '../model/product_details_model.dart';
import '../repository/product_dertails_repository.dart';

class ProductDetailsUseCaseInput {
  int id;

  ProductDetailsUseCaseInput({
    required this.id,
  });
}

class ProductDetailsUseCaseImplementation
    implements BaseUseCase<ProductDetailsUseCaseInput, ProductDetailsModel> {
  final ProductDetailsRepository _repository;

  ProductDetailsUseCaseImplementation(
    this._repository,
  );

  @override
  Future<Either<Failure, ProductDetailsModel>> execute(
      ProductDetailsUseCaseInput input) async {
    return await _repository.getProductDetails(
      ProductDetailsRequest(
        id: input.id,
      ),
    );
  }
}
