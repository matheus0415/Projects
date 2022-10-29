import 'package:aula_flutter/db/database.dart';
import 'package:aula_flutter/models/lembretes.dart';
import 'package:aula_flutter/widgets/custom_edit.dart';
import 'package:aula_flutter/widgets/custom_logo.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LembretePage extends StatefulWidget {
  const LembretePage({super.key});
  @override
  State<LembretePage> createState() => _LembretePageState();
}

class _LembretePageState extends State<LembretePage> {
  final TextEditingController textTitle = TextEditingController();
  final TextEditingController textDescription = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final int cont = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Adicionar Lembrete'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 30),
                const CustomLogo(),
                const SizedBox(height: 50),
                CustomEdit(
                  controller: textTitle,
                  hintText: "Titulo do lembrete",
                  icon: Icons.title,
                  validator: (value) {
                    if (Database().duplicatedLembrete(value)) {
                      return "Titulo já cadastrado, por favor informe outro título";
                    }
                    if (value == null || value.trim() == "") {
                      return "Informe o titulo";
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomEdit(
                  controller: textDescription,
                  hintText: "Informe a descrição",
                  icon: Icons.description,
                  validator: ((value) {
                    if (value == null || value.trim() == "") {
                      return "Informe a descrição";
                    }
                  }),
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Lembrete lembrete = Lembrete(
                codigo: cont + 1,
                titulo: textTitle.text,
                descricao: textDescription.text);
            Database().addLembrete(lembrete);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Lembrete adicionado...'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          }
        },
        label: const Text('Salvar lembrete'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
