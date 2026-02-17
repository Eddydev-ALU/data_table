# Data Table

A Flutter application demonstrating the DataTable widget for displaying tabular data in a structured format.

## Run Instructions

1. Ensure Flutter is installed on your system
2. Clone this repository
3. Navigate to the project directory:
   ```bash
   cd data_table
   ```
4. Install dependencies:
   ```bash
   flutter pub get
   ```
5. Run the application:
   ```bash
   flutter run
   ```

## Key DataTable Attributes

This project demonstrates three key DataTable attributes:

- **columns**: Defines the column headers of the table using DataColumn widgets
- **rows**: Contains the actual data rows using DataRow and DataCell widgets  
- **showCheckboxColumn**: Enables row selection with checkboxes (demonstrated in advanced example)

## Features

The app includes two examples accessible via the toggle button:

**Basic DataTable**: Simple table displaying name, age, and role information

**Advanced DataTable**: Enhanced table with:
- Row selection with checkboxes
- Color-coded rows based on status (Active/Inactive)
- Interactive action buttons (Edit/Delete)
- Custom cell styling with badges and icons
- Delete functionality with feedback

## Screenshots

### Basic DataTable View
![Basic DataTable](Screenshots/Screenshot%202026-02-17%20at%2013.56.46.png)

### Advanced DataTable View
![Advanced DataTable](Screenshots/Screenshot%202026-02-17%20at%2013.57.11.png)

### Advanced DataTable with Actions
![Advanced DataTable Actions](Screenshots/Screenshot%202026-02-17%20at%2013.57.22.png)
