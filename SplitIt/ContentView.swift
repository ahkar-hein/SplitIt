import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var groups = [
        ExpenseGroup(name: "Roommates", members: ["Ahkar", "Sam", "Mia"]),
        ExpenseGroup(name: "Vegas Trip", members: ["Ahkar", "Leo"])
        ]
    var body: some View {
            NavigationStack {
                List(groups) { group in
                    NavigationLink {
                        GroupDetailView(group: group)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(group.name)
                            Text("\(group.members.count) members")
                        }
                    }
                }
                .navigationTitle("Groups")
            }
        }
}

#Preview {
    ContentView()
}
