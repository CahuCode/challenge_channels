import 'package:challenge_channels/src/aplication/theme/colors_app.dart';
import 'package:challenge_channels/src/core/utils/global_vars.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomWidgets {
  /*  static void showToast(String msg, {int position = 0}) {
    EasyLoading.showToast(
      msg,
      toastPosition: (position == 0) ? EasyLoadingToastPosition.bottom : EasyLoadingToastPosition.top,
      maskType: EasyLoadingMaskType.none,
    );
  }

  static void showLoading(String msg) {
    EasyLoading.show(status: msg, maskType: EasyLoadingMaskType.custom);
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }*/

  static void showSnackBar(
    BuildContext context,
    String message, {
    String textHide = 'Cerrar',
    double borderRadius = 0,
    bool btnHide = false,
    VoidCallback? callback,
    int timeHideSecons = 2,
    int? timeHideMins,
    Color textColor = ColorsApp.white,
    Color backColor = Colors.black54,
  }) {
    final customText = CustomText(context);
    final snackBar = SnackBar(
      backgroundColor: backColor,
      behavior: SnackBarBehavior.floating,
      duration: timeHideMins != null ? Duration(minutes: timeHideMins) : Duration(seconds: timeHideSecons),
      width: double.infinity,
      dismissDirection: DismissDirection.down,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      elevation: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      content: customText.autoSizeText(message, textColor: textColor),
      action: btnHide
          ? SnackBarAction(
              textColor: textColor,
              label: textHide,
              onPressed: () {
                if (callback != null) callback();
              },
            )
          : null,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static InkWell imageAvatar({
    String? image,
    IconData icon = Icons.info_outline,
    double borderRadius = 80,
    double size = 50,
    VoidCallback? callback,
  }) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (callback != null) callback();
      },
      child: SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          radius: borderRadius,
          child: image != null
              ? ClipOval(
                  child: FadeInImage(
                    color: Colors.transparent,
                    image: NetworkImage(image),
                    placeholder: AssetImage('${Globalvars.pathImages}dash.png'),
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) => Image.asset('${Globalvars.pathImages}dash.png'),
                  ),
                )
              : Icon(icon),
        ),
      ),
    );
  }

  static AppBar appBarGeneral({
    required BuildContext context,
    String title = '',
    Widget? widgetTitle,
    Widget? widgetLeading,
    double elevation = 0.0,
    bool centerTitle = true,
    VoidCallback? callBack,
    IconData icono = Icons.arrow_back_ios,
    bool isBold = true,
    bool isDrawer = false,
    double heigthAppBar = kToolbarHeight,
    List<Widget>? actions,
    PreferredSizeWidget? menuBottom,
    double porcentTitle = 1.9,
  }) {
    CustomText customText = CustomText(context);
    return AppBar(
      title: widgetTitle ?? customText.appbarTitle(title, isBold: isBold, porcent: porcentTitle),
      centerTitle: centerTitle,
      elevation: elevation,
      actions: actions,
      bottom: menuBottom,
      toolbarHeight: heigthAppBar,
      leading: isDrawer
          ? null
          : widgetLeading ??
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    (callBack != null) ? callBack() : Navigator.pop(context);
                  },
                  child: Icon(icono, color: Theme.of(context).colorScheme.secondary),
                ),
    );
  }

  static ListTile customPost(PostEntity post, {VoidCallback? callback, VoidCallback? callbackFavorite}) {
    return ListTile(
      title: Text(post.title),
      //subtitle: Text(post.body),
      trailing: IconButton(
        color: post.isFavorite ? ColorsApp.redBtn : ColorsApp.greyInactive,
        icon: Icon(post.isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          if (callbackFavorite != null) callbackFavorite();
        },
        /*onPressed: () {
          ref.read(toggleFavoriteProvider(post.id));
        },*/
      ),
      onTap: () {
        if (callback != null) callback();
        //ref.read(syncCommentsProvider(post.id));
      },
    );
  }
}
