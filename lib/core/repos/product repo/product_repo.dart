import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
