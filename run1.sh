#! /usr/bin/env bash

# Which state in states.tab.gz has the lowest murder rate?

datasets='/Users/donnie/MOLB7621/problem-set-1_old/data-sets/'

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head  -n1 \
    | cut -f1)
echo "answer-1: $answer_1" > answers.yml


sample="$datasets/fasta/sample.fa"
answer_2=$(cat $sample \
    | grep '^>' \
    | wc -l)
echo "answer-2: $answer_2" >> answers.yml




