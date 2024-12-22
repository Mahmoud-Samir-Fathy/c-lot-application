import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity product;
  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index)=>Container(
        width: 200.w,
          color: AppColors.buttonTextColor,
          child:  Image(
            image: NetworkImage(product.image[index]),
            fit: BoxFit.contain,
          )
      ),
      separatorBuilder: (context,index)=>SizedBox(width: 15.w,),
      itemCount: product.image.length,

    );
  }
}
