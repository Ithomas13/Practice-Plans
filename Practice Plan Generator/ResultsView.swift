import SwiftUI

// Results screen: shows performance scores and a generated practice plan
struct ResultsView: View {
    // Data passed in from the input view
    let practiceDuration: String
    let fairwaysHit: String
    let GIR: String
    let onePutt: String
    let twoPutts: String
    let threePutts: String
    let fourPutts: String
    let chipsWithin6Feet: String
    let pars: String
    let birdies: String
    let bogies: String
    let doubles: String
    let triples: String
    
    // State variables for calculated scores
    @State private var puttingScore: Int = 0
    @State private var chippingScore: Int = 0
    @State private var drivingScore: Int = 0
    @State private var approachScore: Int = 0
    @State private var managementScore: Int = 0
    
    // The generated practice plan text
    @State private var practicePlan: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Section: Performance scores
                Text("Performance Scores")
                    .font(.title)
                
                ScoreView(title: "Putting", score: puttingScore)
                ScoreView(title: "Chipping", score: chippingScore)
                ScoreView(title: "Driving", score: drivingScore)
                ScoreView(title: "Approach", score: approachScore)
                ScoreView(title: "Course Management", score: managementScore)
                
                Divider().padding(.vertical, 10)
                
                // Section: Practice plan
                Text("Practice Plan")
                    .font(.title2)
                Text(practicePlan)
                    .padding()
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        // When view appears, run calculations
        .onAppear {
            calculateScores()
            generatePracticePlan()
        }
        .navigationTitle("Results")
    }
    
    // Convert input strings to Ints and compute category scores
    func calculateScores() {
        let fairways = Int(fairwaysHit) ?? 0
        let gir = Int(GIR) ?? 0
        let one = Int(onePutt) ?? 0
        let two = Int(twoPutts) ?? 0
        let three = Int(threePutts) ?? 0
        let four = Int(fourPutts) ?? 0
        let chips = Int(chipsWithin6Feet) ?? 0
        let birdiesVal = Int(birdies) ?? 0
        let bogiesVal = Int(bogies) ?? 0
        let doublesVal = Int(doubles) ?? 0
        let triplesVal = Int(triples) ?? 0
        
        // Example formulas
        puttingScore = max(0, 100 - ((one*2) + (two*3) + (three*5) + (four*8)))
        chippingScore = min(100, chips * 10)
        drivingScore = min(100, fairways * 10)
        approachScore = min(100, gir * 10)
        managementScore = max(0, 100 + (birdiesVal*5) - (bogiesVal*3) - (doublesVal*7) - (triplesVal*10))
    }
    
    // Generate a practice plan based on deficiencies
    func generatePracticePlan() {
        let totalMinutes = Int(practiceDuration) ?? 0
        guard totalMinutes > 0 else {
            practicePlan = "Please enter a valid practice duration."
            return
        }
        
        // Calculate deficiencies (points below 100)
        let puttingDef = max(0, 100 - puttingScore)
        let chippingDef = max(0, 100 - chippingScore)
        let drivingDef = max(0, 100 - drivingScore)
        let approachDef = max(0, 100 - approachScore)
        let managementDef = max(0, 100 - managementScore)
        let totalDef = puttingDef + chippingDef + drivingDef + approachDef + managementDef
        
        // Drill suggestions for each category
        let drills = [
            "Putting": "Ladder Drill: Place markers at different distances and practice lag putting.",
            "Chipping": "Target Practice: Chip toward cones or spots around the green.",
            "Driving": "Alignment Drill: Use alignment sticks to train consistent setup.",
            "Approach": "Distance Control: Hit to varying yardages and track dispersion.",
            "Course Management": "Visualization Drill: Simulate a hole and plan each shot."
        ]
        
        // If no deficiencies, all areas are solid
        guard totalDef > 0 else {
            practicePlan = "Excellent round! Focus on general warm-ups and light drills."
            return
        }
        
        // Allocate time based on deficiency proportion
        func allocatedTime(for deficiency: Int) -> Int {
            Int(round((Double(deficiency) / Double(totalDef)) * Double(totalMinutes)))
        }
        
        // Build the plan text
        practicePlan = """
        Putting (\(allocatedTime(for: puttingDef)) min): \(drills["Putting"]!)
        
        Chipping (\(allocatedTime(for: chippingDef)) min): \(drills["Chipping"]!)
        
        Driving (\(allocatedTime(for: drivingDef)) min): \(drills["Driving"]!)
        
        Approach (\(allocatedTime(for: approachDef)) min): \(drills["Approach"]!)
        
        Course Management (\(allocatedTime(for: managementDef)) min): \(drills["Course Management"]!)
        """
    }
}

// Helper view to show score + progress bar
struct ScoreView: View {
    let title: String
    let score: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title): \(score)")
                .font(.headline)
            ProgressView(value: Double(score), total: 100)
        }
    }
}
