/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct AppPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var name: String?

    let columns = Array(repeating: GridItem(.flexible()), count: 4)

    let pickableItems = [
        "reminder",
        "remote",
        "safari",
        "setting",
        "sunset",
        "tunes",
        "university",
        "drawbrylife"
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(pickableItems, id: \.self) { item in
                    Button {
                        self.name = item
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(item)
                            .resizable()
                            .scaledToFit()
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.accentColor)
                            .ignoresSafeArea(.container, edges: .bottom)
                    }
                    .padding()
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct AppPicker_Previews: PreviewProvider {
    static var previews: some View {
        AppPicker(name: .constant(nil))
    }
}
