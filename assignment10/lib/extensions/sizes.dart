import 'package:flutter/material.dart';

extension Sizes on BuildContext{


double getWidth(){

  return MediaQuery.sizeOf(this).width;

}

double getHeight(){

  return MediaQuery.sizeOf(this).height;

}



}