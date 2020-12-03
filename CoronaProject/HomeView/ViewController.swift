import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    var cases: Int = 0
    var deaths: Int = 0
    var imageArray = ["index","indexOne"]
    var labelArray = ["Swipe right to continue", "Confirmed Cases"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControl.numberOfPages = 2
        callCoronaService()
    }
    /// json parser call
    func callCoronaService() {
        let homeObject = HomeViewModel()
        homeObject.getResponse(urlString: urlConstants.link, oncompletion: { (result) in
            if let item = result.features {
                for item1 in item {
                    if let item2 = item1.attributes {
                        if let caseCount = item2.CumCase {
                            self.cases = caseCount
                        }
                        if let CumDeath = item2.CumDeath {
                            self.deaths = CumDeath
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.colView.reloadData()
                }
            }
        }) { (error) in
            print(error)
        }
    }
    
}
extension ViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! countryssituationreportsCell
        cell.img.image = UIImage(named:imageArray[indexPath.row])
        if (indexPath.item != 0){
            cell.countryLabel.text = "UK's Situation in Numbers"
            cell.deathLabel.text = "Total Deaths"
            cell.firstLabel.text = String(cases)
            cell.secondLabel.text =  String(deaths)
        }
        else{
            cell.Arrowimg.image = UIImage(named: "Path")
        }
        cell.lable.text = labelArray[indexPath.row]
        return cell
    }
}
extension ViewController:  UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
    }
}


