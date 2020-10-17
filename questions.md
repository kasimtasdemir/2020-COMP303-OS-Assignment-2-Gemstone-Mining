# Gemstone Mining Game
A mother has a gemstone mining business. She needs help with sifting for gemstones from her children. She gives a bucket of dirt to each of her children. 

Price list:
- diamond, 3500$
- ruby, 50$
- sapphire, 1200$
- emerald 800$

In this assignment, 
a bucket of dirt is represented by a text file which is filled with random characters, the dirth. The gemstones are represented by their first letter (lowercase). An example file content is given below:

suffrkly7acxjvg8er06q5wxk6pgqqywq4qey0eafdwc9e4w9e

In this sample bucket there are 1 sapphire, 2 rubies, 4 emeralds which makes it worth of 1200+50x2+800x4=4500$  

The mother is represented by the main process, children are the child processes. 

The children get tired after checking out 24 characters in the text file and go to sleep for a random amount between 500-1500msec. 

# Part 1
You are given N text files (buckets) filled with random characters (dirt). 
The main process (the mother) will create N children.
Each child will take its text file and start reading the text file one character at a time. The bucket worths 0$ in the beginning. When the child finds a gem, she/he increases the bucket value by the amount of the found gemstone.  When the end of the file is reached, they return the total amount to the mother.
When all the children are done, Mother adds up the values of all buckets and displays the result.
# Part 2
Only the mother will do the bucket value calculation. Children will only send the gemstone to the mother whenever it is found.  
Communication from child to parent will be done via message passing.


# Help
In linux command line, we can checkout the content of a bucket:
```grep -o [dser] 0.txt | sort | uniq -c ```
Output:
      8 r
      1 s

With total worth:
```grep -o [dser] 1.txt | sort | uniq -c | awk '{if ($2 == "d") print $2, $1, value=$1*3500;  else if ($2 == "s") print $2, $1, value=$1*1200 ; else if ($2 == "e") print $2, $1, value=$1*800; else if ($2 == "r") print $2, $1, value=$1*50; total+=value} END {print "total", total}' ```   
Output:  
e 1 800  
r 3 150  
total 950  

Regex with PCRE (Matches the number after result)  
```grep -ioP "result\s*\K\d+"```
