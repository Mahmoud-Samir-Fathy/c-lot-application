import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/widgets/product_item.dart';
import 'package:e_commerce_app/features/home/presentation/manager/search_by_all_product_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/search_by_all_product_manager/states.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GetAllProductsCubit.get(context);
    cubit.requestFocus();

    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: BasicAppbar(
        hideBack: false,
        title: buildSearchContainer(context),
      ),
      body: BlocBuilder<GetAllProductsCubit, GetAllProductsStates>(
        builder: (context, state) {
          if (state is GetAllProductsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllProductsErrorState) {
            return Center(child: Text(state.message));
          } else if (state is SearchResultsUpdatedState) {
            if (cubit.searchResults.isEmpty) {
              if (cubit.searchController.text.isEmpty) {
                return  Container();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage(AppImages.searchImage)),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                      child: Text(
                        "Sorry we couldn't find any matching result for your search",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 30.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }
            }
            return SizedBox(
              height: 400.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    buildProductItem(cubit.searchResults[index],context),
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: cubit.searchResults.length,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
Widget buildSearchContainer(BuildContext context) {
  final cubit = GetAllProductsCubit.get(context);
  return ClipRRect(
    borderRadius: BorderRadius.circular(30.r),
    child: TextFormField(
      controller: cubit.searchController,
      focusNode: cubit.searchFocusNode,
      onChanged: (query) {
        final cubit = GetAllProductsCubit.get(context);
        if (query.isEmpty) {
          cubit.clearSearch();
        } else {
          cubit.searchProduct(query);
        }
      },
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: AppColors.searchColor,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.searchColor,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 16.0.w),
      ),
      style: const TextStyle(
        color: AppColors.buttonTextColor,
      ),
    ),
  );
}

