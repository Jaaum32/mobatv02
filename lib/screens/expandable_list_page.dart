import 'package:flutter/material.dart';
import '../widgets/expandable_product_item.dart'; // Importa o widget que representa os itens expansíveis de produto

/// Tela principal que exibe a lista de produtos expansíveis
class ExpandableListPage extends StatelessWidget {
  const ExpandableListPage({super.key});

  // Lista estática de produtos para demonstração
  // Cada produto tem título, descrição e preço
  final List<Map<String, String>> products = const [
    {
      'title': 'Notebook Gamer',
      'description': 'Alto desempenho com placa de vídeo dedicada.',
      'price': 'R\$ 4.999,00',
    },
    {
      'title': 'Smartphone Premium',
      'description': 'Tela AMOLED, câmera de 108MP e 5G.',
      'price': 'R\$ 2.899,00',
    },
    {
      'title': 'Fone de Ouvido Bluetooth',
      'description': 'Cancelamento de ruído ativo e 40h de bateria.',
      'price': 'R\$ 399,00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar que exibe o título "Ofertas de Produtos"
      appBar: AppBar(title: const Text('Ofertas de Produtos')),

      // ListView.builder: Renderiza a lista de produtos de forma eficiente
      // Com o ListView.builder, apenas os itens visíveis na tela são renderizados, economizando memória
      body: ListView.builder(
        padding: const EdgeInsets.all(16), // Adiciona o espaçamento de 16 pixels ao redor da lista
        itemCount: products.length, // O número de itens na lista será o tamanho da lista de produtos
        itemBuilder: (context, index) {
          // Para cada índice da lista, cria-se um widget ExpandableProductItem
          // 'ExpandableProductItem' é um widget que irá exibir os detalhes do produto e permitir expandir/recolher
          final product = products[index]; // Obtém o produto com base no índice
          return ExpandableProductItem(
            title: product['title']!, // Passa o título do produto
            description: product['description']!, // Passa a descrição do produto
            price: product['price']!, // Passa o preço do produto
          );
        },
      ),
    );
  }
}
