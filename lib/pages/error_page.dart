import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_offline/routes/const_routes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(MyConstRoutes.homeRouteName);
          }, child: const Text('Go Back'),
        ),
      ),
    );
  }
}