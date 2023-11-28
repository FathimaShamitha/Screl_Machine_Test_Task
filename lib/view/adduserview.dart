import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitled/model/usermodel.dart';

import '../viewmodel/userdatamanger.dart';

class AddUserClass extends StatelessWidget {
  const AddUserClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final userController = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 40, bottom: 10),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email';
                  }
                  if (!value.contains('@')) {
                    return 'Incorrect Mail Format';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  int n = userController.user.length + 1;
                  if (formKey.currentState!.validate()) {
                    final userData = User(
                        id: n.toString(),
                        name: nameController.text,
                        email: emailController.text,
                        createdAt: DateTime.now());
                    userController.addUser(userData);
                    nameController.clear();
                    emailController.clear();
                    Fluttertoast.showToast(msg: 'User added successfully');
                    Navigator.pop(context);
                  }
                },
                child: Text('Add User'))
          ],
        ),
      ),
    );
  }
}
