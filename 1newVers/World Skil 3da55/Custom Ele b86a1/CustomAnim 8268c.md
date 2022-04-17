# CustomAnimation

```swift
CustomView()
.gesture(DragGesture()
				 .onChanged({ value in
		self.x[i] = value.translation.width
		self.degree[i] = 8
 })
				 .onEnded({ value in 
		self.degree[i] = 15
}))
```