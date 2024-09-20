import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Error",
        textAlign: TextAlign.center,
      ),
    );
  }
}
