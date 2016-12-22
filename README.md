# DragonBonesExample
This is a simple example of how to add a DragonBones animation with actionScript/Starling.
I used the Dragon bones panel (for Adobe Animate) to create the following three files for XML and JSON.

    - texture.png 
    - texture.xml
    - skeleton.xml (Why is this file generated?)

    AND

    - texture.png 
    - texture.JSON
    - skeleton.JSON (Why is this file generated?)

    ****Not sure if I should use XML or JSON versions.

This file contains two simple animations: 1) idle and 2) armsWaving.

I would like to: 

      1) Add the animations to the stage 
      2) Be able to have control over how or when each animations play (idle or armsWaving).

I looked over the AnimationBaseTest.as demonstration file but it isn't clear and I'm running into errors. Further 
my assets are being added by the asset manager and being embedded.

Also in Starling when adding a movieClip or image it references 2 files, the png and xml file. In DragonBones does it reference
2 or two files, png, and 2 xml files?
