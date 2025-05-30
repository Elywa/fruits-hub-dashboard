import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/custom_image_field.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dash_board/features/add%20data/presentation/views/widgets/is_featured.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          autovalidateMode: autoValidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 16),

              CustomTextFormField(
                hint: "Product Name",
                onSaved: (name) {},
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                hint: "Product Price",
                onSaved: (price) {},
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              CustomTextFormField(hint: "Product Code", onSaved: (code) {}),
              SizedBox(height: 16),

              CustomTextFormField(
                hint: "Product Description",
                onSaved: (description) {},
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsFeatured(onChanged: (value) {}),
              SizedBox(height: 16),
              CustomImageField(onFileChanged: (image) {}),
            ],
          ),
        ),
      ),
    );
  }
}
