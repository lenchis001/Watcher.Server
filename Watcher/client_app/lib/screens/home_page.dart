import 'package:client_app/components/panel.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/screens/base_page.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;

class HomePage extends BasePage {
  final wcb.ITestService testService;

  const HomePage({
    Key? key,
    required INavigationService navigationService,
    required this.testService
  }) : super(key: key, navigationService: navigationService);

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Panel(
              header: "Tests" ,
              child: SizedBox(
                  width: 480,
                  height: 256,
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: Text("SignIn flow test"),
                            ),
                            Expanded(
                              child: Text("Enabled", style: TextStyle(color: Colors.green),),
                            ),
                            Expanded(
                              child: Text("Failed", style: TextStyle(color: Colors.redAccent),),
                            ),
                          ]);
                    },
                  )
              )
          ),
        ],)
      ],
    );
  }
  
}