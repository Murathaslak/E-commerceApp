import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Category extends ConsumerStatefulWidget {
  const Category({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Category"),
      ),
    );
  }
}
