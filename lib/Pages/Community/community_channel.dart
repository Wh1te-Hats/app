import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Community extends StatefulWidget {
  Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  // List<Map<String, dynamic>> _menuItem = [];
  @override
  void initState() {
    super.initState();
    // Fetch data from the API when the widget is initialized
    // fetchData();
  }

  // Future<void> fetchData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var storedUserId = prefs.getString('user_id');
  //   // var storedName = prefs.getString('name');
  //   // var storedGrade = prefs.getString('grade');

  //   final user_id = storedUserId;
  //   final apiUrl = 'https://b980-122-172-81-249.ngrok-free.app/community/user/$user_id';

  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);

  //       setState(() {
  //         _menuItem = data.map((item) => {
  //           'title': item['title'],
  //           'member': item['member'].toString(),
  //         }).toList();
  //       });
  //     } else {
  //       // Handle error
  //       print('Failed to load data. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle error
  //     print('Error fetching data: $error');
  //   }
  // }

  final List<Map<String, dynamic>> _menuItem = [
    {
      "title": "Cyber Security",
      "member": "24",
    },
    {
      "title": "Devops",
      "member": "10",
    },
    {
      "title": "Consultancy",
      "member": "30",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.primaryColor,
      appBar: AppBar(
        title: const Text("Community"),
        backgroundColor: MyApp.secondary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _menuItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      side: const BorderSide(width: 0.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      _menuItem[index]['title'].toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "${_menuItem[index]['member'].toString()} Memebrs",
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Adjust the left padding as needed
                      child: CircleAvatar(
                        backgroundColor: Color(0xffc1feaf),
                        child: Icon(
                          Icons.people,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.5),
                    onTap: () {
                      context.push('/communityChat',
                          extra: _menuItem[index]['title']);
                    },
                    tileColor: MyApp.primaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
