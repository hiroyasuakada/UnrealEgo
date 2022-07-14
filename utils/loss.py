import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
from math import exp


class LossFuncLimb(nn.Module):
    list_joints = [
            "head",
            "neck_01",
            "upperarm_l",
            "upperarm_r",
            "lowerarm_l",
            "lowerarm_r",
            "hand_l",
            "hand_r",
            "thigh_l",
            "thigh_r",
            "calf_l",
            "calf_r",
            "foot_l",
            "foot_r",
            "ball_l",
            "ball_r"
        ]
    kinematic_parents = [0, 0, 1, 1, 2, 3, 4, 5, 2, 3, 8, 9, 10, 11, 12, 13]
    def __init__(self):
        super(LossFuncLimb, self).__init__()

        self.cos_loss = nn.CosineSimilarity(dim=2)

    def forward(self, pose_predicted, pose_gt):
        predicted_bone_vector = pose_predicted - pose_predicted[:, self.kinematic_parents, :]
        predicted_bone_vector = predicted_bone_vector[:, 1:, :]
        gt_bone_vector = pose_gt - pose_gt[:, self.kinematic_parents, :]
        gt_bone_vector = gt_bone_vector[:, 1:, :]


        cos_loss = self.cos_loss(predicted_bone_vector, gt_bone_vector)
        cos_loss = torch.mean(torch.sum(cos_loss, dim=1), dim=0)

        predicted_bone_length = torch.norm(predicted_bone_vector, dim=-1)
        gt_bone_length = torch.norm(gt_bone_vector, dim=-1)

        bone_length_loss = torch.mean(torch.sum((predicted_bone_length - gt_bone_length)**2, dim=1), dim=0)

        return cos_loss, bone_length_loss

class LossFuncCosSim(nn.Module):
    list_joints = [
            "head",
            "neck_01",
            "upperarm_l",
            "upperarm_r",
            "lowerarm_l",
            "lowerarm_r",
            "hand_l",
            "hand_r",
            "thigh_l",
            "thigh_r",
            "calf_l",
            "calf_r",
            "foot_l",
            "foot_r",
            "ball_l",
            "ball_r"
        ]
    kinematic_parents = [0, 0, 1, 1, 2, 3, 4, 5, 2, 3, 8, 9, 10, 11, 12, 13]
    def __init__(self):
        super(LossFuncCosSim, self).__init__()

        self.cos_loss = nn.CosineSimilarity(dim=2)

    def forward(self, pose_predicted, pose_gt):
        predicted_bone_vector = pose_predicted - pose_predicted[:, self.kinematic_parents, :]
        predicted_bone_vector = predicted_bone_vector[:, 1:, :]
        gt_bone_vector = pose_gt - pose_gt[:, self.kinematic_parents, :]
        gt_bone_vector = gt_bone_vector[:, 1:, :]

        cos_loss = self.cos_loss(predicted_bone_vector, gt_bone_vector)
        cos_loss = torch.mean(torch.sum(cos_loss, dim=1), dim=0)

        return cos_loss

class LossFuncMPJPE(nn.Module): 
    def __init__(self):
        super(LossFuncMPJPE, self).__init__()

    def forward(self, pred_pose, gt_pose):
        distance = torch.linalg.norm(gt_pose - pred_pose, dim=-1)
        return torch.mean(distance)


if __name__ == "__main__":

    loss = nn.MSELoss(reduction="none")
    input = torch.randn(4, 3, 5, 5, requires_grad=True)
    target = torch.randn(4, 3, 5, 5)
    output = loss(input, target)
    print(output)