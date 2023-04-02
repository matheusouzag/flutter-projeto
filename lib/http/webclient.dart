import 'dart:convert';
import 'package:http/http.dart' as http;
import '../screens/products.dart';

Future<List<Produto>> getProdutos() async {
  final apiKey = '2cfa7002191740e4b5bb402653e8bfe1';
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/food/products/search?query=foods&apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final produtosData = data['products'];
    final produtos = List<Produto>.from(
        produtosData.map((produto) => Produto(
            nome: produto['title'],
            preco: produto['price'],
            imagem: produto['image']
        )));

    return produtos;
  } else {
    throw Exception('Erro ao carregar produtos');
  }
}
