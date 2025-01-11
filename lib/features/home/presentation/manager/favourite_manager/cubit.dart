import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/is_favourite_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/set_favourites_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<Map<String, bool>> {
  final IsFavouriteUseCase isFavourite;
  final SetFavouritesUseCase setFavouriteUseCase;

  FavouriteCubit({
    required this.isFavourite,
    required this.setFavouriteUseCase,
  }) : super({}); // Initialize with an empty map

  static FavouriteCubit get(context) => BlocProvider.of(context);

  Future<void> isFavouriteProduct(String productId) async {
    final result = await isFavourite.getProductsRepository.isFavourite(productId);
    emit({...state, productId: result}); // Update the specific product's state
  }

  Future<void> onTap(ProductEntity product) async {
    final currentStatus = state[product.productId] ?? false;

    final data = await setFavouriteUseCase.getProductsRepository.setToFavourite(product);

    data.fold(
          (error) {
        // Handle error
      },
          (success) {
        emit({...state, product.productId: !currentStatus}); // Toggle the product's favorite state
      },
    );
  }

  bool isProductFavourite(String productId) {
    return state[productId] ?? false;
  }
}
