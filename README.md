
# Blog Explorer

**Blog Explorer** is a Flutter application that allows users to explore a list of blogs fetched from a RESTful API. Users can view blog titles, images, and details, and mark their favorite blogs. The application employs Flutter's Bloc state management solution to manage app state efficiently and includes error handling to provide a smooth user experience.

## Demo

[Demo Video](https://github.com/user-attachments/assets/179e7fdf-a04c-4541-816e-6e79017cd667)

### Screens

![UI](https://github.com/user-attachments/assets/a9f623a9-449b-4a0e-a120-47d753ddf944)


## Features

1. **API Integration:** Fetches data from the provided RESTful API.
2. **Blog List View:** Displays a list of blogs with titles and images.
3. **Detailed Blog View:** Shows the full details of a selected blog.
4. **Navigation:** Seamless navigation between blog list view and detailed blog view.
5. **State Management:** Utilizes Bloc for efficient state management.
6. **Error Handling:** Gracefully handles API errors with user-friendly messages.
7. **UI/UX Design:** Attractive and user-friendly interface.

## Getting Started

### Prerequisites

- Flutter SDK
- A code editor (e.g., Visual Studio Code)
- A device or emulator to run the app

### Installation

1. Navigate to the project directory:
    ```bash
    cd blog-explorer
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```

### Configuration

Ensure you have the correct API URL and admin secret set in your `fetchBlogs` function in `lib/services/blog_service.dart`:

```dart
const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
```

## Usage

### Fetch Blogs

- The app fetches the list of blogs from the API when launched.

### View Blogs

- The home screen displays a list of blogs with their titles and images.

### View Blog Details

- Tap on a blog item to view its full details, including the title and image.

## Main Files

- `main.dart`: Entry point of the application.
- `services/blog_service.dart`: Contains the API integration logic.
- `screens/blog_list_screen.dart`: Displays the list of blogs.
- `screens/blog_detail_screen.dart`: Shows the details of a selected blog.
- `blocs/blog_bloc.dart`, `blog_event.dart`, `blog_state.dart`: Implements Bloc for state management.

## API Integration

API requests are handled in `lib/services/blog_service.dart`:

```dart
import 'package:http/http.dart' as http;

Future<List<Blog>> fetchBlogs() async {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      // Parse and return the list of blogs
      return parseBlogs(response.body);
    } else {
      throw Exception('Failed to load blogs');
    }
  } catch (e) {
    throw Exception('Failed to load blogs: $e');
  }
}
```

---
