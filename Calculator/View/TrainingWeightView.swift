import SwiftUI

struct TrainingWeightView: View {
    @State var selectedTraining = trainings[0]
    @StateObject private var viewModel = TrainingWeightViewModel()
    @ObservedObject var calculatorViewModel = CalculatorViewModel()

    @State var isPresented: Bool = false
    @State var activeInputIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker("Training", selection: $selectedTraining) {
                        ForEach(trainings, id: \.self) { training in
                            Text(training)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .tag(training)
                        }
                    }
                    .tint(.orange)
                    Spacer()
                }
                .padding(.leading, 5)
                Text("input_your_one_rm")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .foregroundColor(.primaryOrange)
                    .padding(.bottom, 50)

                TextField("0", text: $calculatorViewModel.displays[0])
                    .frame(width: 200)
                    .fontWeight(.bold)
                    .font(.system(size: 48))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("kg")
                    .fontWeight(.regular)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 70)
                    .padding(.top, -20)
                
                Button(action: {
                    if !calculatorViewModel.displays[0].isEmpty {
                        viewModel.calculateTrainingWeights()
                        isPresented.toggle()
                    }
                }) {
                    Text("Details")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .padding()
                        .background(calculatorViewModel.displays[0].isEmpty ? Color.secondary : Color.primaryOrange)
                        .cornerRadius(12)
                }
                .padding()

                CalculatorButtonsView(calculatorViewModel: calculatorViewModel, activeInputIndex: $activeInputIndex)
                
            }
            .sheet(isPresented: $isPresented) {
                TrainingWeightResult(viewModel: viewModel)
                    .background(.secondaryGrey)
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                    .presentationDetents([.fraction(0.5)])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Text("Rep Max")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
            }
        }
    }
}

#Preview {
    TrainingWeightView()
}

struct TrainingWeightResult: View {
    @ObservedObject var viewModel: TrainingWeightViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                Text("Repetition %")
                    .font(.system(size: 19))
                    .fontWeight(.medium)
                VStack {
                    ForEach(viewModel.trainingWeights.indices, id: \.self) { index in
                        HStack{
                            HStack{
                                Image(systemName: "percent")
                                    .resizable()
                                    .foregroundColor(.primaryOrange)
                                    .frame(width: 15, height: 15)
                                Text("\(viewModel.percentages[index], specifier: "%.0f") %")
                            }
                            Spacer()
                            HStack{
                                Image(systemName: "scalemass")
                                    .resizable()
                                    .foregroundColor(.primaryOrange)
                                    .frame(width: 15, height: 15)
                                Text("\(viewModel.trainingWeights[index], specifier: "%.0f") kg")
                            }
                            Spacer()
                            HStack{
                                Image(systemName: "flame")
                                    .resizable()
                                    .foregroundColor(.primaryOrange)
                                    .frame(width: 15, height: 15)
                                Text("\(viewModel.repetition[index], specifier: "%.0f") Rep")
                            }
                            Spacer()
                            HStack{
                                Image(systemName: "figure.walk.circle")
                                    .resizable()
                                    .foregroundColor(.primaryOrange)
                                    .frame(width: 15, height: 15)
                                Text("Muscle")
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(.white)
                        .cornerRadius(25)
                        .font(.system(size: 15))
                    }
                }
                .padding(.top, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(.gray),
                    alignment: .top
                )
            }
            .background(.secondaryGrey)
        .padding()
        }

    }
}
