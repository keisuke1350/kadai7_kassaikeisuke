//
//  ViewController.swift
//  collectionview2
//
//  Created by 葛西　佳祐 on 2020/06/08.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    private let photos = ["sdgs", "sdgs01", "sdgs02", "sdgs03", "sdgs04", "sdgs05","sdgs06", "sdgs07", "sdgs08", "sdgs09", "sdgs10", "sdgs11", "sdgs12", "sdgs13", "sdgs14", "sdgs15", "sdgs16", "sdgs17"]
    
    let infoLists: [SdgsInfo] = [
        SdgsInfo(iconName: "sdgs", title: "概要", description: ""),
        SdgsInfo(iconName: "sdgs01", title: "貧困を無くそう", description: "MySDGS ToDoを追加して下さい"),//e5243b
        SdgsInfo(iconName: "sdgs02", title: "飢餓をゼロに", description: "MySDGS ToDoを追加して下さい"),//DDA63A
        SdgsInfo(iconName: "sdgs03", title: "すべての人に健康と福祉を", description: "MySDGS ToDoを追加して下さい"),//4C9F38
        SdgsInfo(iconName: "sdgs04", title: "質の高い教育をみんなに", description: "MySDGS ToDoを追加して下さい"),//C5192D
        SdgsInfo(iconName: "sdgs05", title: "ジェンダー平等を実現しよう", description: "MySDGS ToDoを追加して下さい"),//FF3A21
        SdgsInfo(iconName: "sdgs06", title: "安全な水とトイレを世界中に", description: "MySDGS ToDoを追加して下さい"),//26BDE2
        SdgsInfo(iconName: "sdgs07", title: "エネルギーをみんなに そしてクリーンに", description: "MySDGS ToDoを追加して下さい"),//FCC30B
        SdgsInfo(iconName: "sdgs08", title: "働きがいも 経済成長も", description: "MySDGS ToDoを追加して下さい"),//A21942
        SdgsInfo(iconName: "sdgs09", title: "産業と技術革新の基盤をつくろう", description: "MySDGS ToDoを追加して下さい"),//FD6925
        SdgsInfo(iconName: "sdgs10", title: "人や国の不平等をなくそう", description: "MySDGS ToDoを追加して下さい"),//DD1367
        SdgsInfo(iconName: "sdgs11", title: "住み続けられるまちづくりを", description: "MySDGS ToDoを追加して下さい"),//FD9D24
        SdgsInfo(iconName: "sdgs12", title: "つくる責任 つかう責任", description: "MySDGS ToDoを追加して下さい"),//BF8B2E
        SdgsInfo(iconName: "sdgs13", title: "気候変動に具体的な対策を", description: "MySDGS ToDoを追加して下さい"),//3F7E44
        SdgsInfo(iconName: "sdgs14", title: "海の豊かさを守ろう", description: "MySDGS ToDoを追加して下さい"),//0A97D9
        SdgsInfo(iconName: "sdgs15", title: "陸の豊かさも守ろう", description: "MySDGS ToDoを追加して下さい"),//56C02B
        SdgsInfo(iconName: "sdgs16", title: "平和と公正をすべての人に", description: "MySDGS ToDoを追加して下さい"),//00689D
        SdgsInfo(iconName: "sdgs17", title: "パートナーシップで目標を達成しよう", description: "MySDGS ToDoを追加して下さい"),//19486A
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // レイアウトを調整
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            collectionView.collectionViewLayout = layout
        }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 18 //表示するセルの数
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let horizontalSpace : CGFloat = 20
         let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
         return CGSize(width: cellSize, height: cellSize)
     }
    
    // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt:", indexPath)
        let vc = DetailViewController()
        vc.sdgsinfo = infoLists[indexPath.row]
        navigationController?.pushViewController(vc,  animated: true)
        
    }
    
    

}

