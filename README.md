# UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture (ECCV2022)

Official PyTorch implementation of our ECCV 2022 paper, "UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture".

**For any questions, please contact the first author, Hiroyasu Akada [hakada@mpi-inf.mpg.de] .**


> **UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture**<br>
Hiroyasu Akada, Jian Wang, Soshi Shimada, Masaki Takahashi, Christian Theobalt, Vladislav Golyanik<br>
> Paper: comming soon<br><br>
> Citation: 

    @inproceedings{hakada2022unrealego,
      title = {UnrealEgo: A New Dataset for Robust Egocentric 3D Human Motion Capture},
      author = {Akada, Hiroyasu and Wang, Jian and Shimada, Soshi and Takahashi, Masaki and Golyanik, Vladislav and Theobalt, Christian},
      booktitle = {European Conference on Computer Vision (ECCV)}, 
      year = {2022}
    } 
	

# Dependencies 

- Python 3.7
- Ubuntu 18.04
- PyTorch 1.6.0 with GPU support (cuda 10.1 is tested to work)


# Training

You can train the models from scratch or use [trained weights](https://drive.google.com/drive/folders/1uTS6Z3BJ4oMz1YbQXSVC1M2Y924CTMs0?usp=sharing). The model weights will be saved in `./log/(experiment_name)`.

## Heatmap

        bash scripts/train/unrealego_heatmap_shared.sh
        
        
## AutoEncoder 

        bash scripts/train/unrealego_autoencoder.sh

After the training is finished, you will see quantitative results.


# Testing

If you want to see quantitative results using trained weights, run the command below.

        bash scripts/test/unrealego_autoencoder.sh


# Acknowledgments
Code is inspired by [CycleGan](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix).

