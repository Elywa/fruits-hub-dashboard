import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dash_board/core/repos/product%20repo/product_repo.dart';
import 'package:fruits_hub_dash_board/errors/failures.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) {
    throw UnimplementedError();
  }
}
