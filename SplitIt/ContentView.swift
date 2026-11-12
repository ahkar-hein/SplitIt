import SwiftUI

struct ContentView: View {
    @State private var groups = [
        ExpenseGroup(name: "Roommates", members: ["Ahkar", "Sam", "Mia"]),
        ExpenseGroup(name: "Vegas Trip", members: ["Ahkar", "Leo"])
    ]
    @State private var showingAddGroup = false
    @State private var newGroupName = ""
    @State private var showingNameError = false

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
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingAddGroup = true
                }
            }
            .sheet(isPresented: $showingAddGroup) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("New Group")
                        .font(.title2)
                        .bold()

                    TextField("Group name", text: $newGroupName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(showingNameError ? Color.red : Color.gray, lineWidth: 1)
                        )
                        .onChange(of: newGroupName) {
                            showingNameError = false
                        }

                    if showingNameError {
                        Text("You must enter a group name")
                            .font(.caption)
                            .foregroundStyle(.red)
                    }

                    HStack {
                        Button("Cancel", role: .cancel) {
                            newGroupName = ""
                            showingNameError = false
                            showingAddGroup = false
                        }
                        Spacer()
                        Button("Add") {
                            if !newGroupName.isEmpty {
                                groups.append(ExpenseGroup(name: newGroupName, members: []))
                                newGroupName = ""
                                showingNameError = false
                                showingAddGroup = false
                            } else {
                                showingNameError = true
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding()
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
}
