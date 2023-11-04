import 'package:flutter/material.dart';
import 'package:flutter_partners_table_db_jalal/db_helper.dart';
import 'package:flutter_partners_table_db_jalal/main.dart';
import 'package:flutter_partners_table_db_jalal/partners_edit_form.dart';
import 'package:flutter_partners_table_db_jalal/partners_form.dart';
import 'package:flutter_partners_table_db_jalal/partners_model.dart';

class PartnersList extends StatefulWidget {
  const PartnersList({super.key});

  @override
  State<PartnersList> createState() => _PartnersListState();
}

class _PartnersListState extends State<PartnersList> {
  late List<PartnersDetailsModel> _PartnersList;

  @override
  void initState() {
    super.initState();
    getAllPartnersList();
  }

  getAllPartnersList() async {
    _PartnersList = <PartnersDetailsModel>[];

    var PartnersListRecords =
        await dbHelper.queryAllRows(DataBaseHelper.partnersListTable);

    PartnersListRecords.forEach((PartnerDetail) {
      setState(() {

        print(PartnerDetail['_id']);
        print(PartnerDetail['_partnerName']);
        print(PartnerDetail['_partnerPan']);
        print(PartnerDetail['_partnerAadhar']);
        print(PartnerDetail['_DateofAppointment']);
        print(PartnerDetail['_DateofResignation']);
        print(PartnerDetail['_partnerNumber']);
        print(PartnerDetail['_partnerEmailID']);
        print(PartnerDetail['_partnerProfitSharing']);

        var partnersDetailsModel = PartnersDetailsModel(
          PartnerDetail['_id'],
          PartnerDetail['_partnerName'],
          PartnerDetail['_partnerPan'],
          PartnerDetail['_partnerAadhar'],
          PartnerDetail['_DateofAppointment'],
          PartnerDetail['_DateofResignation'],
          PartnerDetail['_partnerNumber'],
          PartnerDetail['_partnerEmailID'],
          PartnerDetail['_partnerProfitSharing'],
        );

        _PartnersList.add(partnersDetailsModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Partners Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
            itemCount: _PartnersList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print('------>Edit or Delete Invoked: Send Data');

                  print(_PartnersList[index].id);
                  print(_PartnersList[index].partnerName);
                  print(_PartnersList[index].partnerPan);
                  print(_PartnersList[index].partnerAadhar);
                  print(_PartnersList[index].partnerDateofAppointment);
                  print(_PartnersList[index].partnerDateofResignation);
                  print(_PartnersList[index].partnerNumber);
                  print(_PartnersList[index].partnerEmailID);
                  print(_PartnersList[index].partnerProfitSharing);

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditPartnersForm(),
                    settings: RouteSettings(
                      arguments: _PartnersList[index],
                    ),
                  ));
                },
                child: ListTile(
                  title: Text(
                    _PartnersList[index].partnerName,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('------- Launch Patners Form List');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartnersForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
