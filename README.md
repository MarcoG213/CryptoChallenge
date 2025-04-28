# Marshall Code Challenge 🪙🚀

A clean, modular iOS app that displays live cryptocurrency prices and exchange rates,  
built with **SwiftUI**, **Swift Concurrency**, **Swift Packages**, and **modern best practices**.

---

## 📱 Features

- Live cryptocurrency prices displayed in **USD** and **SEK**
- Toggle between USD and SEK currencies
- Sort cryptocurrencies by:
  - **Current Value**
  - **24h Change**
  - **Market Capitalization**
- Tap on a coin to view a detailed screen with a generated **price trend chart**
- Live **Exchange Rate** display (1 USD ➔ SEK or 1 SEK ➔ USD)
- Exchange rate auto-refreshes every few seconds
- Clean modular project structure using **Swift Packages**

---

## 🛠 Architecture

- **MVVM** + **Modular Architecture** (Swift Packages)
- **Swift Concurrency (async/await)** for network calls and background tasks
- **Strategy Pattern** for data fetching abstraction
- **Service Layer** for shared state and background polling
- **Reusable UI Components** (DesignSystem module)
- **Clean separation** of API Models and Domain Models
- **Environment Injection** using `@Environment`
- **Observation Framework** (`@Observable`) for ViewModel state

---

## 📦 Modules

- **Core** Utility extensions and general-purpose helpers.
- **Domain** Business logic models and protocols.
- **NetworkLayer** Reusable network client based on URLSession, with fetch support for decoding API responses safely.
- **API** Concrete services that fetch crypto prices and exchange rates (e.g., WazirXCryptoPriceStrategy, OpenERExchangeRateStrategy).
- **DesignSystem** Shared reusable UI components (buttons, cards, list elements) and assets (icons, colors) for consistent design across views.

---

## 🚀 Requirements

- **Xcode 16.2+**
- **iOS 18+**
- **Swift 5.9+**
- **Swift Charts Framework** (iOS 16+)

---

## 🔥 Current Screens

- **SplashScreen** (Initial load + transition)
- **CryptoListScreen** (Main listing + sorting)
- **CryptoDetailScreen** (Coin details + trend chart)
- **ExchangeRateScreen** (Live exchange rates USD/SEK)

---

## 🧪 Testing

- Unit tests on:
- JSON parsing
- API responses
- Fixtures with mock JSON

---

## 🧩 APIs Used

- [WazirX API](https://api.wazirx.com/sapi/v1/tickers/24hr) – Cryptocurrency prices
- [OpenERAPI](https://open.er-api.com/) – Exchange rates (USD ⇆ SEK)

---

## 🙏 Acknowledgements

- Crypto icons sourced from public repositories
- APIs from open free sources (no commercial usage)

---

## 🏆 Highlights

- Modular Swift Packages
- Task-based async networking
- Auto-refresh with Task management
- Professional asset handling and clean code

---
