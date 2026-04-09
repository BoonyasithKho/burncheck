# Burncheck

Flutter mobile application for monitoring, visualizing, and communicating wildfire and open burning information in an accessible mobile experience. The project is designed to present fire-related data in a clear, practical, and user-friendly format for decision support, situation awareness, and public communication.

## Overview

The application focuses on delivering burn-related information through a mobile interface that supports data viewing, map-based exploration, and situation summaries. It is intended to help users quickly understand fire conditions, affected areas, and related geospatial information from connected data services.

## Key Features

- Display burn and fire-related information in a mobile-friendly interface
- Show map-based layers for spatial situation awareness
- Present summary cards, statistics, and status information
- Support filtering and browsing data by area, time, or category
- Connect to backend APIs for near-real-time data retrieval
- Designed for scalable extension with additional modules and analytics

## Technology Stack

- **Framework:** Flutter
- **Language:** Dart
- **Architecture:** Feature-based Flutter project structure
- **State Management:** Bloc / Cubit (recommended if used in project)
- **Map Integration:** Google Maps / other map package depending on implementation
- **Networking:** `dio` or `http`
- **Local Storage:** `shared_preferences`, `hive`, or similar

## Project Structure

```text
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── services/
├── models/
├── data/
│   ├── datasource/
│   ├── repositories/
│   └── api/
├── blocs/
├── screens/
│   ├── home/
│   ├── map/
│   ├── report/
│   ├── notification/
│   └── settings/
├── widgets/
└── routes/
```

> Adjust the structure above to match the actual folder organization in your project.

## Getting Started

### 1. Prerequisites

Make sure the following tools are installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK
- Android Studio or VS Code
- Android SDK / Xcode (depending on target platform)

Check Flutter installation:

```bash
flutter doctor
```

### 2. Clone the Project

```bash
git clone <your-repository-url>
cd burncheck
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the Application

```bash
flutter run
```

## Build Commands

### Android APK

```bash
flutter build apk --release
```

### Android App Bundle

```bash
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

## Environment Configuration

If the project uses API endpoints or environment-specific settings, create a configuration file such as:

```text
.env
```

Example:

```env
BASE_URL=https://your-api-domain.com
MAP_API_KEY=your_map_key
APP_ENV=development
```

You may manage configuration with packages such as `flutter_dotenv`.

## Example Dependencies

Below are example packages commonly used in Flutter projects like Burncheck:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.0
  equatable: ^2.0.5
  dio: ^5.0.0
  google_maps_flutter: ^2.5.0
  shared_preferences: ^2.2.0
```

## Development Guidelines

- Keep widgets small and reusable
- Separate UI, business logic, and data layers
- Use consistent naming conventions
- Centralize constants, routes, and themes
- Handle API errors and empty states clearly
- Design for accessibility and readable information display

## Suggested Modules

Depending on the current scope of Burncheck, the application may include:

- **Home:** Situation summary and quick overview
- **Map:** Burn area or fire hotspot visualization
- **Detail View:** Detailed information for selected item or area
- **Notification:** Alert and event updates
- **Report:** Historical summaries or charts
- **Settings:** Language, theme, permissions, and app preferences

## API Integration

A simple service example:

```dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://your-api-domain.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Response> getBurnData() async {
    return await dio.get('/burn-data');
  }
}
```

## Testing

Run tests with:

```bash
flutter test
```

## Release Checklist

Before publishing:

- Update app version in `pubspec.yaml`
- Verify API endpoints for production
- Test on both Android and iOS devices
- Check permissions and notification behavior
- Confirm map rendering and geospatial data loading
- Review accessibility and UI responsiveness

## Contribution

If this project is developed by a team, consider using the following workflow:

1. Create a feature branch
2. Commit changes with clear messages
3. Open a pull request
4. Review and test before merging

## License

Specify the project license here.

```text
MIT / Proprietary / Internal Use Only
```

## Contact

Project Owner / Team: `Burncheck Development Team`

Organization: `Your organization name`

---

If needed, this README can be extended with screenshots, architecture diagrams, API documentation, deployment notes, or module-specific usage instructions.
