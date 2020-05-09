//
//  SampeCollectionViewController.swift
//  SOPT26_3rd_Seminar
//
//  Created by 이주혁 on 2020/05/09.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class SampleCollectionViewController: UIViewController {

    @IBOutlet var musicCollectionView: UICollectionView!
    private var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicList()
        // Do any additional setup after loading the view.
        musicCollectionView.delegate = self
        musicCollectionView.dataSource = self
    }
    
    func setMusicList(){
        let music1 = Music(title: "album_iu", singer: "아이유", coverName: "삐삐")
        let music2 = Music(title: "album_vibe", singer: "바이브", coverName: "가을타나봐")
        let music3 = Music(title: "album_yangdail", singer: "양다일", coverName: "고백")
        let music4 = Music(title: "album_im", singer: "임창정", coverName: "하루도 그대를 사랑하지 않은 적이 없었다.")
        let music5 = Music(title: "album_smtm7", singer: "루피(Loopy)", coverName: "Save (Feat. 팔토알토)")
        let music6 = Music(title: "album_ziont", singer: "자이언티", coverName: "멋지게 인사하는 법 (Feat. 슬기")
        let music7 = Music(title: "album_bts", singer: "방탄소년단", coverName: "IDOL")
        let music8 = Music(title: "album_loco", singer: "로꼬", coverName: "시간이 들겠지 (Feat. Colde)")
        let music9 = Music(title: "album_paul", singer: "폴킴", coverName: "모든 날, 모든 순간")
        let music10 = Music(title: "album_shaun", singer: "숀(SHAUN)", coverName: "Way Back Home")
        
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SampleCollectionViewController: UICollectionViewDelegate {
    
}

extension SampleCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let musicCell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCell.identifier, for: indexPath)
            as? MusicCell else { return UICollectionViewCell() }
        musicCell.set(musicList[indexPath.row])
        return musicCell
        
    }
}

extension SampleCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 2, height: collectionView.frame.height / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
