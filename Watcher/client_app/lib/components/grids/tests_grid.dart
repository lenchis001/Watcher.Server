import 'package:client_app/models/test/test_list_item.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TestsGrid extends DataGridSource {
  static Widget createGrid({
    required List<TestListItem> tests,
    required void Function(int) deleteTest,
  }) {
    return SfDataGrid(
      source: TestsGrid(
          tests: tests,
          deleteTest: deleteTest
      ),
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: 'id',
            label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  'Id',
                ))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: 'name',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Name'))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: 'status',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Status'))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'deleteAction',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Delete Action'))),
      ],
    );
  }

  /// Creates the employee data source class with required details.
  TestsGrid({
    required List<TestListItem> tests,
    required void Function(int) deleteTest
  }) {
    _employeeData = tests
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(columnName: 'status', value: _getExecutionStatus(e.isSuccessful)),
      DataGridCell<Widget>(
        columnName: 'actions',
        value: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){}, child: const Text('Edit')),
              ElevatedButton(
                onPressed: (){
                  deleteTest(e.id);
                },
                child: const Text('Delete'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)
                ),
              )
            ]),
      )
    ]))
        .toList();
  }

  static String _getExecutionStatus(bool? isSuccessful) {
    if(isSuccessful == null){
      return 'Now executed yet';
    } else if(isSuccessful) {
      return 'Successful';
    } else {
      return 'Failed';
    }
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          Widget child;
          if(e.columnName=="actions") {
            child = e.value;
          }else {
            child = Text(e.value.toString());
          }

          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: child,
          );
        }).toList());
  }
}