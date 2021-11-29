import UIKit

final public class ScrollViewsContainerView: UIScrollView, UIScrollViewDelegate {
    private weak var topView: UIView?
    private weak var bottomScrollView: UIScrollView?
    
    public func setChildViews(topView: UIView, bottomScrollView: UIScrollView) {
        self.topView = topView
        self.bottomScrollView = bottomScrollView
        delegate = self
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let topView = topView else { return }
        guard let bottomScrollView = bottomScrollView else { return }
        
        let blockedOffset = topView.frame.height
        let yOffset = scrollView.contentOffset.y
        let secondScrollOffsetY = yOffset - blockedOffset
        
        if yOffset > blockedOffset || bottomScrollView.contentOffset.y > 0 {
            let bottomOffset = bottomScrollView.scrollingContentHeight
            
            if !bottomScrollView.isHidden {
                bottomScrollView.contentOffset.y = max(0, min(bottomOffset, bottomScrollView.contentOffset.y + secondScrollOffsetY))
            }
            
            if bottomScrollView.contentOffset.y < bottomOffset {
                scrollView.contentOffset.y = blockedOffset
            }
        }
    }
}

fileprivate extension UIScrollView {
    var scrollingContentHeight: CGFloat {
        contentSize.height - bounds.height + contentInset.bottom
    }
}
