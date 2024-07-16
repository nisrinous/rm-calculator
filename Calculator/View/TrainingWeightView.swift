import SwiftUI

struct TrainingWeightView: View {
    @State var selectedTraining = trainings[0]
    @StateObject private var viewModel = TrainingWeightViewModel()
    @ObservedObject var calculatorViewModel = CalculatorViewModel()

    @State var isPresented: Bool = false
    @State var activeInputIndex = 0
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    var body: some View {
        NavigationView {
            VStack {
                Divider()
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
                Text("Input Your 1RM")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .foregroundColor(.primaryOrange)
                    .padding(.bottom, 50)

                TextField("0", text: $calculatorViewModel.displays[0])
                    .frame(width: 200)
                    .foregroundColor(.primaryOrange)
                    .fontWeight(.bold)
                    .font(.system(size: 48))
                    .multilineTextAlignment(.center)
                    .padding()
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                    .onChange(of: calculatorViewModel.displays[0]) {
                        self.hideKeyboard()
                    }
                
                Text("kg")
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, 70)
                    .padding(.top, -20)
                
                Button(action: {
                    if !calculatorViewModel.displays[0].isEmpty {
                        self.hideKeyboard()
                        viewModel.oneRepMax = calculatorViewModel.displays[0]
                        viewModel.calculateTrainingWeights()
                        isPresented.toggle()
                    }
                }) {
                    Text("View % 1RM")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding()
                        .background(calculatorViewModel.displays[0].isEmpty ? Color.secondary : Color.primaryOrange)
                        .cornerRadius(12)
                }
                
                Spacer()

                CalculatorButtonsView(calculatorViewModel: calculatorViewModel, activeInputIndex: $activeInputIndex)
                Spacer()
            }
            .sheet(isPresented: $isPresented) {
                TrainingWeightResult(viewModel: viewModel)
                    .background(.secondaryGrey)
//                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
//                    .presentationDetents([.fraction(0.5)])
                    .presentationDetents([.fraction(0.5), .medium, .large])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Rep Max")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
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
                Text("% 1RM")
                    .font(.system(size: 19))
                    .fontWeight(.medium)
                VStack {
                    VStack(alignment:.leading){
                        Text("Strength")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        VStack {
                            SubList(viewModel: viewModel, indices: [10,9])
                        }
                        .padding()
                        .background(.greyTable)
                        .cornerRadius(15)
                            
                    }
                    VStack(alignment:.leading){
                        Text("Power")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        VStack {
                            SubList(viewModel: viewModel, indices: [8])
                        }
                        .padding()
                        .background(.greyTable)
                        .cornerRadius(15)
                    }
                    VStack(alignment:.leading){
                        Text("Muscle")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        VStack {
                            SubList(viewModel: viewModel, indices: [7,6])
                        }
                        .padding()
                        .background(.greyTable)
                        .cornerRadius(15)
                    }
                    VStack(alignment:.leading){
                        Text("Endurance")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        VStack {
                            SubList(viewModel: viewModel, indices: [5,4])
                        }
                        .padding()
                        .background(.greyTable)
                        .cornerRadius(15)
                    }
                    VStack(alignment:.leading){
                        Text("Explosive Power")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        VStack {
                            SubList(viewModel: viewModel, indices: [3,2,1,0])
                        }
                        .padding()
                        .background(.greyTable)
                        .cornerRadius(15)
                    }
                }
                .padding(.top, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(.gray),
                    alignment: .top
                )
                Spacer()
            }
            .padding()
        }
    }
}

struct SubList: View {
    @ObservedObject var viewModel: TrainingWeightViewModel
    let indices:[Int]
    
    var body: some View {
        ForEach(indices, id: \.self) { index in
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "percent")
                        .resizable()
                        .foregroundColor(.primaryOrange)
                        .frame(width: 15, height: 15)
                    Text("\(viewModel.percentages[index], specifier: "%.0f") %")
                }
                Spacer()
                HStack {
                    Image(systemName: "scalemass")
                        .resizable()
                        .foregroundColor(.primaryOrange)
                        .frame(width: 15, height: 15)
                    Text("\(viewModel.trainingWeights[index], specifier: "%.0f") kg")
                }
                Spacer()
                HStack {
                    Image(systemName: "flame")
                        .resizable()
                        .foregroundColor(.primaryOrange)
                        .frame(width: 15, height: 15)
                    Text("\(viewModel.repetition[index], specifier: "%.0f") Rep")
                }
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(Color.secondaryGrey)
            .cornerRadius(25)
            .font(.system(size: 15))
        }
    }
}
