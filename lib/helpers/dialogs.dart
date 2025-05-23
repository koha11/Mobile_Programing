import 'package:flutter/material.dart';

Future<String?> showConfirmDialog(
    BuildContext context, String dispMessage) async {
  AlertDialog dialog = AlertDialog(
    title: const Text("Xác nhận"),
    content: Text(dispMessage),
    actions: [
      ElevatedButton(
        onPressed: () =>
            Navigator.of(context, rootNavigator: true).pop("cancel"),
        child: const Text("Hủy"),
      ),
      ElevatedButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop("ok"),
        child: const Text("OK"),
      ),
    ],
  );
  String? res = await showDialog<String?>(
    barrierDismissible: false, // Phải bấm váo nút hủy hoặc OK
    context: context,
    builder: (context) => dialog,
  );
  return res;
}

void showSnackBar(BuildContext context, {required String msg, int second = 3}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    duration: Duration(seconds: second),
  ));
}
