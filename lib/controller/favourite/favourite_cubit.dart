import 'package:ecommerce/controller/favourite/favourite_state.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState(favoriteItems: []));

  void toggleFavorite(Product product) {
    final currentFavorites = List<Product>.from(state.favoriteItems);
    if (currentFavorites.contains(product)) {
      currentFavorites.remove(product);
    } else {
      currentFavorites.add(product);
    }
    emit(FavoriteState(favoriteItems: currentFavorites));
  }
}
