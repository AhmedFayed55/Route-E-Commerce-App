import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_sources/wishlist_ds.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/entities/get_all_wishlist_entity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(this._dataSource);

  final WishlistDataSource _dataSource;

  @override
  Future<Either<Failures, GetAllWishlistEntity>> getAllWishlist() async {
    var either = await _dataSource.getAllWishlist();

    return either.fold(
      (error) => Left(error),
      (response) => Right(response.toEntity()),
    );
  }
}
