import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';

class CartHelper {
  static double calculatingSubTotal(List<GetFromCartEntity> product) {
    double subTotal = 0.0;

    for (var item in product) {
      subTotal = item.productPrice + subTotal;
    }

    return subTotal;
  }
}
