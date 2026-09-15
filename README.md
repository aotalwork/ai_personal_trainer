# 🏋️ AI Personal Trainer

> A personalized fitness platform built with Ruby on Rails to help users assess their current state, follow tailored training plans, track progress, manage nutrition, and connect their routines with their calendar.

---

## ✨ Overview

**AI Personal Trainer** is a web application focused on personalized fitness and wellness management.

The platform brings together training plans, workouts, nutrition, assessments, progress tracking, and calendar integration in a single experience.

The goal is to provide users with a structured way to understand their current fitness situation, follow a personalized plan, and monitor their evolution over time.

---

## 🚀 Features

### 📝 Fitness Assessments

Users can complete assessments that provide the information needed to build and manage their fitness profile.

### 🏋️ Training Plans

Personalized plans can be viewed and followed through the application.

Each plan can contain structured workouts designed around the user's profile and goals.

### 💪 Workouts

Users can browse their available workouts and inspect individual workout details.

### 🥗 Nutrition

The application includes meal management as part of the user's fitness journey, bringing training and nutrition together.

### 📈 Progress Tracking

The dashboard provides access to the user's latest progress measurement, making it possible to monitor changes over time.

### 👤 Personal Profile

Users have their own fitness profile containing the information required by the application to personalize their experience.

### 📅 Google Calendar

Training-related planning can be connected with Google Calendar through the application's calendar integration.

### 📤 Exports

The application provides an export flow for user data and fitness information.

---

## 🧩 Application Flow

```text
                    ┌─────────────────────┐
                    │       User          │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Dashboard      │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
        ┌───────────┐    ┌───────────┐    ┌───────────┐
        │Assessment │    │   Plans   │    │ Progress  │
        └─────┬─────┘    └─────┬─────┘    └───────────┘
              │                │
              ▼                ▼
        ┌───────────┐    ┌───────────┐
        │  Profile  │    │ Workouts  │
        └───────────┘    └───────────┘
                               │
                               ▼
                         ┌───────────┐
                         │   Meals   │
                         └───────────┘

                         ┌───────────┐
                         │  Google   │
                         │ Calendar  │
                         └───────────┘
```

---

## 🛠️ Tech Stack

### Backend

* Ruby
* Ruby on Rails 8.1
* PostgreSQL
* Active Record
* Puma

### Frontend

* HTML / ERB
* Tailwind CSS
* Hotwire
* Turbo
* Stimulus
* Importmap

### Authentication

* `bcrypt`
* Rails authentication

### Infrastructure & Rails ecosystem

* Propshaft
* Solid Cache
* Solid Queue
* Solid Cable
* Bootsnap
* Kamal
* Thruster
* Active Storage

### Testing & Code Quality

* RSpec / Rails testing ecosystem
* Capybara
* Selenium WebDriver
* Brakeman
* Bundler Audit
* RuboCop
* Debug

---

## 🏗️ Architecture

The application follows a conventional Rails architecture with domain concepts represented through models, controllers, views, and application services.

```text
Browser
   │
   ▼
Rails Routes
   │
   ▼
Controllers
   │
   ├── Dashboard
   ├── Assessments
   ├── Plans
   ├── Workouts
   ├── Meals
   ├── Exports
   └── Google Calendar
   │
   ▼
Active Record Models
   │
   ▼
PostgreSQL
```

The main application areas exposed through the routes are:

```text
/profile
/assessments
/plans
/workouts
/meals
/exports
/google/calendar
```

---

## 📂 Project Structure

```text
app/
├── controllers/
├── models/
├── views/
├── services/
├── javascript/
└── helpers/

config/
├── routes.rb
├── database.yml
└── ...

db/
├── migrate/
└── schema.rb

test/
```

---

## 💻 Getting Started

### Prerequisites

Make sure you have installed:

* Ruby
* Bundler
* PostgreSQL
* Node.js if required by your local frontend tooling

### Clone the repository

```bash
git clone https://github.com/aotalwork/ai_personal_trainer.git
cd ai_personal_trainer
```

### Install dependencies

```bash
bundle install
```
