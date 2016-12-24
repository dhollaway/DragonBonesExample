package {


import dragonBones.textures.TextureAtlasData;

import starling.core.Starling;
import starling.display.Sprite;

import flash.filesystem.File;

import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.AssetManager;

import dragonBones.objects.DragonBonesData;
import dragonBones.starling.StarlingFactory;
import dragonBones.starling.StarlingArmatureDisplay;
import dragonBones.events.EventObject;


public class Game extends Sprite {
    private var assets:AssetManager = new AssetManager ();
    private var appDir:File = File.applicationDirectory;
    private var background:Image;

    private var armatureDisplay:StarlingArmatureDisplay = null;
    private var factory:StarlingFactory = new StarlingFactory ();

    private var skeletonData:Object;
    private var textureData:Object;
    private var texture:Texture;

    public function Game() {
        trace( "The screen side is: ");
        this.addEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
    }


    private function loadScreen(e:starling.events.Event):void {
        this.removeEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
        onAddedToStage ();
    }

    private function onAddedToStage():void {
        assets.enqueue (appDir.resolvePath ("assets/"));
        assets.loadQueue (function (ratio1:Number):void {
            if (ratio1 == 1.0) {

                skeletonData = assets.getObject ("skeleton");
                textureData = assets.getObject ("texture");
                texture = assets.getTexture ("texture");

                drawScreen ();
            }
        });
    }


    //Draws the assets onto the screen.
    private function drawScreen():void {
        var dbData:DragonBonesData = factory.parseDragonBonesData (skeletonData);
        factory.parseTextureAtlasData (textureData, texture);


        if (dbData) {

            armatureDisplay = factory.buildArmatureDisplay (dbData.armatureNames[0]);
            addChild (armatureDisplay);
        }

        armatureDisplay.alignPivot("center","center");
        armatureDisplay.x = stage.stageWidth/2;
        armatureDisplay.y = stage.stageHeight/2;

        armatureDisplay.animation.play ();

        //plays named the animation in a loop
        armatureDisplay.animation.play ("armsWaving",0);

        armatureDisplay.addEvent (Event.COMPLETE, finished);

    }

    private function finished(e:Event):void
    {
        trace("DragonBones is finished!");
    }


}

}