import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_item_model.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
                width: 300,
                height: 150,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D41E1),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 8.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF07C8F9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
