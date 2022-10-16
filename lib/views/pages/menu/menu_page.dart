import 'package:flutter/material.dart';
import 'package:starwapp/views/pages/menu/widgets/toggle_option_widget.dart';
import 'package:starwapp/views/widgets/title_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TitleWidget(title: '¡Cuida tu conexión!'),
          ToggleOptionWidget(title: 'Modo sin conexión', subtitle: 'Manten activada esta opción para que nadie pueda encontrarte.')
        ],
      ),
    );
  }
}
