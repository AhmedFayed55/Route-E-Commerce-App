import 'package:ecommerce_app/core/helpers/flutter_toast.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/strings.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/product_details/presentation/manager/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/manager/add_to_cart_state.dart';
import 'package:ecommerce_app/features/products_screen/data/models/product_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/product_color.dart';
import '../widgets/product_description.dart';
import '../widgets/product_item.dart';
import '../widgets/product_label.dart';
import '../widgets/product_rating.dart';
import '../widgets/product_size.dart';
import '../widgets/product_slider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductDto product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddToCartCubit>(),
      child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Product Details',
                  style: getMediumStyle(
                    color: ColorManager.appBarTitleColor,
                  ).copyWith(fontSize: 20.sp),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, bottom: 50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductSlider(
                        items: [
                          ProductItem(
                              imageUrl: product.images?[0] ?? ''
                          ),
                          ProductItem(
                              imageUrl: product.images?[1] ?? ''
                          ),
                          ProductItem(
                              imageUrl: product.images?[2] ?? ''
                          ),
                        ],
                        initialIndex: 0,
                      ),
                      SizedBox(height: 24.h),
                      ProductLabel(
                        productName: product.title ?? '',
                        productPrice: product.price.toString(),
                      ),
                      SizedBox(height: 16.h),
                      ProductRating(
                        productBuyers: product.sold.toString(),
                        productRating: '${product.ratingsAverage} (${product
                            .ratingsQuantity})',
                      ),
                      SizedBox(height: 16.h),
                      ProductDescription(
                          productDescription: product.description ?? ''
                      ),
                      ProductSize(
                          size: const [35, 38, 39, 40], onSelected: () {}),
                      SizedBox(height: 20.h),
                      Text(
                        'Color',
                        style: getMediumStyle(
                          color: ColorManager.appBarTitleColor,
                        ).copyWith(fontSize: 18.sp),
                      ),
                      ProductColor(
                        color: const [
                          Colors.red,
                          Colors.blueAccent,
                          Colors.green,
                          Colors.yellow,
                        ],
                        onSelected: () {},
                      ),
                      SizedBox(height: 48.h),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total price',
                                style: getMediumStyle(
                                  color: ColorManager.primary.withOpacity(.6),
                                ).copyWith(fontSize: 18.sp),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                product.price.toString(),
                                style: getMediumStyle(
                                  color: ColorManager.appBarTitleColor,
                                ).copyWith(fontSize: 18.sp),
                              ),
                            ],
                          ),
                          SizedBox(width: 33.w),
                          Expanded(
                            child: BlocListener<AddToCartCubit, AddToCartState>(
                              listener: (context, state) {
                                if (state.isLoadingAddToCart) {
                                  ToastMessage.toastMsg(
                                      AppStrings.pleaseWaiting,
                                      ColorManager.primary);
                                } else if (state.errorAddToCart != null) {
                                  ToastMessage.toastMsg(
                                      AppStrings.failedAddToCart, Colors.red);
                                  print(
                                      "================= Error ====================");
                                } else if (state.successAddToCart != null) {
                                  ToastMessage.toastMsg(
                                      AppStrings.addToCartSuccessfully,
                                      Colors.green);
                                  print(
                                      "================= Success ====================");
                                }
                              },
                              child: CustomElevatedButton(
                                label: 'Add to cart',
                                onTap: () {
                                  context.read<AddToCartCubit>().addToCart(
                                      product.id!);
                                },
                                prefixIcon: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: ColorManager.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
