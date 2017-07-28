#!/bin/bash

PATH_FILE="Combined_full_ROI/combined_roi_mask_path.csv"
ROI_MASK_DIR="Combined_full_ROI/roi_mask_png"
#PAT_TRAIN_FILE="Combined_full_ROI/patient_test.txt"
#PAT_TRAIN_FILE="Combined_patches_im4096_256_v3/train/pat_leftover.txt"
PAT_TRAIN_FILE="Combined_patches_im4096_256_v3/val/pat_lst.txt"
FULL_IMG_DIR="Combined_full_ROI/full_img_png"
TRAIN_OUT_DIR="Combined_patches_im4096_256_v3/val"
#VAL_OUT_DIR="Combined_patches_im4096_256_v3/no_out"
BKG_DIR="background"
CALC_POS_DIR="calc_mal"
CALC_NEG_DIR="calc_ben"
MASS_POS_DIR="mass_mal"
MASS_NEG_DIR="mass_ben"

mkdir -p $TRAIN_OUT_DIR/$BKG_DIR \
    $TRAIN_OUT_DIR/$CALC_POS_DIR $TRAIN_OUT_DIR/$CALC_NEG_DIR \
    $TRAIN_OUT_DIR/$MASS_POS_DIR $TRAIN_OUT_DIR/$MASS_NEG_DIR
#mkdir -p $VAL_OUT_DIR/$BKG_DIR \
#    $VAL_OUT_DIR/$CALC_POS_DIR $VAL_OUT_DIR/$CALC_NEG_DIR \
#    $VAL_OUT_DIR/$MASS_POS_DIR $VAL_OUT_DIR/$MASS_NEG_DIR

python sample_patches_combined.py \
	--target-height 4096 \
	--patch-size 256 \
	--nb-bkg 100 \
	--nb-abn 100 \
	--nb-hns 75 \
	--pos-cutoff 0.5 \
	--neg-cutoff 0.0 \
    --val-size 0.0 \
	--bkg-dir $BKG_DIR \
	--calc-pos-dir $CALC_POS_DIR \
	--calc-neg-dir $CALC_NEG_DIR \
	--mass-pos-dir $MASS_POS_DIR \
	--mass-neg-dir $MASS_NEG_DIR \
	--verbose \
	"$PATH_FILE" "$ROI_MASK_DIR" "$PAT_TRAIN_FILE" \
	"$FULL_IMG_DIR" "$TRAIN_OUT_DIR" "$VAL_OUT_DIR"




