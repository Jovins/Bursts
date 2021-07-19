# Bursts 🔥
A Funny Framework is showing alerts, Have been Adapting Swift and SwiftUI

----

[![CI](https://img.shields.io/badge/Bursts-pasing-success.svg)](https://github.com/jovins/Bursts/actions) [![CI](https://img.shields.io/badge/SwiftUI-Adapting-blueviolet.svg)]() [![CI](https://img.shields.io/badge/Swift-5.1-important.svg)]()[![CI](https://img.shields.io/badge/License-MIT-red.svg)]()

### Features

- iOS 10+
- Can be used in UIKit and SwiftUI applications
- Light/Dark modes
- Interactive dismissal
- Queue to show consecutive bursts
- Support dynamic font sizing
- Support announcing title and subtitle via VoiceOver
- Show from top or bottom of screen

----

### Installation

+ CocoaPods

```
use_frameworks!
platform :ios, '10.0'

pop 'Bursts'
```

----

### Usage

+ Create a Bursts Example

```swift
// 1.title
let burst: Burst = "Title Only"
// 2.title Only
let burst = Burst(title: "Title Only")
// 3.set title and subtitle
let burst = burst(title: "Title", subtitle: "Subtitle")
// 4.set title、subtitle and animator duration
let burst = burst(title: "Title", subtitle: "Subtitle", duration: 5.0)
//  init Bursts
let burst = Burst(
    title: "Title",
    subtitle: "Subtitle",
    icon: UIImage(systemName: "star.fill"),
    action: .init {
        print("Burst tapped")
        Bursts.hide()
    },
    position: .top,
    duration: 2.0,
    accessibility: "Alert: Title, Subtitle"
)
```

+ Show Bursts

```swift
// only title
Bursts.show("Title")
// Bursts
Bursts.show(burst)
```

+ SwiftUI

```swift
import SwiftUI
import Bursts

struct ContentView: View {
  
    var body: some View {
        Button("Show Bursts") {
            Drops.show(burst)
        }
    }
}
```

+ Swift UIKit

```swift
import UIKit
import Bursts

class ViewController: UIViewController {

    func showDrop() {
        Bursts.show("Title")
    }
}
```

----

### Example Projects

- Run the `SwiftUIExample` target to see how Bursts works in SwiftUI applications.
- Run the `UIKitExample` target to see how Bursts works in UIKit applications.

----

### Author

jovinscoder@gmail.com

### License

- `Bursts` is available under the MIT license. See the LICENSE file for more info.

