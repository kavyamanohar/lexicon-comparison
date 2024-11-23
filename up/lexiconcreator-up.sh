rm mal_lex
rm wordpronunciation
rm time.txt
start=`date +%s`
cat ../data/vocabASR | while read x; 
do valgrind ./unified-parser $x  0 0 0 0;
cat wordpronunciation >> mal_lex;done
end=`date +%s`
filename=mal_lex
sed -i 's/\"//g' $filename
sed -i "s/set\! wordstruct '//g" $filename
sed -i "s/(( (( //g" $filename
sed -i "s/ ) 0) ))//g" $filename
sed -i "s/ ) 0) (( / /g" $filename
vocabulary=`wc -l ../data/vocabASR`
paste ../data/vocabASR mal_lex > lexicon-up.tsv
echo Execution time was `expr $end - $start` seconds to create a dictionary of $vocabulary  words. >> time.txt
