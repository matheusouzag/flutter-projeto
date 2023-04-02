import 'package:flutter/material.dart';
import 'package:projeto_final/screens/products.dart';

class CarrinhoPage extends StatefulWidget {
  final List<Produto> produtos;

  const CarrinhoPage({Key? key, required this.produtos}) : super(key: key);

  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  double total = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    double newTotal = 0;
    for (var produto in widget.produtos) {
      newTotal += produto.preco;
    }
    setState(() {
      total = newTotal;
    });
  }

  void _removerProduto(int index) {
    setState(() {
      widget.produtos.removeAt(index);
    });
    _calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: ListView.builder(
        itemCount: widget.produtos.length,
        itemBuilder: (BuildContext context, int i) {
          final produto = widget.produtos[i];

          return ListTile(
            leading: Image.network(produto.imagem),
            title: Text(produto.nome),
            subtitle: Text('Valor: R\$ ${produto.preco}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removerProduto(i);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: R\$ ${total.toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                  // Implementar aqui a lógica para realizar o pagamento
                },
                child: Text('Pagar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
