import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/is_favourite_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/set_favourites_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<bool> {
  final IsFavouriteUseCase isFavourite;
  final SetFavouritesUseCase setFavouriteUseCase;

  FavouriteCubit({
    required this.isFavourite,
    required this.setFavouriteUseCase,
  }) : super(false);

  static FavouriteCubit get(context) => BlocProvider.of(context);

  Future<void> initializeFavouriteStatus(String productId) async {
    final result = await isFavourite.getProductsRepository.isFavourite(productId);
    emit(result);
  }

  Future<void> onTap(ProductEntity product) async {
    final data = await setFavouriteUseCase.getProductsRepository.setToFavourite(product);
    data.fold(
          (error) {},
          (success) {
        emit(success);

      },
    );
  }
}
