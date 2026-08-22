import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InteractivityWidget extends StatelessWidget {
  const InteractivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intercativity Widget')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print('On Pressed');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                shadowColor: WidgetStatePropertyAll(Colors.blueAccent),
              ),
              child: Text('Click me'),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                'click',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 2,
                  color: Colors.blue,
                ),
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, color: Colors.red),
            ),

            CupertinoButton(
              onPressed: () {},
              color: Colors.blue,
              foregroundColor: Colors.white,
              child: Text('click'),
            ),

            GestureDetector(
              onTap: () {
                print('On Tapped');
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.yellow, Colors.blue],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text('Button'),
              ),
            ),

            ListTile(
              onTap: () {
                print('Go to Profile');
              },
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
