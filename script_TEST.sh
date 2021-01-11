#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -o ./output-test-logs.txt -j y
#$ -t 1:1000

# This command will parse SUBJECTS to the subj variable for a SGE grid setup
# If you are not running on a grid, just ensure that ${subj} gets assigned to each subjects folder
SUBJECTS=(`cat ./input_subjects.txt`)
subj=${SUBJECTS[${SGE_TASK_ID}-1]}

base=(`awk 'NR == 2 {print $2}' ./input_text.txt`) ;

touch ${base}/logs/${subj}.txt ;
