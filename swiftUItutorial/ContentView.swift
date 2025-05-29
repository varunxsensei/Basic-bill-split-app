import SwiftUI


struct ContentView : View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages : [Int] = [10,15,20,25,0]
    
    var totalPerPerson : Double {
         let peopleCount = Double(numberOfPeople + 2)
         let tipSelection = Double(tipPercentage)
        let tipAmount = (checkAmount/100) * tipSelection
        let grandTotal = checkAmount + tipAmount
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("How much do you wanna pay?",value: $checkAmount,format:.currency(code:Locale.current.currency?.identifier ?? "USD"))
                    
                    Picker("Choose how many people will split",selection: $numberOfPeople){
                        ForEach(2..<100, id: \.self){
                            Text("\($0) people")
                        }
                    }
                   
                }
                
                Section("How much do you wanna tip?") {
                    Picker("Tip percentage",selection: $tipPercentage){
                        ForEach(tipPercentages,id:\.self){
                            Text($0,format:.percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("You have to pay") {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("BILL SPLIT")
        }
    }
    }


#Preview{
    ContentView()
}
