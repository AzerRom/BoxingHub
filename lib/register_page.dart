import 'package:flutter/material.dart';
import './login_page.dart'; // Navigation

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register / Registrieren'),
      ),
      body: SingleChildScrollView(
        // Scrollbarer Inhalt, währnd die Tastatut öffnet
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // minimaler Platz für die Spalte nutzen
          children: <Widget>[
            Text(
              'Register / Registrieren',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name / Vorname'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name / Nachname'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _birthdateController,
              decoration:
                  InputDecoration(labelText: 'Birthdate / Geburtsdatum'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: 'Username/Email / Benutzername/E-Mail'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password / Passwort',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                errorText: _passwordError,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password / Passwort bestätigen',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                errorText: _confirmPasswordError,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_passwordController.text ==
                      _confirmPasswordController.text) {
                    _passwordError = null;
                    _confirmPasswordError = null;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    print(
                        'Registration complete / Registrierung abgeschlossen');
                  } else {
                    _passwordError =
                        'Passwords do not match / Passwörter stimmen nicht überein';
                    _confirmPasswordError =
                        'Passwords do not match / Passwörter stimmen nicht überein';
                  }
                });
              },
              child: Text('Register / Registrieren'),
            ),
            SizedBox(height: 20), // Platzhalter zwischen Widgets
          ],
        ),
      ),
    );
  }
}
