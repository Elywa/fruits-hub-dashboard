import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dash_board/errors/failures.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failures , void>> addProduct(AddProductInputEntity addProductInputEntity);
}
