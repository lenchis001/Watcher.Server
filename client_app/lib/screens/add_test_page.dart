import 'package:automap/automap.dart';
import 'package:client_app/models/error_code.dart';
import 'package:client_app/models/test/add_test.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/screens/base_page.dart';
import 'package:flutter/material.dart';
import 'package:code_editor/code_editor.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;
import 'package:client_app/models/default_processing_result.dart';

class AddTestPage extends BasePage {
  final wcb.ITestService testService;
  final AutoMapper mapper;

  const AddTestPage({
    Key? key,
    required INavigationService navigationService,
    required this.testService,
    required this.mapper,
  }) : super(key: key, navigationService: navigationService);

  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white70),
            padding: const EdgeInsets.all(40),
            child:
                AddTestPageContent(testService: testService, mapper: mapper)));
  }
}

class AddTestPageContent extends StatefulWidget {
  final wcb.ITestService testService;
  final AutoMapper mapper;

  AddTestPageContent({
    required this.testService,
    required this.mapper,
  });

  @override
  State<StatefulWidget> createState() => AddTestPageContentState();
}

class AddTestPageContentState extends State<AddTestPageContent> {
  late String _name, _cron, _script;
  late Future _future;

  AddTestPageContentState() {
    _future = Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: _future,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Name'),
                TextField(onChanged: (value) => _name = value),
                const SizedBox(height: 16),
                const Text('Cron'),
                TextField(onChanged: (value) => _cron = value),
                const SizedBox(height: 16),
                const Text('Code'),
                const SizedBox(height: 16),
                CodeEditor(
                    key: GlobalKey(),
                    model: EditorModel(
                        files: [FileEditor(name: 'Script', language: 'js')]),
                    onSubmit: (_, codeValue) {
                      _script = codeValue ?? '';
                    }),
                const SizedBox(height: 16),
                Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: const Text('Add'),
                      onPressed: () {
                        final addTest =
                            AddTest(name: _name, script: _script, cron: _cron);
                        final bllAddTest =
                            widget.mapper.map<AddTest, wcb.AddTest>(addTest);

                        setState(() {
                          _future = widget.testService
                              .add(bllAddTest)
                              .then((value) {
                            return widget.mapper.map<
                                wcb.DefaultProcessingResult,
                                DefaultProcessingResult>(value);
                          })
                              .then((value) {
                            if (value.errorCode == ErrorCode.OK) {
                              Navigator.pop(context);
                            } else {
                              return showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('An error happened.'),
                                  content: const Text(
                                      'An error happened on attempt to sign in. Please check input data and try again.'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context, true),
                                        child: const Text('Close'))
                                  ],
                                ),
                              );
                            }
                          });
                        });
                      },
                    )),
              ]);
        });
  }
}
