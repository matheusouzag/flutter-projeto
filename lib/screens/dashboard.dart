import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Superbarato'),
      ),
      body: Column(
        children: [
          Image.asset('images/logo-superbarato.png'),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                String text = '';
                IconData icone = Icons.food_bank;
                if (index == 0) {
                  text =
                      'Compre com o melhor da região Compre com o melhor da região Compre com o melhor da região Compre com o melhor da região Compre com o melhor da região Compre com o melhor da região Compre com o melhor da região Compre com o melhor da região';
                  icone = Icons.location_city;
                } else if (index == 1) {
                  text = 'Produtos frescos todos os dias';
                  icone = Icons.local_florist;
                } else if (index == 2) {
                  text = 'Descontos exclusivos para você';
                  icone = Icons.local_offer;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: ListaComentarios(
                      text: text,
                      icone: icone,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListaComentarios extends StatelessWidget {
  final String text;
  final IconData icone;

  const ListaComentarios({Key? key, required this.text, required this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            child: Icon(icone),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
