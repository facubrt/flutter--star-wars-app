import 'package:flutter/material.dart';
import 'package:starwapp/src/presentation/logic/services/user_preferences.dart';

class ToggleOptionWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  const ToggleOptionWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  State<ToggleOptionWidget> createState() => _ToggleOptionWidgetState();
}

class _ToggleOptionWidgetState extends State<ToggleOptionWidget> {
  late bool state;
  final UserPreferences prefs = UserPreferences();

  @override
  void initState() {
    state = prefs.connection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: state,
      onChanged: (value) {
        setState(() {
          state = !state;
          prefs.connection = state;
        });
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      isThreeLine: true,
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      visualDensity: VisualDensity.standard,
    );
  }
}
