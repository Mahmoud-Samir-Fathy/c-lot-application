import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  final List<GetFromCartEntity> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Column(
          children: [
            const Image(image: AssetImage(AppImages.emptyCart)),
            const SizedBox(height: 15),
            const Text('Your Cart Is Empty'),
            const SizedBox(height: 15),
            MaterialButton(
              onPressed: () {},
              child: const Text('Explore Categories'),
            )
          ],
        ),
      )
          : ListView.separated(
        itemBuilder: (context, index) =>
            buildCartItem(cartItems[index]), // Pass a single entity
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: cartItems.length,
      ),
    );
  }

  Widget buildCartItem(GetFromCartEntity entity) => Container(
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.secondBackground,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                  height: 80,
                  width: 80,
                  image: NetworkImage(entity.productImage))),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      entity.productTitle,
                      style: const TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text("\$${entity.productPrice}",
                        style: const TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Size - ',
                      style: TextStyle(
                        color: AppColors.searchColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(' ${entity.productSize}',
                        style: const TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 15),
                    const Text('Color - ',
                        style: TextStyle(
                          color: AppColors.searchColor,
                          fontSize: 15,
                        )),
                    Text(' ${entity.productColor}',
                        style: const TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
