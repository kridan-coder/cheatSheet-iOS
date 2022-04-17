# Custom Pager

```swift
TabView(selection: $currentPage.animation()) {
	FirstView().tag(1)
  FirstView().tag(2)
  FirstView().tag(3)
}
.tabViewStyle(.page) // main idea
// optional \/
.overlay(CustomIndexView(numberOfPages: 3, 
												 currentPage: currentPage),
				 alignment: .bottom)
```

Custom Index View (не стоит затраченного времени):

```swift
struct CustomIndexView: View {
  var numberOfPages: Int
  let currentPage: Int
    var body: some View {
      HStack(spacing: 10) {
        ForEach(0..<numberOfPages) { index in
          Capsule()
            .foregroundColor(index == currentPage ? Color("Blue") : Color("LightGray"))
            .frame(width: index == currentPage ? 20 : 6)
        }
      }
      .frame(height: 6)
    }
}
```