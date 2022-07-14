#!/bin/bash

# script
python train.py \
    --project_name UnrealEgoPose \
    --experiment_name unrealego_autoencoder_B16 \
    --model unrealego_autoencoder \
\
\
    --use_amp \
    --init_ImageNet \
\
    --lambda_mpjpe 0.1 \
    --lambda_heatmap 1.0 \
    --lambda_cos_sim -0.01 \
    --lambda_heatmap_rec 0.001 \
\
    --niter 5 \
    --niter_decay 5 \
    --lr 1e-3 \
    --batch_size 16 \
\
    --path_to_trained_heatmap ./log/unrealego_heatmap_shared_B16_epoch5-5/best_net_HeatMap.pth \

