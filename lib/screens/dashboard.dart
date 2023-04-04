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
                  'Se você procura um supermercado que oferece produtos de qualidade, preços competitivos e um atendimento excepcional, então você precisa conhecer o nosso! Aqui no nosso supermercado, trabalhamos diariamente para garantir que nossos clientes tenham uma experiência de compra agradável e eficiente.';
                  icone = Icons.location_city;
                } else if (index == 1) {
                  text = 'Se você é daqueles que preza por alimentos frescos e saborosos, precisa conhecer o nosso supermercado! Temos um setor exclusivo de frutas e verduras, onde nossos funcionários selecionam os melhores produtos diretamente dos produtores locais, garantindo que você leve para casa alimentos frescos e nutritivos.';
                  icone = Icons.local_florist;
                } else if (index == 2) {
                  text = 'Se você está em busca de economizar nas suas compras, precisa conhecer os descontos exclusivos que o nosso supermercado oferece! Aqui, temos uma variedade de produtos com preços reduzidos e promoções imperdíveis.';
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