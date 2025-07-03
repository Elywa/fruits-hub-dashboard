import 'package:flutter/material.dart';

void buildErrorsSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(errorMessage)));
}
