import SwiftUI

struct StarRatingView: View {
    var rating: Int
    
    private func starType(index: Int) -> String {
        return index < rating ? "star.fill" : "star"
    }

    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundColor(index < rating ? .yellow : .gray)
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 3)
}
