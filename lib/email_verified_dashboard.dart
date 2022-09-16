import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/features/auth/auth_service.dart';
import 'package:flutter/material.dart';

class EmailVerifiedDashboard extends StatelessWidget {
  const EmailVerifiedDashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user!.photoURL != null)
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            if (user.photoURL == null)
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(''),
              ),
            const SizedBox(
              height: 20,
            ),
            Text('Name: ${user.displayName}'),
            const SizedBox(
              height: 20,
            ),
            Text('Email: ${user.email}'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}