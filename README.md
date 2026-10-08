

# GA3 answers - Wyatt Bednar

------------------------------------------------------------------------

## Part A: Your README, data, and Git repo

### 1: Create subdirs and copy files



### 2: Initialize a Git repository, and commit the README and `.gitignore`



### 3: Commit throughout the assignment



------------------------------------------------------------------------

## Part B: Basic shell scripts

### 4: Predict the output of `echo.sh`


*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08`): This will cause an error, as the third argument ($3) is not present in the code, as Oct 07 and Oct 08 are the only arguments.



*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10`): This will list the first three agruments, Oct 07, Oct 08, and Oct 09, and list out finished because there are three agruments and then the argument to put finished in the document. 

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"`): This will list three agruments and finished, but Oct 9th and 10th will be listed together as they are in quotations. It will list results at the end. 

*Answer* (prediction and reasoning for `bash scripts/echo.sh results/fastqc/*.html`): I believe it would list the first three files in the results directory, and the finished command.

### 5: Run `echo.sh` and compare with your predictions

```bash
bash scripts/echo.sh Oct07 Oct08
```

The output of the command was:

```     
Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable    
```

```bash
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
```

The output of the command was:

```   
Oct07
Oct08
Oct09
Finished
```

```bash
bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
```

The output of the command was:

``` 
Oct07
Oct08
Oct09 Oct10
Finished     
```

```bash
bash scripts/echo.sh results/fastqc/*.html
```

The output of the command was:

```  
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished  
```

*Answer*: Which output (if any) differed from your prediction, and why? 
They all look similar to my predictions. The script can only run the three arguments and finsihed, so if the script has less than three or more than three it will only list three. The quotation marks cause the third script Oct 09 and 10 to run together. The fourth script listed out the first three files in the results directory. 

### 6: Write the `printline.sh` script


### 7: Test `printline.sh` twice

Test 1:

```bash
bash scripts/printline.sh
```

The output of the command was:

``` 
S68     24hpi   relictum  
```

Test 2 (with redirection), and checking the contents of the output file:

```bash

bash scripts/printline.sh > results/metadata.tsv
```

The output of the command that checks the file contents was:

```  
Moved the last line, S68	24hpi	relictum into the file in results       
```

------------------------------------------------------------------------

## Part C: A script to run MultiQC

### 8: Get a MultiQC container link

*Answer*: The container link (URI) is: oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

### 9: MultiQC's help info, and the MultiQC command

Code to run `multiqc --help` with the container:

```bash
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc --help
```



The MultiQC command to run MultiQC on `results/fastqc` with output in `results/multiqc`:

```bash
#Outdir should be after input directory to tell the command what directory is the output directory
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc results/fastqc/ -o results/multiqc/ 
```
 
### 10: Write the `multiqc.sh` script



### 11: Run `multiqc.sh`

Code to run the script:

```bash
bash scripts/multiqc.sh
```



*Answer*: Number of FastQC reports MultiQC found: 44 reports

*Answer*: Does that match what you expected? No, there are less reports than I expected. I would have expected the exact amount of zip and html files located in the fastqc folder. 

### 12: Make `multiqc.sh` accept arguments, and rerun it



Code to rerun the script:

```bash
bash scripts/multiqc.sh results/fastqc results/multiqc
```



### 13: Differences between the two MultiQC runs

*Answer*: The second Multiqc run created a second folder in the results/multiqc directory. The first run created multiqc_data with its matching html folder, the second run created another folder, multiqc_data_1 with the matching html file. This is likely to prevent erasing or overriding previous data sets. 

------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does): It looks like I am able to transfer my markdown file into a PDF. The PDF is the output directory, as it has the -o command in front of it. I am transferring my markdown content into a new file. 

*Answer* (how does Pandoc know which output format to produce?): The pdf extension at the end of the output location will convert the file to a pdf. 

### 15: Render your README to PDF and HTML

```bash
pandoc -o README.pdf README.md
```

- Command to render to HTML:

```bash
pandoc -o README.html README.md
```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not?

No, as we should only be committing source material, not generated material from the source material. 

### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file: The code blocks do not show up, so it is important to differentiate in the markdown file what the code is and what the outputs are. Without labels, it is hard to determine what could be code and what is the output of the code. 

## Part E: Publish your repo on GitHub

### 18: Create a GitHub repository

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 19: Connect your local repo to GitHub, and push

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 20: Create an Issue to tag the instructors

<!-- No command/output needed here -- we check your GitHub repo directly. -->

------------------------------------------------------------------------

## Bonus

### 21: Explore the MultiQC report

*Answer* (one insight you gained): It is able to show data quality, base pair reads, GC content. It is a great tool for ensuring data quality and analyzing large amounts of reads. It also creates nice graphs and tables. I also like how it shows the top overrepresented seuqences, which you can use to compare with various reports. 

*Answer* (one thing you're confused about): I would assume these figures probably shouldn't be used to a dissertation to represent data quality, but what are the recommendations if it is allowed.

### 22: Pandoc versions

```bash
pandoc -v
```

The output of the command(s) was: 

pandoc 2.14.0.3
Compiled with pandoc-types 1.22.1, texmath 0.12.3.3, skylighting 0.10.5.2,
citeproc 0.4.0.1, ipynb 0.1.0.1
User data directory: /users/PAS3493/wyattbed65/.local/share/pandoc
Copyright (C) 2006-2021 John MacFarlane. Web:  https://pandoc.org
This is free software; see the source for copying conditions. There is no
warranty, not even for merchantability or fitness for a particular purpose.

```         
```

*Answer*: Is the Pandoc version available by default the most recent one? 

The most recent version is 3.12, and the version I am using is pandoc 2.14.0.3, meaning that OSC does not provide the most recent version automatically. 

*Answer*: Which Pandoc version are you using after loading the module?
After I did module spider pandoc, I saw that pandoc 3.6.4 was the most recent version available. I loaded it in via module load pandoc/3.6.4.

pandoc -v
pandoc 3.6.4
Features: +server +lua
Scripting engine: Lua 5.4
User data directory: /users/PAS3493/wyattbed65/.local/share/pandoc
Copyright (C) 2006-2024 John MacFarlane. Web: https://pandoc.org
This is free software; see the source for copying conditions. There is no
warranty, not even for merchantability or fitness for a particular purpose.
