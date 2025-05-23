# 📘 GPA Calculator App - Flutter
#screen:
![Flutter](./preview.gif)

A  GPA Calculator application built with Flutter using the BLoC pattern for efficient state management. Helps students track and calculate their GPA by entering course details.

## 🚀 Features

### 🏠 Home Screen
- **Course List Display**
  - View all added courses with name, grade, and credit hours
  - Real-time GPA calculation updates
  - Intuitive card-based UI for each course

- **Add New Course**
  - Simple form with validation:
    - Required course name field
    - Numeric credit hours input
    - Grade selection via dropdown menu

### ✏️ Course Management
- **Edit Existing Courses**
  - Modify course details with the same validation as adding
- **Delete Courses**
  - Swipe-to-delete or via explicit delete action
- **Data Persistence**
  - Courses saved between sessions (using shared_preferences or similar)

### 🧠 State Management
- **BLoC Architecture**
  - Clean separation of business logic and UI
  - Reactive updates to GPA calculation
  - Well-defined events and states:
    - `AddCourse`, `UpdateCourse`, `DeleteCourse`
    - `CoursesLoaded`, `GPAUpdated`
