import 'package:flutter/material.dart';
import 'package:receitas_app/models/receita.dart';
import 'package:receitas_app/services/receita_api.dart';
import 'package:receitas_app/widgets/CartaoReceita.dart';

class Resultado extends StatefulWidget {
  final void Function(Receita) aoAbrirReceita;
  final Map<int, Receita> favoritos;
  final void Function(Receita) aoAlternarFavorito;

  const Resultado({
    super.key,
    required this.aoAbrirReceita,
    required this.favoritos,
    required this.aoAlternarFavorito,
  });

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  final TextEditingController controller = TextEditingController();
  List<Receita> resultados = [];
  bool carregando = false;
  bool pesquisou = false;
  String? erro;
  String mensagem = '';

  Future<void> pesquisar() async {
    final consulta = controller.text.trim();

    if (consulta.isEmpty) {
      setState(() {
        mensagem = 'Digite um nome para pesquisar.';
        pesquisou = false;
        resultados = [];
        erro = null;
      });
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      carregando = true;
      pesquisou = true;
      mensagem = '';
      erro = null;
      resultados = [];
    });

    try {
      final lista = await ReceitaApi.pesquisar(consulta);

      if (!mounted) return;

      setState(() {
        resultados = lista;
        carregando = false;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        erro = 'Não foi possível carregar as receitas.';
        carregando = false;
      });
    }
  }

  void limparPesquisa() {
    controller.clear();

    setState(() {
      resultados = [];
      carregando = false;
      pesquisou = false;
      erro = null;
      mensagem = '';
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar receitas'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Qual receita você procura?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263F35),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => pesquisar(),
            decoration: const InputDecoration(
              labelText: 'Nome da receita',
              hintText: 'Buscar pelo nome',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          if (mensagem.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              mensagem,
              style: const TextStyle(color: Colors.red),
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: carregando ? null : pesquisar,
              child: const Text('Pesquisar'),
            ),
          ),
          OutlinedButton(
            onPressed: limparPesquisa,
            child: const Text('Limpar pesquisa'),
          ),
          const SizedBox(height: 24),
          if (carregando)
            const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('Carregando receitas...'),
                ],
              ),
            )
          else if (erro != null)
            Column(
              children: [
                Text(
                  erro!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: pesquisar,
                  child: const Text('Tentar novamente'),
                ),
              ],
            )
          else if (pesquisou && resultados.isEmpty)
              const Column(
                children: [
                  Icon(Icons.search, size: 50),
                  SizedBox(height: 12),
                  Text(
                    'Nenhum resultado',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Não encontramos receitas para esse nome. Tente outro termo.',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            else if (resultados.isNotEmpty) ...[
                Text(
                  'Resultados para "${controller.text.trim()}"',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...resultados.map(
                      (receita) => CartaoReceita(
                    receita: receita,
                    favoritada: widget.favoritos.containsKey(receita.id),
                    aoAbrir: () => widget.aoAbrirReceita(receita),
                    aoAlternarFavorito: () =>
                        widget.aoAlternarFavorito(receita),
                  ),
                ),
              ],
        ],
      ),
    );
  }
}