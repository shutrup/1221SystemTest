import SwiftUI

struct MainTabBar: View {
    
    var body: some View {
        TabView {
            DetailView()
                .tabItem { Label("Главная", systemImage: "tree.circle.fill") }
            
            Text("Каталог")
                .tabItem { Label("Каталог", systemImage: "circle.grid.2x2") }
            
            Text("Корзина")
                .tabItem { Label("Корзина", systemImage: "cart.fill") }
            
            Text("Профиль")
                .tabItem { Label("Профиль", systemImage: "person") }
        }
        .accentColor(.green)
    }
}

#Preview {
    MainTabBar()
}
