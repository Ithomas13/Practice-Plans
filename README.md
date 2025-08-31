# Golf Practice Planner

A SwiftUI-based iOS app that generates personalized golf practice plans based on real round performance.  

---

## Purpose

One of the biggest challenges in golf improvement is knowing **what to practice**. Many players believe one part of their game is holding them back, when in reality another area has a greater impact on their scores. This app was created to solve that problem for my DigiGolf students. By analyzing round statistics and breaking down performance into key areas—Putting, Chipping, Driving, Approach, and Course Management—the app provides data-driven feedback and allocates practice time where it’s most needed.  

Currently, the app is being tested by DigiGolf students in real training sessions, and will be launching on the **App Store soon**.  

The goal is simple: **practice efficiently, improve faster, and focus on what actually lowers scores.**

---

## Features

- **Round Input Form**  
  Enter stats from your round, including fairways hit, greens in regulation (GIR), putting breakdowns, chips within 6 feet, and scoring outcomes.

- **Performance Scoring**  
  Algorithms calculate a score out of 100 in five categories:
  - Putting  
  - Chipping  
  - Driving  
  - Approach  
  - Course Management  

- **Practice Duration Customization**  
  Specify how much time you have to practice, and the app automatically divides that time among categories based on performance deficiencies.

- **Tailored Practice Plan**  
  Each category includes recommended drills and suggestions, ensuring practice sessions are purposeful and targeted.

- **Progress Visualization**  
  Performance scores are displayed with progress bars for quick, intuitive feedback.

---

## How It Works

1. Enter your round statistics in the input form.  
2. Select your available practice duration (in minutes).  
3. Review your performance scores across all areas of the game.  
4. Get a customized practice plan that focuses more time on your weaker areas, along with drills to guide your practice session.  

---

## Technologies

- Swift 5  
- SwiftUI for declarative, modern user interfaces  
- State management with `@State` and data binding  
- Navigation using `NavigationView` and `NavigationLink`  

---

## Why It Matters

Efficient practice is the key to improvement. Instead of spending hours on a part of your game that feels weak but isn’t costing you strokes, this app helps golfers invest their practice time wisely. It reflects the DigiGolf philosophy: **focus on the data, not just the feeling.**

---

## Future Enhancements

- Historical round tracking to monitor improvement over time  
- Advanced analytics (strokes gained metrics)  
- Drill libraries with video demonstrations  
- Exportable practice reports  

The app is currently in **beta testing with DigiGolf students** and will be released on the **App Store soon**, with ongoing updates based on real-world feedback.  

---

## About DigiGolf

DigiGolf is dedicated to making golf improvement **accessible, data-driven, and efficient**. This app is one of the many tools designed to help golfers of all levels build smart practice habits and achieve lasting results.
