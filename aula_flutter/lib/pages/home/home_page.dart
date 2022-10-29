import 'package:aula_flutter/routes.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:aula_flutter/db/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed(
                  Routes.USUARIOS,
                );

                setState(
                  () {},
                );
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, ${Database().usuarioLogado?.nome ?? ""}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "você tem ${Database().lembretes.length}"
              " lembretes.",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: Database().lembretes.length,
                itemBuilder: (context, index) {
                  var item = Database().lembretes.elementAt(index);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Material(
                      color: Colors.grey.shade100,
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          height: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      item.titulo,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item.descricao,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          Database().removeLembrete(item);
                                          setState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Excluido com sucesso'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        alignment: Alignment.bottomRight,
                                        icon: const Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(
            Routes.LEMBRETES,
          );

          setState(
            () {},
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
