import 'package:flutter/material.dart';
import '../widgets/expandable_product_item.dart';

/// Tela principal que exibe a lista de produtos expansíveis
class ExpandableListPage extends StatelessWidget {
  const ExpandableListPage({super.key});

  // Lista estática de produtos para demonstração
  final List<Map<String, String>> products = const [
    {
      'title': 'Notebook Gamer',
      'description': 'Alto desempenho com placa de vídeo dedicada.',
      'price': 'R\$ 4.999,00'
    },
    {
      'title': 'Smartphone Premium',
      'description': 'Tela AMOLED, câmera de 108MP e 5G.',
      'price': 'R\$ 2.899,00'
    },
    {
      'title': 'Fone de Ouvido Bluetooth',
      'description': 'Cancelamento de ruído ativo e 40h de bateria.',
      'price': 'R\$ 399,00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ofertas de Produtos')),
      // ListView.builder para renderizar lista de forma eficiente
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ExpandableProductItem(
            title: product['title']!,
            description: product['description']!,
            price: product['price']!,
          );
        },
      ),
    );
  }
}
