import 'package:flutter/material.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/utils/transitions.dart';
import 'package:starwapp/views/pages/base/base_page.dart';
import 'package:starwapp/views/pages/detail/detail_page.dart';
import 'package:starwapp/views/pages/home/home_page.dart';
import 'package:starwapp/views/pages/menu/menu_page.dart';

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
        return SlideLeftTransitionRoute(widget: DetailPage(character: character));
      default:
        return FadeTransitionRoute(widget: const BasePage());
    }
  }
}