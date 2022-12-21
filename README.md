# UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture (ECCV2022)

Official PyTorch implementation of our ECCV 2022 paper, "UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture".
UnrealEgo is based on an advanced concept of eyeglasses equipped with two fisheye cameras that can be used in unconstrained environments. it contains more than 450 thousand naturalistic egocentric stereo views in a wider variety of 3D environemnts.

![img](doc/overview_of_setting_2.png)

**For any questions, please contact the first author, Hiroyasu Akada [hakada@mpi-inf.mpg.de] .**

## Citation

```
    @inproceedings{hakada2022unrealego,
      title = {UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture},
      author = {Akada, Hiroyasu and Wang, Jian and Shimada, Soshi and Takahashi, Masaki and Theobalt, Christian and Golyanik, Vladislav},
      booktitle = {European Conference on Computer Vision (ECCV)}, 
      year = {2022}
    } 
```

## UnrealEgo Dataset

You can download the **UnrealEgo dataset** on [our project page](https://4dqv.mpi-inf.mpg.de/UnrealEgo/) or use our download script. 

- **UnrealEgo 01 ~ 06**: this is an original dataset (~1.1TB)
- **UnrealEgo impl**: this is a preprocessed dataset (~1TB) for our implementation. If you only want to try our implementation, please just download this set.
 
Our download script will download both **UnrealEgo 01 ~ 06** and **UnrealEgo impl**. You can modify [this line](https://github.com/hiroyasuakada/UnrealEgo/blob/6b2bfddef20145e8e660482dad7d3274b5020c48/scripts/data/download_unrealego.sh#L261-L268) to download specific sets of the data.

        bash scripts/data/download_unrealego.sh [Access Token]

Please follow steps below to obtain Google’s OAuth Token from [OAuth 2.0 Playground](https://developers.google.com/oauthplayground/). 

#### Step 1: Go to [OAuth 2.0 Playground](https://developers.google.com/oauthplayground/)

#### Step 2: In the “Select the Scope” box, sarch for “Drive API v3”, expand the scope and select `https://www.googleapis.com/auth/drive.readonly`

#### Step 3: Click “Authorize APIs” and then “Exchange authorization code for tokens”

#### Step 4: Copy the “Access token” and run the download script with it

Note that this access token is valid for 1 hour. Once it expires, the download process will stop and you need to regenerate the token. You can re-run our download script with the token to resume the download process.

You can find more information about OAuth 2.0 Playground [here](https://medium.com/@skylarng89/download-large-files-from-google-drive-using-drive-api-fcbdba64fb18).


### Data Structure

With the download script, UnrealEgo will be stored in a single **UnrealEgoData** folder as below. If you downloaded each data directly from our project page, please extract and merge them accordingly.

Note that in **UnrealEgo impl**,  we provide txt files to divide UnrealEgo into training, validation, and testing splits. 

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
│   │   │		│	│	├── json (keypoint, etc.)
│   │   │		│	│	└── all_data_with_img-256_hm-64_pose-16_npy (RGB, Heatmap, Keypoint)
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

- **fisheye_final_image**: rgb images, 8-bit png, 1024 × 1024
- **fisheye_depth_image**: depth images, 8-bit png, 1024 × 1024
- **json**: json files with camera, pose, and ground plane data
    - trans: global translation in the UE4 coordinate system
    - rot: global rotation in the UE4 coordinate system
    - camera pts3d: camera-relative 3D keypoint location in the OpenCV coordinate system
    - camera pts2d: 2D keypoint location in the image coordinate
- **all_data_with_img-256_hm-64_pose-16_npy**: this file contains preprocessed data used for faster training
    - rgb images (resized to 256 × 256 and normalized with ImageNet statistics)
    - heatmaps (64 × 64)
    - pelvis-relative 3D pose (16 keypoints listed [here](https://github.com/hiroyasuakada/UnrealEgo/blob/50c01042244ddf9270da9a28adfa534f60856327/utils/loss.py#L9))
    - See our [dataloader](https://github.com/hiroyasuakada/UnrealEgo/blob/e3ba929345eb71f27bac1ce8d97e25e106cc3d47/dataloader/data_loader.py#L86-L90) for more details on how to load data

### Image Visualization of the Preprocessed Data

To visualize images from the preprocessed data (**all_data_with_img-256_hm-64_pose-16_npy**) , run the following code.

        python visualize_image.py /
            --path_npy_data [specify the path to npy data, e.g. ~/all_data_with_img-256_hm-64_pose-16_npy/frame_0.npy] /
            --save_dir [specify the dir to save images]

Images will be stored in the specified directory.

|<img src=doc/input_rgb_right.png width="128">|<img src=doc/input_rgb_left.png width="128">|<img src=doc/gt_heatmap_right.png width="128">|<img src=doc/gt_heatmap_left.png width="128">|
|:---:|:---:|:---:|:---:|
|RGB right<br>(256 × 256)|RGB left<br>(256 × 256)|Heatmap right<br>(64 × 64)|Heatmap left<br>(64 × 64)|


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

You can train the models from scratch or use [trained weights](https://drive.google.com/drive/folders/1aq9urIHQ46OwcBYCobpzO35SnVRr4IMY). The model weights will be saved in `./log/(experiment_name)`.

#### Heatmap

        bash scripts/train/unrealego_heatmap_shared/unrealego_heatmap_shared.sh

        
#### AutoEncoder 

        bash scripts/train/unrealego_autoencoder/unrealego_autoencoder.sh

After the training is finished, you will see quantitative results.


### Testing

If you want to see quantitative results using trained weights, run the command below.

        bash scripts/test/unrealego_autoencoder.sh

### Comparison Method

We also provide our implementation of a previous work, EgoGlass, without additional segmentation supervision from their 2D body part branch.
You can download [trained weights](https://drive.google.com/drive/folders/1_J8qc6NYz1woIg9vkysrC-lqqnYWPMMz). If you want to use this implementation or trained weights, please cite their paper.

        bash scripts/train/unrealego/unrealego.sh


## License Terms
Permission is hereby granted, free of charge, to any person or company obtaining a copy of this software and associated documentation files (the "Software") from the copyright holders to use the Software for any non-commercial purpose. Publication, redistribution and (re)selling of the software, of modifications, extensions, and derivates of it, and of other software containing portions of the licensed Software, are not permitted. The Copyright holder is permitted to publically disclose and advertise the use of the software by any licensee.

Packaging or distributing parts or whole of the provided software (including code, models and data) as is or as part of other software is prohibited. Commercial use of parts or whole of the provided software (including code, models and data) is strictly prohibited. Using the provided software for promotion of a commercial entity or product, or in any other manner which directly or indirectly results in commercial gains is strictly prohibited.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Acknowledgments
Code is inspired by [CycleGan](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix).
