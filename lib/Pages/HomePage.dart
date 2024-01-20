
import 'package:android_app_project_bookhub/widgets/HomePage/Timeline.dart';

import 'package:android_app_project_bookhub/widgets/HomePage/searchWidget.dart';

import 'package:flutter/material.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/NavBar.dart';
import '../widgets/HomePage/PostLinkWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffe4e5e7),
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            "The wall",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xfff10d76),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Icon(
                  Icons.post_add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Scaffold(
              backgroundColor: Color(0xffe4e5e7),
              body: Container(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Search(),
                    ),
                    Center(
                      child: PostLinkWiget(),
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Color(0xffe4e5e7),
              body: Timeline(),
            ),
          ],
        ),
      ),
    );
  }

  signUserIn() {
    // Your sign-in logic here
  }
}
