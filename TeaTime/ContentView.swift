import SwiftUI

struct ContentView: View {
    @State private var selectedRecipe: String = ""
    
    var body: some View {
        VStack {
            Spacer().frame(height: 50) // Space from the top
            Text("How do you like your tea?")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding(.bottom, 50)
            
            HStack(spacing: 50) {
                TeaButton(iconName: "MilkTeaIcon", recipe: "Tea Bag, Water, Milk, Sugar", selectedRecipe: $selectedRecipe)
                TeaButton(iconName: "BlackTeaIcon", recipe: "Tea Bag, Water, Sugar", selectedRecipe: $selectedRecipe)
                TeaButton(iconName: "CoffeeIcon", recipe: "Espresso, Milk, Sugar", selectedRecipe: $selectedRecipe)
            }
            .padding(.bottom, 50)
            
            Text(selectedRecipe)
                .font(.title2)
                .foregroundColor(.black)
            
            Spacer() // Push content to the top
        }
        .padding(.horizontal, 20)
        .background(Color(red: 0.8, green: 0.9, blue: 1.0).edgesIgnoringSafeArea(.all))
    }
}

struct TeaButton: View {
    var iconName: String
    var recipe: String
    @Binding var selectedRecipe: String
    
    var body: some View {
        Button(action: {
            selectedRecipe = recipe
        }) {
            VStack {
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 100)
                
                Text(iconName.replacingOccurrences(of: "Icon", with: ""))
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}

