import 'package:client_app/screens/base_page.dart';
import 'package:flutter/material.dart';
import 'package:code_editor/code_editor.dart';

class AddTest extends BasePage {
  const AddTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white70),
        padding: const EdgeInsets.all(40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Add new test'),
          const TextField(),
          const SizedBox(height: 16),
          const Text('Code'),
          const SizedBox(height: 16),
          CodeEditor(
              key: GlobalKey(),
              model: EditorModel(
                  files: [FileEditor(name: 'Script', language: 'js')]),
              onSubmit: (_, __) {}),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () {}, child: const Text('Add')),
          )
        ])
      )
    );
  }
}
