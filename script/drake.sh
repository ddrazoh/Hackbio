##Create a folder titled your name
$ mkdir drake

##Create another new directory titled biocomputing and change to that directory with one line of command
$ mkdir biocomputing && cd biocomputing

##Download these 3 files:
#https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna 
#https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
#https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk 
$ nano urls.txt
$ wget -i urls.txt

#OH! You made a mistake. You have to move the .fna file to the folder titled your name directly. (Do this with one command. Hint: See our cheatsheet)
$ mv *.fna ../drake

#OH No! The gbk file is a duplicate, they are actually the same thing. Please delete it.
$  rm wildtype.gbk.1

#The .fna file is actually from a bacteria, and it should definitely have a TATA (tata) box for initiating gene transcription. The molecular biologist is trying to understand the implication of dual TATA sequences. The files got mixed up and we are not sure which is wildtype and which is mutant. The mutant should have “tatatata” while the normal should have just “tata”. Can you confirm if the file is mutant or wild type
$ if grep -q "tatatata" ../drake/wildtype.fna; then echo "mutant sequence"; elif grep -q "tata" ../drake/wildtype.fna; then echo "wildtype sequence" else echo "neither mutant nor wildtype found"; fi
$grep -q "tatatata" ../drake/wildtype.fna && echo "Mutant" || echo "Wildtype"


#If it is mutant, print all the lines that show it is a mutant into a new file
$  grep "tatatata" ../drake/wildtype.fna > mutant.txt

#What is your favorite gene? (In any organism). Each team member should pick a unique gene different from every other person 
#nucleocaspid gene of sars cov2

#Download the fasta format of the gene from NCBI Nucleotide
$ efetch -db nucleotide -id NC_045512.2 -seq_start 28274 -seq_stop 29533 -format fasta | sed "1s/.*/>SARS-COV-2 nucleocapsid gene/" > sars_nucleocaspid.fasta


#How many lines are in the FASTA file (with the exception of the header)
$ grep -v "^>" spike.fasta | wc -l

#How many times does A occur
$ grep -v "^>" spike.fasta | tr -d '\n' | grep -oi 'A' | wc -c 

#How many times does G occur
$ grep -v "^>" spike.fasta | tr -d '\n' | grep -oi 'G' | wc -c 


#How many times does C occur
$  grep -v "^>" spike.fasta | tr -d '\n' | grep -oi 'C' | wc -c 


#How many times does T occur
$  grep -v "^>" spike.fasta | tr -d '\n' | grep -oi 'T' | wc -c


#Calculate the %GC content of your gene
$ grep -v '^>' sars_nucleocaspid.fasta | tr -d '\n' | awk -F '[GCgc]' '{print (NF-1)/length*100}'


#Create a nucleotide file title your name
$ touch drake.fasta


#“echo” the following into the file using >>: the number of A, G, T and C in the file you created above.
$  tr '[:lower:]' '[:upper:]' < sars_nucleocaspid.fasta | grep -v '^>' | grep -o  '[AGTC]' | sort | uniq -c > drake.fasta

#Upload the file to your team’s github repo in a folder called /output
$ mkdir output && mv drake.fasta output
$ git clone https://github.com/ddrazoh/Hackbio.git
$ git add output 
$ git commit -m “testing”
$ git remote add master https://github.com/ddrazoh/Hackbio.git
$ git push origin master



