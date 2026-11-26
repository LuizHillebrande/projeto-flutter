import 'package:flutter/material.dart';
import 'package:receitas_app/Perfil.dart';
import 'package:receitas_app/Favoritos.dart';
import 'package:receitas_app/Detalhes.dart';
import 'package:receitas_app/models/receita.dart';
import 'package:receitas_app/services/receita_api.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int abaSelecionada = 0;
  bool carregando = true;
  String? erro;
  List<Receita> receitas = [];
  final Map<int, Receita> favoritos = {};

  @override
  void initState() {
    super.initState();
    carregarReceitas();
  }

  Future<void> carregarReceitas() async {
    setState(() {
      carregando = true;
      erro = null;
    });

    try {
      final lista = await ReceitaApi.buscarReceitas();

      if (!mounted) return;

      setState(() {
        receitas = lista;
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

  void alternarFavorito(Receita receita) {
    setState(() {
      if (favoritos.containsKey(receita.id)) {
        favoritos.remove(receita.id);
      } else {
        favoritos[receita.id] = receita;
      }
    });
  }

  void abrirDetalhes(Receita receita) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detalhes(
          receita: receita,
          favoritada: favoritos.containsKey(receita.id),
          aoAlternarFavorito: () => alternarFavorito(receita),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saborê',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF7F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF245B49),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Saborê',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          backgroundColor: const Color(0xFFFAF7F0),
        ),
        body: IndexedStack(
          index: abaSelecionada,
          children: [
            Perfil(
              receitas: receitas,
              carregando: carregando,
              erro: erro,
              aoTentarNovamente: carregarReceitas,
              aoAbrirReceita: abrirDetalhes,
              favoritos: favoritos,
              aoAlternarFavorito: alternarFavorito,
            ),
            Favoritos(
              favoritos: favoritos,
              aoAbrirReceita: abrirDetalhes,
              aoAlternarFavorito: alternarFavorito,
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: abaSelecionada,
          onDestinationSelected: (indice) {
            setState(() {
              abaSelecionada = indice;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Explorar',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}