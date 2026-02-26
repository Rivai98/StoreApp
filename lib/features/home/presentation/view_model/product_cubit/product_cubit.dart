import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/home/data/models/product_item_model.dart';
import 'package:store_app/features/home/data/models/products_model.dart';
import 'package:store_app/features/home/presentation/widgets/product_item.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.dio) : super(ProductInitial());

  final Dio dio;
  Future<void> loadProducts() async {
    emit(ProductLoading());

    try {
      final res = await dio.get(
        "https://dummyjson.com/products",
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      debugPrint("Response: ${res.data}");
      if (res.statusCode == 200) {
       final  ProductsModel productsModel= ProductsModel.fromJson(res.data as Map<String, dynamic>);
       final List<ProductItemModel> productsList = productsModel.products;
        emit(ProductSuccess(productsList));
      } else {
        emit(ProductFailure("Failed to load products"));
        return;
      }
    } on Exception catch (e) {
      emit(ProductFailure(e.toString()));
      return;
    }
  }
}
