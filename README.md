# Store App

A Flutter application demonstrating API integration and MVVM architecture best practices.

## About This Project

This project demonstrates how to build a Flutter application using:
- **API Integration**: Making HTTP requests using the Dio package
- **MVVM Architecture**: Clean separation of concerns with ViewModel pattern
- **State Management**: Managing app state efficiently

## Features

### 1. **Authentication (Login)**
- User login functionality integrated with API
- Secure credential handling
- Error handling for failed login attempts

### 2. **Product List (Get Products)**
- Fetch and display products from API
- List view with product information
- API response handling and error management

## Architecture: MVVM Pattern

The project follows the **Model-View-ViewModel** architecture:

```
lib/
├── features/
│   ├── auth/
│   │   ├── presentation/
│   │   │   ├── views/        (UI Screens)
│   │   │   └── viewmodels/   (Login ViewModel)
│   │   ├── data/
│   │   │   ├── models/       (Data classes)
│   │   │   └── repositories/ (API calls)
│   │
│   └── home/
│       ├── presentation/
│       │   ├── views/        (UI Screens)
│       │   └── viewmodels/   (Products ViewModel)
│       ├── data/
│       │   ├── models/       (Product model)
│       │   └── repositories/ (Product API calls)
│
└── core/
    ├── networking/          (Dio configuration & setup)
    ├── theme/              (App styling)
    ├── routing/            (Navigation)
    └── widgets/            (Reusable components)
```

**Components:**
- **View**: UI layer (Widgets, Pages)
- **ViewModel**: Business logic and state management
- **Model**: Data structures
- **Repository**: API communication layer

## API Integration with Dio

### What is Dio?

Dio is a powerful HTTP client package for Dart/Flutter that simplifies API communication.

### Key Features Used:

✅ **Making GET/POST Requests**
```dart
final response = await dioClient.get('/api/endpoint');
```

✅ **Request/Response Interceptors**
- Add headers automatically
- Handle authentication tokens
- Error handling

✅ **Error Handling**
- Categorize different types of errors
- User-friendly error messages

✅ **Clean API Communication**
- Centralized Dio configuration
- Reusable API methods

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Android Studio or VS Code
- A device or emulator

### Installation

1. **Clone the project**
   ```bash
   cd store_app
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Dependencies

Key packages used in this project:
- `dio`: HTTP client for API requests
- `flutter_bloc` or `provider`: State management
- Other dependencies listed in `pubspec.yaml`

## Learning Outcomes

Through this project, I learned:
- ✅ How to integrate REST APIs using Dio package
- ✅ Implementing MVVM architecture in Flutter
- ✅ Proper error handling for API requests
- ✅ Managing authentication flows
- ✅ Best practices for clean code organization
- ✅ Separating UI logic from business logic using ViewModels

## Project Structure Highlights

The project demonstrates clean architecture principles:
- **Separation of Concerns**: Each layer has a specific responsibility
- **Reusability**: Common code in `core` folder for all features
- **Scalability**: Easy to add new features following the same pattern
- **Testability**: ViewModel patterns make unit testing easier

## Future Enhancements

- [ ] Add product search functionality
- [ ] Implement product filtering
- [ ] Add shopping cart feature
- [ ] User profile management
- [ ] Order history

## Resources

- [Dio Package Documentation](https://pub.dev/packages/dio)
- [Flutter MVVM Pattern](https://docs.flutter.dev)
- [REST API Best Practices](https://restfulapi.net)

---

**Created**: February 2026
