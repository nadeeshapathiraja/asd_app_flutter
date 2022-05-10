import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/game/game_one_provider.dart';
import 'package:game_app/providers/item_provider.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
              child: Text(
            'Child Progress Report',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          DataTable(
            columns: [
              DataColumn(
                label: CustomText(
                  text: "ID",
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: "Category",
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: "Game",
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: "Fail Count",
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Animals')),
                  DataCell(Text('Bird')),
                  DataCell(
                    Text(
                      Provider.of<GameOneProvider>(context, listen: false)
                          .clickCount
                          .toString()
                          .replaceAll(regex, ''),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Animals')),
                  DataCell(Text('Dog')),
                  DataCell(
                    Text(
                      Provider.of<GameOneProvider>(context, listen: false)
                          .clickCount
                          .toString()
                          .replaceAll(regex, ''),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Vehicles')),
                  DataCell(Text('Train')),
                  DataCell(
                    Text(
                      Provider.of<GameOneProvider>(context, listen: false)
                          .clickCount
                          .toString()
                          .replaceAll(regex, ''),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
