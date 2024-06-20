import 'package:flutter/material.dart';
import 'task.dart';
class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late String _selectedStatus;
  late DateTime _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.task.status;
    _selectedDueDate = widget.task.dueDate;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status: $_selectedStatus'),
          Text('Due Date: ${_selectedDueDate.toString().substring(0, 10)}'),
        ],
      ),
      trailing: DropdownButton<String>(
        value: _selectedStatus,
        items: ['To Do', 'Urgent', 'Done'].map((String status) {
          return DropdownMenuItem<String>(
            value: status,
            child: Text(status),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedStatus = newValue;
            });
            // You can add logic here to update the task status
            // taskService.updateTaskStatus(widget.task.id, newValue);
          }
        },
      ),
      onTap: () {
        _selectDueDate(context);
      },
    );
  }

  // Function to show date picker and update _selectedDueDate
  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDueDate) {
      setState(() {
        _selectedDueDate = picked;
      });
      // You can add logic here to update the task due date
      // taskService.updateTaskDueDate(widget.task.id, picked);
    }
  }
}
