import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мои заметки',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: NoteListPage(),
    );
  }
}

class NoteListPage extends StatefulWidget {
  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<String> _notes1 = [];
  TextEditingController _noteController1 = TextEditingController();
  List<String> _notes2 = [];
  TextEditingController _noteController2 = TextEditingController();
  List<String> _notes3 = [];
  TextEditingController _noteController3 = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes1 = prefs.getStringList('notes') ?? [];
      _notes2 = prefs.getStringList('notes') ?? [];
      _notes3 = prefs.getStringList('notes') ?? [];
    });
  }

  Future<void> _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', _notes1);
    await prefs.setStringList('notes2', _notes2);
    await prefs.setStringList('notes3', _notes3);
  }

  void _addNote() {
    String text = _noteController1.text.trim();
    String text2 = _noteController2.text.trim();
    String text3 = _noteController3.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _notes1.add(text);
        _notes2.add(text2);
        _notes3.add(text3);
        _noteController1.clear();
        _noteController2.clear();
        _noteController3.clear();
      });
      _saveNotes();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 


        Center(
          child: Row(
          children: [
            Center(
              child: 
              Column( 
                children: [

          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),

            child: Column(
            children: [

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Заметки',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 16),
                child: TextField(
                  controller: _noteController1,
                  decoration: InputDecoration(
                    hintText: '1',
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),

              SizedBox(height: 20),

          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),

            child: Column(
            children: [

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Заметки',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),



              SizedBox(height: 10),

              Expanded(
                child: _notes1.isEmpty
                    ? Center(child: Text('Заметок пока нет'))
                    : ListView.builder(
                        itemCount: _notes1.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(_notes1[index]),
                            ),
                          );
                        },
                      ),
              ),

          ],
        ),
      ),
],
),
),

              SizedBox(width: 10),


              Center(
                child: 
              Column( 
                children: [

                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),

              child: Column(
                children: [

                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                  Text(
                    'Заметки',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 16),
                child: TextField(
                  controller: _noteController2,
                  decoration: InputDecoration(
                    hintText: '2',
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),

              SizedBox(height: 20),

          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),

            child: Column(
            children: [

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Заметки',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),



              SizedBox(height: 10),

              Expanded(
                child: _notes2.isEmpty
                    ? Center(child: Text('Заметок пока нет'))
                    : ListView.builder(
                        itemCount: _notes2.length,
                        itemBuilder: (context2, index) {
                          return Card(
                            child: ListTile(
                              title: Text(_notes2[index]),
                            ),
                          );
                        },
                      ),
              ),

          ],
        ),
      ),
],
),
),


             SizedBox(width: 10),



              Center(
                child: 
              Column( 
                children: [

                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),

              child: Column(
                children: [

                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                  Text(
                    'Заметки',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 16),
                child: TextField(
                  controller: _noteController3,
                  decoration: InputDecoration(
                    hintText: '3',
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),

              SizedBox(height: 20),

          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),

            child: Column(
            children: [

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Заметки',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),



              SizedBox(height: 10),

              Expanded(
                child: _notes3.isEmpty
                    ? Center(child: Text('Заметок пока нет'))
                    : ListView.builder(
                        itemCount: _notes3.length,
                        itemBuilder: (context3, index) {
                          return Card(
                            child: ListTile(
                              title: Text(_notes3[index]),
                            ),
                          );
                        },
                      ),
              ),

          ],
        ),
      ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 16),
                child: ElevatedButton(
                onPressed: _addNote,
                  child: Text('Add'),
                ),
              ),

],
),
),        




          ],
),
        ),
        ),
);
}
}