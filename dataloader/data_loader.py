import os, glob
import random
import numpy as np
import torch
import torch.nn as nn
import torchvision.transforms as transforms
import torchvision.transforms.functional as F
import json
from PIL import Image
from natsort import natsorted
from dataloader.image_folder import make_dataset

from PIL import ImageFile
ImageFile.LOAD_TRUNCATED_IMAGES = True


class Normalize(object):
    def __init__(self, mean, std):
        self.mean = mean
        self.std = std

    def __call__(self, image):
        assert (isinstance(image, np.ndarray))
        image -= self.mean
        image /= self.std

        return image


def dataloader_full(opt, mode='train', id=None):

    if mode == 'train':
        shuffle = True
        drop_last = True
    elif mode == 'validation':
        shuffle = False
        drop_last = False
    elif mode == 'test':
        shuffle = False
        drop_last = False        

    if opt.model == "egoglass":
        datasets = CreateStereoFullDataset(opt, mode, id=id)
    elif opt.model == "unrealego_heatmap_shared":
        datasets = CreateStereoHeatmapDataset(opt, mode, id=id)
    elif opt.model == "unrealego_autoencoder":
        datasets = CreateStereoFullDataset(opt, mode, id=id)

    dataset = torch.utils.data.DataLoader(
        datasets, 
        batch_size=opt.batch_size, 
        shuffle=shuffle, 
        num_workers=int(opt.num_threads), 
        drop_last=drop_last
    )
    return dataset


class CreateStereoFullDataset(torch.utils.data.Dataset):
    def __init__(self, opt, mode, id=None):
        super(CreateStereoFullDataset, self).__init__()
        self.opt = opt
        self.mode = mode

        self.load_size_rgb = opt.load_size_rgb
        self.load_size_heatmap = opt.load_size_heatmap

        self.data_list_path = os.path.join(opt.data_dir, mode + '.txt')  # CT\UnrealEgo\static00\UnrealEgoData\train.txt

        self.frame_data_paths, self.num_frame_data = make_dataset(
            opt=opt, 
            data_list_path=self.data_list_path, 
            data_sub_path='all_data_with_img-256_hm-64_pose-16_npy',
            id=id
        )

    def __getitem__(self, index):

        # get paths for each data
        frame_data_path = self.frame_data_paths[index]

        # load each data
        frame_data = np.load(frame_data_path, allow_pickle=True)
        frame_data = frame_data.item()

        input_rgb_left = torch.from_numpy(frame_data["input_rgb_left"]).float()
        input_rgb_right = torch.from_numpy(frame_data["input_rgb_right"]).float()
        gt_heatmap_left = torch.from_numpy(frame_data["gt_heatmap_left"]).float()
        gt_heatmap_right = torch.from_numpy(frame_data["gt_heatmap_right"]).float()
        gt_local_pose = torch.from_numpy(frame_data["gt_local_pose"]).float()
        
        return {"frame_data_path": frame_data_path,
                'input_rgb_left': input_rgb_left, 
                'input_rgb_right': input_rgb_right,
                'gt_heatmap_left': gt_heatmap_left, 
                'gt_heatmap_right': gt_heatmap_right,
                'gt_local_pose': gt_local_pose,
                }

    def __len__(self):
        return self.num_frame_data


class CreateStereoHeatmapDataset(torch.utils.data.Dataset):
    def __init__(self, opt, mode, id=None):
        super(CreateStereoHeatmapDataset, self).__init__()
        self.opt = opt

        self.load_size_rgb = opt.load_size_rgb
        self.load_size_heatmap = opt.load_size_heatmap

        self.data_list_path = os.path.join(opt.data_dir, mode + '.txt')  # CT\UnrealEgo\static00\UnrealEgoData\train.txt

        self.frame_data_paths, self.num_frame_data = make_dataset(
            opt=opt, 
            data_list_path=self.data_list_path, 
            data_sub_path='all_data_with_img-256_hm-64_pose-16_npy',
            id=id
        )

    def __getitem__(self, index):

        # get paths for each data
        frame_data_path = self.frame_data_paths[index]

        # load each data
        frame_data = np.load(frame_data_path, allow_pickle=True)
        frame_data = frame_data.item()

        input_rgb_left = torch.from_numpy(frame_data["input_rgb_left"]).float()
        input_rgb_right = torch.from_numpy(frame_data["input_rgb_right"]).float()
        gt_heatmap_left = torch.from_numpy(frame_data["gt_heatmap_left"]).float()
        gt_heatmap_right = torch.from_numpy(frame_data["gt_heatmap_right"]).float()
        
        return {"frame_data_path": frame_data_path,
                'input_rgb_left': input_rgb_left, 
                'input_rgb_right': input_rgb_right,
                'gt_heatmap_left': gt_heatmap_left, 
                'gt_heatmap_right': gt_heatmap_right,
                }

    def __len__(self):
        return self.num_frame_data


if __name__ == "__main__":

    img = transforms.ToPILImage()(torch.randn(3, 224, 224))

    color_jitter = transforms.ColorJitter(brightness=0.1, contrast=0.1, saturation=0.1, hue=0.1)
    transform = transforms.ColorJitter.get_params(
        color_jitter.brightness, color_jitter.contrast, color_jitter.saturation,
        color_jitter.hue)

    img_trans1 = transform(img)
    img_trans2 = transform(img)

    print((np.array(img_trans1) == np.array(img_trans2)).all())


    # new_dict = np.load('file.npy', allow_pickle='TRUE')