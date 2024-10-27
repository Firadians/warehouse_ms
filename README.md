# Warehouse Management System (warehouse_ms)

A comprehensive Flutter application for managing warehouse inventory, including CRUD operations for warehouse items, real-time updates, and efficient state management using the BLoC pattern. This project is intended for tracking, updating, and managing items within a warehouse environment.

## Features

- **Inventory Management**: Add, edit, update, and delete warehouse items with ease.
- **Local Database**: Uses SQLite for local storage, ensuring data persistence even when offline.
- **Efficient State Management**: Powered by the BLoC pattern for clear separation of UI and business logic.
- **Real-time Feedback**: Get real-time feedback on CRUD actions via UI notifications.
- **Scalable Architecture**: Structured for scalability with Repository and BLoC layers, allowing easy modifications and additions of features.

## Project Structure

- **BLoC (Business Logic Component)**: Handles state management and business logic, providing clean separation of concerns between the UI and data layers.
- **SQLite Database**: Stores data locally with a persistent database to ensure items are retained and updated.
- **Repository Pattern**: Encapsulates database operations, allowing easy integration of other data sources if needed.
- **UI Pages**: Designed for intuitive and accessible interaction with CRUD actions for each warehouse item.

## Getting Started

### Prerequisites

- **Flutter**: Make sure you have Flutter installed. You can download it [here](https://docs.flutter.dev/get-started/install).
- **SQLite Database**: Integrated within the application for local storage.

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/warehouse_ms.git
   cd warehouse_ms
2. Install dependencies:
   ```bash
   flutter pub get
3. Run the application:
   ```bash
   flutter run
