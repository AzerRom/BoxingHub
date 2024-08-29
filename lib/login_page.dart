import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anmelden'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Anmelden',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Username/Email / Benutzername/E-Mail'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password / Passwort'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Anmeldung abgeschlossen');
                Navigator.pop(
                    context); // Hier soll die Verlinkung zur Dashboard hergestellt werden!
              },
              child: Text('Anmelden'),
            ),
          ],
        ),
      ),
    );
  }
}
