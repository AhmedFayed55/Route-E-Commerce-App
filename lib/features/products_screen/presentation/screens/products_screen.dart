import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manager/product_tab_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manager/product_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../main_layout/home/domain/entities/category_or_brand_response.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.category});

  final CategoryOrBrand category;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductTabCubit>()..getProducts(category.id),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(category.name ?? ''),
        ),
        body: Padding(
          padding: REdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              BlocBuilder<ProductTabCubit, ProductTabStates>(
                builder: (context, state) {
                  if (state is ProductTabSuccessState) {
                    var products = state.responseEntity.data ?? [];
                    return products.isNotEmpty
                        ? Expanded(
                            child: GridView.builder(
                              itemCount: products.length,
                              gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 10,
                            ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                                  product: products[index],
                                  height: height,
                            width: width,
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                          )
                        : Center(
                            child: Lottie.asset("assets/animation/empty.json"),
                          );
                  } else if (state is ProductTabErrorState) {
                    return Center(child: Text(state.failures.errorMessage));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
