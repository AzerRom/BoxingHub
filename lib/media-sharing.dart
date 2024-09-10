import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meine App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MediaPage(), // Startseite
    );
  }
}

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  List<String> _mediaFiles =
      []; // Liste zur Speicherung von hochgeladenen Medien (Bilder/Videos)

  // Methode zum Hochladen eines Bildes oder Videos
  Future<void> _pickMedia() async {
    // Hier Codes hinzufügen, um DAteien hochzuladen

    setState(() {
      _mediaFiles
          .add('path/to/your/media/file'); // Beispielpfad eines Medienuploads
    });
  }

  void _navigateTo(String page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (page) {
            case 'Calendar':
              return CalendarPage();
            case 'Messages':
              return MessagesPage();
            case 'Trainings':
              return TrainingsPage();
            case 'History':
              return HistoryPage();
            case 'Auctions':
              return AuctionsPage();
            case 'Push Notifications':
              return PushNotificationsPage();
            case 'Reminders':
              return RemindersPage();
            default:
              return MediaPage(); // Zurück zur aktuellen Seite, wenn nicht gefunden
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media-sharing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _mediaFiles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.insert_photo),
                    title: Text('Medien ${index + 1}'),
                    subtitle: Text(_mediaFiles[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              onPressed: _pickMedia,
              backgroundColor: Colors.blue,
              child: Icon(Icons.cloud_upload),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 16,
            child: DropdownButton<String>(
              icon: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.menu),
                backgroundColor: Colors.blue,
              ),
              items: <String>[
                'Calendar',
                'Messages',
                'Trainings',
                'History',
                'Auctions',
                'Push Notifications',
                'Reminders',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _navigateTo(newValue);
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// Kalender-Seite
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(child: Text('Calendar Page')),
    );
  }
}

// Nachrichten-Seite
class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Center(child: Text('Messages Page')),
    );
  }
}

// Trainings-Seite mit standortbasierter Suche
class TrainingsPage extends StatefulWidget {
  @override
  _TrainingsPageState createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  String? _selectedLocation; // Standortauswahl
  String? _selectedTrainer; // Trainerauswahl
  String? _postalCode; // Postleitzahl

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Wähle einen Trainingsstandort:'),
            DropdownButton<String>(
              hint: Text('Standort auswählen'),
              value: _selectedLocation,
              items: <String>['Standort 1', 'Standort 2', 'Standort 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Wähle einen Trainer:'),
            DropdownButton<String>(
              hint: Text('Trainer auswählen'),
              value: _selectedTrainer,
              items: <String>['Trainer A', 'Trainer B', 'Trainer C']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTrainer = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Postleitzahl',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _postalCode = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Filterlogik
                print(
                    'Standort: $_selectedLocation, Trainer: $_selectedTrainer, Postleitzahl: $_postalCode');
              },
              child: Text('Suche starten'),
            ),
          ],
        ),
      ),
    );
  }
}

// Historie-Seite mit Bewertungsfunktion
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  double _trainingRating = 0.0; // Bewertungsskala

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Vergangene Trainings'),
            // Hier könnte eine Liste vergangener Trainings angezeigt werden
            ListTile(
              title: Text('Training 1'),
              subtitle: Text('Standort 1, Trainer A'),
              trailing: ElevatedButton(
                onPressed: () {
                  _showRatingDialog(context);
                },
                child: Text('Bewerten'),
              ),
            ),
            ListTile(
              title: Text('Training 2'),
              subtitle: Text('Standort 2, Trainer B'),
              trailing: ElevatedButton(
                onPressed: () {
                  _showRatingDialog(context);
                },
                child: Text('Bewerten'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Training bewerten'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bewerte dein Training:'),
              Slider(
                value: _trainingRating,
                min: 0,
                max: 5,
                divisions: 5,
                label: _trainingRating.toString(),
                onChanged: (double value) {
                  setState(() {
                    _trainingRating = value;
                  });
                },
              ),
              Text('Deine Bewertung: $_trainingRating'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Abbrechen'),
            ),
            TextButton(
              onPressed: () {
                // Logik zum Speichern der Bewertung
                Navigator.of(context).pop();
              },
              child: Text('Speichern'),
            ),
          ],
        );
      },
    );
  }
}

// Auktionen-Seite mit der Möglichkeit, eine Auktion zu erstellen
class AuctionsPage extends StatefulWidget {
  @override
  _AuctionsPageState createState() => _AuctionsPageState();
}

class _AuctionsPageState extends State<AuctionsPage> {
  List<Map<String, String>> _auctions = [];

  void _startAuction() {
    showDialog(
      context: context,
      builder: (context) {
        String? location;
        String? trainingType;
        int? quantity;

        return AlertDialog(
          title: Text('Auktion starten'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ort',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  location = value;
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Trainingsart',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  trainingType = value;
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Anzahl',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Abbrechen'),
            ),
            TextButton(
              onPressed: () {
                if (location != null &&
                    trainingType != null &&
                    quantity != null) {
                  setState(() {
                    _auctions.add({
                      'Ort': location!,
                      'Trainingsart': trainingType!,
                      'Anzahl': quantity.toString(),
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Auktion starten'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auctions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _startAuction,
              child: Text('Auktion starten'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _auctions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${_auctions[index]['Trainingsart']} in ${_auctions[index]['Ort']}'),
                    subtitle: Text('Anzahl: ${_auctions[index]['Anzahl']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Push Notifications-Seite
class PushNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: Center(child: Text('Push Notifications Page')),
    );
  }
}

// Erinnerungen-Seite
class RemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Center(child: Text('Reminders Page')),
    );
  }
}
