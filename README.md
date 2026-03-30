Add to a git project.
```
git submodule add https://github.com/EloiStree/2026_03_30_gdp_croco_color_xr.git addons/2026_03_30_gdp_croco_color_xr
```

----------------

# Croco Color XR

> Croco color to connect node together.


<img width="1062" height="536" alt="image" src="https://github.com/user-attachments/assets/559bf5e1-51d2-4890-a5d9-3e9941f33233" />
<img width="1502" height="664" alt="image" src="https://github.com/user-attachments/assets/0cee9a8f-b2e9-47d8-a764-6240072234b6" />

## Context

For the Micro:bit project, I would like the student to be able to create connections between pins and objects while practicing with the Godot XR Tools box.

The concept is simple:
You can associate a color with a crocodile clip. All clips of the same color are considered linked together. Using RGB values like 255, 255, 255 can differentiate them.

By touching an Area3D with a setter on it, you can change the color.
We could also make some tools to:

Precisely change the color
Transfer color from one clip to another

An idea came to me while writing this:
A cube that takes the color on the left and a cube that applies the color on the right to repaint the clip.
Also, an HSV cylinder could be used to choose the color when a clip is open in it.

You see the idea:
Try, in a simple and easy way, to make clips for games that need connections between objects.
And some scripts to open, close, and make them hold other objects. Something like that.

