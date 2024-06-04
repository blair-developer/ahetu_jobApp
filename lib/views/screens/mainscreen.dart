import 'package:ahetu/controllers/zoom_provider.dart';
import 'package:ahetu/views/common/drawer/drawerScreen.dart';
import 'package:ahetu/views/screens/applications/applied_jobs.dart';
import 'package:ahetu/views/screens/auth/profile_page.dart';
import 'package:ahetu/views/screens/bookmarks/BookMark_Page.dart';
import 'package:ahetu/views/screens/chat/chat_list.dart';
import 'package:ahetu/views/screens/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:ahetu/views/common/reusable_text.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ZoomNotifier>(
          builder: (context, ZoomNotifier, child){
            return ZoomDrawer(
              menuScreen: DrawerScreen(indexSetter: (index){
                ZoomNotifier.currentIndex = index;
              }),
              borderRadius: 30,
              menuBackgroundColor: Color(kLightBlue.value),
              angle: 0.0,
              slideWidth: 230,
              mainScreen: currentScreen()
               );
          }
          )
    );
  }

  Widget currentScreen(){
  var zoomNotifier = Provider.of<ZoomNotifier>(context);
  switch (zoomNotifier.currentIndex) {
    case 0:
     return HomePage();
    case 1:
     return ChatList();
    case 2:
     return BookMarksPage();  
    case 3:
     return AppliedJobs(); 
    case 4:
     return ProfilePage(drawer: true,);   
    default:
     return HomePage();
  }
}
}

