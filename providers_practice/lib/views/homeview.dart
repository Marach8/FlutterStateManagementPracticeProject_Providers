import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:providers_practice/custommarachitem.dart';
import 'package:providers_practice/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'), centerTitle: true),
      body: Column(
        children: [
          Consumer<MarachItemProvider>(
            builder: (contex, providerItem, child){
              return MarachItemsWidget(marachItems: providerItem.marachItems);
            }
          ),
          TextButton(
            onPressed: (){Navigator.of(context).pushNamed('/addItemRoute');},
            child: const Text('Add New Item')
          ),
          const Gap(5),
          TextButton(
            onPressed: (){context.read<MarachItemProvider>().reset();},
            child: const Text('reset')
          )
        ],
      )
    );
  }
}