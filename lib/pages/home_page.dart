import 'package:flutter/material.dart';
import 'package:hotels_ui/pages/homework_page.dart';
import 'package:hotels_ui/pages/hotel_ui_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 200,
              child: MaterialButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(HotelUiPage.id);
                },
                child: Text("Hotel UI"),
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 200,
              child: MaterialButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(HomeworkPage.id);
                },
                child: Text("Homework UI"),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
