import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../manager/home_tab_cubit.dart';
import '../manager/home_tab_states.dart';
import 'custom_category_widget.dart';

class CategoriesWidgetBlocBuilder extends StatelessWidget {
  const CategoriesWidgetBlocBuilder({
    super.key,
    required this.viewModel,
    required this.itemCount,
  });

  final HomeTabCubit viewModel;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
      bloc: viewModel..getAllCategories(),
      builder: (context, state) {
        return viewModel.categoriesList.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: ColorManager.primary),
              )
            : SizedBox(
                height: 270.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomCategoryWidget(
                      item: viewModel.categoriesList[index],
                    );
                  },
                  itemCount: itemCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              );
      },
    );
  }
}
