import 'package:client_app/components/refreshable_panel/refreshable_panel.dart';
import 'package:flutter/material.dart';

import '../panel.dart';

abstract class RefreshablePanelStateBase<DT> extends State<RefreshablePanel> {
  Future<DT> processFuture;

  RefreshablePanelStateBase({required this.processFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DT>(
        future: processFuture,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot<DT> snapshot) {
          return SizedBox(
              width: widget.width,
              height: widget.height,
              child: Panel(
                  header: widget.header,
                  child: Expanded(
                      child: snapshot.connectionState != ConnectionState.done
                          ? const Center(child: CircularProgressIndicator())
                          : buildContent(context, snapshot.data!))));
        });
  }

  void runProcess(Future<DT> future) {
    setState(() {
      processFuture = future;
    });
  }

  Widget buildContent(BuildContext context, DT data);
}
