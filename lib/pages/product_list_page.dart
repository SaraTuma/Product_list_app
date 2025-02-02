import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/auth_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_item.dart';
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool showDetails = false;
  ProductModel? selectedProduct;
  void selectProduct(ProductModel product) {
    setState(() {
      selectedProduct = product;
      showDetails = true;
    });
  }

  void goBack() {
    setState(() {
      showDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
        //automaticallyImplyLeading: false,
        title: Text(showDetails ? 'Product Detail':'E-mail: ${authProvider.email}', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: showDetails ? _buildProductDetails() : _buildProductList(productProvider)),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushReplacementNamed("/add_product");
      }, child: Icon(Icons.add, color: Colors.black),),
    );
  }

  Widget _buildProductList(ProductProvider productProvider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Product List',
              style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.primary)),
        ),

        Expanded(
            child: ListView.builder(
                itemCount: productProvider.productList.length,
                itemBuilder:  (context, index) {
                  final product = productProvider.productList[index];
                  return ProductItem(
                    title: product.title,
                    price: product.price,
                    description: product.description,
                    onDelete: () => productProvider.removeProduct(index),
                      onView: () => selectProduct(product)
                  );
                })
        )

      ],
    );
  }
  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start
        ,

        children: [
          Text(selectedProduct!.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(selectedProduct!.price, style: TextStyle(fontSize: 18, color: Colors.green)),
          SizedBox(height: 10),
          Text(selectedProduct!.description, textAlign: TextAlign.left, style: TextStyle(fontSize: 17)),
          SizedBox(height: 30),
          ElevatedButton(onPressed: goBack, child: Text('Voltar', style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }

}
