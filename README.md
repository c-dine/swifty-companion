# Swifty Companion

## About the project

Swifty Companion is an iOS app that allows you to search for students from the 42 school network and view their profiles.

## Features

*   Search for students by their login.
*   View student profiles, including:
    *   Coalition
    *   Level
    *   Projects
    *   Skills
*   Network error handling.

## Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/swifty-companion.git
    ```
2.  Open the project in Xcode:
    ```bash
    open swifty-companion/swifty-companion.xcodeproj
    ```
3.  Create a `info.plist` file in `swifty-companion/swifty-companion/` and add the following keys with your 42 API credentials:
    *   `FORTY_TWO_API`: The 42 API url
    *   `FORTY_TWO_UID`: Your API UID
    *   `FORTY_TWO_SECRET`: Your API secret
4.  Build and run the project on a simulator or a physical device.

## Usage

1.  Launch the app.
2.  Enter a student's login in the search bar.
3.  Tap the "Look up" button.
4.  If the student is found, their profile will be displayed.

## Project Structure

The project is structured using the MVVM (Model-View-ViewModel) design pattern.

*   **Models**: Contains the data models for the app.
*   **Views**: Contains the SwiftUI views for the app.
*   **ViewModels**: Contains the view models for the app.
*   **Services**: Contains the services for interacting with the 42 API.
