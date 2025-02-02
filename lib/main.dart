import 'package:flutter/material.dart';
import 'package:product_listing_app/pages/add_product_page.dart';
import 'package:product_listing_app/pages/login_page.dart';
import 'package:product_listing_app/pages/product_list_page.dart';
import 'package:product_listing_app/providers/auth_provider.dart';
import 'package:product_listing_app/providers/product_provider.dart';
import 'pages/initial_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AuthProvider()),
            ChangeNotifierProvider(create: (context) => ProductProvider()),
          ],
        child:  const MyApp() ,
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/initial',
      routes: {
        '/initial':(context) =>  InitialPage(),
        '/login': (context) =>  LoginPage(),
        '/home': (context) =>  ProductListPage(),
        '/add_product': (context) =>  AddProductPage(),
        '/exit_page':(context) => const ExitPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

