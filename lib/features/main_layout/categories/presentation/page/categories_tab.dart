import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_tab_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_tab_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/di.dart';
import '../widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  // CategoriesTabCubit viewModel = getIt<CategoriesTabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesTabCubit>()..getCategories(),
      child: BlocBuilder<CategoriesTabCubit, CategoriesTabState>(
        buildWhen: (previous, current) {
          if (current is CategoriesTabErrorState ||
              current is CategoriesTabLoadingState ||
              current is CategoriesTabSuccessState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is CategoriesTabSuccessState) {
            return Padding(
              padding: REdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p12,
              ),
              child: Row(
                children: [
                  CategoriesList(categories: state.responseEntity.data ?? []),
                  SizedBox(width: 16.w),
                  const SubCategoriesList(),
                ],
              ),
            );
          } else if (state is CategoriesTabErrorState) {
            return Center(child: Text(state.failures.errorMessage));
          } else {
            return Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          }
        },
      ),
    );
  }
}
