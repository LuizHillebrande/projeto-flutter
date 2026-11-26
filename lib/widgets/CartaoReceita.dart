import 'package:flutter/material.dart';
import 'package:receitas_app/models/receita.dart';

const verde = Color(0xFF245B49);
const texto = Color(0xFF263F35);

class CartaoReceita extends StatelessWidget {
  final Receita receita;
  final bool favoritada;
  final VoidCallback aoAbrir;
  final VoidCallback aoAlternarFavorito;

  const CartaoReceita({
    super.key,
    required this.receita,
    required this.favoritada,
    required this.aoAbrir,
    required this.aoAlternarFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: aoAbrir,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: receita.imagem.isEmpty
                    ? Container(
                  width: 90,
                  height: 90,
                  color: const Color(0xFFE8E8D9),
                  child: const Icon(Icons.restaurant, color: verde),
                )
                    : Image.network(
                  receita.imagem,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 90,
                      height: 90,
                      color: const Color(0xFFE8E8D9),
                      child: const Icon(Icons.restaurant, color: verde),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receita.nome,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: texto,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${receita.tempoPreparo ?? '--'} min • '
                          '${receita.avaliacao?.toStringAsFixed(1) ?? '--'} / 5',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: aoAlternarFavorito,
                icon: Icon(
                  favoritada ? Icons.favorite : Icons.favorite_border,
                  color: favoritada ? Colors.deepOrange : texto,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}