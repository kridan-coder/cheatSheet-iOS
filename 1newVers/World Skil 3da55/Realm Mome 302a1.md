# Realm Moment

```swift
pod 'RealmSwift'
...
import RealmSwift
...
@ObservedResults(RealmShoot.self) var shoots
...
class RealmShoot: Object {
	@objc dynamic var word = ""
	var definitions = RealmSwift.List<RealmDefinition>()
	@objc dynamic var RealmApple: RealmApple? = nil
}
...
let realm = try! Realm()
try! realm.write {
	let realmObj = RealmShoot()
	...
	realm.add(realmObj, update: .all)
}
...
let result = realm.objects(RealmShoot.self).first { $0.word == word }
```