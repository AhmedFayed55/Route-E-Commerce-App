import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/delete_or_add_to_wishlist_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/products_repo.dart';

@injectable
class AddToWishlistUseCase {
  AddToWishlistUseCase(this.repo);

  ProductsRepo repo;

  Future<Either<Failures, DeleteOrAddToWishlistEntity>> invoke(id) {
    return repo.addToWishlist(id);
  }
}
