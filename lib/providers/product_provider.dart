import 'package:flutter/material.dart';

import '../models/product_model.dart';
class ProductProvider extends ChangeNotifier{

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  ProductProvider() {
    _productList = initialProducts();
  }

  static List<ProductModel> initialProducts() {
    return [
    ProductModel(id: 1, title: "Camiseta de Algodão Premium", price: "1200 AOA", description: "Camiseta confortável, feita 100% de algodão, disponível em várias cores."),

    ProductModel(id: 2, title: "Tênis Esportivo Leve", price: "2500 AOA", description: "Tênis ideal para corridas e caminhadas, com solado antiderrapante e amortecimento reforçado."),

    ProductModel(id: 3, title: "Relógio Digital Smart", price: "3000 AOA", description: "Relógio inteligente com monitor de batimentos cardíacos, notificações e resistência à água."),

    ];
  }

  void addProduct(ProductModel product) {
    _productList.add(product);
    notifyListeners();
  }

  void removeProduct(int index) {
    _productList.removeAt(index);
    notifyListeners();
  }

}