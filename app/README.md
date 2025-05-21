  # 📱 GPA Calculator App – Flutter Project

### 📝 Overview
The **GPA Calculator App** is a Flutter-based application that simplifies academic performance tracking. It allows users to input course details, assign grades and credit hours, and dynamically compute their GPA. The app is designed with a clean UI and interactive features to deliver a seamless user experience.

---

### 🚀 Features

#### **1. Homepage**
- Displays a list of all added courses with their respective grades and credit hours.
- Shows the **Overall GPA** at the bottom of the screen, dynamically calculated based on the entered data.
- Includes a form with the following inputs:
  - **Course Name:** Text input field.
  - **Credit Hours:** Numeric input field.
  - **Grade:** Dropdown menu to select grades (e.g., A, B+, C).
- **Add Course Button**: Adds the inputted course to the list.

#### **2. Add/Edit Course Screen**
- Allows users to **add** or **edit** course details including:
  - Course Name
  - Grade
  - Credit Hours
- Provides **form validation**:
  - Course name cannot be empty.
  - Credit hours must be a valid number.
- Displays error messages for invalid inputs.
- Uses a **bottom sheet** for editing course details.

#### **3. State Management**
- Implements **BLoC (Business Logic Component)** for efficient state management.
- Dynamically updates the course list and GPA when courses are added, edited, or deleted.

#### **4. Validation**
- Ensures all fields are correctly filled:
  - **Empty fields** trigger error messages.
  - **Invalid credit hours** (non-numeric input) are flagged with appropriate warnings.

---

### 📸 Screenshots

1. **List of Added Courses with GPA**  
 ![2](https://github.com/user-attachments/assets/0bd4120e-e624-424b-99f8-f81dc91d81f0)

2. **Empty State - No Courses Added**  
 ![3](https://github.com/user-attachments/assets/bfd6206b-b57d-48d1-823f-3fa336810de2)

3. **Validation Errors**  
   - Empty fields:  
    ![5](https://github.com/user-attachments/assets/93d5cfd7-af09-49ba-a81d-c76f6e6ca618)
![4](https://github.com/user-attachments/assets/7171ee40-6e58-4918-a2c5-85e02f4d6abe)

4. **Editing Courses**  
    
![6](https://github.com/user-attachments/assets/65ae5879-3ef6-44ba-b814-98b50af0e735)

5. **Adding a Course**
6.  ![1](https://github.com/user-attachments/assets/ac235731-8bf7-4b1b-9924-371e4dd18cc4)

 
---

### 🧰 Tech Stack
- **Flutter** (latest version)
- **Dart**
- **BLoC** for state management

---

### 💻 GitHub Submission Guidelines
1. Clone the repository:  
   ```bash
   git clone https://github.com/BushraAljuwair/GPA-Calculator.git
2. flutter pub get:  
   ```bash
   flutter run