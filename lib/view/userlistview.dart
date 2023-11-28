import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/utils/constants/themes/mycolor.dart';
import 'package:untitled/view/userdetailsview.dart';

import '../model/usermodel.dart';
import '../viewmodel/userdatamanger.dart';
import 'adduserview.dart';

class UserListViewClass extends StatelessWidget {
  const UserListViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    final TextEditingController searchController = TextEditingController();

    final userController = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserList View'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUserClass()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SizedBox(
        height: ht,
        child:
            Consumer<UserViewModel>(builder: (context, userController, child) {
          List<User> user = userController.user;
          return user.isEmpty
              ? Center(
                  child: Text('No Users Added'),
                )
              : ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetailsViewClass(
                                        user: user[index],
                                      )));
                        },
                        leading: CircleAvatar(
                          backgroundColor: MyAppColor.primaryColor,
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            color: MyAppColor.iconColor,
                          ),
                        ),
                        title: Text(user[index].name),
                        subtitle: Text(user[index].email),
                        trailing: InkWell(
                          onTap: () {
                            userController.deleteUser(user[index]);
                          },
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    );
                  });
        }),
      ),
    );
  }
}
