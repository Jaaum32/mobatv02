import 'package:flutter/material.dart';

/// Widget que representa um item de produto expansível
/// Implementa animação suave ao expandir/recolher e exibe detalhes do produto
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
  // Controla o estado de expansão do item
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Alterna o estado de expansão ao tocar
      onTap: () => setState(() => _expanded = !_expanded),
      child: ClipRRect(
        // Aplica bordas arredondadas com animação
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          // Anima mudanças de tamanho e cor com duração de 500ms
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // Muda a cor de fundo quando expandido
            color: _expanded ? Colors.blue.shade50 : Colors.white,
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
              Text(
                widget.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 8),
              // Animação de crossfade para mostrar/ocultar detalhes
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.description),
                    const SizedBox(height: 8),
                    Text(
                      widget.price,
                      style: const TextStyle(fontWeight: FontWeight.bold)
                    ),
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
