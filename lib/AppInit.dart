import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kriptobakkal/screens/chartEx.dart';
import 'custom_icons/flutter_custom_icon.dart';
import 'screens/screens.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation_item.dart';

import 'constants/color_constant.dart';

class AppInit extends StatefulWidget {
  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {

  final _pageController = PageController();

  List _pages = [
     HomeScreen(),
     WalletScreen(),
     MoneyTransferScreen(),
     CryptoPay(),
  ];

  var items = [
    // BottomNavItem(title: 'Home', iconData: Icons.home),
    NeosBottomNavigationItem(
      icon: Icon(Icons.home),
      title: "Home",
    ), NeosBottomNavigationItem(
      icon: Icon(Icons.account_balance_wallet),
      title: "Wallet",
    ),
    NeosBottomNavigationItem(

      icon: Icon(Icons.send_to_mobile),
      title: "Transfer",
    ),
    NeosBottomNavigationItem(
      icon: Icon(Icons.credit_card),
      title: "Crypto Pay",
    ),
  ];

  int cIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    cIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _drawerKey,
      appBar: _AppBar(context),
      drawer: _Drawer(),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context,i)=>_pages[i],
      ),
      bottomNavigationBar: NeosBottomNavigation(
          items: items,
          backgroundColor: kAccentColor,
          itemBackgroudnColor: kAccentColor,
          onTap: (index) {
            _pageController.animateToPage(index,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 600));
            // setState(() {
            //   cIndex = index;
            // });
          },
        ),
    );
  }

  //App Bar
  Widget _AppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      title: Text('Kriptobakkal', style: TextStyle(color: kAccentColor),),
      leading: IconButton(
        icon: Icon(
          MyFlutterApp.navigation_drawer,
          color: kBlackColor,
        ),
        onPressed: () {

          _drawerKey.currentState.openDrawer();
        },
        padding: EdgeInsets.only(left: 8),
      ),
    );
   }

   //Drawer
   Widget _Drawer() {

     var _list =  SimpleTimeSeriesChart.withSampleData();
     print(_list.animate);

     return Drawer(
       // Add a ListView to the drawer. This ensures the user can scroll
       // through the options in the drawer if there isn't enough vertical
       // space to fit everything.
       child: ListView(
         // Important: Remove any padding from the ListView.
         padding: EdgeInsets.zero,
         children: <Widget>[
           DrawerHeader(
             child: Text('Drawer Header'),
             decoration: BoxDecoration(
               color: Colors.blue,
             ),
           ),
           ListTile(
             title: Text('Graphs test'),
             onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => SimpleTimeSeriesChart(_list.seriesList), ), ),
           ),
           ListTile(
             title: Text('Item 2'),
             onTap: () {
               // Update the state of the app.
               // ...
             },
           ),
         ],
       ),
     );
   }
}



