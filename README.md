# UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture (ECCV2022)

Official PyTorch implementation of our ECCV 2022 paper, "UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture".
UnrealEgo is based on an advanced concept of eyeglasses equipped with two fisheye cameras that can be used in unconstrained environments. it contains more than 450 thousand naturalistic egocentric stereo views in a wider variety of 3D environemnts.

![img](doc/overview_of_setting_2.png)

**For any questions, please contact the first author, Hiroyasu Akada [hakada@mpi-inf.mpg.de] .**

## Citation

```
    @inproceedings{hakada2022unrealego,
      title = {UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture},
      author = {Akada, Hiroyasu and Wang, Jian and Shimada, Soshi and Takahashi, Masaki and Golyanik, Vladislav and Theobalt, Christian},
      booktitle = {European Conference on Computer Vision (ECCV)}, 
      year = {2022}
    } 
```

## UnrealEgo Dataset

Please download the UnrealEgo dataset on [our project page](https://4dqv.mpi-inf.mpg.de/UnrealEgo/). The dataset is 1.9TB in total.

### Structure

The dataset is structured as follows:

```
UnrealEgoData
├── test.txt
├── train.txt
├── validation.txt
├── Environment Name 1
│   ├── Day
│   │   ├── Human Model Name 1
│   │   │	└── Glasses Name (SKM_MenReadingGlasses_Shape_01)
│   │	│		├── Motion Category 1
│   │	│		│	├── Motion Name 1
│   │	│		│	│	├── fisheye_final_image (RGB)
│   │   │		│	│	├── fisheye_depth_image (Depth)
│   │   │		│	│	├── fisheye_heatmap (Heatmap)
│   │   │		│	│	├── json (keypoint, etc.)
│   │   │		│	│	└── all_data_with_img-256_hm-64_pose-16_npy
│   │   │		│	│
│   │   │		│	├── Motion Name 2
│   │   │		│	└──...
│   │   │		│
│   │   │		├── Motion Category 2
│   │   │		└──...
│   │   │
│   │	├── Human Model Name 2
│   │	└──...
│   │	
│   └── (Night)
│   
├── Environment Name 2
├── Environment Name 3
└──...
```

We provide metadata for each frame:

- fisheye_final_image: rgb images, 8-bit png, 1024 × 1024
- fisheye_depth_image: depth images, 8-bit png, 1024 × 1024
- fisheye_heatmap: heatmaps, npy, 64 × 64
- json: json file with camera and pose information 
- all_data_with_img-256_hm-64_pose-16_npy: this contains data used for faster training, including rgb images, heatmaps, and pelvis-relative 3D pose. See our [dataloader](https://github.com/hiroyasuakada/UnrealEgo/blob/e3ba929345eb71f27bac1ce8d97e25e106cc3d47/dataloader/data_loader.py#L86-L90) for more details.

### Motion Categories

We mannually classified all of the motions into 30 motion categories as follows:

|Motion Category|Example Motions|
|---------|----------|
|1: jumping |cross_jumps, forward_jump, joyful_jump |
|2: falling down |stunned, knocked_down, dying |
|3: exercising |air_squat, back_squat, bicycle_crunch |
|4: pulling |pulling_a_rope |
|5: singing |singing, guitar_playing |
|6: rolling |running_dive_roll |
|7: crawling |crawl_backwards, running_crawl |
|8: laying |laying_breathless, stroke_shrugging |
|9: sitting on the ground |sitting_dazed |
|10: crouching - normal |crouch_look_around_corner |
|11: crouching - turning |crouch_turn_to_stand |
|12: crouching - to standing |crouch_to_stand, getting_up |
|13: crouching - forward |crouch_running, crouch_walk |
|14: crouching - backward |crouch_run_backwards, pull_heavy_object |
|15: crouching - sideways |crouch_walk_left, crouch_walk_right |
|16: standing - whole body |angry, digging, looking_around|
|17: standing - upper body |blow_a_kiss, bartending, disappointed|
|18: standing - turning |change_direction |
|19: standing - to crouching |kneel |
|20: standing - forward |walking, open_door_outwards |
|21: standing - backward |run_backward_arc_right |
|22: standing - sideways |standing_walk_right |
|23: dancing |wave_hip_hop_dance, bellydancing |
|24: boxing |cross_punch, reaction |
|25: wrestling |kicking, headbutt |
|26: soccer |chip, goalkeeper_catch|
|27: baseball  |pitching, buntm hit |
|28: basketball |dribble, intercepting |
|29: american football |receiver_catch, quarterback_pass |
|30: golf |golf_drive, golf_tee_up |




## Implementation

### Dependencies 

- Python 3.7
- Ubuntu 18.04
- PyTorch 1.6.0
- Cuda 10.1

### Training

You can train the models from scratch or use [trained weights](https://drive.google.com/drive/folders/1uTS6Z3BJ4oMz1YbQXSVC1M2Y924CTMs0?usp=sharing). The model weights will be saved in `./log/(experiment_name)`.

#### Heatmap

        bash scripts/train/unrealego_heatmap_shared.sh
        
        
#### AutoEncoder 

        bash scripts/train/unrealego_autoencoder.sh

After the training is finished, you will see quantitative results.


### Testing

If you want to see quantitative results using trained weights, run the command below.

        bash scripts/test/unrealego_autoencoder.sh


## Acknowledgments
Code is inspired by [CycleGan](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix).

