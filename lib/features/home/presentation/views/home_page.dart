import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/routing/app_routes.dart';

import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:store_app/features/auth/presentation/views/login_page.dart';
import 'package:store_app/features/home/data/models/product_item_model.dart';
import 'package:store_app/features/home/presentation/view_model/product_cubit/product_cubit.dart';
import 'package:store_app/features/home/presentation/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).logout();
              Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (state is ProductFailure) {
                return Center(child: Text(state.errorMessage));
              } else if (state is ProductSuccess) {
                final products = state.products;
                return Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItem(product: products[index]);
                      },
                    ),
                  ],
                );
              } else {
                return Center(child: Text("Something went wrong"));
              }
            },
          ),
        ),
      ),
    );
  }
}
    /* CustomButton(
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).logout();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          text: "Logout",
                        ), */