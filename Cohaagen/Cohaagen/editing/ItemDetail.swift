/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct ItemDetail: View {
    var symbolName: String
    
    @StateObject var dataModel = DataModel()
    @State private var alertPresented: Bool = false

    var body: some View {
        VStack {
            Text(symbolName)
                .font(.system(.largeTitle, design: .rounded))
            
            Image(symbolName)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
                .navigate(to: NavigationView {
                    GridView()
                }.environmentObject(dataModel).navigationViewStyle(.stack), when: $alertPresented)
                .onTapGesture {
                    self.alertPresented = true
                }
        }
        .padding()
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(symbolName: "magnifyingglass")
    }
}
