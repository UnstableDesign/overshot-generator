# overshot pattern generator
An interface that allows one to design a specific overshot pattern using key commands. 

The generator is written with Processing and will require one to download Processing in order to open and run the file. When the file is running, the software will generate the overshot pattern based on the commands the user inputs. 

This code is written to generate an overshot pattern for an 8-shaft loom (though only 6 of the shafts are used). It is based on a loom (e.g. my loom) which will be warped at 30 epi and will contain a total of 780 warps (for a 26" wide weave). The color scheme displayed in the generator assumes a white warp and tan and red sections within the weft. I intend to use a floating selvedge on the loom to keep the edges well formed.

I generated this base pattern from a textile I saw a friends house. Her family is Danish and someone in her family wove it to serve as a long table runner. Unlike the other overshot patterns that I have seen, this pattern slighlty overlaps the floating sections between successive weft rows. This overlapping gives it a more interesting texture (in my opinion). The weft coloring alternates along the length of the fabric. For instance:
if a tan sections alternates between:   tan/floats, white/plain, tan/floats
then the red regions alternate:         white/plain, red/floats, white/plain  

I created this code because it was difficult to get the tie up right doing it all by hand and I wanted to allow myself a bit of playfulness in composing the patterning along the warp. I hope others might find it useful and playful as well. 

# pattern basics
![Tie Up and Treadling Pattern](http://unstable.design/wp-content/uploads/2019/10/tieup.png)



# features

## using keyboard inputs to design the warp tie ups
When the code is running, the user is able to enter commands (e.g. A8, B7, C6) that tell the program to repeat pattern A for 8 warps, pattern B across 7 warps, and so on and so on. Each time a command is typed, it appears in the draft and also shows a crude visualation of how the region will appear when woven (based on two set treadling patterns).
![A](http://unstable.design/wp-content/uploads/2019/10/canvas_1_a.jpg)





## error checking
The code checks to make make sure that the stitches are valid (e.g. that the base rows maintain an appropriate plain weave stitch). If the stitch you enter is incompatable with the stitch prior, the software will not add it and give you a warning. In which case you can start typing a new stitch to add.

## undo
If you have added a stitch that is incorrect or too long, simply hit delete to remove your last command. 

## export
Once you have your file designed you can hit "return" to export an image of your draft. That image will live in the same folder as the Processing code that you are running. 

## heddle counts
When you hit enter, the code will calculate how many heddles will be required on each frame. This will print just under the code window and will take the form of "Shaft 1: 150", etc. This means that your first frame or shaft will require the use of 150 heddles. 

# likely modifications you'll need to make
Since the code is fixed based on my own weaving setup, I am assuming others might need to adjust certain features like the number of warps. So, if you replace the value of warps (e.g. 780 in my code) with the number of warps in your setup, it should work. That said, if you are using MORE warps than me, you'll also have to change the value in the "size()" command to create a bigger window. There are instuctions where and how to make this change embedded in the code. 



