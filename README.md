# 📰 News App

A modern Flutter news application powered by **NewsAPI**.  
Built with **GetX** for state management, **Dio** for API calls, and **Slivers** for a smooth scrolling experience.

## ✨ Features

- 🔹 Fetch latest news and top headlines using [NewsAPI](https://newsapi.org/)
- 🔹 Category-based filtering (`business`, `health`, `sports`, etc.)
- 🔹 Search functionality for finding news by keyword
- 🔹 Trending news carousel (horizontal scroll)
- 🔹 Latest news feed (vertical list)
- 🔹 Open full article inside the app with **WebView**
- 🔹 GetX powered reactive UI with `Rx<T>` observables
- 🔹 SliverAppBar for smooth scrolling with pinned headers


---

## 🚀 Tech Stack

- **Flutter** – Cross-platform framework
- **GetX** – State management, routing, dependency injection
- **Dio** – HTTP client for API calls
- **WebView Flutter** – Embedded browser for full articles

---

## 📸 Screenshots

*(Screenshots will be added here)*

## 🏗 Project Structure  

lib/
│── core/
│ └── api_service/
│ └── api_service.dart # Singleton Dio service
│ └── news_repository.dart # Repository layer for API calls
│
│── home_page/
│ ├── controller/
│ │ └── news_controller.dart # GetX Controller
│ ├── modules/
│ │ └── news.dart # Models for News API
│ └── views/
│ └── news_home.dart # UI with Slivers, categories, lists