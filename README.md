# Educational Flutter CRUD To-Do App

A clean, beginner-friendly **To-Do List application** built with [Flutter](https://flutter.dev/) designed specifically for educational purposes. 

Lazily generated with Gemini Auto Low ([https://share.gemini.google/lb3CzemIyF9H](https://share.gemini.google/lb3CzemIyF9H)).

This project demonstrates core architectural principles, including **Separation of Concerns (SoC)**, **full CRUD operations** (Create, Read, Update, Delete) across dedicated screens, state management using Flutter's built-in `StatefulWidget`s, and local data persistence via `shared_preferences`.

---

## 🛠 Features & Architecture

### 1. Architectural Design: Separation of Concerns (SoC)
* **Model Layer (`models/task.dart`)**: Defines the data blueprint and handles JSON serialization/deserialization.
* **Service Layer (`services/task_service.dart`)**: Encapsulates data persistence and business logic, completely decoupled from the user interface.
* **UI Layer (`screens/`)**: Dedicated view components responsible strictly for rendering UI elements and receiving user actions.

### 2. Dedicated CRUD Pages
* **Index (`index_screen.dart`)**: Displays the list of tasks with quick-action controls for viewing details, editing, or deleting.
* **Create (`create_screen.dart`)**: Form page to input title and detailed descriptions for a new task.
* **Read (`read_screen.dart`)**: View page to inspect complete task information and completion status.
* **Update (`update_screen.dart`)**: Edit page pre-populated with task data to modify titles, descriptions, or mark as completed.
* **Delete**: Handled gracefully via the Index screen with instant local storage updates.

### 3. Local Persistence
* Task state is safely preserved across application restarts using local `shared_preferences` storage encoded in JSON format.

---

## 📁 Project Directory Structure

```text
lib/
├── models/
│   └── task.dart          # Task model & JSON serialization
├── services/
│   └── task_service.dart   # Data service & shared_preferences storage logic
├── screens/
│   ├── index_screen.dart   # Main view displaying the list of tasks (Index)
│   ├── create_screen.dart  # Form screen to create a new task (Create)
│   ├── read_screen.dart    # Detailed view screen for a single task (Read)
│   └── update_screen.dart  # Form screen to edit an existing task (Update)
└── main.dart               # Application entry point & theme configuration
```

---

## 🚀 Getting Started & Setup Guide

Follow these step-by-step instructions to get the project up and running on your local device or emulator.

### Prerequisites

Ensure you have the following installed on your development machine:
1. **Flutter SDK**: [Install Flutter](https://docs.flutter.dev/get-started/install) (v3.0.0 or higher recommended).
2. **Dart SDK**: Included automatically with Flutter.
3. An IDE such as **VS Code** (with Flutter & Dart extensions) or **Android Studio**.
4. An target emulator (Android/iOS) or physical device for testing.

---

### Installation Steps

1. **Clone the Repository or Create a New Project**
   If you are creating this from scratch, initialize a new Flutter project:
   ```bash
   flutter create todo_flutter_soc
   cd todo_flutter_soc
   ```

2. **Add Dependencies**
   Open `pubspec.yaml` and add `shared_preferences` under the `dependencies` section:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     shared_preferences: ^2.3.2
   ```

3. **Fetch Dependencies**
   Run the following command in your terminal to fetch the added package:
   ```bash
   flutter pub get
   ```

4. **Add Source Files**
   Create the directory structure inside `lib/` as shown in the **Project Directory Structure** section above and copy the respective Dart files into `models/`, `services/`, and `screens/`.

5. **Run the Application**
   Ensure an emulator is active or a real device is connected, then execute:
   ```bash
   flutter run
   ```

---

## 📚 Key Educational Takeaways

* **Data Modeling & JSON**: Converting Dart objects into Maps (`toJson`) and vice-versa (`fromJson`) is essential when working with REST APIs or local key-value stores.
* **Decoupling Logic**: Moving storage calls out of the UI widgets into a dedicated service (`TaskService`) ensures code can be re-used, unit tested, and easily swapped with a different database (e.g., SQLite, Hive) without altering the UI.
* **Declarative Navigation**: Navigating between distinct routes using `Navigator.push` and awaiting screen dismissals allows the main index view to reactively refresh upon return.