import 'package:flutter/material.dart';
import 'package:ivallytask/controllers/navigation_layout_controller.dart';
import 'package:provider/provider.dart';

class BottomNavigationLayout extends StatelessWidget {
  const BottomNavigationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NavigationController>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90.0), // here the desired height
            child: AppBar(
              flexibleSpace: Image(
                height:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.height / 5
                        : MediaQuery.of(context).size.height / 12,
                image: const AssetImage('assets/images/logo_horizontal.png'),
                fit: BoxFit.contain,
              ),
              centerTitle: true,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.blue, size: 35),
              backgroundColor: Colors.white,
            ),
          ),
          drawer: const Drawer(),
          body: Column(
            children: [
              //SharedAppBar(),
              Expanded(
                child: provider.screens[provider.layoutIndex],
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              provider.changeLayoutIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: provider.layoutIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.amber,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
