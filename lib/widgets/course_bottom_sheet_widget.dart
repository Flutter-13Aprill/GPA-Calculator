import 'package:flutter/material.dart';

// -BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/screens/home/bloc/gap_calculator_bloc.dart';

// -- Utilities (Extensions)
import 'package:gpa_calculator/utilities/screen/extensions/screen_size.dart';

/// [courseBottomSheetWidget] A bottom sheet widget for displaying course-related actions such as add or editing course details.
void courseBottomSheetWidget({required BuildContext context,required Widget child,required GapCalculatorBloc gapBloc,}) async{
  BlocProvider.value(
    value: gapBloc,
    child: await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: Container(
              height: context.getHeight(multiplied: 0.4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: child,
            ),
          ),
        );
      },
    ),
  );
}
