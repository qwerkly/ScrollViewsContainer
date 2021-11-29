# ScrollViewsContainer

[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager)

---

If you need synchronize two vertical UIScrollView's and force them scrolling together, this library will be helpful for you.
Only that you need to do add your child scroll views with setChildScrollViews func.

```swift
import ScrollViewsContainer

class ViewController: UIViewController {
    private let scrollViewsContainer = ScrollViewsContainer()
    private let firstScrollView = UIScrollView()
    private lazy var secondScrollViews = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        layoutViews()
        setupViews()
    }
    
    private func addSubviews() {
        view.addSubview(scrollViewsContainer)
    }
    
    private func layoutViews() {
        // Some layout code...
    }
    
    private func setupViews() {
        scrollViewsContainer.setChildScrollViews([firstScrollView, secondScrollViews])
    }
}
```
