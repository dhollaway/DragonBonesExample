package {

import flash.display.Sprite;
import starling.core.Starling;



[SWF (frameRate = "60" , backgroundColor = "#ffffff")]

public class Main extends Sprite
{
    public static var screenWidthDetermined:int;
    private var _starling:Starling;


    public function Main()
    {
        _starling = new Starling(Game, stage);
        _starling.start();
        screenWidthDetermined = Starling.current.nativeStage.stageWidth;
    }





}
}
