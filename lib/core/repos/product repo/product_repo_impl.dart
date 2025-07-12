import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dash_board/core/repos/product%20repo/product_repo.dart';
import 'package:fruits_hub_dash_board/core/services/data_base_service.dart';
import 'package:fruits_hub_dash_board/core/utils/constants.dart';
import 'package:fruits_hub_dash_board/errors/failures.dart';
import 'package:fruits_hub_dash_board/features/add%20data/data/models/add_product_input_model.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await dataBaseService.addData(
        path: kAddProductCollection,
        data: AddProductInputModel.fromJson(addProductInputEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure("Add product failed in product repo impl: $e"));
    }
  }
}
