infilename=../data/vocabASRespeak
outfilename=transcript
touch $outfilename
rm time.txt
start=`date +%s`
head $infilename
phonemize -q -j 4 -p ' ' -s '' -w '' -l ml -b espeak $infilename -o $outfilename
#sed -i 's/^\ //g' $outfilename
#sed -i 's/\ \ $//g' $outfilename
#sed -i 's/m æ l eɪ ɑː l ə m  //g' $outfilename
paste $infilename $outfilename > lexicon_espeak.tsv
end=`date +%s`
echo The time for espeak lexicon creation is `expr $end - $start`  seconds > time.txt
