import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LembretePage extends StatefulWidget {
  const LembretePage({super.key});

  @override
  State<LembretePage> createState() => _LembretePageState();
}

class _LembretePageState extends State<LembretePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Adicionar Lembrete'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // função de salvar o novo lembrete
          // Database().addLembrete(Lembrete);

          Navigator.pop(context);
        },
        label: const Text('Salvar lembrete'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
