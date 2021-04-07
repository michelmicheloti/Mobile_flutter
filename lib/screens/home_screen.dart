import 'package:agenda/components/home_drawer.dart';
import 'package:agenda/components/pages_item.dart';
import 'package:agenda/data/icons_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      drawer: HomeDrawer(),
      body: Center(
        child: GridView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: ICONS_DATA.map((item) {
            return PageItem(item);
          }).toList(),
        ),
      ),
    );
  }
}
