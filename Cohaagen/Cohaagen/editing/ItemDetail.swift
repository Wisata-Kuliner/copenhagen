/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct IdentifiableView: Identifiable {
    let view: AnyView
    let id = UUID()
}

struct ItemDetail: View {
    var symbolName: String
    
    @StateObject var dataModel = DataModel()
    @State private var alertPresented: Bool = false
    @State private var title: String = ""
    @State var appView: AnyView
    
    @State private var nextView: IdentifiableView? = nil

    var body: some View {
        VStack {
            
            Text(self.title)
                .font(.system(.largeTitle, design: .rounded))
            
            NavigationLink(destination: self.appView.environmentObject(dataModel)) {
                Image(symbolName)
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.accentColor)
            }
            
        }
        .padding()
        .onAppear() {
            checkSymbol()
            checkView()
        }
        .fullScreenCover(item: self.$nextView, onDismiss: { nextView = nil}) { view in
            view.view
        }
        
    }
    
    func checkSymbol() {
        switch (symbolName) {
        case "store":
            self.title = "App Store"
        default:
            self.title = symbolName
        }
    }
    
    func checkView() {
        switch (symbolName) {
        case "drawbrylife":
            self.appView = AnyView(DrawerView())
            self.nextView = IdentifiableView(view: AnyView(DrawerView()))
        default:
            self.appView = AnyView(GridView())
        }
    }
    
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(symbolName: "magnifyingglass", appView: AnyView(GridView()))
    }
}
