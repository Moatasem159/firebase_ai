import 'package:camera/camera.dart';
import 'package:fire_base_ai/face_detactor.dart';
import 'package:fire_base_ai/text_recognition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
List<CameraDescription> cameras=[];

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Column(
        children: [
        Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          tileColor: Theme.of(context).primaryColor,
          title: const Text(
            "text recognition",
          ),
          onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const TextRecognizerScreen()));
          },
        )),
        Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          tileColor: Theme.of(context).primaryColor,
          title: const Text(
            "face recognition",
          ),
          onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const FaceDetectorScreen()));
          },
        ),),
        ],
      )
    );
  }
}
