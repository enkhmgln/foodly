# Foodly

**Foodly** is a Mongolian alternative to [Yuka](https://yuka.io/): a mobile app that lets users scan food and cosmetic products, see their impact on health, and discover healthier alternatives.

---

## What It Does (Like Yuka)

- **Scan products** — By barcode or manual search (food & cosmetics).
- **Health impact** — Highlights additives, allergens, excess salt/sugar/fat, and (for cosmetics) irritants or endocrine disruptors.
- **Simple score** — Easy-to-understand grade or score (e.g. Bad / Fair / Good / Excellent).
- **Better alternatives** — Suggests similar products with better scores when available.

The app is built to stay **independent**: no brand influence on scores or recommendations.

---

## Project Layout

| Folder   | Stack        | Role                          |
|----------|--------------|-------------------------------|
| **mobile** | Flutter      | iOS & Android app (Nexus Infinity) |
| **api**    | Spring Boot  | Backend REST API, PostgreSQL  |

- **Company:** Nexus Infinity  
- **Product:** Foodly  

---

## MVP for v1

Goal: **minimal usable version** so users can scan and get a basic health view.

### In scope (v1)

1. **Product lookup**
   - Scan barcode or search by name.
   - Show product name, brand, category (food / cosmetic).

2. **Basic health info**
   - Simple score or grade (e.g. 0–100 or Bad → Excellent).
   - Short summary: e.g. “High in sugar”, “Contains additive E…”, “No major concerns”.

3. **Product database**
   - Backend (API + PostgreSQL) stores products with barcode, name, brand, category, score, and summary.
   - Seed a small set of Mongolian/common products for testing.

4. **Mobile app**
   - Scan screen (barcode).
   - Search screen (by name).
   - Product detail screen (score + summary).
   - Basic navigation and loading/error states.

### Out of scope for v1

- User accounts, login, favorites.
- Cosmetic-specific deep analysis (ingredient-level warnings).
- Recommendations / “better alternatives” (can be v2).
- Offline mode or advanced caching.
- Multiple languages (v1 can be Mongolian or English only).

---

## How to Run

- **API:** `cd api && make run` (or `./mvnw spring-boot:run`). Needs PostgreSQL and a `foodly` database.
- **Mobile:** `cd mobile && flutter run`. See `mobile/README.md` for setup.

---

## Summary

Foodly is a **Yuka-style** app for the **Mongolian market**: scan products, get a simple health score and summary. **v1 MVP** = barcode/search → product → score + short health summary, with mobile app + Spring Boot API and PostgreSQL.
