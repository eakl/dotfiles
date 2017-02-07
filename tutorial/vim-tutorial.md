VIM commands
============

**Modes**  
Enter _insert_ mode: `i`  
Enter _append_ mode: `a`  
Enter _normal_ mode: `Esc`  
Enter _visual_ mode (or selection mode): `v`

**Word movement**  
Move to the start of the next word: `w`  
Move to the end of the word: `e`  
Move to beginning of the word: `b`  

**Number powered movement**  
Move to the start of the next word **3 times**: `3w`  
Move works also with the arrow keys -- Move right 9 times: `9->`  

**Insert text repeatedly**  
Insert 'Yes' 4 times: `4iYes` + `Esc`  
Insert ------------------------------: `30i-` + `Esc`  

**Find a character**  
Find and move to the next occurrence of a character: `fa`  
Find and move to the next occurrence of a _a_: `f`  
Find and move to the third occurrence of _c_: `3fc`  

**Matching parentheses**  
Jump to the matching parenthesis '()': `Shift` + `%`  
_Works also with curly brackets '{}' and brackets '[]'_  

**Go to start/end of line**  
Go to beginning of the line: `0`  
Go to the end of the line: `$`  

**Find word under cursor**  
Find the next occurrence of the word under cursor: `*`  
Find the previous occurrence of the word under cursor: `#`  

**Go to line**  
Go to the beginning of the _file_: `gg`  
Go to the end of the _file_: `G`  
Go to the 10th line: `10G`  

**Search /text**  
Search a specific text: `/`  
Search _hello_: `/hello`  
Go to the next searched occurrence: `n`  
Go to the previous searched occurrence: `N`  

**Insert new line**  
Insert a line under cursor: `o`  
Insert a line above cursor: `O`  
_when a new line is created, the editor is in `insert` mode_

**Removing a character**  
Delete the character under the cursor (the selected character): `x`  
_Hell[o]_ `x` becomes _Hell_  
Delete the character to the left of the cursor (the previous character): `X`  
_He[l]lo_ `X` becomes _Hllo_

**Replacing letter under cursor**  
Replace the character under the cursor: `r`  
_m[y]_ `r` becomes _me_

**Deleting**  
Delete: `d`  
Delete the whole line: `dd`  
Delete the first word on the right side of the cursor: `dw`  
Delete 4 words: `d4w`

**Undo / Redo**  
Undo: `u`  
Redo: `ctrl` + `r`  

**Copy/Paste**  
Copy: `y`  
Copy line : `yy`  
Cut: `d`  
Paste: `p`

**Repetition**  
Repeat the previous command: `.`  
Repeat a deletion: `dw` then `.`

**Visual mode**  
Delete a selected word: `ve->d` (visual/end of word/get the space/delete)  

**File commands**  
Save file: `:w`  
Quit file: `:q`  
Quit without saving: `:q!`

**Help**  
Get help: `:help`
