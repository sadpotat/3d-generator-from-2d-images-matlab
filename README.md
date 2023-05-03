# 3d-generator-from-2d-images-matlab
 
 This project is a MATLAB GUI that takes images of the three faces of an object as input (in PNG and JPG) and creates a 3D model of it.  </br></br>
 The motivation behind this project was to create a student-friendly application that would generate the coordinates of an object's outline in the three-dimensional space and export it to an `SCR` file that can be imported into AutoCAD. </br></br>
 
 ## The GUI:
<img src="https://github.com/sadpotat/3d-generator-from-2d-images-matlab/blob/main/for_readme/gui2.JPG?raw=true">
<video src="https://user-images.githubusercontent.com/127079821/235832932-89e47b06-e770-4bda-b7e4-2e848095a77f.mp4"></video>
</br>

 ## How to Use
 <img src="https://github.com/sadpotat/3d-generator-from-2d-images-matlab/blob/main/for_readme/gui_explanation.png?raw=true">
 </br>

### Step-1: Calibration - Setting distance per pixel </br>
<details>
<summary>Get Image</summary>
 </br>
 Take a front facing image of the object you want to use to calibrate the program and load it into the GUI. </br>
 The object must be rectangular. Uses Mode 1 for object separation.
 </br>
</details>
<details>
<summary>Set Length (in cm)</summary>
</br>
Enter the height of the object.
</br>
</details>
<details>
<summary>Calibrate</summary>
</br>
This button runs the calibrate() function and stores the distance per pixel. The user does not need to bother with this parameter.
</br>
</details>
</br> 
  
 ### Step-2: Set a sampling frequency </br>
 Set a step size for sampling images. This parameter is measured in pixels. A higher step size reduces processing time but also drops accuracy.
 </br>
 </br>
 ### Step-3: Select an object separating mode </br>
I couldn't find any object separating method that worked for all the images I tested with, so I added all of them as modes. Mode 1 is used by default but I would recommend you to try all of them to find the one that works best with your images.
 </br>
 </br>
 ### Step-4: Main commands </br>
<details>
<summary>Get Photos</summary>
</br>
Select photos of the top face, front face and the side face of the object you want to model. The images must be in entered in the specified order. </br>
This part of the script will separate the object from the images and load them into the previews below. Check the preview to see if your object loads properly. If not, try taking photos in different lighting or a single tone background.
</br>
</details>
<details>
<summary>Get Coordinates</summary>
</br>
Generates XYZ coordinates from the loaded images. You can view the total number of points generated in the Matrix Dimension Table.
</br>
</details>
<details>
<summary>Model</summary>
</br>
Pop ups a 3D surf plot of the object. You can choose to hide certain faces by selecting them in the Layer Correction Panel.
</br>
</details>
</br> 

# More about this project
This is a project I did in the 3rd semester of my undergrad. I didn't really know anything about the rules of writing code back then, so the scripts aren't very readable...</br>

Further development:
- I've started rewriting some of the bad code. 
- The object detecting methods I've used aren't mine, they are templates from the internet. I want to replace them with my own algorithm in future. 
- The exporting to `SCR` feature was never implemented so I'll add that later as well. 
