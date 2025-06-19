import Foundation
import UIKit

struct SettingSection {
    let title: String
    let items: [SettingItem]
}

struct SettingItem {
    let icon: UIImage?
    let title: String
    let action: (() -> Void)?
}
