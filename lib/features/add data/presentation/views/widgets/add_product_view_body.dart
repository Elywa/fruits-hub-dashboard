import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dash_board/core/widgets/custom_button.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';
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
  late String name, code, description;
  late num price;
  File? image;
  bool isFeatured = false;
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
                onSaved: (value) {
                  name = value!;
                },
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                hint: "Product Price",
                onSaved: (value) {
                  price = num.parse(value!);
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                hint: "Product Code",
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                hint: "Product Description",
                onSaved: (value) {
                  description = value!;
                },
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsFeatured(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              CustomImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                text: "Add Product",
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Product added successfully!")),
                      );
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    showErrorSnackBar(context);
                  }
                },
                isVisible: true,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Please select an image")));
    return;
  }
}
