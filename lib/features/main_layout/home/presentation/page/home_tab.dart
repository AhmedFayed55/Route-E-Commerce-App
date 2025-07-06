import 'dart:async';

import 'package:ecommerce_app/features/main_layout/home/presentation/manager/home_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../widgets/brands_widget_bloc_builder.dart';
import '../widgets/categories_widget_bloc_builder.dart';
import '../widgets/custom_ads_widget.dart';
import '../widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  HomeTabCubit viewModel = getIt<HomeTabCubit>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
            adsImages: adsImages,
            currentIndex: _currentIndex,
            timer: _timer,
          ),
          Column(
            children: [
              CustomSectionBar(sectionNname: 'Categories', function: () {}),
              CategoriesWidgetBlocBuilder(viewModel: viewModel,
                itemCount: viewModel.categoriesList.length,),
              SizedBox(height: 12.h),
              CustomSectionBar(sectionNname: 'Brands', function: () {}),
              BrandsWidgetBlocBuilder(
                viewModel: viewModel, itemCount: viewModel.brandsList.length,)
            ],
          ),
        ],
      ),
    );
  }
}
