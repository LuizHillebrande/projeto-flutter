import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:receitas_app/models/receita.dart';

class ReceitaApi {
  static const String baseUrl = 'https://dummyjson.com';

  static Future<List<Receita>> buscarReceitas() async {
    final resposta = await http
        .get(Uri.parse('$baseUrl/recipes?limit=30'))
        .timeout(const Duration(seconds: 15));

    if (resposta.statusCode != 200) {
      throw Exception('Não foi possível carregar as receitas.');
    }

    final dados = jsonDecode(resposta.body);

    if (dados is! Map || dados['recipes'] is! List) {
      throw Exception('Resposta inválida da API.');
    }

    return (dados['recipes'] as List)
        .whereType<Map<String, dynamic>>()
        .map(Receita.fromJson)
        .toList();
  }

  static Future<List<Receita>> pesquisar(String consulta) async {
    final uri = Uri.https(
      'dummyjson.com',
      '/recipes/search',
      {'q': consulta, 'limit': '30'},
    );

    final resposta =
    await http.get(uri).timeout(const Duration(seconds: 15));

    if (resposta.statusCode != 200) {
      throw Exception('Não foi possível realizar a pesquisa.');
    }

    final dados = jsonDecode(resposta.body);

    if (dados is! Map || dados['recipes'] is! List) {
      throw Exception('Resposta inválida da API.');
    }

    return (dados['recipes'] as List)
        .whereType<Map<String, dynamic>>()
        .map(Receita.fromJson)
        .toList();
  }
}