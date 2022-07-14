#!/bin/bash

# script
python test.py  
    --experiment_name unrealego_autoencoder_B16
    --model unrealego_autoencoder 
    --data_dir ../../../static00/UnrealEgoData
    --use_amp  
    --batch_size 1
    --path_to_trained_heatmap ./log/unrealego_heatmap_shared_B16_epoch5-5/best_net_HeatMap.pth 


