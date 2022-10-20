import 'package:flutter/material.dart';
import 'package:starwapp/src/core/constants/constants.dart';
import 'package:starwapp/src/presentation/views/pages/menu/widgets/toggle_option_widget.dart';
import 'package:starwapp/src/presentation/views/widgets/title_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MENU_PAGE),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TitleWidget(title: MENU_TITLE),
          ToggleOptionWidget(title: CONNECTION_BUTTON_TITLE, subtitle: CONNECTION_BUTTON_SUBTITLE)
        ],
      ),
    );
  }
}
