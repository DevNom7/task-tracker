# Flutter Task Tracker - Portfolio Entry

## Project Overview
**Flutter Task Tracker** - A clean, modern task management app built with Flutter demonstrating clean architecture principles and mobile development best practices.

**Live Demo**: [GitHub Repository](https://github.com/DevNom7/task-tracker)  
**Tech Stack**: Flutter, Dart, SharedPreferences, Material 3  
**Duration**: 6 days (September 9-15, 2025)  
**Role**: Full-Stack Mobile Developer

## 🎯 Project Goals
- Learn Flutter fundamentals and widget-based architecture
- Implement clean architecture patterns for maintainable code
- Practice state management and local data persistence
- Create a production-ready mobile application

## ✨ Key Features
- **Task Management**: Add, edit, delete, and toggle task completion
- **Smart Filtering**: Filter tasks by All, Active, or Completed status
- **Intuitive UI**: Swipe-to-delete gestures and smooth animations
- **Data Persistence**: Local storage using SharedPreferences
- **Theme Support**: Automatic dark/light mode following system preferences
- **Responsive Design**: Optimized for all screen sizes

## 🏗️ Technical Implementation

### Clean Architecture
```
lib/
├── models/          # Task data model (immutable design)
├── data/           # TaskStore handles all persistence
├── pages/          # TaskHomePage (main screen logic)
├── widgets/        # Reusable UI components
└── utils/          # DateUtils for time formatting
```

### Key Technologies
- **State Management**: setState for local state management
- **Data Persistence**: SharedPreferences for local storage
- **UI Framework**: Material 3 design system
- **Architecture**: Clean separation of concerns
- **Error Handling**: Graceful degradation with try-catch blocks

## 🚀 Learning Outcomes

### Flutter Concepts Mastered
- Widget lifecycle and state management
- TextEditingController and form handling
- ListView.separated for efficient scrolling
- Dismissible widgets for swipe gestures
- Material Design 3 components
- Theme customization and responsive design

### Software Engineering Practices
- Clean architecture implementation
- Immutable data patterns with copyWith()
- Component reusability and DRY principles
- Error handling and graceful degradation
- Code organization and separation of concerns

## 📱 Screenshots
*[Add screenshots of your app here - main screen, dark mode, task creation, filtering]*

## 🔧 Technical Challenges Solved

### 1. State Management
**Challenge**: Managing complex state across multiple widgets  
**Solution**: Implemented proper setState patterns with immutable data updates

### 2. Data Persistence
**Challenge**: Storing and retrieving tasks locally  
**Solution**: Created TaskStore class using SharedPreferences with JSON serialization

### 3. UI/UX Design
**Challenge**: Creating intuitive and responsive user interface  
**Solution**: Used Material 3 components with custom animations and gestures

## 📈 Results & Impact
- **Code Quality**: Zero linting errors, comprehensive documentation
- **Performance**: Smooth 60fps animations and responsive interactions
- **Maintainability**: Clean architecture makes code easy to extend and modify
- **Learning**: Solid foundation in Flutter development and mobile app architecture

## 🛠️ Future Enhancements
- [ ] State management with Provider or Riverpod
- [ ] Unit and widget testing implementation
- [ ] Database integration (SQLite)
- [ ] Cloud synchronization
- [ ] Push notifications
- [ ] App store deployment

## 💡 Key Takeaways
This project taught me the importance of clean architecture in mobile development. By separating concerns into distinct layers (models, data, presentation), I created maintainable code that's easy to test and extend. The experience reinforced the value of proper state management and user experience design in creating professional mobile applications.

---

**GitHub**: [https://github.com/DevNom7/task-tracker](https://github.com/DevNom7/task-tracker)  
**Technologies**: Flutter, Dart, Material 3, SharedPreferences, Clean Architecture
