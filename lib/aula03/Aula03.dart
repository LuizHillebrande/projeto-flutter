import 'package:flutter/material.dart';
import 'package:impostor_game/aula03/Inscricao.dart';

class Aula03 extends StatelessWidget {
  const Aula03({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inscricao(),
    );
  }
}
