import 'package:e_commerce_app/features/settings/presentation/widgets/wishlist_widgets/favourite_widget.dart';
import 'package:e_commerce_app/features/settings/presentation/widgets/wishlist_widgets/t_shirt_widget.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(
        title: Text('Wishlist'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(
          children: [
            const FavouriteWidget(),
            SizedBox(height: 15.h,),
            const TShirtWidget()
          ],
        ),
      ),
    );
  }
}
