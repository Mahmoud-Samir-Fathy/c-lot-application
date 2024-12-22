import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_categories_repository.dart';

class GetCategoriesUseCase extends UseCase<Either,CategoriesEntity>{
  final GetCategoriesRepository getCategoriesRepository;

  GetCategoriesUseCase({required this.getCategoriesRepository});
  @override
  Future<Either>? call(CategoriesEntity params) {

    return getCategoriesRepository.getCategories();
  }

}