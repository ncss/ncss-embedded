
rem -- This is a script for updating your pyboard.
rem -- Note: lines starting with 'rem' are comments in bat files.

rem -- update main.py
copy main.py D:\main.py

rem -- The sync command flushes pending writes, to reduce the risk of 
rem -- corrupting the file system on your pyboard.
sync D:\
