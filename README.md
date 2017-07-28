# Breast cancer diagnosis using deep residual nets and transfer learning

Li Shen

Icahn School of Medicine at Mount Sinai

New York, New York, USA

## Overview
Under the current folder are several Python modules that are used by both training and inference. The training and inference code are under specific sub-folders as described below.

Development Environment: CUDA 8 + Python 2.7 + Tensorflow + Keras 1.x

## Training
### Patch classifier training on CBIS-DDSM
Under [ddsm_train](./ddsm_train) folder:

[sample_patches_combined.py](./ddsm_train/sample_patches_combined.py) is a Python program to generate image patches from CBIS-DDSM images. It takes in images and corresponding binary masks (i.e. annotations) as input and generates image patches to external folders. See [sample_combined_patches_im4096.sh](./ddsm_train/sample_combined_patches_im4096.sh) for an example to call this program.

[patch_clf_train.py](./ddsm_train/patch_clf_train.py) is a Python program to train a deep learning model to classify image patches into background, benign and malignant. See [train_patch_clf_im4096_256_3Cls.sh](./ddsm_train/train_patch_clf_im4096_256_3Cls.sh) for an example to call this program.
### Patch classifier finetuning on DM challenge data
Under [training](./training) folder:

[dm_patchClf_finetune.py](./training/dm_patchClf_finetune.py) is a Python program used to finetune a patch classifier on the DM challenge data. See [finetune_patch_clf.sh](./training/finetune_patch_clf.sh) for a shell script to run this program in the cloud. See [finetune_patch_clf_local.sh](./training/finetune_patch_clf_local.sh) for a shell script to run this program locally.
### Breast-level classifier training on probabilistic heatmaps
Under [training](./training) folder:

[dm_heatmap_score.py](./training/dm_heatmap_score.py) is a Python program to generate probabilistic heatmaps from DM challenge images using a trained patch classifier. See [score_heatmap.sh](./training/score_heatmap.sh) for a shell script to run it in the cloud. See [score_heatmap_local.sh](./training/score_heatmap_local.sh) for a shell script to test it locally. 

[prob_heatmap_clf_dist.ipynb](./training/prob_heatmap_clf_dist.ipynb) is a Python notebook that contains code to develop a breast-level classifier based on the features extracted from the probabilistic heatmaps. 
### Sub-challenge 2 classifier training
Under [training](./training) folder:

[dm_sc2_meta_clf.py](./training/dm_sc2_meta_clf.py) is a Python script that trains a random forest classifier using image scores and clinical information from the current and previous exams.

## Inference
Under [inference](./inference) folder:

[dm_sc1_phm_infer.py](./inference/dm_sc1_phm_infer.py) and [dm_sc2_phm_infer.py](./inference/dm_sc2_phm_infer.py) are the Python programs for SC1 and SC2 inference, respectively. [sc1_phm_infer.sh](./inference/sc1_phm_infer.sh) and [sc2_phm_infer.sh](./inference/sc2_phm_infer.sh) are the shell scripts to run them in the cloud. [sc1_phm_infer_local.sh](./inference/sc1_phm_infer_local.sh) and [sc2_phm_infer_local.sh](./inference/sc2_phm_infer_local.sh) are the shell scripts to test them locally.



