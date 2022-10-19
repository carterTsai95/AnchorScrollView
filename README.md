# SwiftUI - AnchorScrollView
<br />
<p align="center">
  <a>
    <img src="/Screenshot/ExampleScreen.gif" alt="action" width="300">
  </a>
</p>

## About AnchorScrollView

First of all, this view was inspired by the DoorDash app's Scrollview, while user scroll through certain content. 
The header's indicator will change to corresponding section. Specially thanks to [Ali Pourhadi](https://www.linkedin.com/in/alipourhadi/), who gave me the idea by using the @resultBuilder in order to create this elegant approach.

AnchorScrollView is consist by the AnchorScrollView and the ScrollViewContent which is the pure SwiftUI view. 
With AnchorScrollView it can simply create the ScrollView with the auto-selected header for better user experience.

## TODOs

- [ ] Make the tab bar ability to customize
- [ ] Using the View's extension to cleanup the each section(content)'s modifier in ScrollViewContainerBuilder
- [x] Finish remaining AnchorScrollView's initializer in order to support up to 10 contents.
- [ ] Check the accessibility
- [ ] Write the blogger for this view's inspiration and step to step tuturial

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

