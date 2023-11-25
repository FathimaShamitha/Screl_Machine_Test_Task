import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/hivemanger.dart';
import 'addnewuserview.dart';

class MyHomeClass extends StatelessWidget {
  MyHomeClass({Key? key}) : super(key: key);

  List myHiveData = [];

  @override
  Widget build(BuildContext context) {
    final hiveObj = Provider.of<HiveFunctions>(context);
    myHiveData = hiveObj.getAllUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserView App',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MyAddNewUserClass()));
        },
        child: Icon(Icons.add),
      ),
      body: myHiveData.isEmpty
          ? Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text("No Data Stored"),),
      )
          : ListView.builder(
              itemCount: myHiveData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 10,
                    child: Icon(Icons.person),
                  ),
                  title: Text(myHiveData[index]['name']),
                  subtitle: Text(myHiveData[index]['email']),
                  trailing: Column(
                    children: [
                      Icon(Icons.delete),
                      Icon(Icons.edit),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
