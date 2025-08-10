import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/manager/wishlist_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/manager/wishlist_state.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/di/di.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishlistCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s14.w,
          vertical: AppSize.s10.h,
        ),
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            if (state.isLoadingGetAllWishlist) {
              return Center(
                child: CircularProgressIndicator(color: ColorManager.primary),
              );
            } else if (state.errorGetAllWishlist != null) {
              return Center(child: Text(state.errorGetAllWishlist ?? ''));
            } else {
              return state.products.isEmpty
                  ? Lottie.asset(ImageAssets.emptyJson)
                  : ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSize.s12.h,
                          ),
                          child: FavoriteItem(
                            product: AppConstants.favoriteProducts[index],
                          ),
                        );
                      },
                    );
            }
          },
        ),
      ),
    );
  }
}
