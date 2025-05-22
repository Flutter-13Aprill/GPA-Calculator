import 'package:flutter/material.dart';


class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.dismissibleKey,
    this.onDismissed = _defaultOnDismissed,
    this.leftContainerColor,
    this.leftContainerIcon,
    this.leftContainerIconColor,
    this.rightContainerColor,
    this.rightContainerIcon,
    this.rightContainerIconColor,
    this.title,
    this.subtitle,
    this.trailing, this.confirmDismiss,
  });

  final Key dismissibleKey;
  final DismissDirectionCallback onDismissed;

  final Color? leftContainerColor;
  final IconData? leftContainerIcon;
  final Color? leftContainerIconColor;

  final Color? rightContainerColor;
  final IconData? rightContainerIcon;
  final Color? rightContainerIconColor;
final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  static void _defaultOnDismissed(DismissDirection direction) {}
  @override
  Widget build(BuildContext context) {
    
    return Card(
                          child: Dismissible(
                      key:dismissibleKey,
                      direction: DismissDirection.horizontal,
                      confirmDismiss: confirmDismiss,  
                      onDismissed: onDismissed,

                        background:Container(
                        color:leftContainerColor,
                       alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Icon(leftContainerIcon, color:leftContainerIconColor)),secondaryBackground: 
    Container(
                        color: rightContainerColor,
                       alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Icon(rightContainerIcon, color: rightContainerIconColor),
  ) , child: ListTile(
                            title: title,
                            subtitle: subtitle,
                            trailing: trailing,
                          ),)
                        );
  }
}



