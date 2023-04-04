import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'carrinho.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({Key? key}) : super(key: key);

  @override
  _ProdutosPage createState() => _ProdutosPage();
}

class _ProdutosPage extends State<ProdutoPage> {
  final List<Produto> _produtos = [];

  final List<Produto> _cart = [];

  @override
  void initState() {
    super.initState();
    _getProdutos();
  }

  void _getProdutos() async {
    final apiKey = '2cfa7002191740e4b5bb402653e8bfe1';
    final response = await http.get(Uri.parse('https://api.spoonacular.com/food/products/search?query=foods&apiKey=$apiKey'));
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> produtosData = responseData['products'];
    setState(() {
      for (var item in produtosData) {
        final preco = Random().nextInt(26) + 5;
        final produto = Produto(
          nome: item['title'],
          preco: preco.toDouble(),
          imagem: item['image'],
        );
        _produtos.add(produto);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: ListView.builder(
        itemCount: _produtos.length,
        itemBuilder: (BuildContext context, int i) {
          final produto = _produtos[i];

          return ListTile(
            leading: Image.network(produto.imagem),
            title: Text(produto.nome),
            subtitle: Text('Valor: R\$ ${produto.preco}'),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  _cart.add(produto);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarrinhoPage(produtos: _cart),
                  ),
                );
              },
              child: Text('Adicionar'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarrinhoPage(produtos: _cart)),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Produto {
  final String nome;
  final double preco;
  final String imagem;

  const Produto(
      {required this.nome, required this.preco, required this.imagem});
}