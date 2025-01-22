import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/product_details/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildProductItem(ProductEntity product,context) => GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product: product,)));
  },
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      height: 400.h,
      width: 180.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            child: Container(
              color: AppColors.buttonTextColor,
              child:  Center(
                child: Image(
                  image: NetworkImage(product.image[0]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Product Details
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            color: AppColors.secondBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonTextColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      product.discountPrice == 0
                          ? ''
                          : '${product.price + product.discountPrice} L.E',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
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
  ),
);
