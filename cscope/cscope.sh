#!/bin/sh  
    
find . -name "*.h" -o -name "*.hh" -o -name "*.hpp" -o -name "*.c" -o -name "*.cc" -o -name "*.cc" -o -name "*.cpp" -o -name "*.cxx" > cscope.files 
cscope -Rbkq -i cscope.files
