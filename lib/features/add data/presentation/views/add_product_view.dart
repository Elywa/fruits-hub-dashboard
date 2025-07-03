import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dash_board/core/repos/image%20repo/image_repo.dart';
import 'package:fruits_hub_dash_board/core/repos/product%20repo/product_repo.dart';
import 'package:fruits_hub_dash_board/core/services/get_it_service.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/manager/cubit/add_product_cubit.dart' show AddProductCubit;
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Add Product')),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt<ImageRepo>(),
          getIt<ProductRepo>()
        ),
        child: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}


