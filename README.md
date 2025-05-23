# 📘 GPA Calculator App

a simple educational application developed using Flutter with state management handled by BLoC.
Its goal is to help students calculate their Grade Point Average (GPA) in an interactive and easy way.
Users can enter course information such as:
(name, grade, and credit hours), and the app will then instantly and directly calculate and display the GPA.


---

## App Features
###  Homepage :

✔ Display a list of all added courses
✔ Courses are displayed using ListView.builder inside a BlocBuilder.
✔ Show grade and credit hours for each course
✔ Displayed in a ListTile: course name, grade, and credit hours.
✔ Form for entering course name, grade, and hours
✔ TextFormField is used for both name and credit hours.
✔ DropdownButtonFormField is used for grade selection.
✔ DropdownButtonFormField is used with a ValueNotifier to update the selected grade.
✔ Display the calculated GPA:
✔ GPA is displayed at the top of the page using BlocBuilder.
✔ Form with a GlobalKey is used for form validation.
✔ Uses Card, Padding, SizedBox, Text, and ElevatedButton.


### GPA Calculation:
✔ The Course model converts the grade string to a numeric value.
✔ Values are multiplied (gradeValue * creditHours), summed, and then divided by the total credit hours.
✔ Ability to delete a course using IconButton.

### Using BLoC for State Management
✔ flutter_bloc was used.
✔ CourseBloc was created with events (AddCourse, RemoveCourse, EditCourse) and the state CourseState.
---

gpa_calculator/
│
├── lib/
│   ├── blocs/
│   │   ├── course_bloc.dart       
│   │   ├── course_event.dart     
│   │   └── course_state.dart     
│   │
│   ├── models/
│   │   └── course_model.dart     
│   │
│   ├── screens/
│   │   └── home_screen.dart      
│   │
│   └── main.dart                 
│
├── pubspec.yaml                   
└── README.md                    

----
 ## screenshots:

 ### Add GPA
![gpaadd ](assets/screenshot/gpa_add.jpg)
 ### Add GPA Step 1
![gpaadd1 ](assets/screenshot/gpa_add1.jpg)
 ### Add GPA Step 2
![gpaadd2 ](assets/screenshot/gpa_add2.jpg)
 ### Add GPA Step 3
![gpaadd3 ](assets/screenshot/gpa_add3.jpg)
 ### Add GPA Step 4
![gpaadd4 ](assets/screenshot/gpa_add4.jpg)
 ### validation
![validation ](assets/screenshot/gpa_validation.jpg)

