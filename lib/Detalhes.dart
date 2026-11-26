import 'package:flutter/material.dart';
import 'package:receitas_app/models/receita.dart';

class Detalhes extends StatefulWidget {
  final Receita receita;
  final bool favoritada;
  final VoidCallback aoAlternarFavorito;

  const Detalhes({
    super.key,
    required this.receita,
    required this.favoritada,
    required this.aoAlternarFavorito,
  });

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  late bool favoritada;

  @override
  void initState() {
    super.initState();
    favoritada = widget.favoritada;
  }

  void alternarFavorito() {
    setState(() {
      favoritada = !favoritada;
    });

    widget.aoAlternarFavorito();
  }

  @override
  Widget build(BuildContext context) {
    final receita = widget.receita;
    final tempoTotal = (receita.tempoPreparo ?? 0) +
        (receita.tempoCozimento ?? 0);
    final temTempo =
        receita.tempoPreparo != null || receita.tempoCozimento != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receita'),
        actions: [
          IconButton(
            onPressed: alternarFavorito,
            icon: Icon(
              favoritada ? Icons.favorite : Icons.favorite_border,
              color: favoritada ? Colors.deepOrange : null,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (receita.imagem.isEmpty)
            Container(
              height: 200,
              color: const Color(0xFFE8E8D9),
              child: const Icon(Icons.restaurant, size: 60),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                receita.imagem,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: const Color(0xFFE8E8D9),
                    child: const Icon(Icons.restaurant, size: 60),
                  );
                },
              ),
            ),
          const SizedBox(height: 20),
          Text(
            receita.nome,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263F35),
            ),
          ),
          if (receita.tiposRefeicao.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(receita.tiposRefeicao.join(' • ')),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (temTempo)
                _Dado(
                  titulo: '$tempoTotal min',
                  subtitulo: 'tempo total',
                ),
              if (receita.porcoes != null)
                _Dado(
                  titulo: '${receita.porcoes}',
                  subtitulo: 'porções',
                ),
              if (receita.avaliacao != null)
                _Dado(
                  titulo: receita.avaliacao!.toStringAsFixed(1),
                  subtitulo: 'avaliação / 5',
                ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Ingredientes',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (receita.ingredientes.isEmpty)
            const Text('Ingredientes não informados.')
          else
            ...receita.ingredientes.map(
                  (ingrediente) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('•  $ingrediente'),
              ),
            ),
          const SizedBox(height: 24),
          const Text(
            'Modo de preparo',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (receita.instrucoes.isEmpty)
            const Text('Modo de preparo não informado.')
          else
            ...receita.instrucoes.asMap().entries.map(
                  (entrada) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: const Color(0xFF245B49),
                      child: Text(
                        '${entrada.key + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(entrada.value)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Dado extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const _Dado({
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF245B49),
            ),
          ),
          const SizedBox(height: 4),
          Text(subtitulo, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}