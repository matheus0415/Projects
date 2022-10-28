import 'package:aula_flutter/models/usuario.dart';
import 'package:aula_flutter/models/lembretes.dart';

class Database {
  static final Database _singleton = Database._internal();

  Database._internal();

  factory Database() {
    return _singleton;
  }

  List<Usuario> usuarios = [
    Usuario(
      codigo: 1,
      nome: 'Matheus',
      email: "Matheus",
      senha: "123",
    ),
  ];

  List<Lembrete> lembretes = [
    Lembrete(
      codigo: 1,
      descricao: "Teremos aula de flutter"
          " durante toda a semana de 19:30 às 21:30. ",
      titulo: "Flutterama: Descomplicando"
          " a programação em flutter",
    ),
    Lembrete(
      codigo: 2,
      titulo: "FUP - Fundamentos de Programação",
      descricao: "Aula toda terça e quinta, "
          "das 08:00 às 10:00",
    ),
    Lembrete(
      codigo: 3,
      titulo: "Logica de Programação",
      descricao: "Aula toda quarta e sexta, "
          "das 13:30 às 15:30",
    ),
    Lembrete(
      codigo: 4,
      titulo: "PAA",
      descricao: "Aula toda quarta e sexta, "
          "das 15:30 às 17:30",
    ),
  ];

  void addLembrete(Lembrete lembrete) {
    lembretes.add(lembrete);
  }

  void removeLembrete(int index) {
    lembretes.removeAt(index);
  }

  Usuario? login(String email, String senha) {
    for (var usuario in usuarios) {
      if (usuario.email == email && usuario.senha == senha) {
        return usuario;
      }
    }

    return null;
  }

  Usuario? usuarioLogado;
}
