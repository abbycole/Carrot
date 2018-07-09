# Usage bash div.preprocess.sh

# To run on my own computer I have my qiime loaded through a miniconda environment
# This is probably different for you
# source activate qiime

# change directory to where your food data is located example script
cd ../data/processed_food/

# example scripts to convert food otu tables to biom (here the input is a food table formated to look like an otu table).
biom convert -i food.txt -o food.biom --to-json --table-type "OTU table" --process-obs-metadata=taxonomy
biom convert -i dhydrt.txt -o dhydrt.biom --to-json --table-type "OTU table" --process-obs-metadata=taxonomy


# calculate beta diversity tables for food otus (here these examples need the tree file).
beta_diversity.py -i food.biom -o food_beta -t ../../raw/diet.tree.txt
beta_diversity.py -i dhydrt.biom -o dhydrt_beta -t ../../raw/diet.tree.txt


# calculate alpha diversity tables for food otus (again examples use the tree file).
alpha_diversity.py -i dhydrt.biom -o dhydrt_alpha.txt -m PD_whole_tree,shannon,chao1,simpson,observed_otus -t ../../raw/diet.tree.txt
alpha_diversity.py -i food.biom -o food_alpha.txt -m PD_whole_tree,shannon,chao1,simpson,observed_otus -t ../../raw/diet.tree.txt

