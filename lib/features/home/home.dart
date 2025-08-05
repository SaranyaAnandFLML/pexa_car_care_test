import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexa_carcare_test/theame/palette.dart';
import '../../core/common/variables.dart';
import '../task/counter.dart';
import '../task/country_list.dart';
import '../task/post_list/screen/post_list.dart';
import '../task/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map<String, dynamic>> taskList = [
    {
      "name": "Counter Application",
      "message": "State management using setState and basic Flutter UI design",
      "widget":const CounterScreen()
    },
    {
      "name": "Country List with Search Functionality",
      "message": "State management, TextEditingController, and efficient list filtering",
      "widget":const CountryList()
    },
    {
      "name": "REST API Integration",
      "message": "Networking, async programming, and UI design",
      "widget":const PostList()
    },
    {
      "name": "Multi-Screen App with Navigation",
      "message": " Navigation and multi-screen app development",
      "widget":ProfileScreen()
    },
    {
      "name": "Dark Mode",
      "message": "Theme customization and state management",
      "widget":''
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Task Box',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.black),
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
                child: Icon(Icons.person,)),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(w*0.06, w*0.03, w*0.06, w*0.06),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    final task = taskList[index];
                    return InkWell(
                      onTap: (){
                        if(task['name']!='Dark Mode'){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>task['widget']));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: w*0.07,
                              backgroundColor: const Color(0xFFEADDFE),
                              child: Text(
                                (index+1).toString(),
                                style:  TextStyle(fontSize: 24,
                                color: Pallete.purple),
                              ),
                            ),
                            const SizedBox(width: 15),
                            // Name and message
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(task["name"],
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            task["name"]=='Dark Mode'?
                                            Expanded(
                                              child: Consumer(
                                                builder: (context, ref, _) {
                                                  final selected = ref.watch(darkModeProvider);
                                                  return SwitchListTile(
                                                    value: selected,
                                                    onChanged: (val) {
                                                      ref.read(darkModeProvider.notifier).state = val;
                                                    },
                                                  );
                                                },
                                              ),
                                            ):Container()
                                            
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(task["message"],
                                      style:  TextStyle(fontSize: w*0.03, color: Pallete.greyColor)),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
