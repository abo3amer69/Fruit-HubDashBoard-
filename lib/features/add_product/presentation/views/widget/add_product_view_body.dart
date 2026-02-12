import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_apps_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_apps_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/views/widget/custom_check_box.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/views/widget/image_product.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/views/widget/is_featured_check_box.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/views/widget/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numberOfCalories, unitAmout;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) {
                  num.parse(value!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
                hintText: 'Expiration Months',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: 'Number Of Calories',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmout = int.parse(value!);
                },
                hintText: 'Unit Amount',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        isOrganic: isOrganic,
                        expirationMonths: expirationMonths.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmout: unitAmout.toInt(),
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Please select an image')));
  }
}
