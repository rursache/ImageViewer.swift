import UIKit

extension UIImageView {
    
    // Data holder tap recognizer
    private class TapWithDataRecognizer:UITapGestureRecognizer {
        weak var from:UIViewController?
        var imageDatasource:ImageDataSource?
        var initialIndex:Int = 0
        var options:[ImageViewerOption] = []
    }
    
    private var vc:UIViewController? {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController
            else { return nil }
        return rootVC.presentedViewController != nil ? rootVC.presentedViewController : rootVC
    }
    
    private func setupImageViewer(
        options:[ImageViewerOption] = [],
        from:UIViewController? = nil) {
        setup(
            datasource: SimpleImageDatasource(imageItems: [.image(image)]),
            options: options,
            from: from)
    }
    
    public func setupImageViewer(
        images:[UIImage],
        initialIndex:Int = 0,
        options:[ImageViewerOption] = [],
        from:UIViewController? = nil) {
        
        let datasource = SimpleImageDatasource(
            imageItems: images.compactMap {
                ImageItem.image($0)
        })
        setup(
            datasource: datasource,
            initialIndex: initialIndex,
            options: options,
            from: from)
    }
    
    private func setupImageViewer(
        datasource:ImageDataSource,
        initialIndex:Int = 0,
        options:[ImageViewerOption] = [],
        from:UIViewController? = nil) {
        
        setup(
            datasource: datasource,
            initialIndex: initialIndex,
            options: options,
            from: from)
    }
    
    private func setup(
        datasource:ImageDataSource?,
        initialIndex:Int = 0,
        options:[ImageViewerOption] = [],
        from: UIViewController? = nil) {
        
        var _tapRecognizer:TapWithDataRecognizer?
        gestureRecognizers?.forEach {
            if let _tr = $0 as? TapWithDataRecognizer {
                // if found, just use existing
                _tapRecognizer = _tr
            }
        }
        
        isUserInteractionEnabled = true
        
        var imageContentMode: UIView.ContentMode = .scaleAspectFill
        options.forEach {
            switch $0 {
            case .contentMode(let contentMode):
                imageContentMode = contentMode
            default:
                break
            }
        }
        contentMode = imageContentMode
        
        clipsToBounds = true
        
        if _tapRecognizer == nil {
            _tapRecognizer = TapWithDataRecognizer(
                target: self, action: #selector(showImageViewer(_:)))
            _tapRecognizer!.numberOfTouchesRequired = 1
            _tapRecognizer!.numberOfTapsRequired = 1
        }
        // Pass the Data
        _tapRecognizer!.imageDatasource = datasource
        _tapRecognizer!.initialIndex = initialIndex
        _tapRecognizer!.options = options
        _tapRecognizer!.from = from
        addGestureRecognizer(_tapRecognizer!)
    }
    
    @available(iOS 13.2, *)
    public func addImageViewer(from viewController: UIViewController? = nil, useDarkMode: Bool = true) {
        guard let image = self.image else { return }
        
        self.setupImageViewer(images: [image], options: [.theme(useDarkMode ? .dark : .light), .closeIcon(UIImage(systemName: "xmark.circle.fill")!)], from: viewController)
    }
    
    @objc
    private func showImageViewer(_ sender:TapWithDataRecognizer) {
        guard let sourceView = sender.view as? UIImageView else { return }
        let imageCarousel = ImageCarouselViewController.init(
            sourceView: sourceView,
            imageDataSource: sender.imageDatasource,
            options: sender.options,
            initialIndex: sender.initialIndex)
        let presentFromVC = sender.from ?? vc
        presentFromVC?.present(imageCarousel, animated: true)
    }
}
