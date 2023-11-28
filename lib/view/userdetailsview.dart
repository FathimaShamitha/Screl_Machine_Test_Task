import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/utils/constants/themes/mycolor.dart';

import '../model/usermodel.dart';

class UserDetailsViewClass extends StatelessWidget {
  final User user;

  UserDetailsViewClass({required this.user});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    DateTime createdAt = user.createdAt;

    String timeDate = DateFormat('dd-MM -- H:mm:ss').format(createdAt);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserDetails',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Container(
              height: ht / 7,
              width: wt,
              child: CircleAvatar(
                backgroundColor: MyAppColor.primaryColor,
                child: Icon(
                  Icons.person,
                  color: MyAppColor.iconColor,
                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            child: Text(' Name : ${user.name}'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            child: Text(' Email : ${user.email}'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
