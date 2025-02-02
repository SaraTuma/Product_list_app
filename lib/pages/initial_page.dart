import 'package:flutter/material.dart';
import 'package:product_listing_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    awaitLoginPage();
  }
  Future<void> awaitLoginPage() async {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => Navigator.of(context).pushReplacementNamed("/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to',style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.primary),),
            Text('Product List Application',style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.primary),),
            const SizedBox(height: 30,),
            Text('Loading...',style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 20,),
            CircularProgressIndicator(color: Theme.of(context).colorScheme.primary)
          ],
        ),
      ),
    );
  }
}
