import os
import argparse
from utils.util import tensor2im, save_image

import numpy as np
import torch


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description="visualize images in the preprocessed npy data")

    parser.add_argument('--path_npy_data', type=str, default=None,
                        help='path to npy data')
    parser.add_argument('--save_dir', type=str, default="./",
                        help='dir to save images')

    args = parser.parse_args()


    # load npy data as tensor
    frame_data = np.load(args.path_npy_data, allow_pickle=True)
    frame_data = frame_data.item()
    input_rgb_left = torch.from_numpy(frame_data["input_rgb_left"]).float()
    input_rgb_right = torch.from_numpy(frame_data["input_rgb_right"]).float()
    gt_heatmap_left = torch.from_numpy(frame_data["gt_heatmap_left"]).float()
    gt_heatmap_right = torch.from_numpy(frame_data["gt_heatmap_right"]).float()

    # convert tensor to image
    input_rgb_left = tensor2im(input_rgb_left)
    input_rgb_right = tensor2im(input_rgb_right)
    gt_heatmap_left = tensor2im(gt_heatmap_left, is_heatmap=True)
    gt_heatmap_right = tensor2im(gt_heatmap_right, is_heatmap=True)

    # save images
    save_image(input_rgb_left, os.path.join(args.save_dir, "input_rgb_left.png"))
    save_image(input_rgb_right, os.path.join(args.save_dir, "input_rgb_right.png"))
    save_image(gt_heatmap_left, os.path.join(args.save_dir, "gt_heatmap_left.png"))
    save_image(gt_heatmap_right, os.path.join(args.save_dir, "gt_heatmap_right.png"))

    print("completed!!!")
