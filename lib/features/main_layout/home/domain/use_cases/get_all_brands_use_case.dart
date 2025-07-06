import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/category_or_brand_response.dart';
import '../repositories/home_tab_repo.dart';

@injectable
class GetAllBrandesUseCase {
  HomeTabRepository homeRepository;

  GetAllBrandesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponse>> invoke() {
    return homeRepository.getAllBrands();
  }
}
