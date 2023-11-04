import 'package:flutter/material.dart';
import 'package:flutter_partners_table_db_jalal/partner_list_screen.dart';

import 'db_helper.dart';
import 'main.dart';

class PartnersForm extends StatefulWidget {
  const PartnersForm({super.key});

  @override
  State<PartnersForm> createState() => _PartnersFormState();
}

class _PartnersFormState extends State<PartnersForm> {
  var _partnerNameController = TextEditingController();
  var _partnerPanController = TextEditingController();
  var _partnerAadharController = TextEditingController();
  var _partnerDateofAppointmentController = TextEditingController();
  var _partnerDateofResignationController = TextEditingController();
  var _partnerNumberController = TextEditingController();
  var _partnerEmailIDController = TextEditingController();
  var _partnerProfitSharingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Partners Form'),
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
                height: 20,
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
                height: 20,
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
                height: 20,
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
                height: 20,
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
                height: 20,
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
                height: 20,
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
                height: 20,
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
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print('------> Save Button Clicked');
                  _save();
                },
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save() async{
    print('------ Save');
    print('------> Partner Name: ${_partnerNameController.text}');
    print('------> Partner Pan: ${_partnerPanController.text}');
    print('------> Partner Aadhar: ${_partnerAadharController.text}');
    print('------> Partner Date of Appointment: ${_partnerDateofAppointmentController.text}');
    print('------> Partner Date of Resignation: ${_partnerDateofResignationController.text}');
    print('------> Partner Number: ${_partnerNumberController.text}');
    print('------> Partner EmailID: ${_partnerEmailIDController.text}');
    print('------> Partner Profit Sharing :${_partnerProfitSharingController.text}');


    Map<String, dynamic> row = {
      DataBaseHelper.colPartnerName: _partnerNameController.text,
      DataBaseHelper.colPartnerPan: _partnerPanController.text,
      DataBaseHelper.colPartnerAadhar: _partnerAadharController.text,
      DataBaseHelper.colPartnerDateofAppointment: _partnerDateofAppointmentController.text,
      DataBaseHelper.colPartnerDateofResignation: _partnerDateofResignationController.text,
      DataBaseHelper.colPartnerNumber: _partnerNumberController.text,
      DataBaseHelper.colPartnerEmailID: _partnerEmailIDController.text,
      DataBaseHelper.colpartnerProfitSharing: _partnerProfitSharingController.text,
    };

    final result = await dbHelper.insertpartnersListTable(
        row, DataBaseHelper.partnersListTable);

    debugPrint('---------> Inserted Row Id: $result');

    if (result > 0) {
      Navigator.pop(context);
      _showSuccesSnackBar(context, 'Saved');
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

  }

