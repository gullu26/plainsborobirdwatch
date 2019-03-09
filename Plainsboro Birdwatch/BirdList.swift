
//  Created by Sudarshan Seshadri on 2/10/19.

import UIKit

class BirdList {
    
    
    var birdArray = Array<Bird>()
    
    init () {

    //eastern blue bird, chickadee, tree swallow, House Wren, house sparrow
    
        birdArray.append(Bird(name: "None", description: "No bird was in the box", image: UIImage.init(named: "Bird")!));
        birdArray.append(Bird(name: "Eastern Bluebird", description: "Orange belly & bright blue back", image: UIImage.init(named: "bluebird")!));
        birdArray.append(Bird(name: "Chickadee", description: "Black head and throat", image: UIImage.init(named: "chickadee")!));
        birdArray.append(Bird(name: "Tree Swallow", description: "White belly & green/blue back", image: UIImage.init(named: "tree_swallow")!));
        birdArray.append(Bird(name: "House Wren", description: "Small size & brown striping", image: UIImage.init(named: "house_wren")!));
        birdArray.append(Bird(name: "House Sparrow", description: "Male: Black throat, grey belly, brown back. Female: solid grey-brown", image: UIImage.init(named: "house_sparrow")!));
    
    }
    
}
