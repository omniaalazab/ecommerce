import 'package:ecommerce/model/product_model.dart';

class SearchStatus {}

class SearchInitial extends SearchStatus {}

class SearchLoading extends SearchStatus {}

class SearchLoaded extends SearchStatus {
  final List<Product> products;
  SearchLoaded(this.products);
}

class SearchSuccess extends SearchStatus {
  final List<Product> products;
  SearchSuccess(this.products);
}

class SearchFailure extends SearchStatus {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}
