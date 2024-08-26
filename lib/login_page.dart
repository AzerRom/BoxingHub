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
              decoration: InputDecoration(labelText: 'Benutzername'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Passwort'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Anmelde-Logik hier hinzufügen
                print('Anmeldung abgeschlossen');
                Navigator.pop(
                    context); // Zurück zur vorherigen Seite navigieren
              },
              child: Text('Anmelden'),
            ),
          ],
        ),
      ),
    );
  }
}
