# Swift Tables

About 180 pages into the Swift Programming Language iBook, I got a little bored and wanted to throw myself into a pool of Swift already. I wanted to do this the same way I did with Objective-C all those years back: by building a good ol' `UITableView` setup. This setup is good because it has a lot of the basics: 
- Setting up and manipulating arrays
- Hooking up `IBOutlet`s and `IBAction`s
- Using Storyboards
- Conforming to existing protocols
- Setting up and conforming to your own protocols
- Displaying alerts

With the exception of touching into persistent storage, the above is arguably enough to build some very basic functional apps. This was the absolute first time I coded anything in Swift so I took some notes along the way.

## Things I Learnt the First Time I Coded in Swift

### General

- There are no more `@`s in front of strings. No more `;`s at the end of lines. No `.h` and `.m` files, just a single `.swift` file! Yay?
- Swift autocomplete in Xcode 6 beta is a little wonky.
- I could be completely off with any of these points so do correct me if I'm wrong!

### Arrays

- Declaring an array variable and initializing it: `var dataSource = String[]()`
- Adding elements: `dataSource.append("Element 1")`
- Replacing elements: `dataSource[tableView.indexPathForSelectedRow().row] = string`

### Storyboards/IBOutlet/IBAction

- Setting up an `IBOutlet` in Swift (just put the tag above your property declaration):

  ```
  @IBOutlet
  var tableView: UITableView
  ```

- There's no need to do a `#import "SomeOtherClass.h"` to access those classes anymore. This was apparent when I was trying to cast `segue.destinationViewController` as my custom class in `prepareForSegue` so I could access the properties I had setup in it, but turns out all I had to do was directly cast it like so: `var destinationVC:DetailViewController = segue.destinationViewController as DetailViewController`. Neat!
- If your `destinationViewController` class needs some custom properties, you may want to make them *optional* (using question marks at the end of the property declaration, e.g. `var delegate: ViewController?`). Otherwise, the compiler is going to complain with an error that those properties are not initialized in `super.init`. If it's possible, setup your `init`s accordingly.
- If you're reaching another scene via a segue, the View Controller of that other scene needs to have a boilerplate `init(coder)` method or you're going to get a compiler error. This was previously optional in Objective-C. Here's what that looks like:

  ```
  init(coder aDecoder: NSCoder!){
      super.init(coder: aDecoder)
  }
  ```

- Setting up an `IBAction` in Swift:

  ```
  @IBAction func dismissButtonPressed() {
      ...
  }
  ```

### Protocols

- Conforming to protocols is pretty easy. Just list them out separated by commas right there at your class definition: `class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailViewProtocol {`. No need for angle brackets!
- To declare a custom protocol, you do this above your class definition:

  ```
  protocol DetailViewProtocol {
      func didFinishDetailView(string:String)
  }
  ```

### Alerts

- The `UIAlertView` has been deprecated in iOS 8. You can now display alerts as such:

  ```
  var alert = UIAlertController(title: "Alert", message: "You typed \"\(string)\"", preferredStyle: UIAlertControllerStyle.Alert)
  alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
  self.presentViewController(alert, animated: true, completion: nil)
  ```

Of course all this is **really basic** stuff and it doesn't even begin to touch on the real power of Swift, but it's just enough to get a *feel* for it if you get tired of reading code (instead of writing it). Swift programming ahead!