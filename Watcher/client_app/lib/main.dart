import 'package:automap/automap.dart';
import 'package:client_app/models/default_data_processing_result.dart';
import 'package:client_app/models/user/sign_in.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/navigation_service.dart';
import 'package:client_app/navigation/watcher_route_information_parser.dart';
import 'package:client_app/navigation/watcher_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:client_app/models/default_processing_result.dart';
import 'package:client_app/models/error_code.dart';
import 'package:client_app/models/test/add_test.dart';
import 'package:client_app/models/test/test.dart';
import 'package:client_app/models/user/add_user.dart';

import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;

void main() {
  var container = GetIt.asNewInstance();
  setupDependencies(container);

  runApp(MaterialApp.router(
      routeInformationParser: container.get<WatcherRouteInformationParser>(),
      routerDelegate: container.get<WatcherRouterDelegate>()));
}

void setupDependencies(GetIt container) {
  setupMappings(container);
  wcb.Facade.setupDependencies(container);

  container.registerSingleton<INavigationService>(NavigationService());
  container.registerSingleton(WatcherRouteInformationParser(
      navigationService: container.get(),
      userService: container.get(),
      testService: container.get(),
      mapper: container.get()));
  container.registerSingleton(WatcherRouterDelegate(
      navigationService: container.get(),
      userService: container.get(),
      testService: container.get(),
      mapper: container.get()));
}

void setupMappings(GetIt container) {
  container.registerSingleton<AutoMapper>(AutoMapper.I);
  wcb.Facade.setupMappings(container.get());

  final mapper = container.get<AutoMapper>();
  mapper
    ..addManualMap<SignIn, wcb.SignIn>(
        (source, mapper, params) => wcb.SignIn(source.email, source.password))
    ..addManualMap<wcb.ErrorCode, ErrorCode>((source, mapper, params) {
      switch (source) {
        case wcb.ErrorCode.OK:
          return ErrorCode.OK;
        case wcb.ErrorCode.UNKNOWN:
          return ErrorCode.UNKNOWN;
        case wcb.ErrorCode.UNAUTHORIZED:
          return ErrorCode.UNAUTHORIZED;
      }
    })
    ..addManualMap<wcb.DefaultProcessingResult, DefaultProcessingResult>(
        (source, mapper, params) => DefaultProcessingResult(
            errorCode: mapper.map<wcb.ErrorCode, ErrorCode>(source.errorCode)))
    ..addManualMap<AddUser, wcb.AddUser>(
        (source, mapper, params) => wcb.AddUser(source.email, source.password))
    ..addManualMap<wcb.AddTest, AddTest>((source, mapper, params) =>
        AddTest(name: source.name, script: source.script, cron: source.cron))
    ..addManualMap<wcb.Test, Test>((source, mapper, params) => Test(
          id: source.id,
          name: source.name,
          script: source.script,
          cron: source.cron,
        ))
    ..addManualMap<wcb.DefaultDataProcessingResult<List<wcb.Test>>,
            DefaultDataProcessingResult<List<Test>>>(
        (source, mapper, params) => DefaultDataProcessingResult<List<Test>>(
            errorCode: mapper.map<wcb.ErrorCode, ErrorCode>(source.errorCode),
            data: source.data == null
                ? null
                : source.data!
                    .map((value) => mapper.map<wcb.Test, Test>(value))
                    .toList()));
}
