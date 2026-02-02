import 'package:challenge_channels/services/notification_service.dart';
import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/core/db/db_helper.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:challenge_channels/src/shareds/widgets/drawer_app.dart';
import 'package:challenge_channels/src/shareds/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.appBarGeneral(
        context: context,
        isDrawer: true,
        actions: [InkWell(onTap: (){
          logDev.i("POSTS DB  >>> ${DBHelper.getPostsCount()}");
          final notificationService = NotificationService();

          notificationService.show(
            title: 'Nuevo comentario',
            body: 'Tienes un nuevo comentario en tu post',
            payload: 'postId=12',
          );
        }, child: Icon(Icons.eighteen_mp))],
      ),
      drawer: DrawerApp(),
      body: SafeArea(child: child),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
