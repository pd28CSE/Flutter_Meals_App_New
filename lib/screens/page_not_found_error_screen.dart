import 'package:flutter/material.dart';

class PageNotFoundErrorMessageScreen extends StatelessWidget {
  const PageNotFoundErrorMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Error!'),
      ),
      body: const Center(
        child: Text(
          'Page Not Found.',
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
