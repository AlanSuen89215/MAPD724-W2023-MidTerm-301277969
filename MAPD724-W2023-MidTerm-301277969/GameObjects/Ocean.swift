import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // reset when the ocean leave the left side
        if(position.x <= -1200)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // reset the ocean at the right side
        position.x = 1200
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}
