# 📱 Education Platform App

A modern Flutter-based education platform that provides an interactive learning experience with course management, enrollment, and progress tracking.

## 🎥 Demo Video

Watch the full app demonstration on YouTube:

[![Education Platform App Demo](https://img.youtube.com/vi/ITtY8s8g1EE/maxresdefault.jpg)](https://www.youtube.com/watch?v=ITtY8s8g1EE&t=9s)

**[▶️ Watch Demo Video](https://www.youtube.com/watch?v=ITtY8s8g1EE&t=9s)**

---

## 🚀 Project Overview

Education Platform App is a feature-rich mobile application built with Flutter that enables users to browse courses, manage enrollments, track learning progress, and interact with educational content. The app follows modern development practices with clean architecture, state management, and responsive UI design with full Arabic RTL support.

**Key Highlights:**
- 🎓 Comprehensive course catalog with categories
- 🛒 Shopping cart functionality for course enrollment
- 📚 Progress tracking and lesson management
- ❤️ Favorite courses system
- 👤 User authentication and profile management
- 🎨 Full Arabic RTL support
- 🌐 Professional video player integration

---

## 📸 App Screenshots

### 🔐 Authentication & Onboarding
<div align="center">

| Banner | Login Screen | Registration |
|--------|--------------|--------------|
| <img src="screenshots/banner.png" width="200" /> | <img src="screenshots/تسجيل الدخول.jpg" width="200" /> | <img src="screenshots/انشاء حساب.jpg" width="200" /> |

</div>

### 🏠 Main Navigation & Home
<div align="center">

| Home Page | Categories | Search |
|-----------|------------|--------|
| <img src="screenshots/الصفحة الرئيسية.jpg" width="200" /> | <img src="screenshots/التصنيفات.jpg" width="200" /> | <img src="screenshots/صفحة البحث.jpg" width="200" /> |

</div>

### 📚 Course Management
<div align="center">

| Category View | Course Details | My Courses |
|---------------|----------------|------------|
| <img src="screenshots/تصنيف.jpg" width="200" /> | <img src="screenshots/تفاصيل الكورس.jpg" width="200" /> | <img src="screenshots/صفحة كورساتي.jpg" width="200" /> |

</div>

### 🛒 Shopping & Enrollment
<div align="center">

| Shopping Cart | Cart with Items | Enrollment Alert |
|---------------|-----------------|------------------|
| <img src="screenshots/صفحة السلة.jpg" width="200" /> | <img src="screenshots/كورسات في السلة.jpg" width="200" /> | <img src="screenshots/رسالة تنيبه ان الكورسات مسجل فيها مسبقا.jpg" width="200" /> |

</div>

### 🎓 Learning Experience
<div align="center">

| Lessons Page | Lesson Player | Profile | More Page |
|--------------|---------------|---------|-----------|
| <img src="screenshots/المحاضرات.jpg" width="200" /> | <img src="screenshots/صفحة مشاهدة المحاضرة.jpg" width="200" /> | <img src="screenshots/الملف الشخصي.jpg" width="200" /> | <img src="screenshots/صفحة المزيد.jpg" width="200" /> |

</div>

---

## 🛠 Tech Stack

### Core Technologies
- **Flutter 3.x** - Cross-platform framework
- **Dart** - Programming language
- **iOS & Android** - Target platforms

### Architecture & State Management
- **BLoC/Cubit** - State management with Cubit for predictable state changes
- **Clean Architecture** - Separation of concerns with data, domain, presentation layers
- **Freezed** - Code generation for immutable classes and union types

### Networking & APIs
- **Dio** - HTTP client for API communication
- **Retrofit** - Type-safe API client generation
- **REST API** - Backend integration with custom endpoints

### Local Storage & Caching
- **Shared Preferences** - Local data persistence
- **Custom Cache Service** - Type-safe storage utilities

### UI & Design
- **Flutter ScreenUtil** - Responsive design adaptation
- **Custom Design System** - Consistent theming and components
- **Material Design** - Google's design language
- **RTL Support** - Full Arabic language support

### Development Tools
- **Freezed Annotation** - Immutable data classes
- **JSON Serialization** - Automated JSON parsing
- **Dependency Injection** - GetIt service locator

---

## 🏗 Architecture

The app follows a clean architecture pattern with clear separation of concerns:

### Layers Structure

```
lib/
├── core/                    # Framework-agnostic business logic
│   ├── networking/          # API clients, DTOs, error handling
│   ├── cache/              # Local storage abstractions
│   ├── errors/             # Custom exception types
│   └── theme/              # Design system
├── features/               # Feature-based modules
│   ├── sign_in/           # Authentication feature
│   ├── courses/           # Course management
│   ├── cart/              # Shopping cart
│   └── lessons/           # Learning content
└── main.dart              # App entry point
```

### State Management Flow

```
UI → Cubit → Repository → Data Source (API/Local)
 ↓
State → UI Rebuild
```

### Key Architectural Patterns
- **Repository Pattern** - Abstract data sources
- **Dependency Injection** - Loose coupling
- **Immutable State** - Predictable state changes
- **Error Handling** - Centralized error management

---

## ✨ Features

### 🔐 Authentication
- User registration and login
- Secure token management
- Auto-login with cached credentials
- Session management

### 📚 Course Management
- Browse courses by categories
- Search functionality
- Course details with rich information
- Instructor profiles
- Course preview videos

### 🛒 Enrollment System
- Add courses to cart
- Bulk enrollment
- Course availability checking
- Enrollment status tracking
- Duplicate enrollment prevention

### ❤️ Favorites System
- Bookmark favorite courses
- Persistent favorites storage
- Quick access to preferred content

### 🎯 Learning Experience
- Lesson player with video support
- Progress tracking
- Course completion status
- Interactive lesson content
- Professional video player with controls

### 👤 User Profile
- Personal information management
- Enrollment history
- Learning progress dashboard
- Account settings

### 🎨 UI/UX Features
- Responsive design
- Arabic RTL support
- Custom animations
- Loading states and error handling
- Professional video player
- Intuitive navigation

---

## 🧪 Testing

### Testing Strategy
- **Unit Tests** - Business logic and utilities
- **Widget Tests** - UI component testing
- **Integration Tests** - End-to-end feature testing
- **Cubit Tests** - State management testing

### Test Structure

```
test/
├── unit/           # Business logic tests
├── widget/         # Component tests
└── integration/    # Feature tests
```

---

## 📁 Folder Structure

```
education_platform_app/
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── lib/
│   ├── core/                  # Core framework
│   │   ├── cache/            # Local storage
│   │   ├── config/           # App configuration
│   │   ├── constants/        # App constants
│   │   ├── di/               # Dependency injection
│   │   ├── errors/           # Error handling
│   │   ├── function/         # Utility functions
│   │   ├── generated/        # Generated code
│   │   ├── helpers/          # Helper utilities
│   │   ├── networking/       # API communication
│   │   ├── routing/          # Navigation
│   │   ├── theme/            # Design system
│   │   └── widgets/          # Reusable components
│   ├── features/             # Feature modules
│   │   ├── cart/            # Shopping cart
│   │   ├── categories/      # Course categories
│   │   ├── courses/         # Course management
│   │   ├── enrollments/     # Enrollment system
│   │   ├── favorites/       # Favorites management
│   │   ├── home/            # Home screen
│   │   ├── lessons/         # Lesson content
│   │   ├── more/            # Additional features
│   │   ├── my_courses/      # User's courses
│   │   ├── profile/         # User profile
│   │   ├── sign_in/         # Authentication
│   │   └── sign_up/         # Registration
│   ├── app.dart             # Main app widget
│   └── main_screen.dart     # Root screen
├── test/                     # Test files
└── pubspec.yaml             # Dependencies
```

---

## 🚀 How to Run the Project

### Prerequisites
- Flutter SDK (version 3.0 or higher)
- Dart SDK
- iOS Simulator or Android Emulator
- Physical device for testing

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd education_platform_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate necessary files**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure environment**
   - Update API base URL in `lib/core/networking/api_constants.dart`
   - Configure signing for release builds

5. **Run the application**
   ```bash
   flutter run
   ```

### Build for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

---

## 🔮 Future Improvements

### 🎯 Planned Features
- **Offline Mode** - Download courses for offline viewing
- **Push Notifications** - Course updates and reminders
- **Social Features** - User reviews and ratings
- **Advanced Analytics** - Learning progress insights
- **Payment Integration** - In-app purchases
- **Live Classes** - Real-time video streaming
- **Gamification** - Achievements and badges

### 🔧 Technical Enhancements
- **Migration to Riverpod** - Modern state management
- **GraphQL API** - Efficient data fetching
- **Micro-frontend Architecture** - Modular feature development
- **Performance Monitoring** - Crash analytics and performance tracking
- **Accessibility** - Enhanced screen reader support
- **Internationalization** - Multi-language support beyond Arabic

### 🚀 Scalability
- **Modular Architecture** - Dynamic feature modules
- **CI/CD Pipeline** - Automated testing and deployment
- **Backend Integration** - Real-time synchronization
- **Cloud Storage** - Media content delivery optimization

---

## 📱 Download

Coming soon on:
- 📱 Google Play Store
- 🍎 Apple App Store

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

## 👥 Contact & Social Links

Developed with ❤️ by the Education Platform Team

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/yourusername/education-platform-app)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/in/yourprofile)
[![Twitter](https://img.shields.io/badge/Twitter-Follow-blue?logo=twitter)](https://twitter.com/yourhandle)
[![YouTube](https://img.shields.io/badge/YouTube-Subscribe-red?logo=youtube)](https://www.youtube.com/channel/yourchannel)

---

## 🐛 Issues & Support

Found a bug? Have a feature request?

- 🐛 [Report Bug](https://github.com/yourusername/education-platform-app/issues)
- ✨ [Request Feature](https://github.com/yourusername/education-platform-app/issues)
- 📧 Email: support@educationplatform.com

---

## ⭐ Show Your Support

If you find this project helpful, please give it a ⭐ on GitHub!

---

## 📊 Project Stats

![GitHub stars](https://img.shields.io/github/stars/yourusername/education-platform-app?style=social)
![GitHub forks](https://img.shields.io/github/forks/yourusername/education-platform-app?style=social)
![GitHub issues](https://img.shields.io/github/issues/yourusername/education-platform-app)
![GitHub license](https://img.shields.io/github/license/yourusername/education-platform-app)

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>© 2024 Education Platform App. All rights reserved.</p>
</div>
