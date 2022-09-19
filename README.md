# SwiftUI - AnchorScrollView
<br />
<p align="center">
  <a>
    <img src="/Screenshot/ExampleScreen.gif" alt="action" width="300">
    <img src="/Screenshot/ImplementationScreen.gif" alt="action" width="300">
  </a>
</p>

## About AnchorScrollView

First of all, this view was inspired by the DoorDash app's Scrollview, while user scroll through certain content. 
The header's indicator will change to corresponding section. Specially thanks to [Ali Pourhadi](https://www.linkedin.com/in/alipourhadi/), who gave me the idea by using the @resultBuilder in order to create this elegant approach.

AnchorScrollView is consist by the AnchorScrollView and the ScrollViewContent which is the pure SwiftUI view. 
With AnchorScrollView it can simply create the ScrollView with the auto-selected header for better user experience.

Usage
```swift
struct ExampleView: View {
    @State private var isRedacted = true

    var body: some View {
        VStack {
            AnchorScrollView {
                // Put your own view with the desired header title
                ScrollViewContent(title: "|Breakfast|") {
                    BreakfastItemList()
                }

                ScrollViewContent(title: "|Fast Food|") {
                    FastFoodItemList()
                }

                ScrollViewContent(title: "|Cheezy-Up! Pizza|") {
                    PizzaItemList()
                }

                ScrollViewContent(title: "|Waterloo Housemade Breakfast|") {
                    BreakfastItemList()
                }
            }
        }
    }
}
 ```

## Acknowledgements
This project was inspired by following project and people

- DoorDash
- [Ali Pourhadi](https://www.linkedin.com/in/alipourhadi/)

