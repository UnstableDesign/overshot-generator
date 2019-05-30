# overshot generator
An interface that allows one to design a specific overshot pattern using key commands. 

The generator is written with Processing and will require one to download Processing in order to open and run the file. When the file is running, the software will generate the overshot pattern based on weave stitches. 

The specific code here is written to generate an overshot pattern for an 8-shaft loom (though only 6 of the shafts are used). The loom will be warped at 30 epi and will contain a total of 780 warps. The color scheme assumes a white warp and brown and read sections within the weft. I intend to use a floating selvedge on the loom to keep the edges well formed.

I generated this base pattern from a textile at a friends house. Unlike the other overshot patterns that I have seen, this pattern slighlty overlaps the floating sections between successive weft rows. This overlapping gives it a more interesting texture (in my opinion). 

I created the code because it was difficult to get the tie up right doing it all by hand. I also wanted to allow myself a bit of playfulness in composing the patterning along the warp. I hope others might find it useful and playful as well. 

# features

## using keyboard inputs to design the warp tie ups
When the code is running, the user is able to enter commands (e.g. A8, B7, C6) that tell the program to repeat pattern A for 8 warps, pattern B across 7 warps, and so on and so on. Each time a command is typed, it appears in the draft and also shows a crude visualation of how the region will appear when woven (based on two set treadling patterns).

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



