import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget que representa um item de produto expansível
/// Implementa animação suave ao expandir/recolher e exibe detalhes do produto
///
/// Características:
/// - Animação suave de expansão/contração
/// - Feedback tátil ao tocar
/// - Animação de elevação
/// - Design responsivo
/// - Gerenciamento adequado de recursos
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

class _ExpandableProductItemState extends State<ExpandableProductItem>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _controller;
  late final Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _elevationAnimation = Tween<double>(
      begin: 2,
      end: 8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showPurchaseConfirmation() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item adicionado ao carrinho!'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: 'OK', onPressed: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: _elevationAnimation.value,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async {
          await HapticFeedback.selectionClick();
          setState(() => _expanded = !_expanded);
          if (_expanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder:
              (context, child) => Container(
                padding: EdgeInsets.lerp(
                  const EdgeInsets.all(16),
                  const EdgeInsets.all(20),
                  _controller.value,
                ),
                decoration: BoxDecoration(
                  color: Color.lerp(
                    Colors.white,
                    Colors.blue.shade50,
                    _controller.value,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 0.5).animate(
                            CurvedAnimation(
                              parent: _controller,
                              curve: Curves.easeOutCubic,
                              reverseCurve: Curves.easeInCubic,
                            ),
                          ),
                          child: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child:
                          _expanded
                              ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    widget.description,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    widget.price,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: 150,
                                    child: ElevatedButton.icon(
                                      onPressed: _showPurchaseConfirmation,
                                      icon: const Icon(Icons.shopping_cart),
                                      label: const Text('Comprar'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                              : const SizedBox(height: 0),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
