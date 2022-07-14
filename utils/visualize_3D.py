from email.policy import default
import os
import numpy as np
import open3d
import os
import argparse

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description="===")
    parser.add_argument("--dir_path", type=str, default="results", 
                        help="path to dir")    
    parser.add_argument('--id', type=int, default=0,
                        help='name of data')
    args = parser.parse_args() 


    gt_pose_path = os.path.join(args.dir_path, "gt_pose", "frame_{}.ply".format(args.id))
    pred_pose_path = os.path.join(args.dir_path, "pred_pose", "frame_{}.ply".format(args.id))
    
    gt_pose_mesh = open3d.io.read_triangle_mesh(gt_pose_path)
    pred_pose_mesh = open3d.io.read_triangle_mesh(pred_pose_path)

    open3d.visualization.draw_geometries([gt_pose_mesh, pred_pose_mesh])


# python utils\visualize_3D.py --dir_path results\unrealego_autoencoder_B16\CityPark_Showcase\Day\rp_amit_rigged_003_ue4\SKM_MenReadingGlasses_Shape_01\011\Running_Arc