import SwiftUI

struct MyPlansView: View {

    @EnvironmentObject var vm: MyPlansViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {

                Text("My Plans")
                    .font(.largeTitle)
                    .bold()

                // فلتر مربوط بالـ ViewModel
                FilterTabs(selected: $vm.filter)

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(vm.filteredPlans) { plan in
                            
                            NavigationLink {
                                PlanDetailsView(plan: plan)
                            } label: {
                                PlanCardView(plan: plan)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
 #Preview {
    MyPlansView()
        .environmentObject(MyPlansViewModel())
}
