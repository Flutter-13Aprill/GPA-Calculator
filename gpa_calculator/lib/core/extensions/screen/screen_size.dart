import 'package:flutter/material.dart';

extension ScreenSize on BuildContext{
    
    double getWidth({double per =10.00}){
    return (((MediaQuery.sizeOf(this).width)/10) * per);
    }
    double getHeight({double per =10.00}){
    return (((MediaQuery.sizeOf(this).height)/10) *per);
    }
    double getShortest({double per =10.00}){
    return (((MediaQuery.sizeOf(this).shortestSide)/10) *per);
    }
    
    double getSafeHeight(){
    return AppBar().preferredSize.height;
    }
    double getKeyboardHeight(){
    return MediaQuery.of(this).viewInsets.bottom;
    }
    double getbottomPadding(){
        return MediaQuery.of(this).padding.bottom;
    }
}

