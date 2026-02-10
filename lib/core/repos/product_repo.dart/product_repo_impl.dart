import 'package:dartz/dartz.dart';
import 'package:fruits_apps_dashboard/core/errors/failures.dart';
import 'package:fruits_apps_dashboard/core/repos/product_repo.dart/product_repo.dart';
import 'package:fruits_apps_dashboard/core/services/database_services.dart';
import 'package:fruits_apps_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_apps_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_apps_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseServices.addData(
        path: BackendEndpoint.productsCollection,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('failed to add product'));
    }
  }
}
