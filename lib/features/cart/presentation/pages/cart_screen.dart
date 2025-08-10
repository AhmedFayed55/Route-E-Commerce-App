import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/di/di.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..getCartItems(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: Column(
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.isLoadingGetCartItems) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    );
                  } else if (state.errorGetCartItems != null) {
                    return Center(child: Text(state.errorGetCartItems ?? ''));
                  } else {
                    return state.products.isEmpty
                        ? Center(child: Lottie.asset(ImageAssets.emptyJson))
                        : Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) => CartItemWidget(
                                imagePath:
                                    state.products[index].product?.imageCover ??
                                    '',
                                title:
                                    state.products[index].product?.title ?? '',
                                price: state.products[index].price!.toInt(),
                                quantity: 1,
                                onDeleteTap: () {},
                                onDecrementTap: (value) {},
                                onIncrementTap: (value) {},
                                size: 40,
                                color: Colors.black,
                                colorName: 'Black',
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: AppSize.s12.h),
                              itemCount: state.products.length,
                            ),
                          );
                  }
                },
              ),
              TotalPriceAndCheckoutBotton(
                totalPrice: 10350,
                checkoutButtonOnTap: () {},
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
