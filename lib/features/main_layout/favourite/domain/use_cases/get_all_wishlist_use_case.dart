import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/entities/get_all_wishlist_entity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllWishlistUseCase {
  GetAllWishlistUseCase(this._repository);

  final WishlistRepository _repository;

  Future<Either<Failures, GetAllWishlistEntity>> invoke() =>
      _repository.getAllWishlist();
}
