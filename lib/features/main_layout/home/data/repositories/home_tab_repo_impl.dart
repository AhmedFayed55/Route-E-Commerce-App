import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../domain/entities/category_or_brand_response.dart';
import '../../domain/repositories/home_tab_repo.dart';
import '../data_sources/remote_ds/home_tab_remote_ds.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  HomeTabRemoteDataSource remoteDataSource;

  HomeTabRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponse>> getAllCategories() async {
    var either = await remoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponse>> getAllBrands() async {
    var either = await remoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
