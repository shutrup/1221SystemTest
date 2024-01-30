import SwiftUI

struct ReviewsCell: View {
    var review: Review
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .foregroundColor(.white)
            .frame(width: 250, height: 150)
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0.0, y: 0.0)
            .overlay(
                VStack(alignment: .leading, spacing: 6) {
                    Text(review.name)
                        .font(.system(size: 16, weight: .bold))
                    
                    Text(review.date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    StarRatingView(rating: review.rating)
                    
                    Text(review.desc)
                        .font(.subheadline)
                }
                .padding(.leading, 14)
                .frame(maxWidth: .infinity, alignment: .leading)
            )
    }
}

#Preview {
    ReviewsCell(review: Review.FETCH_MOCK)
}
