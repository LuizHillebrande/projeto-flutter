import 'package:flutter/material.dart';
import 'package:receitas_app/models/receita.dart';
import 'package:receitas_app/widgets/CartaoReceita.dart';

class Favoritos extends StatelessWidget {
  final Map<int, Receita> favoritos;
  final void Function(Receita) aoAbrirReceita;
  final void Function(Receita) aoAlternarFavorito;

  const Favoritos({
    super.key,
    required this.favoritos,
    required this.aoAbrirReceita,
    required this.aoAlternarFavorito,
  });

  @override
  Widget build(BuildContext context) {
    final lista = favoritos.values.toList();

    if (lista.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border, size: 60),
              SizedBox(height: 16),
              Text(
                'Nenhum favorito',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Marque uma receita como favorita para encontrá-la aqui.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Favoritos',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF263F35),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Receitas salvas nesta sessão.'),
        const SizedBox(height: 20),
        ...lista.map(
              (receita) => CartaoReceita(
            receita: receita,
            favoritada: true,
            aoAbrir: () => aoAbrirReceita(receita),
            aoAlternarFavorito: () => aoAlternarFavorito(receita),
          ),
        ),
      ],
    );
  }
}