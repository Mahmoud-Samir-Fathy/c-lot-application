import 'package:e_commerce_app/core/widgets/product_item.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/states.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => sl<SettingsCubit>()..getFavouriteProduct(),
      child: Scaffold(
        body: BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state) {
            if (state is GetFavouriteSuccessState) {
              final favouriteList = state.favourites;
              return Scaffold(
                appBar: BasicAppbar(
                  hideBack: false,
                  title: Text("My Favourites (${favouriteList.length})"),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: GridView.count(
                    childAspectRatio: 1 / 1.6,
                    mainAxisSpacing: 20.sp,
                    crossAxisSpacing: 20.sp,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      favouriteList.length,
                          (index) =>
                          buildProductItem(favouriteList[index], context),
                    ),
                  ),
                ),
              );
            }
            if (state is GetFavouriteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Scaffold(
                appBar: BasicAppbar(
                  hideBack: false,
                  title: Text("My Favourites (0)"),
                ),
                body: Center(
                  child: Text('No Favourite products Yet'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
