import argparse
import os
from utils import util
import torch


class BaseOptions():
    def __init__(self):
        self.parser = argparse.ArgumentParser()
        self.initialized = False

    def initialize(self):
        ### basic define ###
        self.parser.add_argument('--project_name', type=str, default='project_name',
                                help='name of the project. This is used for wnadb')
        self.parser.add_argument('--experiment_name', type=str, default='experiment',
                                help='name of the experiment')
        self.parser.add_argument('--log_dir', type=str, default='log',
                                help='It decides where to store samples and models of the experiment')
        self.parser.add_argument('--save_dir_pose', type=str, default='results', 
                                help = 'saves poses here')
        self.parser.add_argument('--which_epoch', type=str, default='latest',
                                help='which epoch to load')
        self.parser.add_argument('--gpu_ids', type=str, default='0',
                                help='gpu ids: e.g. 0, 1, 2 use -1 for CPU')   
        self.parser.add_argument('--model', type=str, default='egoglass',
                                help='choose which model to use, [xr_egopose] | [egoglass] | [unrealego]')
        self.parser.add_argument('--init_ImageNet', action='store_true', 
                                help='If true, use ImageNet initialization for the backbone')
        self.parser.add_argument('--model_name', type=str, default='resnet18', 
                                help='name of the backbone')
        self.parser.add_argument('--use_slurm', action='store_true', 
                                help='If true, use slurm cluster')
        self.parser.add_argument('--use_amp', action='store_true',
                                help='Use AMP FP16 training')
        self.parser.add_argument('--path_to_trained_heatmap', type=str, default=None,
                                help='path to weights of the trained heatmap estimator')

        ### dataset parameters ###
        self.parser.add_argument('--data_dir', type=str, default="../../../../../CT/UnrealEgo/static00/UnrealEgoData",
                                help='training, validation, and testing dataset')
        self.parser.add_argument('--num_seq', type=int, default=1,
                                help='number of sequential images to be processd at one iteration')
        self.parser.add_argument('--num_heatmap', type=int, default=15,
                                help='# of heatmaps')
        self.parser.add_argument('--num_threads', default=8, type=int, 
                                help='# threads for loading data')
        self.parser.add_argument('--batch_size', type=int, default=32, 
                                help='input batch size')
        self.parser.add_argument('--load_size_rgb', nargs='+', type=int, default=[256, 256], 
                                help='scale images to this size')
        self.parser.add_argument('--load_size_heatmap', nargs='+', type=int, default=[64, 64], 
                                help='scale images to this size')
        
        ### network structure define ##
        self.parser.add_argument('--ae_hidden_size', type=int, default=20,
                                help='# of channels at the bottom of AutoEncoder')
        self.parser.add_argument('--init_type', type=str, default='kaiming',
                                 help='network initialization [normal|xavier|kaiming]')

        # display parameter define
        self.parser.add_argument('--display_winsize', type=int, default=256,
                                 help='display window size')
        self.parser.add_argument('--display_id', type=int, default=1,
                                 help='display id of the web')
        self.parser.add_argument('--display_port', type=int, default=8097,
                                 help='visidom port of the web display')
        self.parser.add_argument('--display_single_pane_ncols', type=int, default=0,
                                 help='if positive, display all images in a single visidom web panel')

        ### others

        self.parser.add_argument('--experiment', action='store_true')
        self.parser.add_argument('--distributed', help='Use DDP', action='store_true')


    def parse(self):
        if not self.initialized:
            self.initialize()

        self.opt=self.parser.parse_args()
        self.opt.isTrain = self.isTrain

        str_ids = self.opt.gpu_ids.split(',')
        self.opt.gpu_ids = []
        for str_id in str_ids:
            id = int(str_id)
            if id >=0:
                self.opt.gpu_ids.append(id)

        # set gpu ids
        if len(self.opt.gpu_ids):
            torch.cuda.set_device(self.opt.gpu_ids[0])

        args = vars(self.opt)

        print('--------------Options--------------')
        for k, v in sorted(args.items()):
            print('%s: %s' % (str(k), str(v)))
        print('----------------End----------------')

        # save to the disk
        expr_dir = os.path.join(self.opt.log_dir, self.opt.experiment_name)
        util.mkdirs(expr_dir)
        save_pose_dir = os.path.join(self.opt.save_dir_pose, self.opt.experiment_name)
        util.mkdirs(save_pose_dir)

        if self.opt.isTrain:
            file_name = os.path.join(expr_dir, 'train_opt.txt')
        else:
            file_name = os.path.join(expr_dir, 'test_opt.txt')
        with open(file_name, 'wt') as opt_file:
            opt_file.write('--------------Options--------------\n')
            for k, v in sorted(args.items()):
                opt_file.write('%s: %s\n' % (str(k), str(v)))
            opt_file.write('----------------End----------------\n')

        return self.opt