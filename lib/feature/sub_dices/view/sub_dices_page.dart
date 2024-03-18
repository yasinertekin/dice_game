import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/model/options/options.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class SubDicesPage extends StatelessWidget {
  const SubDicesPage({
    required this.categoryOptions,
    super.key,
  });

  final List<Options> categoryOptions;

  @override
  Widget build(BuildContext context) {
    return _SubDicesView(
      categoryOptions: categoryOptions,
    );
  }
}

final class _SubDicesView extends StatelessWidget {
  const _SubDicesView({
    required this.categoryOptions,
  });

  final List<Options> categoryOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categoryOptions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(categoryOptions[index].name ?? ''),
            onTap: () {},
          );
        },
      ),
    );
  }
}
