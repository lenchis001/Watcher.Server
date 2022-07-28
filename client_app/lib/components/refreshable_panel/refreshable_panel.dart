import 'package:client_app/components/refreshable_panel/refreashable_panel_state_base.dart';
import 'package:flutter/material.dart';

class RefreshablePanel extends StatefulWidget {
  final String header;
  final double width, height;
  final RefreshablePanelStateBase state;

  const RefreshablePanel(
      {Key? key,
      required this.header,
      required this.width,
      required this.height,
        required this.state
      })
      : super(key: key);

  @override
  State<RefreshablePanel> createState() => state;
}