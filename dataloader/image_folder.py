import os, glob
import os.path
from natsort import natsorted


def make_dataset(opt, data_list_path, data_sub_path, id=None):
    data = []

    with open(data_list_path) as f:
        paths = [s.strip() for s in f.readlines()]

    for path in paths:
        full_path = os.path.join(path, data_sub_path, "*")

        if id is not None:
            motion_category_id = full_path.split("/")[-4]
            if id != motion_category_id:
                continue

        list_imgs_per_sequence = natsorted(glob.glob(full_path))
        data += list_imgs_per_sequence

        if opt.experiment:
            if len(data) >= 100:
                break
    
    return data, len(data)

