import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_practice/custommarachitem.dart';
import 'package:providers_practice/provider.dart';

class AddItemView extends StatefulWidget {
  const AddItemView({super.key});

  @override
  State<AddItemView> createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  late final TextEditingController _controller;

  @override
  void initState(){super.initState(); _controller = TextEditingController();}

  @override  
  void dispose(){_controller.dispose(); super.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new Item'), centerTitle: true),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter a new Marach Item here...',
            ),
          ), 
          TextButton(
            onPressed: (){
              if(_controller.text.isNotEmpty){
                final item = MarachItem(isActive: false, name: _controller.text);
                context.read<MarachItemProvider>().addItem(item); Navigator.pop(context);
              }
            },
            child: const Text('Add')
          )
        ]
      )
    );
  }
}