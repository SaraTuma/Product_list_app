import 'package:flutter/material.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('New Product', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextFormField(controller: idController,
                  decoration: const InputDecoration(
                      labelText: 'Id',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'The E-mail can not be empty!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'The E-mail can not be empty!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(controller: priceController,
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'The E-mail can not be empty!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(controller: descriptionController,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'The E-mail can not be empty!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed("/home");
                    }, child: Text('Cancel',style: TextStyle(fontSize: 20))),

                    ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                        productProvider.addProduct(ProductModel(id: int.parse(idController.text), title: titleController.text, price: priceController.text, description: descriptionController.text));
                        Navigator.of(context).pushReplacementNamed("/home");
                      }

                    }, child: Text('Add product',style: TextStyle(fontSize: 20))),

                  ],
                ),

                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
