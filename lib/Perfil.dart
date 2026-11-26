import 'package:flutter/material.dart';
import 'package:receitas_app/Resultado.dart';
import 'package:receitas_app/models/receita.dart';
import 'package:receitas_app/widgets/CartaoReceita.dart';

class Perfil extends StatelessWidget {
  final List<Receita> receitas;
  final bool carregando;
  final String? erro;
  final VoidCallback aoTentarNovamente;
  final void Function(Receita) aoAbrirReceita;
  final Map<int, Receita> favoritos;
  final void Function(Receita) aoAlternarFavorito;

  const Perfil({
    super.key,
    required this.receitas,
    required this.carregando,
    required this.erro,
    required this.aoTentarNovamente,
    required this.aoAbrirReceita,
    required this.favoritos,
    required this.aoAlternarFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Receitas',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF263F35),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Pesquise uma receita pelo nome.'),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultado(
                    aoAbrirReceita: aoAbrirReceita,
                    favoritos: favoritos,
                    aoAlternarFavorito: aoAlternarFavorito,
                  ),
                ),
              );
            },
            child: const Text('Buscar receitas'),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Receitas disponíveis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF263F35),
          ),
        ),
        const SizedBox(height: 12),
        if (carregando)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('Carregando receitas...'),
                ],
              ),
            ),
          )
        else if (erro != null)
          Column(
            children: [
              Text(erro!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: aoTentarNovamente,
                child: const Text('Tentar novamente'),
              ),
            ],
          )
        else if (receitas.isEmpty)
            const Text('Nenhuma receita disponível.')
          else
            ...receitas.map(
                  (receita) => CartaoReceita(
                receita: receita,
                favoritada: favoritos.containsKey(receita.id),
                aoAbrir: () => aoAbrirReceita(receita),
                aoAlternarFavorito: () => aoAlternarFavorito(receita),
              ),
            ),
      ],
    );
  }
}