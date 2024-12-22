import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/data/data_sources/fire_base_get_category_data_source.dart';
import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_categories_repository.dart';

class GetCategoriesRepositoryImpl implements GetCategoriesRepository {
  final FireBaseGetCategoryDataSource fireBaseGetCategoryDataSource;

  GetCategoriesRepositoryImpl({required this.fireBaseGetCategoryDataSource});

  @override
  Future<Either> getCategories() async {
    var user = await fireBaseGetCategoryDataSource.getCategories();

    return user.fold(
          (error) => Left(error),
          (response) {
        if (response == null || (response as List).isEmpty) {
          return Left(Exception('No categories found.'));
        }

        try {
          final categories = (response)
              .map((category) => CategoriesEntity.fromJason(category))
              .toList();
          return Right(categories);
        } catch (e) {
          return Left(Exception('Failed to parse categories: $e'));
        }
      },
    );
  }

}