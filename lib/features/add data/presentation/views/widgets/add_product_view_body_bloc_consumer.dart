import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dash_board/core/functions/custom_snackBar.dart';
import 'package:fruits_hub_dash_board/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          return buildErrorsSnackBar(context, state.errMessage);
        } else if (state is AddProductSuccess) {
          return buildErrorsSnackBar(context, "Product added successfully!");
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
