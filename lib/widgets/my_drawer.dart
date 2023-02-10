import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.pink.shade400,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Partho Debnath',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text('partho@gmail.com'),
            currentAccountPicture: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Profile Pic'),
              ),
            ),
          ),
          ListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            leading: Text('Leading'),
            dense: true,
            trailing: Text('Trailing'),
          ),
          Divider(
            indent: 30,
            endIndent: 30,
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            leading: Text('Leading'),
            dense: true,
            trailing: Text('Trailing'),
          ),
          Divider(
            indent: 30,
            endIndent: 30,
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            leading: Text('Leading'),
            dense: true,
            trailing: Text('Trailing'),
          ),
          Divider(
            indent: 30,
            endIndent: 30,
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
