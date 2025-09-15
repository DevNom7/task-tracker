# Task Tracker - My Flutter Learning Journey
**Built by: Naim Lindsay**  
**Learning Period: September 9/10 to 9/15, 2025**

This is my first public Flutter app that I built to practice everything I've been learning about mobile development. I wanted to create something practical while exploring clean architecture patterns and Flutter best practices.

## What I Learned & Implemented

### 🏗️ **Clean Architecture Approach**
I organized my code following clean architecture principles I studied:
- **Models**: Pure data classes with no dependencies
- **Data Layer**: Handles all storage operations (TaskStore)
- **Presentation Layer**: UI components and state management
- **Utils**: Helper functions separated from business logic

This separation made my code way easier to test and maintain!

### 📱 **Flutter Concepts I Practiced**
- **StatefulWidget vs StatelessWidget**: Learned when to use each
- **setState()**: Managed local state changes properly
- **TextEditingController**: Controlled text input fields
- **ListView.separated**: Built efficient scrollable lists
- **Dismissible**: Implemented swipe-to-delete functionality
- **SharedPreferences**: Persisted data locally on device
- **Material 3**: Used modern design system components

### 🎯 **Key Features I Built**
- ✅ Add, edit, and delete tasks with smooth animations
- ✅ Smart filtering (All / Active / Completed tasks)
- ✅ Swipe gestures for intuitive task deletion
- ✅ Local data persistence (tasks survive app restarts!)
- ✅ Dark/light theme support (follows system preference)
- ✅ Loading states and empty state handling

## My Project Structure
```
lib/
├── models/          # Task data model (immutable design)
├── data/           # TaskStore handles all persistence
├── pages/          # TaskHomePage (main screen logic)
├── widgets/        # Reusable UI components
│   ├── task_input.dart    # Input field component
│   └── task_list.dart     # Task list with swipe actions
└── utils/          # DateUtils for time formatting
```

### **Error Handling**
I implemented proper try-catch blocks in my TaskStore so the app doesn't crash if storage fails. Learned that graceful degradation is super important!

### **Immutable Data Pattern**
Used the `copyWith()` method for updating tasks without mutating the original objects. This prevents bugs and makes state changes predictable.

### **Component Reusability**
Created separate widgets for TaskInput and TaskList that can be reused anywhere. This follows the DRY principle I learned about.

### **User Experience**
Added loading indicators, smooth animations, and intuitive gestures. The app feels responsive and professional!

## How to Run My App
```bash
git clone https://github.com/yourusername/task_tracker.git
cd task_tracker
flutter pub get
flutter run
```

## My Learning Journey
- **Day 1** (9/10): Set up project structure and basic UI
- **Day 2** (9/11): Implemented task CRUD operations and state management
- **Day 3** (9/12): Added data persistence with SharedPreferences
- **Day 4** (9/13): Built filtering system and improved UI
- **Day 5** (9/14): Added swipe-to-delete and animations
- **Day 6** (9/15): Code cleanup, comments, and final polish

## Next Steps
I want to learn more about:
- State management solutions like Provider or Riverpod
- Unit testing and widget testing
- Database integration ( SQLite)
- API integration and networking
- App deployment to stores

 Excited to keep learning!! 💯
