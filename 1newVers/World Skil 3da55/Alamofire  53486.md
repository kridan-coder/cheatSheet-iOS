# Alamofire Moment

Проверка наличия интернет-соединения:

```swift
NetworkReachabilityManager()?.isReachable ?? false
```

---

Простейший get-запрос:

```swift
AF.request(url, method: .get)
	.validate(statusCode: 200..<201)
	.response { response in
	switch response.result {
	case .success(let data):
		// handle success
	case .failure(let error):
		// handle failure
	}
 }
```

---

Чота посложнее (POST):

```swift
// Залепил headers
let httpHeaders: HTTPHeaders = ["Authorization" : "Bearer \(user.token!)",  
																"Accept": "application/json"]
// Залепил параметры
let parameters: Parameters = ["test": "123"]
// ИЛИ так
let parameters = MyCustomCodableShoot()
// В ЗАВИСИМОСТИ ОТ 

AF.request(...)
```