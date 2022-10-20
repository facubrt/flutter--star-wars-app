import 'package:flutter/material.dart';
import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/core/utils/transitions.dart';
import 'package:starwapp/src/presentation/views/pages/base/base_page.dart';
import 'package:starwapp/src/presentation/views/pages/detail/detail_page.dart';
import 'package:starwapp/src/presentation/views/pages/home/home_page.dart';
import 'package:starwapp/src/presentation/views/pages/menu/menu_page.dart';

const String basePage = 'basePage';
const String homePage = 'homePage';
const String menuPage = 'menuPage';
const String detailPage = 'detailPage';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (basePage):
        return FadeTransitionRoute(widget: const BasePage());
      case (homePage):
        return FadeTransitionRoute(widget: const HomePage());
      case (menuPage):
        return FadeTransitionRoute(widget: const MenuPage());
      case (detailPage):
        final args = settings.arguments;
        Character character = args as Character;
        return SlideLeftTransitionRoute(
            widget: DetailPage(character: character));
      default:
        return FadeTransitionRoute(widget: const BasePage());
    }
  }
}
