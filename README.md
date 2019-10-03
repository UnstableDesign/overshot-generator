# overshot pattern generator
This is a Processing sketch that allows someone to design a specific overshot pattern using key commands. I used it in my own weaving practice to more quickly "sketch" and visualize different combinations of overshot patterns that would automatically translate into the threading pattern.  

The generator is written with Processing and will require one to download Processing in order to open and run the file. When the file is running, the software will generate the overshot pattern based on the commands the user inputs. 

This code is written to generate an overshot pattern for an 8-shaft loom (though only 6 of the shafts are used). It is based on a loom (e.g. my loom) which will be warped at 30 epi and will contain a total of 780 warps (for a 26" wide weave). The color scheme displayed in the generator assumes a white warp and tan and red sections within the weft. I intend to use a floating selvedge on the loom to keep the edges well formed.

# inspiration
I generated this base pattern from a textile I saw a friend, Kristina Andersen's house. The weave was designed and fabricated originally by Ruth Bergesen (Kristina's godmother).  Unlike the other overshot patterns that I have seen, this pattern slighlty overlaps the floating sections between successive weft rows. This overlapping gives it a more interesting texture (in my opinion). The weft coloring alternates along the length of the fabric.

![The Original Weave](http://unstable.design/wp-content/uploads/2019/10/original.jpg)

# pattern basics
I created this code because it was difficult to get the tie up right doing it all by hand and I wanted to allow myself a bit of playfulness in composing the patterning along the warp. I hope others might find it useful and playful as well. I began by printing the original image and "decoding" the pattern back into a draft using Excel. This image shows this original decoding, treadling order, and tie up. Basically, the patterning alternatites between plain weave (white), overshot pattern (color), then complementary plain weave (white), then the overshot pattern again (color). Two alternating, complementary overshot patterns are used in tandem with teh coloring to create the illustions of intesecting bands through the lengths of the fabric. 

![Tie Up and Treadling Pattern](http://unstable.design/wp-content/uploads/2019/10/tieup.png)


# the pattern generator
As I moved the pattern into my generator, I decided to change the colors between blue, white and tan into red, white and tan. The color scheme in the generator follows this pattern:
if a tan sections alternates between:   tan/floats, white/plain, tan/floats
then the red regions alternate:         white/plain, red/floats, white/plain  

## using keyboard inputs to design the warp tie ups
To design using the code generator, the user "runs" the code (presses the play button) and then can type in letters and numbers to specify the weave. When the code is running, the user is able to enter commands (e.g. A8, B7, C6) that tell the program to repeat pattern A for 8 warps, pattern B across 7 warps, and so on and so on. Each time a command is typed, it appears in the draft and also shows a crude visualation of how the region will appear when woven (based on two set treadling patterns).The mapping between lettering and patterning is shown below: 
![The patterning](http://unstable.design/wp-content/uploads/2019/10/Screen-Shot-2019-10-03-at-2.04.31-PM.png)
The reason patterns are groupings of two is because each floating thread in a overshot row is "paired" with a plain woven row. Thus, some patterns appear the same visually, but are different in terms of the whether the even or odd heddles are selected for the adjacent stitch. 

The software also keeps a count of the total number of threads that your pattern is using.  
![The count](http://unstable.design/wp-content/uploads/2019/10/canvas_1_detail.jpg)

## error checking
The code checks to make make sure that the stitches are valid (e.g. that the base rows maintain an appropriate plain weave stitch). If the stitch you enter is incompatable with the stitch prior, the software will not add it and give you a warning. In which case you can start typing a new stitch to add. This error checking makes sure the plain woven rows are always well formed. 

## undo
If you have added a stitch that is incorrect or too long, simply hit delete to remove your last command. 

## export
Once you have your file designed you can hit "return" to export an image of your draft. That image will live in the same folder as the Processing code that you are running. The image below is the exported code for the weave I eventually produced: 
![The export](http://unstable.design/wp-content/uploads/2019/10/canvas_1.jpg)


## heddle counts
When you hit enter, the code will calculate how many heddles will be required on each frame. This will print just under the code window and will take the form of "Shaft 1: 150", etc. This means that your first frame or shaft will require the use of 150 heddles. 
![The heddles](http://unstable.design/wp-admin/upload.php?item=718)


## likely code modifications you'll need to make
Since the code is fixed based on my own weaving setup, I am assuming others might need to adjust certain features like the number of warps. So, if you replace the value of warps (e.g. 780 in my code) with the number of warps in your setup, it should work. That said, if you are using MORE warps than me, you'll also have to change the value in the "size()" command to create a bigger window. There are instuctions where and how to make this change embedded in the code. 

# helpful tips for weaving
I found it difficult to keep track of my threading due to the fact that the paper is non regular in its repetitions. I developed a nice workflow by printing out my pattern and taping it into one long strip, then marking off the threaded regions as I worked across the width

![Threading1](http://unstable.design/wp-content/uploads/2019/10/Screen-Shot-2019-10-03-at-2.27.41-PM.png)
(left) mark out ten heddles to thread from the pattern at a time
(right) move your threading yarns to the right (I'm right handed) of the heddles you will select, then count out the heddles based on what you'll need in that group of 10.

![Threading2](http://unstable.design/wp-content/uploads/2019/10/Screen-Shot-2019-10-03-at-2.27.35-PM.png)
(left) I balanced a shaft between my 10 selected heddles and the reamining heddles.
(right) Pulled tension to select the next yarn 

![Threading3](http://unstable.design/wp-content/uploads/2019/10/Screen-Shot-2019-10-03-at-2.27.30-PM.png)
(left) Thread the heddles.
(right) Highlight the region you just completed, mark out the next region. Repeat. 

# Results
![On Loom Tests1](http://unstable.design/wp-content/uploads/2019/10/IMG_6610.jpg)
![On Loom Tests2](http://unstable.design/wp-content/uploads/2019/10/IMG_6633.jpg)
A few initial tests with different yarns, textures, and colors. 

![Cloak](http://unstable.design/wp-content/uploads/2019/10/KristinasWeaveFabricated2.jpg)
I used 8/2 raw cotton in the warp, weft, and 8/2 blue tencel in the warp and found that my pattern had more zigzagging than the original. It could be that my warps were packed too tight at 30 epi. Even when I threw a "thin" plain woven yarn, it still retained this zig zagging quality. I came to love the patterns, as alternations within a single color would create interesting geometric qualities. 

![Cloak](http://unstable.design/wp-content/uploads/2019/10/IMG_6631.jpg)
I used the clock to make an interactive protoype, experimenting also with some funky introductions of knitted i-cord to create ties and sensors. 

![Cloak2](http://unstable.design/wp-content/uploads/2019/10/IMG_6708-938x1024.jpg)
I created two panels of this fabric, repeating the treadling order to achieve an alignment between the layers. I cut one panel nearly in half to make it into a wearable cloak. 

![Cloak3](http://unstable.design/wp-content/uploads/2019/10/IMG_6827.jpg)
A final detail shot of the tie and fabric.

![Cloak4](http://unstable.design/wp-content/uploads/2019/10/chanting_electronics_detail.jpg)
The final cloak has a Teensy audio board embedded. The chest tie senses your inhales and initiates audio playback upon exhale. I use it for chanting/screaming with recorded sounds of motors. 

![Cloak5](http://unstable.design/wp-content/uploads/2019/10/chantingCloak.jpeg)
Front and back of finalized cloak.







