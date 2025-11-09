##  Flutter Cart Logic (Using Provider)

###  Setup

* Wrap the **entire app** with `ChangeNotifierProvider` in `main.dart`.

  ```dart
  ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  );
  ```

---

###  Model (cart.dart)

* Store the data (like a list of shoes).
* Add logic to **add** or **remove** items.
* Use `notifyListeners()` to update UI automatically.

  ```dart
  class Cart extends ChangeNotifier {
    List<Shoe> userCart = [];

    void addItemToCart(Shoe shoe) {
      userCart.add(shoe);
      notifyListeners();
    }

    void removeItemFromCart(Shoe shoe) {
      userCart.remove(shoe);
      notifyListeners();
    }

    List<Shoe> getUserCart() => userCart;
  }
  ```

---

###  Accessing Data

#### 1. **To read data dynamically:**

Use `Consumer<Cart>` — it rebuilds when data changes.

```dart
Consumer<Cart>(
  builder: (context, value, child) {
    return Text('Items: ${value.getUserCart().length}');
  },
)
```

#### 2. **To perform actions:**

Use `Provider.of<Cart>(context, listen: false)` — it doesn’t rebuild UI.

```dart
Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
```

---

###  Example Flow

* `addItemToCart()` → adds shoe to cart list.
* `notifyListeners()` → tells Flutter UI to refresh.
* `Consumer<Cart>` → rebuilds cart page showing updated items.

---

###  Simple Rule

> Use **Consumer** when UI depends on data.
> Use **Provider.of(..., listen: false)** when performing actions.

---
