# Buypass Seller

A new Flutter project following **MVVM Clean Architecture** with **Riverpod** for state management.

## 📦 Overview

**Buypass Seller** is structured using the **Model-View-ViewModel (MVVM)** pattern and clean architecture principles. It integrates modern Flutter development tools and libraries to ensure scalability, testability, and maintainability.

---

## 🚀 Tech Stack

- **Flutter SDK**: 3.7.2
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router)
- **Networking**: [Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit)
- **Code Generation**: Freezed, JsonSerializable, Retrofit Generator
- **Asset Management**: Flutter Gen
- **Local Storage**: Shared Preferences
- **Image Handling**: Image Picker, Image Cropper, Flutter Image Compress
- **Utilities**: Flutter Toast, Cached Network Image, Permission Handler

---

## 🛠️ Setup Guide



```bash
1. **Clone the Repository**

git clone https://your-repo-link.git
cd buypass_seller

2. **Install Dependencies**


flutter pub get

3. **Install Dependencies**


flutter pub run build_runner build --delete-conflicting-outputs

4. **Run the Application**


flutter run


## 🚀 Project Structure


lib/
├── core/             # Constants, utilities, common resources
├── data/             # Models, API services, repository implementations
├── domain/           # Entities, repository interfaces, use cases
├── presentation/     # Screens, widgets, viewmodels
├── gen/              # Auto-generated files (assets, etc.)
├── main.dart         # Application entry point


