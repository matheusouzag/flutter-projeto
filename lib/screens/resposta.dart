import 'package:flutter/material.dart';
import 'package:projeto_final/screens/carrinho.dart';
import 'package:projeto_final/screens/dashboard.dart';

class Sucesso extends StatelessWidget {
  const Sucesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container cinza embaixo do Scaffold
        Container(
          color: Colors.grey.withOpacity(0.9),
          width: double.infinity,
          height: double.infinity,
        ),

        Scaffold(
          body: Center(
            child: Container(
              width: 300,
              height: 175,
              padding: EdgeInsets.fromLTRB(0, 16, 0, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 60.0,
                  ),
                  Text(
                    'Compra bem sucedida!',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarrinhoPage(produtos: []),
                            ),
                          );
                        },
                        child: Text(
                          'Voltar',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}