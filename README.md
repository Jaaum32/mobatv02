# Lista Expansível Flutter

## Objetivo
Aplicativo Flutter que demonstra a implementação de uma lista com itens expansíveis usando animações suaves e feedback visual.

## Instalação
1. Clone o repositório
2. Execute `flutter pub get` para instalar as dependências
3. Execute `flutter run` para iniciar o aplicativo

## Funcionalidades
- Lista de produtos expansível com animações suaves
- Interface moderna e responsiva com Material Design 3
- Feedback visual ao expandir/recolher itens
- Detalhes do produto com descrição e preço
- Botão de ação para cada produto

## Exemplo de Uso
![Exemplo de item expandido](screenshots/exemplo.png)

Para usar o aplicativo:
1. Inicie o aplicativo
2. Toque em qualquer item da lista para expandir/recolher
3. Visualize os detalhes do produto
4. Use o botão "Comprar" para interagir com o item

## Estrutura do Projeto
```
lib/
  ├── screens/
  │   └── expandable_list_page.dart   # Tela principal com lista de produtos
  ├── widgets/
  │   └── expandable_product_item.dart # Widget do item expansível
  └── main.dart                        # Ponto de entrada do aplicativo
```

## Tecnologias Utilizadas
- Flutter SDK
- Material Design 3
- Animações implícitas (AnimatedContainer, AnimatedCrossFade)
- Gerenciamento de estado com StatefulWidget
- Gerenciamento adequado de memória com dispose()