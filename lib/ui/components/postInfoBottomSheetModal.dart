import 'package:flutter/material.dart';

void displayPostInfoBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 23, right: 23, bottom: 30, top: 20),
            child: Container(
              color: Colors.white,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Research Quality',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Yes',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'No',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Date Specified')),
                      DataCell(Icon(Icons.check)),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Location Specified')),
                      DataCell(Icon(Icons.check)),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Location is Accurate')),
                      DataCell(Icon(Icons.check)),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Community support')),
                      DataCell(Text('')),
                      DataCell(Icon(Icons.check)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Evidence')),
                      DataCell(Icon(Icons.check)),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Test')),
                      DataCell(Text('')),
                      DataCell(Icon(Icons.check)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
