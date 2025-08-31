import SwiftUI

struct GolfInputView: View {
    // Input fields for practice duration and round stats
    @State private var practiceDuration: String = "" // total practice time in minutes
    @State private var fairwaysHit: String = ""
    @State private var GIR: String = ""
    @State private var onePutt: String = ""
    @State private var twoPutts: String = ""
    @State private var threePutts: String = ""
    @State private var fourPutts: String = ""
    @State private var chipsWithin6Feet: String = ""
    @State private var pars: String = ""
    @State private var birdies: String = ""
    @State private var bogies: String = ""
    @State private var doubles: String = ""
    @State private var triples: String = ""

    // Navigation control
    @State private var navigateToResults: Bool = false

    var body: some View {
        NavigationView {
            Form {
                // Practice duration
                Section(header: Text("Practice Duration (in minutes)")) {
                    TextField("Enter total practice time", text: $practiceDuration)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif
                }

                // Driving & Approach
                Section(header: Text("Driving & Approach")) {
                    TextField("Fairways hit", text: $fairwaysHit)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("GIR", text: $GIR)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif
                }

                // Putting
                Section(header: Text("Putting Stats")) {
                    TextField("1 putt (outside of 3)", text: $onePutt)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("2 putts", text: $twoPutts)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("3 putts", text: $threePutts)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("4 putts", text: $fourPutts)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif
                }

                // Short game
                Section(header: Text("Short Game")) {
                    TextField("Chips within 6 feet", text: $chipsWithin6Feet)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif
                }

                // Scoring
                Section(header: Text("Scoring")) {
                    TextField("Pars", text: $pars)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("Birdies", text: $birdies)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("Bogies", text: $bogies)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("Doubles", text: $doubles)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif

                    TextField("Triples", text: $triples)
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif
                }

                // Navigation → Results
                Section {
                    NavigationLink(
                        destination: ResultsView(
                            practiceDuration: practiceDuration,
                            fairwaysHit: fairwaysHit,
                            GIR: GIR,
                            onePutt: onePutt,
                            twoPutts: twoPutts,
                            threePutts: threePutts,
                            fourPutts: fourPutts,
                            chipsWithin6Feet: chipsWithin6Feet,
                            pars: pars,
                            birdies: birdies,
                            bogies: bogies,
                            doubles: doubles,
                            triples: triples
                        ),
                        isActive: $navigateToResults
                    ) { EmptyView() }

                    Button(action: { navigateToResults = true }) {
                        Text("Calculate Scores and Generate Practice Plan")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Golf Round Data")
        }
    }
}

// Wrapper ContentView (entry point view)
struct ContentView: View {
    var body: some View {
        GolfInputView()
    }
}

#Preview {
    ContentView()
}
