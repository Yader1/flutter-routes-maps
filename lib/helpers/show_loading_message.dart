import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {
  if(Platform.isAndroid){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        title: Text('Por favor espere'),
        content: CircularProgressIndicator(
          strokeWidth: 3,
          color: Colors.black
        )
      )
    );
    return;
  } else {
    showCupertinoDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => const CupertinoAlertDialog(
        title: Text('Por favor espere'),
        content: CupertinoActivityIndicator()
      )
    );
    return;
  }
}