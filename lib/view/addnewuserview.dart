import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitled/viewmodel/hivemanger.dart';

class MyAddNewUserClass extends StatelessWidget {
  MyAddNewUserClass({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController qualController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fKey = GlobalKey();
    double ht = MediaQuery.of(context).size.height;
    double wdth = MediaQuery.of(context).size.width;
    final dataObj = Provider.of<HiveFunctions>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'New User',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: qualController,
                  decoration: InputDecoration(
                      hintText: 'Qualification',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    dataObj.createUser({
                      "name": nameController.text,
                      "email": emailController.text,
                      "age": ageController.text,
                      "phone": phoneController.text,
                      "qualification": qualController.text,
                    });
                    Fluttertoast.showToast(msg: "Added");
                    Navigator.pop(context);
                  },
                  child: Text('Add User'),
                ),
              )
            ],
          ),
        ));
  }
}
