import 'package:anhkhoa_flutter_app/commercial_app/app_fruit_store.dart';
import 'package:anhkhoa_flutter_app/getx/getx_simple_state_management.dart';
import 'package:anhkhoa_flutter_app/layout/grid_view_example.dart';
import 'package:anhkhoa_flutter_app/layout/list_view_example.dart';
import 'package:anhkhoa_flutter_app/page_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // runApp(const GetXApp());
  // runApp(const AppFruitStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageHome(),
      debugShowCheckedModeBanner: false,
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
  String message = "Hello";
  String avatar =
      "https://img.lovepik.com/free-png/20211231/lovepik-cartoon-dog-image-png-image_401083245_wh860.png";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNgaySinh = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App của tui"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Container(width: 400, height: 300, child: Image.network(avatar)),
            const Text(
              "Hello!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  backgroundColor: Colors.amber),
            ),
            Text("Hello ${txtName.text} sinh ngay ${txtNgaySinh.text} !"),
            TextField(
              controller: txtName,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: txtNgaySinh,
              decoration: InputDecoration(
                  labelText: "Ngay Sinh", hintText: "Nhap ngay sinh vao day"),
              keyboardType: TextInputType.datetime,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (message == "Hello") {
                      message = "Chào";
                    } else {
                      message = "Hello";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Chao ${txtName.text} !!!"),
                      duration: Duration(seconds: 3),
                    ));
                  });
                },
                child: Text(message)),
          ],
        ),
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtName.text = "Anh Khoa";
    txtNgaySinh.text = "01/01/2001";
  }
}
