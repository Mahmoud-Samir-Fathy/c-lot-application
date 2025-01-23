import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderRegisteredSuccessfullyPage extends StatelessWidget{
  const OrderRegisteredSuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: AppColors.primary,
     body: Column(
       children: [
         const Expanded(child:  Image(image: AssetImage(AppImages.order))),
         SizedBox(height: 20.h,),
         Expanded(
           child: Container(
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight:  Radius.circular(15.r),),
               color: AppColors.secondBackground
             ),
             child: Padding(
               padding:  EdgeInsets.only(top: 40.0.h),
               child: Column(
                 children: [
                    Text('Order Placed \n Successfully',style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold,color: AppColors.buttonTextColor),),
                   SizedBox(height: 20.h,),
                   const Text('You will receive an email confirmation',style: TextStyle(color: AppColors.searchColor),),

                   SizedBox(height: 30.h,),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 40.h),
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.r),
                         color: AppColors.primary,
                       ),
                       width: double.infinity,
                       height: 50.h,
                       child: MaterialButton(
                         onPressed: () {
                           AppNavigators.pushAndReplacement(context, AppRoutes.appNav);
                         },
                         child:
                             Text(
                               'See Order details',
                               style: TextStyle(
                                   color: AppColors.buttonTextColor,
                                   fontSize: 18.sp,
                                   fontWeight: FontWeight.bold),
                             ),

                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
         )

       ],
     ),


   );
  }

}