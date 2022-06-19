import 'dart:async';
import 'package:automap/automap.dart';
import 'package:client_app/models/default_data_processing_result.dart';
import 'package:client_app/models/error_code.dart';
import 'package:client_app/models/test/test.dart';
import 'package:flutter/material.dart';
import 'package:client_app/components/refreshable_panel/refreashable_panel_state_base.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;

class TestRefreshablePanelState extends RefreshablePanelStateBase<DefaultDataProcessingResult<List<Test>>> {
  final AutoMapper mapper;
  final wcb.ITestService testService;

  TestRefreshablePanelState({
    required this.mapper,
    required this.testService
  })
      : super(processFuture: _fetchTest(testService, mapper));

  @override
  Widget buildContent(BuildContext context, DefaultDataProcessingResult<List<Test>> data) {
    return data.errorCode == ErrorCode.OK ?
      ListView.separated(
          itemBuilder: (context, index) => Text(data.data![index].name),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: data.data!.length
      ):
        const Text('An error occurred');
  }

  static Future<DefaultDataProcessingResult<List<Test>>> _fetchTest(wcb.ITestService testService, AutoMapper mapper) async {
    final bllTests = await testService.getAll();
    final tests = mapper.map<
        wcb.DefaultDataProcessingResult<List<wcb.Test>>,
        DefaultDataProcessingResult<List<Test>>
    >(bllTests);
    return tests;
  }
}
