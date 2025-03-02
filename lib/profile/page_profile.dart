import 'package:flutter/material.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  String ngaySinh = "14/02/2004";
  String? gioiTinh = "Nam";
  List<String> nnlts = [
    "Tieng viet",
    "Java",
    "C#",
    "C/C++",
    "Javascript",
    "Python"
  ];
  String? nnlt = "Tieng viet";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(index),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Trần Anh Khoa"),
              accountEmail: Text("Khoa@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "AK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundImage: AssetImage("assets/images/anhhoanghon.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("Inbox"),
              trailing: Text("10"),
            ),
            ListTile(
              leading: Icon(Icons.sms),
              title: Text("SMS"),
              trailing: Text("10"),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  index = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text("Draft"),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Sent"),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete"),
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sms,
                color: Colors.orange,
              ),
              label: "SMS"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
                color: Colors.green,
              ),
              label: "Phone")
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: Image.asset("assets/images/anhhoanghon.png"),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Họ và tên: ",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trần Anh Khoa",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Ngày sinh: ",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        ngaySinh,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          var selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2040));

                          if (selectedDate != null) {
                            ngaySinh =
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                          }

                          setState(() {});
                        },
                        icon: Icon(Icons.calendar_month)),
                    SizedBox(
                      width: 30,
                    )
                  ],
                )),
            SizedBox(height: 10),
            Text(
              "Giới tính: ",
              style: TextStyle(fontSize: 24),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(
                      "Nam",
                      style: TextStyle(fontSize: 24),
                    ),
                    value: "Nam", // Gia tri co dinh
                    groupValue:
                        gioiTinh, // Thay doi khi groupValue == value => radio btn checked
                    onChanged: (value) {
                      setState(() {
                        gioiTinh = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Nữ", style: TextStyle(fontSize: 24)),
                    value: "Nữ", // Gia tri co dinh
                    groupValue:
                        gioiTinh, // Thay doi khi groupValue == value => radio btn checked
                    onChanged: (value) {
                      setState(() {
                        gioiTinh = value;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Sở thích: ",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Xem phim, nghe nhạc, đọc sách, chơi game, ...",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                  )),
            ),
            SizedBox(height: 10),
            Text(
              "Ngôn ngữ lập trình giỏi nhất của bạn: ",
              style: TextStyle(fontSize: 24),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value:
                  nnlt, // Gia tri thay doi, khi bang voi gia tri cua item ben trong thi item selected
              items: nnlts
                  .map(
                    (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Row(
                          children: [
                            Icon(
                              Icons.abc,
                              size: 40,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 30),
                            Text(
                              e,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        )),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  nnlt = value;
                });
              },
            )
          ])),
    );
  }

  Widget _buildSMS() {
    return Center(
      child: Text(
        "SMS",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildPhone() {
    return Center(
      child: Text(
        "Phone",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHome();
      case 1:
        return _buildSMS();
      case 2:
        return _buildPhone();
      default:
        return _buildHome();
    }
  }
}
