from utils.util import RunningAverageDict
from tqdm import tqdm
import torch
import os
import cv2


def get_dict_motion_category():
    return {
        "001": "jumping",
        "002": "falling_down",
        "003": "exercising",
        "004": "pulling",
        "005": "singing",
        "006": "rolling",
        "007": "crawling",
        "008": "laying",
        "009": "sitting_on_the_ground",
        "010": "crouching",
        "011": "crouching_and_tuning",
        "012": "crouching_to_standing",
        "013": "crouching_and_moving_forward",
        "014": "crouching_and_moving_backward",
        "015": "crouching_and_moving_sideways",
        "016": "standing_with_whole_body_movement",
        "017": "standing_with_upper_body_movement",
        "018": "standing_and_turning",
        "019": "standing_to_crouching",
        "020": "standing_and_moving_forward",
        "021": "standing_and_moving_backward",
        "022": "standing_and_moving_sideways",
        "023": "dancing",
        "024": "boxing",
        "025": "wrestling",
        "026": "soccer",
        "027": "baseball",
        "028": "basketball",
        "029": "american_football",
        "030": "golf",
    }

def evaluate(opt, model, eval_dataset, epoch, save_eval_pose=None):
    model.eval()
    runnning_average_dict = RunningAverageDict()

    if opt.use_slurm is False:
        bar_eval = tqdm(enumerate(eval_dataset), total=len(eval_dataset), desc=f"Epoch: {epoch}", position=0, leave=True)
    else:
        bar_eval = enumerate(eval_dataset) 

    with torch.no_grad():
        for id, data in bar_eval:
            model.set_input(data)
            runnning_average_dict= model.evaluate(runnning_average_dict=runnning_average_dict)
            
    model.train()

    return runnning_average_dict.get_value()
    

