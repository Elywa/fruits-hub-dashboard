import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/core/repos/image%20repo/image_repo.dart';
import 'package:fruits_hub_dash_board/core/repos/product%20repo/product_repo.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (imageUrl) async {
        addProductInputEntity.imageUrl = imageUrl;
        var productResult = await productRepo.addProduct(addProductInputEntity);
        productResult.fold(
          (failure) {
            emit(AddProductFailure(failure.message));
          },
          (success) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
