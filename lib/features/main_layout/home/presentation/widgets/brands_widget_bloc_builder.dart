import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../manager/home_tab_cubit.dart';
import '../manager/home_tab_states.dart';
import 'custom_category_widget.dart';

class BrandsWidgetBlocBuilder extends StatelessWidget {
  const BrandsWidgetBlocBuilder({
    super.key,
    required this.viewModel,
    required this.itemCount,
  });

  final HomeTabCubit viewModel;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        return viewModel.brandsList.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: ColorManager.primary),
              )
            : SizedBox(
                height: 270.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomCategoryWidget(
                      item: viewModel.brandsList[index],
                    );
                  },
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              );
      },
    );
  }
}
