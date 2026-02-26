import 'package:store_app/features/home/data/models/product_item_model.dart';

class ProductsModel{
  final List<ProductItemModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductsModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List<dynamic>? ?? const [];

    return ProductsModel(
      products: productsJson
          .map((e) => ProductItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
    );
  }
}
