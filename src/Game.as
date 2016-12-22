package {


import dragonBones.textures.TextureAtlasData;

import starling.core.Starling;
import starling.display.Sprite;

import flash.filesystem.File;

import starling.display.Image;
import starling.events.Event;
import starling.textures.Texture;
import starling.utils.AssetManager;

import dragonBones.objects.DragonBonesData;
import dragonBones.starling.StarlingFactory;
import dragonBones.starling.StarlingArmatureDisplay;
import dragonBones.events.EventObject;


public class Game extends Sprite
{
    private var assets:AssetManager = new AssetManager ();
    private var appDir:File = File.applicationDirectory;
    private var background:Image;

    private var armitureDisplay: StarlingArmatureDisplay = null;
    private var factory:StarlingFactory = new StarlingFactory();

    public function Game() {
        trace ("we're in Starling Land!");
        this.addEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
    }


    private function loadScreen(e:starling.events.Event):void
    {
        this.removeEventListener (starling.events.Event.ADDED_TO_STAGE, loadScreen);
        onAddedToStage ();
    }

    private function onAddedToStage():void
    {
        assets.enqueue(appDir.resolvePath("assets/"));
        assets.loadQueue (function (ratio2:Number):void {
            if (ratio2 == 1.0)
            {
                drawScreen ();
            }
        });
    }


    //Draws the assets onto the screen.
    private function drawScreen():void
    {
        trace ("drawScreen is loaded!");
        trace(armitureDisplay);
        trace(factory);

        const dragonBonesData: DragonBonesData = factory.parseDragonBonesData(JSON.parse("texture"));

        factory.parseTextureAtlasData(JSON.parse(assets.getTexture("texture")), assets.getTexture("texture"));

        armitureDisplay = factory.buildArmatureDisplay(dragonBonesData.armatureNames[0]);
        armitureDisplay.x = 50;
        armitureDisplay.y = 100;
        this.addChild(armitureDisplay);
    }

}

}