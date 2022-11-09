import os
import argparse
from utils.util import tensor2im, save_image

import numpy as np
import torch

# # convert a tensor into a numpy array
# def tensor2im(image_tensor, bytes=255.0, imtype=np.uint8, is_depth=False, is_heatmap=False):
#     if image_tensor.dim() == 3:  # (C, H, W)
#         image_tensor = image_tensor.cpu().float()
#     else:
#         image_tensor = image_tensor[0].cpu().float()

#     if is_depth:
#         image_tensor = image_tensor * bytes
#     elif is_heatmap:
#         image_tensor = torch.clamp(torch.sum(image_tensor, dim=0, keepdim=True), min=0.0, max=1.0) * bytes
#     else:
#         # image_tensor = (image_tensor + 1.0) / 2.0 * bytes
#         image_tensor = denormalize_ImageNet(image_tensor) * bytes

#     image_numpy = (image_tensor.permute(1, 2, 0)).numpy().astype(imtype)
#     return image_numpy

# def denormalize_ImageNet(x):
#     mean = torch.Tensor([0.485, 0.456, 0.406]).view(3, 1, 1)
#     std = torch.Tensor([0.229, 0.224, 0.225]).view(3, 1, 1)
#     return x * std + mean

# def save_image(image_numpy, image_path):
#     if image_numpy.shape[2] == 1:
#         image_numpy = image_numpy.reshape(image_numpy.shape[0], image_numpy.shape[1])
#     image_numpy = Image.fromarray(image_numpy)
#     image_numpy.save(image_path)
#     # imageio.imwrite(image_path, image_numpy)


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
