# Topic Modeling with Mallet

## Installing Mallet on Mac

### Let's first make sure you have java. 

Java Download and Setup: Mallet is written in Java, a cross-platform language maintained by Oracle. Although named similarly, it has nothing to with Javascript in your web browser.
Depending on your version of Mac OS X and what you’ve installed previously, you may already have Java installed. But most probably will need to install Java before you are able to use Mallet.

How to check
1. Go to Apple -> System Preferences -> You should see Java on the bottom left. 
2. Command Line
- Java version
```sh
java -version  
```
- Java Compiler version
```sh
javac -version
```

If you don't have java,  go to this [page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).
Accept the License Agreement. Download the “Mac OS X x64” version of Java.


### Mallet Download and Setup 

Download this file: [http://mallet.cs.umass.edu/dist/mallet-2.0.8.tar.gz](http://mallet.cs.umass.edu/dist/mallet-2.0.8.tar.gz)
Open the Downloads folder in the Finder (usually in the Dock next to the trash).
Open the downloaded file so that it uncompresses into folder called mallet-2.0.8.
Move to the Desktop.


### Launch Terminal
The icon is in the Utilities folder, inside the Applications folder
Or search for “Terminal” using Spotlight, the magnifying glass icon in the top righthand corner of the screen
Within Terminal, type `cd ` (with a space). Don’t hit return yet.
Drag the icon of mallet-2.0.8 into the Terminal window. The full “path” to the folder should appear, so that the line reads:
 cd /Users/yourname/Downloads/mallet-2.0.8
Hit return. Your command-line terminal will now be “inside” the mallet folder.
Type `ls` to get a list of all the files and folders inside the mallet folder.
Back in the Finder, double-click the mallet-2.0.8 folder.  You can now see all the files and folders inside the mallet folder.

### Windows Set-up
Mallet is written in Java, a cross-platform language maintained by Oracle. Although named similarly, it has nothing to with Javascript in your web browser.
You will most probably need to install Java on your PC. Note that Oracle has stopped supporting Java on Windows XP. 
The Programming Historian has a comprehensive tutorial on how to install the required Java files for use with Mallet. Follow the instructions here:
http://programminghistorian.org/lessons/topic-modeling-and-mallet

----------


## Sample Data

We have a collection of journal articles from JSTOR for this lab. Download [this Zip file](https://drive.google.com/file/d/0B1glRexbIUWoODZoaU5jb1NOcEk/edit?usp=sharing).

They are a random selection of 1,000 documents from journals such as: 

- amstudiestxt - American Quarterly  
- chaucer - The Chaucer Review
- bible - Journal of Bible and Religion 

Once you uncompress the file, you’ll see a number of folders with names such as “avian”, “bible”, etc.  
These titles roughly correspond with the subjects of the journals they were pulled from.

If you happen to inspect any of these individual text files, you’ll notice they’re not readable by a human because they’re just lists of word counts. 
This is how JSTOR can grant access to in-copyright material for text mining purposes. Even though we can’t read them easily, Mallet can still find patterns in word co-occurrence.

----

## Using Mallet - Mac

Three basic steps to using Mallet:

1. Make sure you and your data are in the right directory. The data should be in the
mallet-2.0.8 folder.  Open your terminal and move into that folder. Use the
[command line tutorial](https://github.com/introdh2016/labs/blob/master/commandline.md).

2. The second step is to Import all your text files. The result will be a combined
binary file that isn’t much use to you, but that is optimized for further work in Mallet. 

Example:

```sh
bin/mallet import-dir --input amstudiestxt --output texts.mallet --keep-sequence --remove-stopwords
```

3.The third step is to "Train topics" on file you created during the import process. The
result will be a list of unlabeled topics, expressed by their significant, or characteristic,
words.

```sh
bin/mallet train-topics \
  --input texts.mallet \
  --num-topics 30 \
  --output-topic-keys topic_keys.txt \
  --xml-topic-report  topic_report.xml \
  --num-iterations 100 \
  --random-seed 1
```

The output will be stored in two files: `topic_keys.txt` and `topic_report.xml`. Both
contain very similar output; you may find you prefer the look at the txt. If you find
a particular topic model useful, I suggest saving either the txt or xml file. Consider
renaming it something that allows you replicate the model if needed. For example,
using the above settings, we might call it `topic_keys_n30_s1.txt` (30 topics and
random seed 1).

If you want more details about the options to the commands above, or to see additional
options, run the following in the terminal:

```{sh}
bin/mallet train-topics --help
```

## Using Mallet - Windows

Three basic steps to using Mallet:

1. Make sure you and your data are in the right directory. The data should be in the
mallet-2.0.8 folder.  Open your terminal and move into that folder. Use the
[command line tutorial](https://github.com/introdh2016/labs/blob/master/commandline.md).

2. The second step is to Import all your text files. The result will be a combined
binary file that isn’t much use to you, but that is optimized for further work in Mallet. 

Example:

```sh
bin\mallet import-dir --input amstudiestxt --output texts.mallet --keep-sequence --remove-stopwords
```

3.The third step is to "Train topics" on file you created during the import process. The
result will be a list of unlabeled topics, expressed by their significant, or characteristic,
words.

```sh
bin\mallet train-topics \
  --input texts.mallet \
  --num-topics 30 \
  --output-topic-keys topic_keys.txt \
  --xml-topic-report  topic_report.xml \
  --num-iterations 100 \
  --random-seed 1
```

The output will be stored in two files: `topic_keys.txt` and `topic_report.xml`. Both
contain very similar output; you may find you prefer the look at the txt. If you find
a particular topic model useful, I suggest saving either the txt or xml file. Consider
renaming it something that allows you replicate the model if needed. For example,
using the above settings, we might call it `topic_keys_n30_s1.txt` (30 topics and
random seed 1).

## Mallet - Adding custom stop words

Mallet has a default stop list it uses. In many cases though, we want to 
adjust the stop list according to our needs. For example, if I'm working with American
Quarterly, I might want to stoplist "American" and "Quarterly."

The default lists are available in: `mallet-2.0.8/stoplists/`. You can override
the default list on Mallet using one of these lists or a custom list of your
choosing.  How do we do this?

Copy the file `en.txt`, rename it `my_stopwords.txt`, and put it directly in
the mallet folder (in our case mallet-2.0.8). Add your own stop words to the
list as new lines. Then, run the following command to set-up the mallet binary
object to include these stopwords:

```sh
bin/mallet import-dir --input amstudiestxt --output texts.mallet \
  --keep-sequence \
  --stopword-file my_stopwords.txt 
```

Now, I'm using my custom list! You need to repeat the model building stage
(step 3 above) to fit a model using this new data.

On a Window machine, the code is mostly the same, just modify the first part to
be `bin\mallet`.

### What's next

Now, explore adjusting the number of topics and editing the stop word lists.
You may also change the number of iterations; the higher the number the longer
the model takes the finish but the more accurate and stable it will be. Decide
on which topic model you find the most interesting or insightful. Be prepared
to explain why. 

--------------------

## Troublshooting

### Not Enough Memory

Depending on how large your files are, you might get an error that says you do not have enough memory. 
To address this issue, you can do one of the following:

##Outside the Terminal

Go to the folder ~/Downloads/mallet-2.0.8/bin/

Drag the "mallet" file into into a text editor. I recommend Sublime.
(If is it a PC, you will use mallet.bat)

Now, we can change our memory. The default is:

MEMORY=1g  

What you change the number to depends on your machine. One recommendation is 
to set it to 1g fewer than ram/memory on your machine. You can check your memory
by going to the Apple on the top left of your computer and choosing "About This Mac."
Look at "Memory."  In my case, my machine has 8GB. I will change to MEMORY=7g.

##Inside the Terminal

Go to the directory mallet2.0.8/bin/

Type 
```
pico mallet
```
Go to MEMORY=1g and change the number according to your machine. 

What you change the number to depends on your machine. One recommendation is 
to set it to 1g fewer than ram/memory on your machine. You can check your memory
by going to the Apple on the top left of your computer and choosing "About This Mac."
Look at "Memory."  In my case, my machine has 8GB. I will change to MEMORY=7g.

One you are done, type Ctrl X. Type "Y" to save. 
Control X to save and exit.

### Granular Units of Text

Due to some intricacies of the algorithm, it works best to split up longer texts into “chunks” that approximate semantic units.  For shorter texts (articles, poems, etc), it’s fine to leave them as one unit. But novels probably need to be split up into smaller divisions than chapters. Matt Jockers (University of Nebraska, Lincoln) has done more work with topic-modeling literature than most: “For the books in this corpus, I found through experimentation that 1,000-word chunking was effective.” See his post: 
http://www.matthewjockers.net/2013/04/12/secret-recipe-for-topic-modeling-themes/
or his book:
http://books.google.com/books?id=mPOdxQgpOSUC

You can use a command on Mac OS X or most other Unix systems to split a novel up into roughly 1000-word chunks, by slicing the text into 6 kilobyte sections:

```sh
split -b 6k file.txt file_
```

Replace file.txt with the name of your file, and file_ with the name of the prefix for each smaller part.  

This lab is adapted from a workshop by Peter Leonard, Digital Humanities Library, Yale University
