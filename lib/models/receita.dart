class Receita {
  final int id;
  final String nome;
  final String imagem;
  final List<String> ingredientes;
  final List<String> instrucoes;
  final int? tempoPreparo;
  final int? tempoCozimento;
  final int? porcoes;
  final double? avaliacao;
  final List<String> tiposRefeicao;

  const Receita({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.ingredientes,
    required this.instrucoes,
    this.tempoPreparo,
    this.tempoCozimento,
    this.porcoes,
    this.avaliacao,
    required this.tiposRefeicao,
  });

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'] is int ? json['id'] : 0,
      nome: json['name'] is String
          ? json['name']
          : 'Receita sem nome',
      imagem: json['image'] is String ? json['image'] : '',
      ingredientes: json['ingredients'] is List
          ? List<String>.from(json['ingredients'])
          : [],
      instrucoes: json['instructions'] is List
          ? List<String>.from(json['instructions'])
          : [],
      tempoPreparo: json['prepTimeMinutes'] is num
          ? (json['prepTimeMinutes'] as num).toInt()
          : null,
      tempoCozimento: json['cookTimeMinutes'] is num
          ? (json['cookTimeMinutes'] as num).toInt()
          : null,
      porcoes: json['servings'] is num
          ? (json['servings'] as num).toInt()
          : null,
      avaliacao: json['rating'] is num
          ? (json['rating'] as num).toDouble()
          : null,
      tiposRefeicao: json['mealType'] is List
          ? List<String>.from(json['mealType'])
          : [],
    );
  }
}