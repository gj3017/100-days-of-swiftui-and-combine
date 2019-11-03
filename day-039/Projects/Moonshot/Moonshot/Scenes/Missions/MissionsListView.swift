//
//  MissionsListView.swift
//  Moonshot
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct MissionsListView: View {
    @EnvironmentObject var store: AppStore
}


// MARK: - Computeds
extension MissionsListView {
    var missions: [Mission] { store.state.missionsState.missions }
}


// MARK: - Body
extension MissionsListView {

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionDetailsContainerView(mission: mission)) {
                    MissionsListItemRow(mission: mission)
                }
            }
            .navigationBarTitle("Missions")
        }
    }
}


// MARK: - View Variables
extension MissionsListView {


}



// MARK: - Preview
struct MissionsListView_Previews: PreviewProvider {

    static var previews: some View {
        let store = SampleStore.default
        
        return MissionsListView()
            .environmentObject(store)
            .accentColor(.purple)
            .onAppear {
                store.send(MissionSideEffect.loadMissions)
            }
    }
}