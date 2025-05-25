# 📘 GPA Calculator App

### Overview 👀

**GPA Calculator** is a simple and intuitive app designed to help students calculate their academic performance efficiently. Users can input their courses, assign grades and credit hours, and get an instant calculation of their GPA using a clean and user-friendly interface.

---

### Output 📱

<img src="https://github.com/user-attachments/assets/a522c24d-0d26-42a8-9fd8-7271cb86d7d3" alt="output" width="300" >
<img src="https://github.com/user-attachments/assets/a3df6590-90d8-4919-8e1f-f41e7cdfa59e" alt="output" width="300" >
<img src="https://github.com/user-attachments/assets/52de5faa-00e1-476e-8adb-b65c80370a35" alt="output" width="300" >
<img src="https://github.com/user-attachments/assets/b783e2fd-669b-4ad1-b050-8a64c9c7501e" alt="output" width="300" >
<img src="https://github.com/user-attachments/assets/8786ab21-93b9-4e74-920b-5dc225aafe95" alt="output" width="300" >
<img src="https://github.com/user-attachments/assets/17c78b57-e137-47b8-b39f-b6335ede2d9e" alt="output" width="300" >

---

### Features ⭐️

* ✏️ Add courses with course name, grade, and credit hours.
* 🔢 Dynamic GPA calculation as courses are added or updated.
* 🗂️ Manage your course list: edit or delete courses easily.
* ⚙️ Built with BLoC pattern for robust state management.
* 🎨 Simple and clean UI designed with Flutter widgets.

---

### Tech Stack 💻

* **Flutter**
* **Dart**
* **BLoC** for state management

---

### Installation 🛠️

1. Clone the repository:

```bash
git https://github.com/lamyaalsuhaibani/GPA-Calculator.git
```

2. Navigate to the project directory:

```bash
cd GPA-Calculator
```

3. Get dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

---

### Folder Structure 🔨

```
lib
├── home
│   ├── bloc
│   │   ├── course_bloc.dart
│   │   ├── course_event.dart
│   │   └── course_state.dart
│   ├── extensions
│   │   └── screens
│   │       └── get_size_screen.dart
│   ├── home_screen.dart
│   ├── model
│   │   └── course_model.dart
│   └── widget
│       ├── bottom_sheet_widget.dart
│       ├── buttom_widget.dart
│       ├── course_widget.dart
│       ├── text_field_widget.dart
│       └── title_widget.dart
├── main.dart
└── style
    ├── style_color.dart
    ├── style_size.dart
    └── theme.dart
```

---

### How to Use 📲

1. Open the app.
2. Add your courses by entering the course name, grade, and credit hours.
3. View your GPA updating dynamically as you add or modify courses.
4. Edit or delete courses anytime to keep your list accurate.


---

### Author 👩‍💻

**Lamya Alsuhaibani**

[🌐 Portfolio Website](https://picayune-mouth-ade.notion.site/Lamya-Alsuhaibani-310c29eda5ba40638fa895968d3f630d)
[💼 LinkedIn](https://www.linkedin.com/in/lamya-a-alsuhaibani/)


