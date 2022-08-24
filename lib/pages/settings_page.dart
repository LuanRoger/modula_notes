import 'package:flutter/material.dart';
import 'package:modula_notes/providers/settings_provider.dart';
import 'package:modula_notes/shared/app_text_style.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool darkTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Configurações")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            const Text(
              "Opções de exibição",
              style: AppTextStyle.SETTING_SECTION_HEADER,
            ),
            Consumer<SettingsProvider>(
              builder: (_, value, __) => ListTile(
                title: const Text("Tema escuro"),
                trailing: Switch(
                  value: value.darkMode,
                  onChanged: (newValue) => value.darkMode = newValue,
                ),
              ),
            )
          ]),
        ));
  }
}
