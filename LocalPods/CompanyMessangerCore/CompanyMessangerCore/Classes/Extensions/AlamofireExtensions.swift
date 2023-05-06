import Alamofire
import AlamofireImage

public extension UIImageView {
    func loadImage(fromUrl urlString: String?, placeholderImage placeholder: UIImage? = nil) {
        image = placeholder
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        
        self.af.setImage(withURL: url, placeholderImage: placeholder)
    }
}
