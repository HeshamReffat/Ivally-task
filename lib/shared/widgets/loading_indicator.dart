import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Loading Indicator Widget usable in all screen for handling server delay time until data is loaded

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.grey[400]!.withOpacity(.5),
            borderRadius: BorderRadius.circular(20)
        ),
        child: const CupertinoActivityIndicator(),
      );
    }else{
      return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.grey[400]!.withOpacity(.5),
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.green,
          ),
        ),
      );
    }
  }
}
