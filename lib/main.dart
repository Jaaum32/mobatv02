import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Expansível',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ExpandableListPage(),
    );
  }
}

class ExpandableListPage extends StatelessWidget {
  const ExpandableListPage({super.key});

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

class ExpandableProductItem extends StatefulWidget {
  final String title;
  final String description;
  final String price;

  const ExpandableProductItem({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  State<ExpandableProductItem> createState() => _ExpandableProductItemState();
}

class _ExpandableProductItemState extends State<ExpandableProductItem> {
  // ✅ 1. Variável booleana _expanded para controlar o estado
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ✅ 2. GestureDetector que alterna o estado com setState
      onTap: () => setState(() => _expanded = !_expanded),
      child: ClipRRect(
        // ✅ 4. ClipRRect envolve o AnimatedContainer para animar os cantos
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          // ✅ 3. AnimatedContainer para animar mudanças de tamanho, cor, padding
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _expanded ? Colors.blue.shade50 : Colors.white,
            // Os cantos continuam arredondados aqui também
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Colors.black12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título visível sempre
              Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              // ✅ 5. Expansão da lista com mais informações quando _expanded = true
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.description),
                    const SizedBox(height: 8),
                    Text(widget.price, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Comprar'),
                    ),
                  ],
                ),
                crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
