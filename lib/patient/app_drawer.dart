// lib/patient/app_drawer.dart

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'DiabetoX Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Data Entry'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/data_entry');
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Exercises'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/exercises');
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Challenges'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/challenges');
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Nutrition'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/nutrition');
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.red),
            title: const Text('Emergency Call', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/emergency_call');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bluetooth),
            title: const Text('Connect Glucometer'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/connect_device');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to profile screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/patient/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Add logout logic and navigate to login screen
            },
          ),
        ],
      ),
    );
  }
}// TODO Implement this library.