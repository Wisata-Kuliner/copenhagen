/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct ImageItem: Identifiable {

    let id = UUID()
    let url: URL

}

extension ImageItem: Equatable {
    static func ==(lhs: ImageItem, rhs: ImageItem) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
