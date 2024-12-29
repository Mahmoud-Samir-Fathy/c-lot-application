import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/widgets/address/address_widget.dart';
import 'package:e_commerce_app/features/checkout/presentation/widgets/checkout_button.dart';
import 'package:e_commerce_app/features/checkout/presentation/widgets/payment/payment_widget.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartEntity> product;


  const CheckoutPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(
        title: Text('Checkout'),
        hideBack: false,
      ),
       body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 8.0.w),
         child:  Column(
           children: [
             const AddressWidget(),
             SizedBox(height: 15.w,),
             const PaymentWidget(),
             const Spacer(),
              CheckoutButton(product: product,)
           ],
         ),
       ),
    );
  }
}
