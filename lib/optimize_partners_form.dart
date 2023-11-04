import 'package:flutter/material.dart';
import 'package:flutter_partners_table_db_jalal/db_helper.dart';
import 'package:flutter_partners_table_db_jalal/main.dart';
import 'package:flutter_partners_table_db_jalal/partner_list_screen.dart';
import 'package:flutter_partners_table_db_jalal/partners_model.dart';

class EditPartnersForm extends StatefulWidget {
  const EditPartnersForm({super.key});

  @override
  State<EditPartnersForm> createState() => _EditPartnersFormState();
}

class _EditPartnersFormState extends State<EditPartnersForm> {
  var _partnerNameController = TextEditingController();
  var _partnerPanController = TextEditingController();
  var _partnerAadharController = TextEditingController();
  var _partnerDateofAppointmentController = TextEditingController();
  var _partnerDateofResignationController = TextEditingController();
  var _partnerNumberController = TextEditingController();
  var _partnerEmailIDController = TextEditingController();
  var _partnerProfitSharingController = TextEditingController();

  //Edit option

  bool firstTimeFlag = false;
  int _selectedId = 0;

  // Optimized
  String buttonText ='Save';

  @override
  Widget build(BuildContext context) {
    // edit _receive data
    if (firstTimeFlag == false) {
      print('------> Once Excutes');

      firstTimeFlag = true;

      final partnersDetail =
      ModalRoute.of(context)!.settings.arguments ;

      if(partnersDetail == null){
        print('--------> FAB: Insert/Save:');
      }else{
        print('------>ListView: Received Data: Edit/Delete');

        partnersDetail as PartnersDetailsModel;

      print('-----> Recived Data');
      print(partnersDetail.id);
      print(partnersDetail.partnerName);
      print(partnersDetail.partnerPan);
      print(partnersDetail.partnerAadhar);
      print(partnersDetail.partnerDateofAppointment);
      print(partnersDetail.partnerDateofResignation);
      print(partnersDetail.partnerNumber);
      print(partnersDetail.partnerEmailID);
      print(partnersDetail.partnerProfitSharing);

      _selectedId = partnersDetail.id!;
      buttonText ='Update';

      _partnerNameController.text = partnersDetail.partnerName;
      _partnerPanController.text = partnersDetail.partnerPan;
      _partnerAadharController.text = partnersDetail.partnerAadhar;
      _partnerDateofAppointmentController.text =
          partnersDetail.partnerDateofAppointment;
      _partnerDateofResignationController.text =
          partnersDetail.partnerDateofResignation;
      _partnerNumberController.text = partnersDetail.partnerNumber;
      _partnerEmailIDController.text = partnersDetail.partnerEmailID;
      _partnerProfitSharingController.text =
          partnersDetail.partnerProfitSharing;
    }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Partners Form'),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text('Delete')),
            ],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                print('Delete Option Clicked');
                _deleteFormDialog(context);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _partnerNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Partner Name',
                  hintText: 'Enter Partner Name',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerPanController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Partner Pan',
                  hintText: 'Enter Partner Pan',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerAadharController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Partner Aadhar',
                    hintText: 'Enter Partner Aadhar'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerDateofAppointmentController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Date of Appointment',
                    hintText: 'Enter Date of Appointment'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerDateofResignationController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Date of Resignation',
                    hintText: 'Enter Date of Resignation'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerNumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Partner Number',
                    hintText: 'Enter Partner Number'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerEmailIDController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Partner EmailID',
                    hintText: 'Enter Partner EmailID'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _partnerProfitSharingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Partner Profit Sharing',
                    hintText: 'Enter Profit Sharing'),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  print('------> Update Button Clicked');
                  if(_selectedId ==0){
                    print('-------->Save');
                    _save();
                  }else{
                    print('------>Update');
                    _Update();
                  }
                },
                child: Text(buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }

  _deleteFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  print('-----> Cancel Button Clicked');
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  print('-----> Delete Button Clicked');
                  _delete();
                },
                child: const Text('Delete'),
              ),
            ],
            title: const Text('Are You Sure Want to Delete This?'),
          );
        });
  }

  void _save() async{
    print('------ _save');

    print('------> Selected ID:$_selectedId');
    print('------> Partner Name: ${_partnerNameController.text}');
    print('------> Partner Pan: ${_partnerPanController.text}');
    print('------> Partner Aadhar: ${_partnerAadharController.text}');
    print(
        '------> Partner Date of Appointment: ${_partnerDateofAppointmentController.text}');
    print(
        '------> Partner Date of Resignation: ${_partnerDateofResignationController.text}');
    print('------> Partner Number: ${_partnerNumberController.text}');
    print('------> Partner EmailID: ${_partnerEmailIDController.text}');
    print(
        '------> Partner Profit Sharing :${_partnerProfitSharingController.text}');

    Map<String, dynamic> row = {
      DataBaseHelper.colId: _selectedId,
      DataBaseHelper.colPartnerName: _partnerNumberController.text,
      DataBaseHelper.colPartnerPan: _partnerPanController.text,
      DataBaseHelper.colPartnerAadhar: _partnerAadharController.text,
      DataBaseHelper.colPartnerDateofAppointment:
      _partnerDateofAppointmentController.text,
      DataBaseHelper.colPartnerDateofResignation:
      _partnerDateofResignationController.text,
      DataBaseHelper.colPartnerNumber: _partnerNumberController.text,
      DataBaseHelper.colPartnerEmailID: _partnerEmailIDController.text,
      DataBaseHelper.colpartnerProfitSharing: _partnerProfitSharingController.text,
    };
    final result =await dbHelper.insertpartnersListTable(
        row, DataBaseHelper.partnersListTable);
    debugPrint('--------> Inserted Row Id: $result');
    if(result>0){
      Navigator.pop(context);
      _showSuccesSnackBar(context, 'Saved');
    }
    setState(() {
      Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (context) => PartnersList()));
    });
  }

  void _Update() async {
    print('------ _Update');

    print('------> Selected ID:$_selectedId');
    print('------> Partner Name: ${_partnerNameController.text}');
    print('------> Partner Pan: ${_partnerPanController.text}');
    print('------> Partner Aadhar: ${_partnerAadharController.text}');
    print(
        '------> Partner Date of Appointment: ${_partnerDateofAppointmentController.text}');
    print(
        '------> Partner Date of Resignation: ${_partnerDateofResignationController.text}');
    print('------> Partner Number: ${_partnerNumberController.text}');
    print('------> Partner EmailID: ${_partnerEmailIDController.text}');
    print(
        '------> Partner Profit Sharing :${_partnerProfitSharingController.text}');

    Map<String, dynamic> row = {
      DataBaseHelper.colId: _selectedId,
      DataBaseHelper.colPartnerName: _partnerNumberController.text,
      DataBaseHelper.colPartnerPan: _partnerPanController.text,
      DataBaseHelper.colPartnerAadhar: _partnerAadharController.text,
      DataBaseHelper.colPartnerDateofAppointment:
      _partnerDateofAppointmentController.text,
      DataBaseHelper.colPartnerDateofResignation:
      _partnerDateofResignationController.text,
      DataBaseHelper.colPartnerNumber: _partnerNumberController.text,
      DataBaseHelper.colPartnerEmailID: _partnerEmailIDController.text,
      DataBaseHelper.colpartnerProfitSharing: _partnerProfitSharingController.text,
    };
    final result = await dbHelper.updatePartnersDetails(
        row, DataBaseHelper.partnersListTable);

    debugPrint('---------> Updated Row Id: $result');

    if (result > 0) {
      Navigator.pop(context);
      _showSuccesSnackBar(context, 'Update');
    }

    setState(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PartnersList()));
    });
  }

  void _showSuccesSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

  void _delete() async {
    print('-----> _delete');

    final result = await dbHelper.deletePartnersDetail(
        _selectedId, DataBaseHelper.partnersListTable);

    debugPrint('------> Deleted Row Id :$result');

    if (result > 0) {
      _showSuccesSnackBar(context, 'Deleted.');
      Navigator.pop(context);
    }
    setState(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PartnersList()));
    });
  }
}
