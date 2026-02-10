import 'package:bloc/bloc.dart';
import 'package:fruits_apps_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_apps_dashboard/core/repos/product_repo.dart/product_repo.dart';
import 'package:fruits_apps_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productRepo) : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {

    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (f){
        emit(AddProductFailure(f.message));
      },
      (url)async{
        addProductInputEntity.imageUrl=url;
        var result =await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (f){
            emit(AddProductFailure(f.message));
          },
          (r){
            emit(AddProductSuccess());
          }
        );
      },
    );

    
  }
}
