<img width="278" height="587" alt="image" src="https://github.com/user-attachments/assets/40601c91-3b40-4de9-a94c-22ce2e259704" />
<img width="276" height="587" alt="image" src="https://github.com/user-attachments/assets/1f316173-2670-4282-a87f-8eff65cb0cf5" />
<img width="275" height="580" alt="image" src="https://github.com/user-attachments/assets/6c1810ef-7cac-4ffa-8eea-22dfbd40cb54" />
<img width="275" height="580" alt="image" src="https://github.com/user-attachments/assets/acfc95c4-9014-4be3-ba3c-fd48f516e8ca" />
<img width="273" height="575" alt="image" src="https://github.com/user-attachments/assets/20b756af-0db8-4295-800f-cc0dd2f4d92a" />
<img width="273" height="581" alt="image" src="https://github.com/user-attachments/assets/293e69d7-d486-4ec0-aca3-2fb2d15ed655" />
<img width="275" height="584" alt="image" src="https://github.com/user-attachments/assets/7af79392-6932-4e2a-bd6c-2ad83a64cf5a" />
<img width="275" height="580" alt="image" src="https://github.com/user-attachments/assets/891d4688-5980-4e14-b630-65528c2fc3ad" />
<img width="272" height="583" alt="image" src="https://github.com/user-attachments/assets/65e87477-4c94-4897-b0b3-fa823b82e89d" />
<img width="275" height="589" alt="image" src="https://github.com/user-attachments/assets/045c8fbc-cfb2-48dc-bdfa-eb118b94dff8" />
<img width="274" height="587" alt="image" src="https://github.com/user-attachments/assets/fe7e6684-3ade-4937-8a79-77881ca9b57a" />
<img width="274" height="588" alt="image" src="https://github.com/user-attachments/assets/fe502cd7-25b4-4077-87c2-108b81df7ce8" />
<img width="273" height="589" alt="image" src="https://github.com/user-attachments/assets/f5221329-6db1-4797-98e8-5a673c679719" />
<img width="276" height="589" alt="image" src="https://github.com/user-attachments/assets/0e5a39ef-27a1-4d5c-bc42-6786276ee689" />
<img width="272" height="585" alt="image" src="https://github.com/user-attachments/assets/08c53f5b-673d-4655-b170-22cb171905e1" />
<img width="272" height="584" alt="image" src="https://github.com/user-attachments/assets/2e7b64ca-6981-42bf-bb0e-b55bbdfa1cfb" />
<img width="270" height="589" alt="image" src="https://github.com/user-attachments/assets/22001d74-47b9-428a-a03f-abfa108b9c16" />
<img width="275" height="586" alt="image" src="https://github.com/user-attachments/assets/a1ae1999-f6de-413b-9244-6a97c48cb713" />





# 📱 E-Commerce App

**E-Commerce App** is a fully featured Flutter application for online shopping, designed to deliver a smooth, fast, and visually appealing user experience across all screen sizes.  
It combines **Clean Architecture (3 Layers)** with **MVVM** to ensure a maintainable and scalable codebase, along with advanced features like secure token storage, state management with BLoC, offline capabilities, and connectivity handling.

---

## 🚀 Features

### 🎨 Fully Responsive Design
- Implemented with **`flutter_screenutil`** to ensure smooth performance on all devices and screen sizes.
- Supports both **portrait** and **landscape** orientations.

### ⚙️ Professional State Management with BLoC
- Used **`flutter_bloc`** and **`bloc`** to organize data flow and separate UI from business logic.

### 🏗 Clean Architecture with MVVM
- Applied a **three-layer architecture**: Presentation – Domain – Data.
- Clear separation between UI and logic for better **testability** and **flexibility**.

### 🖼 Image Caching for Better Performance
- Integrated **`cached_network_image`** to display product images quickly, even in low-connectivity environments.

### 🛒 Product & Offer Carousels
- Used **`carousel_slider_plus`** for attractive and interactive display of featured products and promotions.

### 👆 Interactive Product Actions
- Integrated **`flutter_slidable`** to enable swipe actions like adding to favorites or removing from the cart.

### 🔐 Save Token
- Stored **authentication token** locally using **`shared_preferences`** to keep user sessions active between launches.

### 🌐 Robust API Integration
- Used **`dio`** for efficient network calls.
- Applied **`dartz`** for functional-style handling of **success** and **failure** using `Either`.

### 🧩 Dependency Injection
- Implemented **`injectable`** and **`get_it`** for clean, testable, and decoupled object creation.

### 📡 Connectivity Awareness
- Integrated **`connectivity_plus`** to monitor internet status and notify the user when offline.

### ✨ Smooth Animations & Engaging UI
- Used **`lottie`** animations for a professional and modern look.

### 🔔 Stylish Toast Notifications
- Implemented **`fluttertoast`** for quick success/error messages.

### 📄 Expandable Text for Product Descriptions
- Used **`readmore`** for managing long product descriptions.

---

## 🛠 Technical Highlights

- **Modular File Structure** for clean organization and scalability.
- **Single Responsibility Principle** applied across most components.
- **Separation of Concerns** between UI, business logic, and data.
- **Offline-First Approach** by storing essential data locally and syncing when online.
- **Highly Scalable Architecture** ready for future integrations like payment gateways or order tracking.

