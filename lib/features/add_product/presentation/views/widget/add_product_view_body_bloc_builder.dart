import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps_dashboard/core/helper_function/build_error_bar.dart';
import 'package:fruits_apps_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/views/widget/add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if(state is AddProductSuccess){
          buildBar(context,'Product Added Successfully');
        }
        if(state is AddProductFailure){
          buildBar(context,state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHuD(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody());
      },
    );
  }
}
