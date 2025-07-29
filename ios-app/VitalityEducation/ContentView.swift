import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }
                .tag(0)
            
            ServicesView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("服务")
                }
                .tag(1)
            
            TeamView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("团队")
                }
                .tag(2)
            
            ContactView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("咨询")
                }
                .tag(3)
        }
        .accentColor(Color("PrimaryColor"))
        .onAppear {
            // 设置TabBar外观
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemBackground
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    ContentView()
} 