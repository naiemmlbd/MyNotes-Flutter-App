# MyNotes App - Flutter

This is a Flutter project for a note-taking application. The app includes the following screens:

- Login screen: Allows users to log in to their accounts using Google Firebase Auth.
- Registration screen: Allows new users to create an account.
- Note list screen: Displays a list of saved notes.
- Note create and update screen: Allows users to create new notes or edit existing ones.

## Features

- User account management: The app uses Google Firebase Auth for user authentication and account management.
- Local storage: The app utilizes local storage to save and retrieve notes.
- SQLite database: The app uses the sqflite package to implement a SQLite database for efficient data storage and retrieval.
- Bloc pattern: The app uses the bloc pattern for state management, providing a clean and organized architecture.

## Getting Started

To run the app, follow these steps:

1. Clone the repository.
2. Set up Firebase Auth and add your Firebase configuration details to the project.
3. Run `flutter pub get` to install the required dependencies.
4. Run the app on your preferred device or emulator using `flutter run`.

## Dependencies

The project relies on some basic dependencies including:

- `firebase_auth`: Provides the integration with Google Firebase Auth for user authentication.
- `sqflite`: Implements the SQLite database for local storage and retrieval.
- `flutter_bloc`: Implements the bloc pattern for state management.

## Contributing

This project is primarily for learning purposes. Contributions and suggestions are welcome. If you find any issues or have ideas for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
