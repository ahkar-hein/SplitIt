//
//  GroupDetailView.swift
//  SplitIt
//
//  Created by Ahkar Hein on 11/10/26.
//

import SwiftUI

struct GroupDetailView: View {
    let group: ExpenseGroup
    
    var body: some View {
        List(group.members, id: \.self) { member in Text(member)
        }
        .navigationTitle(group.name)
    }
}

#Preview {
    NavigationStack{
        GroupDetailView(group: ExpenseGroup(name: "Vegas Trip", members: ["Ahkar", "Leo"]))
    }
}
