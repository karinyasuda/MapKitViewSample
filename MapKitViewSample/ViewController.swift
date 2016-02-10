//
//  ViewController.swift
//  MapKitViewSample
//
//  Created by Karin on 2016/02/10.
//  Copyright © 2016年 Karin. All rights reserved.
//

//map kit view で、好きな場所を指定して表示、pinをそこに立てるまで。
//コードを書く前に、MapKit.framework を Linked Frameworks and Libraries に追加
//mapKitをimportすることを忘れないように！
import UIKit
import MapKit//これがないとエラー出る。　MapKit のインポート

class ViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var testmapView :MKMapView!// MapView の関連付け。　MapKitを使う
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coordinate = CLLocationCoordinate2DMake(35.647320, 139.735989)//mapの中心地点の井緯度と経度
        let span = MKCoordinateSpanMake(0.005, 0.005)//表示範囲　数字が小さければ小さいほど拡大表示するので、表示される範囲が狭くなる
        let region = MKCoordinateRegionMake(coordinate, span)//位置と範囲からオブジェクトを生成してmapviewに表示する
        testmapView.setRegion(region, animated:true)
        
        
        //ピンを立てる　start
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(35.647320, 139.735989)
        annotation.title = "ライフイズテック"//ピンクリック時に表示されるtitle
        annotation.subtitle = "サイオスビル"// subtitle
        
        self.testmapView.addAnnotation(annotation)
        //ピンを立てる　end
        
    }

    
//アニメーションとボタン表示はうまくいってない！！！
    //ピンのアニメーション？？start
    func testmapView(testmapView: MKMapView, viewForAnnotation annotation:MKAnnotation) -> MKAnnotationView?{
        if annotation is MKUserLocation{
            return nil
        }
        let reuseId = "pin"
        var pinView = testmapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)as? MKPinAnnotationView
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.animatesDrop = true//animation drop プロパティに　trueを指定
        }else{
            pinView?.annotation = annotation
        }
        //吹き出しにボタンを表示start
        pinView?.canShowCallout = true
        
        let rightButton: AnyObject! = UIButton(type:UIButtonType.DetailDisclosure)
        pinView?.rightCalloutAccessoryView = rightButton as? UIView
        
        return pinView
        //吹き出しにボタンを追加stop
    }//ピンのアニメーション　stop
    
    //吹き出しのボタンが押されたときに呼び出される処理　start
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    
        
    }
    //吹き出しのボタンが押されたときに呼び出される処理　stop
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

