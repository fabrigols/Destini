//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
	
	
	var stories = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

		updateUI()
    }
	
	@IBAction func choiceButtonPressed(_ sender: UIButton) {
		if sender.titleLabel?.text == stories.stories[stories.currentFlow].choice1 {
			stories.currentFlow = stories.stories[stories.currentFlow].choice1Destination
		} else if sender.titleLabel?.text == stories.stories[stories.currentFlow].choice2 {
			stories.currentFlow = stories.stories[stories.currentFlow].choice2Destination
		} else if sender.titleLabel?.text == "The" || sender.titleLabel?.text == "End" {
			print("fim")
		}
		
		updateUI()
	}
	
	func updateUI() {
		storyLabel.text = stories.getLabel(stories.currentFlow)
		choice1Button.setTitle(stories.getOptions(stories.currentFlow)[0], for: .normal)
		choice2Button.setTitle(stories.getOptions(stories.currentFlow)[1], for: .normal)
	}
	
}

