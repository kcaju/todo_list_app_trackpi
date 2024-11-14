# todo_list_app

To-Do List App Overview
The To-Do List app is a simple yet powerful productivity tool designed to help users manage their tasks effectively. With a user-friendly interface, this app allows users to add, update, and track their tasks. It provides the flexibility to categorize tasks based on their status, priority, and completion. The app leverages Provider for state management and SQLite (via sqflite package) for persistent local storage, ensuring that tasks are saved even after the app is closed or the device is restarted.

Key Features and Functionality
Task Management:

Add New Tasks: Users can easily add new tasks by entering a title, description, priority, and selecting the status of the task (e.g., Pending, Completed).
Priority Level: Tasks can be categorized with different priority levels (e.g., Low, Medium, High) for better organization.
Status & Checkboxes: Tasks have a status field (Pending/Completed), and users can toggle the status using checkboxes. When a user marks a task as completed, the checkbox gets checked, and the task's status updates accordingly.
Task Screens:

All Tasks Screen: Displays a list of all the tasks created by the user, both completed and pending.
Completed Tasks Screen: Shows only the tasks that have been marked as completed. This helps users track finished tasks separately.
Pending Tasks Screen: Displays the tasks that are still pending, making it easy for users to focus on unfinished tasks.
Task Operations:

Long Press to Delete: Users can long-press any task on the task list to delete it. This is a simple yet efficient way to remove tasks that are no longer needed.
Edit Task: Users can tap on a task to edit its details, such as updating the title, description, priority, or changing the status.
State Management (Provider):

Provider is used to manage the state of the tasks throughout the app. This ensures that the task data remains consistent and updates the UI efficiently when a task is added, modified, or deleted.
Local Storage (SQLite):

The app uses SQLite (via the sqflite package) to store tasks locally. All task data, including titles, descriptions, priorities, and statuses, are saved in a local database. This ensures that tasks are persisted across app restarts.
Task Synchronization: When the app is reopened, all the tasks (including completed and pending ones) are fetched from the SQLite database and displayed in the respective screens.

App Flow Overview
Home Screen (All Tasks):

The user starts at the All Tasks Screen, which shows a list of tasks. Each task displays its title, description, priority, and status (via a checkbox).
The Add Task button is prominently displayed, allowing users to quickly create new tasks.
Adding a Task:

When the user presses the Add Task button, a form screen appears where they can enter the task’s title, description, priority, and select the status.
After filling in the details, users press Save, which saves the task to the SQLite database and updates the task list in the UI.
Viewing and Editing Tasks:

Each task card in the list can be tapped to view its full details, and from there, users can edit any aspect of the task (title, description, priority, or status).
The task's checkbox can be ticked to mark it as completed or unchecked to mark it as pending.
Marking Task as Complete:

Users can easily mark a task as completed by checking the checkbox next to the task. This action updates the task's status in the database.
Once marked as completed, the task is also moved to the Completed Tasks Screen.
Viewing Pending and Completed Tasks:

Pending Tasks Screen: Displays all tasks with a pending status, helping users focus on what needs to be done.
Completed Tasks Screen: Shows all tasks marked as completed, offering a sense of accomplishment and progress.
Deleting a Task:

Users can long-press on any task in the task list to delete it. This triggers a confirmation before the task is removed from both the UI and the SQLite database.

Technical Details
State Management (Provider):

The app uses Provider to manage the state of tasks across different screens (All, Pending, Completed). This ensures that when a task is added, updated, or deleted, the UI automatically reflects the changes without the need for complex manual updates.
Persistent Storage (SQLite):

SQLite is used to store the task data locally, ensuring persistence. The app uses the sqflite package for database operations such as adding, retrieving, updating, and deleting tasks.
Task data is saved in a table with columns for id, title, description, priority, and status. When a task is updated or deleted, the database is synchronized accordingly.
UI/UX:

The app features an intuitive design with a simple list layout, allowing users to easily manage tasks.
The task list is updated dynamically as tasks are added, edited, or deleted, providing a smooth and responsive user experience.
