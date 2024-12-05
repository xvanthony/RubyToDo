# TODO WEB APP

A To-Do application built with Ruby on Rails. Manage tasks effortlessly with priority sorting and tagging in a clean and user-friendly interface.

Features

    Task Management: Add, edit, and delete tasks with ease.
    Priority Sorting: Tasks are automatically sorted by their priority level: High → Medium → Low.
    Tagging: Organize tasks using tags for better categorization and filtering.
    Filter by Tags: Quickly view tasks associated with specific tags.
    Completion Tracking: Mark tasks as completed or pending.

Installation
Prerequisites

    Ruby 3.x
    Rails 7.x
    SQLite3

Setup

    Clone the repository

Install dependencies:

bundle install

Set up the database:

rails db:create db:migrate

Run the server:

    rails server

    Open the app in your browser at http://localhost:3000.

Usage
Adding Tasks

    Click the "New Todo" button on the homepage.
    Fill out the task form with the Title, Priority, and optional Tags.
    Submit to save the task.

Tagging Tasks

    Add tags by entering comma-separated values in the "Tags" field during task creation or editing.

Sorting and Filtering

    Tasks are automatically sorted by priority and status.
    Use the tag filter on the homepage to view tasks related to a specific tag.

Created By

Anthony Roman, Christian Klindt, Darshil Sheth, Richwei Chea