/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct DetailView: View {
    let item: ImageItem
    
    let persistenceController = PersistenceController.shared
    
    @State private var alertPresented: Bool = false

    var body: some View {
        AsyncImage(url: item.url) { image in
            image
                .resizable()
                .scaledToFit()
                .navigate(to: ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext), when: $alertPresented)
                .onTapGesture {
                    self.alertPresented = true
                }
        } placeholder: {
            ProgressView()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mushy1", withExtension: "jpg") {
            DetailView(item: ImageItem(url: url))
        }
    }
}
