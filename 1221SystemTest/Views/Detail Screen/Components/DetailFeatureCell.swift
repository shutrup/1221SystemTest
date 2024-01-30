import SwiftUI

struct DetailFeatureCell: View {
    var name: String
    var feature: String
    
    var body: some View {
        HStack {
            Text(name)
            
            Spacer(minLength: 0)
            
            Text(String(repeating: ".", count: 80))
                .lineLimit(1)
                .truncationMode(.tail)
                .minimumScaleFactor(0.01)
            
            Text(feature)
        }
        .font(.subheadline)
    }
}

#Preview {
    DetailFeatureCell(name: "Производство", feature: "Россия, Краснодарский край")
}
