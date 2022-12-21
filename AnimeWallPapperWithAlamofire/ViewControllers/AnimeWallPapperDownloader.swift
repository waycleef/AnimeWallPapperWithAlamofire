//
//  ViewController.swift
//  AnimeWallPapperWithAlamofire
//
//  Created by Алишер Маликов on 21.12.2022.
//

import UIKit

class AnimeWallPapperDownloader: UIViewController {
    
    
    private var linkForWallPapper = Links.animeUrl.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoVC = segue.destination as? ImageAndInfoImageViewController {
            infoVC.links = linkForWallPapper
        } else { return }
    }
    
    @IBAction func getWallpaperButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "animeWallPapper", sender: nil)
    }
    
    @IBAction func firstSwitchAction(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.maid.rawValue
        }
    }
    
    @IBAction func secondSwintch(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.waifu.rawValue
        }
    }
    
    @IBAction func thirdSwitch(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.marinkitagawa.rawValue
        }
    }
    
    @IBAction func fourthSwitch(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.moricalliope.rawValue
        }
    }
    
    @IBAction func fifthSwitch(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.raidenshigun.rawValue
        }
    }
    
    @IBAction func sixthSwitch(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.oppai.rawValue
        }
    }
    
    @IBAction func seventhSwitch(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.selfies.rawValue
        }
    }
    
    
    @IBAction func eighth(_ sender: UISwitch) {
        if sender.isOn {
            linkForWallPapper += Links.uniform.rawValue
        }
    }
}

