import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {

  const CartPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text('Cart'),
      ),
      body:ListView.separated(
              itemBuilder: (context, index) => buildCartItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 10,
            ),
    );
  }
  Widget buildCartItem()=>Container(
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
            child: const Image(
              height: 80,
              width: 80,
              image: AssetImage(AppImages.defaultImage),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ay 5ra',
                        style: TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$${10}",
                      style: TextStyle(
                        color: AppColors.buttonTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Size - ',
                      style: TextStyle(
                        color: AppColors.searchColor,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      "${20}",
                      style: TextStyle(
                        color: AppColors.buttonTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Color - ',
                      style: TextStyle(
                        color: AppColors.searchColor,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                     '5rawy',
                      style: TextStyle(
                        color: AppColors.buttonTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        // Add logic to remove item from cart or decrease quantity
                      },
                      mini: true,
                      backgroundColor: AppColors.primary,
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.buttonTextColor,
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


