import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // reset when the island leave the left side
        if(position.x <= -450)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // reset the island at the right side
        position.x = 876
        // get a pseudo random number
        let randomY:Int = (randomSource?.nextInt(upperBound: 80))! - 140
        // set the island at a random position on Y-axis
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}
