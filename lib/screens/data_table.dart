import 'package:flutter/material.dart';

// What is DataTable?
// A Material Design widget for displaying data in a tabular format
// Provides structured rows and columns for organized information display
// Perfect for dashboards, admin panels, and data-heavy applications

void main() {
  runApp(
    const MaterialApp(
      home: DataTableExampleApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class DataTableExampleApp extends StatefulWidget {
  const DataTableExampleApp({super.key});

  @override
  State<DataTableExampleApp> createState() => _DataTableExampleAppState();
}

class _DataTableExampleAppState extends State<DataTableExampleApp> {
  bool showAdvanced = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(
          showAdvanced ? 'Advanced Employee DataTable' : 'DataTable Sample',
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                showAdvanced = !showAdvanced;
              });
            },
            icon: Icon(
              showAdvanced ? Icons.arrow_back : Icons.arrow_forward,
              color: Colors.white,
            ),
            label: Text(
              showAdvanced ? "Show Basic" : "Show Advanced",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: showAdvanced
            ? const AdvancedDataTableExample()
            : const DataTableExample(),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text('Name', style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text('Age', style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text('Role', style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
        DataRow(cells: 
        <DataCell>[
          DataCell(Text('Eddy')),
          DataCell(Text('05')),
          DataCell(Text('Student')),
        ]
        )
      ],
    );
  }
}

class AdvancedDataTableExample extends StatefulWidget {
  const AdvancedDataTableExample({super.key});

  @override
  State<AdvancedDataTableExample> createState() =>
      _AdvancedDataTableExampleState();
}

class _AdvancedDataTableExampleState extends State<AdvancedDataTableExample> {
  final List<Map<String, dynamic>> _masterEmployees = [
    {
      "name": "Alice",
      "department": "IT",
      "salary": 500000,
      "status": "Active",
      "selected": false,
    },
    {
      "name": "Brian",
      "department": "Finance",
      "salary": 650000,
      "status": "Inactive",
      "selected": false,
    },
    {
      "name": "Catherine",
      "department": "HR",
      "salary": 450000,
      "status": "Active",
      "selected": false,
    },
    {
      "name": "David",
      "department": "Marketing",
      "salary": 550000,
      "status": "Inactive",
      "selected": false,
    },
  ];

  List<Map<String, dynamic>> employees = [];

  @override
  void initState() {
    super.initState();
    employees = _masterEmployees
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  void _deleteEmployee(int index) {
    setState(() {
      employees.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Employee deleted'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showCheckboxColumn: true,
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Department')),
          DataColumn(label: Text('Salary')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Actions')),
        ],
        rows: employees.asMap().entries.map((entry) {
          final index = entry.key;
          final employee = entry.value;
          return DataRow(
            selected: employee["selected"],
            onSelectChanged: (value) {
              setState(() {
                employee["selected"] = value;
              });
            },
            color: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.08);
              }
              
              if (employee["status"] == "Inactive") {
                return Colors.grey.withValues(alpha: 0.3);
              }
              return null; 
            }),
            cells: [
              DataCell(Text(employee["name"])),
              DataCell(Text(employee["department"])),
              DataCell(Text("RWF ${employee["salary"]}")),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: employee["status"] == "Active"
                        ? Colors.green[200]
                        : Colors.red[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(employee["status"]),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteEmployee(index),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
