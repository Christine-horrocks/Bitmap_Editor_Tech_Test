# Bitmap editor

## Task
To create an editor for a bitmap. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour. The editor will allow the user to issue commands to change the colour of pixels on the bitmap. On instantiation, bitmaps can be between 1 - 250 pixels in height and width. Colours are specified by capital letters.

The input will come from a text file, which will contain a sequence of commands. The required commands are:
- I N M - Create a new M x N image with all pixels coloured white (O).
- C - Clears the table, setting all pixels to white (O).
- L X Y C - Colours the pixel (X,Y) with colour C.
- V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- S - Show the contents of the current image


## Running
To run the program, enter the desired commands to the file:
`examples/show.txt`

Then go to the command line and run the following command:

`>bin/bitmap_editor examples/show.txt`

## Example of Expected outcome

This is an example of possible input and expected outcome of the program, when it is complete.

Input File:
I 5 6
L 1 3 A
V 2 3 6 W
H 3 5 2 Z
S


Expected Output:
OOOOO
OOZZZ
AWOOO
OWOOO
OWOOO
OWOOO
