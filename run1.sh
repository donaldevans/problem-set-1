#! /usr/bin/env bash

# Which state in states.tab.gz has the lowest murder rate?

datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head  -n1 \
    | cut -f1 \
    | sed 's/"//g')
echo "answer-1: $answer_1" > answers.yml


sample="$datasets/fasta/sample.fa"
answer_2=$(cat $sample \
    | grep '^>' \
    | wc -l)
echo "answer-2: $answer_2" >> answers.yml


# How many unique CpG IDs are in cpg.bed.gz?
datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
cpg="$datasets/bed/cpg.bed.gz"

answer_3=$(gzcat $cpg \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l )
echo "answer-3: $answer_3" >> answers.yml

# How many sequence records are in the SP1.fq file?
datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
SP1="$datasets/fastq/SP1.fq"

answer_4=$(cat $SP1 \
    | grep '^@cluster' \
    | sort -u \
    | wc -l)
echo "answer-4: $answer_4" >> answers.yml

# How many words are on lines containing the word bloody in hamlet.txt?
# (Hint: use wc to count words).

datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
hamlet="$datasets/misc/hamlet.txt"
answer_5=$(cat $hamlet \
    | grep -i 'bloody' \
    | wc -w)
echo "answer-5: $answer_5" >> answers.yml

# What is the length of the sequence in the first record of sample.fa?
# (Hint: use wc to count characters).

datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
sample="$datasets/fasta/sample.fa"
answer_6=$(cat $sample \
    | grep -v '^>' \
    | head -n1 \
    | tr -d '\n\r' \
    | wc -m)
echo "answer-6: $answer_6" >> answers.yml

# What is the name of the longest gene in genes.hg19.bed.gz?
datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
genes="$datasets/bed/genes.hg19.bed.gz"
answer_7=$(gzcat $genes \
    | awk '{print $4, $3-$2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d " ")
echo "answer-7: $answer_7" >> answers.yml
# How many unique chromosomes are in genes.hg19.bed.gz?
datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
bed="$datasets/bed/genes.hg19.bed.gz"
answer_8=$(gzcat $bed \
    | cut -f1 \
    | sort -u \
    | wc -w)
echo "answer-8: $answer_8" >> answers.yml

# How many intervals are associated with CTCF (not CTCFL) in
# peaks.chr22.bed.gz?
datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
peaks="$datasets/bed/peaks.chr22.bed.gz"
answer_9=$(gzcat $peaks \
    | grep -v 'CTCFL' \
    | grep 'CTCF' \
    | sort -u \
    | wc -l)
echo "answer-9: $answer_9" >> answers.yml

# On what chromosome is the largest interval in lamina.bed?
datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'
lamina="$datasets/bed/lamina.bed"
answer_10=$(cat $lamina \
    | awk '{print $1, $3-$2}' \
    | sort -k2n \
    | tail -n1 \
    | cut -d " " -f1)
echo "answer-10: $answer_10" >> answers.yml
