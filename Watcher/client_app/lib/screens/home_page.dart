import 'package:automap/automap.dart';
import 'package:client_app/components/panel.dart';
import 'package:client_app/components/refreshable_panel/refreshable_panel.dart';
import 'package:client_app/components/refreshable_panel/test_refreshable_panel_state.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/screens/base_page.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;

class HomePage extends BasePage {
  final wcb.ITestService testService;
  final AutoMapper mapper;

  const HomePage({
    Key? key,
    required INavigationService navigationService,
    required this.testService,
    required this.mapper
  }) : super(key: key, navigationService: navigationService);

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          RefreshablePanel(
            key: GlobalKey(),
              header: "Tests" ,
              width: 480,
              height: 256,
              state: TestRefreshablePanelState(testService: testService, mapper: mapper),
              )
        ],)
      ],
    );
  }
  
}