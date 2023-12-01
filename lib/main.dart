import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const Lab1Screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("201091"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lab 1',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class Lab1Screen extends StatefulWidget {
  const Lab1Screen({super.key});

  @override
  State<Lab1Screen> createState() => _Lab1ScreenState();
}

class _Lab1ScreenState extends State<Lab1Screen> {
  List<String> _predmeti = [];

  void addPredmet()
  {
  showDialog(context: context, builder: (BuildContext context){
    String newPredmet="";
    return AlertDialog(
      title: Text("Dodadi nov predmet"),
      content: TextField(
        onChanged: (value){
          newPredmet=value;
        },
      ),
      actions: [
        ElevatedButton(onPressed: (){
          setState(() {
            if(newPredmet.isNotEmpty)
              {
                _predmeti.add(newPredmet);
              }
            Navigator.pop(context);
          });
        }, child: const Text("Dodadi"))
      ],
    );
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("201091"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Color.fromRGBO(8, 76, 158, 0.7),

      child: ListView.builder(
          itemCount: _predmeti.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  _predmeti[index],
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_rounded),
                  onPressed: () {
                    setState(() {
                      _predmeti.removeAt(index);
                    });
                  },
                ),
              ),
            );
          })
      ),
      floatingActionButton: FloatingActionButton( onPressed: addPredmet,
      backgroundColor: Colors.amber,
      child: Icon(Icons.add_box_rounded),),
    );
  }
}
