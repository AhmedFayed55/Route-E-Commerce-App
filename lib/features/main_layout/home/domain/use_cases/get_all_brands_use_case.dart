import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/category_or_brand_response.dart';
import '../repositories/home_tab_repo.dart';

class GetAllBrandesUseCase {
  HomeTabRepository homeRepository;

  GetAllBrandesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponse>> invoke() {
    return homeRepository.getAllBrands();
  }
}
