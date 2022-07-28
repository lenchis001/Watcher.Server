import 'dart:async';
import 'package:automap/automap.dart';
import 'package:client_app/components/grids/tests_grid.dart';
import 'package:client_app/models/default_data_processing_result.dart';
import 'package:client_app/models/error_code.dart';
import 'package:client_app/models/test/test.dart';
import 'package:client_app/models/test/test_list_item.dart';
import 'package:client_app/models/test_execution/test_execution.dart';
import 'package:flutter/material.dart';
import 'package:client_app/components/refreshable_panel/refreashable_panel_state_base.dart';
import 'package:taskus/index.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;
import 'package:collection/collection.dart';

class TestRefreshablePanelState extends RefreshablePanelStateBase<
      DefaultDataProcessingResult<List<TestListItem>>
> {
  final AutoMapper mapper;
  final wcb.ITestService testService;
      final wcb.ITestExecutionService testExecutionService;

  TestRefreshablePanelState({
    required this.mapper,
    required this.testService,
    required this.testExecutionService,
  })
      : super(processFuture: _fetchTest(testService, testExecutionService, mapper));

  @override
  Widget buildContent(BuildContext context, DefaultDataProcessingResult<List<TestListItem>> result) {
    if(result.errorCode != ErrorCode.OK) {
      return const Align(
        child: Text('An error occurred'),
      );
    }

    return TestsGrid.createGrid(tests: result.data!, deleteTest: _deleteTest);
  }

  void _deleteTest(int id) {
    runProcess(testService
        .delete(id)
        .then((value) => _fetchTest(testService, testExecutionService, mapper)));
  }

  static Future<DefaultDataProcessingResult<List<TestListItem>>> _fetchTest(
      wcb.ITestService testService,
      wcb.ITestExecutionService testExecutionService,
      AutoMapper mapper
    ) async {
    final bllResult = await ExtendedFuture.waitTwo(
      futureA: testService.getAll(),
      futureB: testExecutionService.getLatest(),
    );

    final tests = mapper.map<
        wcb.DefaultDataProcessingResult<List<wcb.Test>>,
        DefaultDataProcessingResult<List<Test>>
    >(bllResult.firstValue);

    final testExecutions = mapper.map<
        wcb.DefaultDataProcessingResult<List<wcb.TestExecution>>,
        DefaultDataProcessingResult<List<TestExecution>>
    >(bllResult.secondValue);

    if(tests.errorCode != ErrorCode.OK && testExecutions.errorCode != ErrorCode.OK) {
      return DefaultDataProcessingResult<List<TestListItem>>.unknownError();
    }

    return DefaultDataProcessingResult<List<TestListItem>>(
      errorCode: ErrorCode.OK,
      data: tests.data!.map((e) =>
        TestListItem(
          id: e.id,
          name: e.name,
          script: e.script,
          cron: e.cron,
          isSuccessful: testExecutions.data!.firstWhereOrNull((te) => te.testId == e.id)?.isSuccessful,
        ))
        .toList(growable: false)
    );
  }
}
