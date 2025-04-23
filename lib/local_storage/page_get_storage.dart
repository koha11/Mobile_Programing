import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PageGetStorage extends StatefulWidget {
  const PageGetStorage({super.key});

  @override
  State<PageGetStorage> createState() => _PageGetStorageState();
}

class _PageGetStorageState extends State<PageGetStorage> {
  int count = 0;
  late GetStorage box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Storage Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("$count"),
            ElevatedButton(
                onPressed: () async {
                  await box.write("counter", ++count);
                  box.read("counter");
                  setState(() {});
                },
                child: Text("Tăng"))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGetStorage();
  }

  Future<void> initGetStorage() async {
    await GetStorage.init();
    box = GetStorage();
    setState(() {
      count = box.read("counter");
    });
  }
}
