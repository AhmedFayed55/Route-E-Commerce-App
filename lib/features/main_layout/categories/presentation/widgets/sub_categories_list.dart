import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_tab_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_card_item.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesTabCubit, CategoriesTabState>(
      buildWhen: (previous, current) => current is SelectNewCategoryState,
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    CategoriesTabCubit
                        .get(context)
                        .selectedCategory
                        ?.name ??
                        "",
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s14.sp,
                    ),
                  ),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  CategoriesTabCubit
                      .get(context)
                      .selectedCategory
                      ?.name ?? "",
                  CategoriesTabCubit
                      .get(context)
                      .selectedCategory
                      ?.image ?? "",
                  goToCategoryProductsListScreen,
                ),
              ),
              BlocBuilder<CategoriesTabCubit, CategoriesTabState>(
                buildWhen: (previous, current) {
                  if (current is SubCategoriesSuccessState ||
                      current is SubCategoriesErrorState ||
                      current is SubCategoriesLoadingState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  if (state is SubCategoriesSuccessState) {
                    return state.subCategoriesEntity.data!.isNotEmpty ?
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.subCategoriesEntity.data?.length,
                            (context, index) =>
                            SubCategoryItem(
                              state.subCategoriesEntity.data![index].name ?? '',
                              ImageAssets.subcategoryCardImage,
                              goToCategoryProductsListScreen,
                            ),
                      ),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1.5,
                        mainAxisSpacing: AppSize.s8,
                        crossAxisSpacing: AppSize.s8,
                      ),
                    )
                        : const SliverToBoxAdapter(
                      child: Text("No categories in this section for now"),
                    );
                  } else if (state is SubCategoriesErrorState) {
                    return SliverToBoxAdapter(child: Center(child: Text(state
                        .error.errorMessage)));
                  } else {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
