import 'package:challenge_channels/src/core/utils/global_vars.dart';
import 'package:challenge_channels/src/core/utils/responsive.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_text.dart';

class DrawerApp extends ConsumerStatefulWidget {
  const DrawerApp({super.key});

  @override
  ConsumerState<DrawerApp> createState() => DrawerAppState();
}

class DrawerAppState extends ConsumerState<DrawerApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final customText = CustomText(context);
    return Drawer(
      width: responsive.width * 0.6,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 0.2),
        borderRadius: BorderRadius.only(topRight: Radius.circular(1), bottomRight: Radius.circular(1)),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: responsive.height * 0.18,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: responsive.hp(2),
              children: [
                CustomWidgets.imageAvatar(size: responsive.dp(6), image: '${Globalvars.pathImages}dash.png'),
                Row(
                  spacing: responsive.wp(2),
                  children: [
                    Expanded(
                      child: customText.autoSizeText(
                        "PRUEBAS USER",
                        lines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: responsive.height * 0.82,
            margin: EdgeInsets.only(top: responsive.height * 0.18),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1.0, spreadRadius: 0.0, offset: Offset(0.0, -1.0))],
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline, color: Colors.grey, size: 20),
                  title: customText.autoSizeText('Acerca de'),
                  onTap: () {
                    Navigator.pop(context);
                    //context.push(routeAboutUs);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.close_sharp, color: Colors.grey, size: 20),
                  title: customText.autoSizeText('Cerrar Sesión'),
                  onTap: () async {
                    /*final confirm = await CustomDialogs.confirm(
                      context,
                      title: 'Cerrar sesión',
                      message: 'Esta seguro de cerrar sesión en este dispositivo?',
                    );
                    if (!confirm) {
                      if (context.mounted) Navigator.pop(context);
                      return;
                    }*/
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
