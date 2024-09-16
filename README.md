# levon

An app for all the novel lovers.

## Getting Started

How to set up and run the app:
- Run 'flutter pub get' command in the terminal.
- Replace 'YOUR_TOKEN' with the actual token in the api_services.dart file (lib/app/data/services).
- When entering phone number during registration, need to include the country code at the beginning (example: 0178707714 ---> 60178707714).
- For the Sign In Screen: that prompts users to enter their phone number, I replace it with email since the api only accepts email as identifier.
- To log out navigate to the profile page by tapping the profile icon at the top left of the home screen.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
