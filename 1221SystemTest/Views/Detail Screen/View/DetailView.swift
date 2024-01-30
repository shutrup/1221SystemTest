import SwiftUI

struct DetailView: View {
    @StateObject var vm = DetailViewModel()
    
    var body: some View {
        contentView
    }
}

#Preview {
    MainTabBar()
}

// MARK: private properties

private extension DetailView {
    var contentView: some View {
        NavigationView {
            VStack {
                mainScrollView
                
                paidContent
            }
        }
    }
    
    var mainScrollView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Group {
                    priceButton
                    detailImage
                    rating
                }
                
                detailDescription
                
                featureList
                
                reviewsList
            }
            .toolbar {
                leadingToolBar
                trailingToolBar
            }
            .padding(.horizontal, 16)
        }
        .accentColor(.black)
    }
    
    var paidContent: some View {
        VStack {
            Picker("Выберите единицу измерения", selection: $vm.selectedUnit) {
                ForEach(vm.units, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.top, 6)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("55.9 ₽/кг")
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("199.0")
                        .foregroundColor(.secondary)
                        .strikethrough(true, color: .secondary)
                }
                
                Spacer()
                
                HStack {
                    Button("-") { vm.count -= 1}
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("\(vm.count) \(vm.selectedUnit)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("\(120 * vm.count) ₽")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    Button("+") { vm.count += 1 }
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .frame(width: 150, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                )
            }
            .padding(.vertical)
        }
        .padding(.horizontal, 16)
        .background(
                Color.white
                    .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: -5)
            )
    }
    
    var leadingToolBar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button { } label: { systemIcon("arrow.left") }
        }
    }
    
    var trailingToolBar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack {
                Button { } label: { systemIcon("doc.plaintext") }
                Button { } label: { systemIcon("square.and.arrow.up") }
                Button { } label: { systemIcon("heart") }
            }
        }
    }
    
    var priceButton: some View {
        Button {
            
        } label: {
            Text("Цена по карте")
                .font(.caption)
                .foregroundColor(.white)
                .padding(8)
                .background(Color.green.cornerRadius(6))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var detailImage: some View {
        Image(.tea)
            .resizable()
            .scaledToFill()
    }
    
    var rating: some View {
        HStack(spacing: 3) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 16, weight: .semibold))
            
            Text("4.1")
                .font(.system(size: 16, weight: .semibold))
            
            Divider()
            
            Text("19 отзывов")
                .foregroundColor(.secondary)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
            
            Image(.sale)
        }
    }
    
    var detailDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Добавка \("Липа") к чаю 200г")
                .font(.system(size: 36, weight: .bold))
            
            HStack {
                Image(.spain)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 20, height: 20)
                
                Text("Испания, Риоха")
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Описание")
                    .font(.system(size: 18, weight: .bold))
                
                Text("Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.")
                    .font(.subheadline)
            }
        }
    }
    
    var featureList: some View {
        VStack(spacing: 10) {
            Text("Основные характеристики")
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(Array(zip(vm.names.indices, vm.names)), id: \.0) { index, name in
                DetailFeatureCell(name: name, feature: vm.features[index])
            }
            
            Button { } label: {
                Text("Все характеристики")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        }
    }
    
    var reviewsList: some View {
        VStack {
            HStack {
                Text("Отзывы")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button { } label: {
                    Text("Все 152")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.green)
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Review.FETCH_MOCKS, id: \.self) { review in
                        ReviewsCell(review: review)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 5)
                    }
                }
            }
            
            Button { } label: {
                Text("Оставить отзыв")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.green)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2.5)
                            .foregroundColor(.green)
                    )
            }
        }
    }
}

// MARK: private func
private extension DetailView {
    func systemIcon(_ title: String) -> some View {
        Image(systemName: title)
            .foregroundColor(.green)
            .font(.system(size: 16, weight: .semibold))
    }
}
