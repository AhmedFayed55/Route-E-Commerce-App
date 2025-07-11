import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manager/product_tab_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manager/product_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductTabCubit>()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Fashion"),
        ),
        body: Padding(
          padding: REdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              BlocBuilder<ProductTabCubit, ProductTabStates>(
                builder: (context, state) {
                  if (state is ProductTabSuccessState) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 10,
                            ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            product: state.responseEntity.data![index],
                            height: height,
                            width: width,
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
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
