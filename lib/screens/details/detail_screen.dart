import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/models/product.dart';
import 'package:flutter_ecomerce_app/screens/details/components/custom_app_bar.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args = (ModalRoute.of(context)!.settings..arguments) as ProductDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: args.product.rating),
      ),
      body: Body(product: args.product,),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments( {required this.product});
}