part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductItemModel> products;
  ProductSuccess(this.products);
}

final class ProductFailure extends ProductState {
  String errorMessage;
  ProductFailure(this.errorMessage);
}
