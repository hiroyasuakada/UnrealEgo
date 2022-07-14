from .base_options import BaseOptions

class TrainOptions(BaseOptions):
    def initialize(self):
        BaseOptions.initialize(self)

        # ------------------------------ training epoch ------------------------------ #
        self.parser.add_argument('--epoch_count', type=int, default=1,
                                 help='the starting epoch count')
        self.parser.add_argument('--niter', type=int, default=0,
                                 help='# of iter with initial learning rate')
        self.parser.add_argument('--niter_decay', type=int, default=0,
                                 help='# of iter to decay learning rate to zero')
        self.parser.add_argument('--continue_train', action='store_true',
                                 help='continue training: load the latest model')
        self.parser.add_argument('--transform_epoch', type=int, default=0,
                                 help='# of epoch for transform learning')
        self.parser.add_argument('--task_epoch', type=int, default=0,
                                 help='# of epoch for task learning')


        # ------------------------------ learning rate and loss weight ------------------------------ #
        self.parser.add_argument('--optimizer_type', type=str, default='Adam',
                                 help='optimizer type[Adam|SGD]')
        self.parser.add_argument('--lr_policy', type=str, default='lambda',
                                 help='learning rate policy[lambda|step|plateau]')
        self.parser.add_argument('--lr_decay_iters_step', type=int, default=4,
                                 help='of iter to decay learning rate with a policy [step]')
        self.parser.add_argument('--lr', type=float, default=1e-3,
                                 help='initial learning rate for adam')
        self.parser.add_argument('--weight_decay', type=float, default=0.0,
                                 help='weight decay')

        self.parser.add_argument('--lambda_mpjpe', type=float, default=1.0,
                                 help='weight for loss_mpjpe')
        self.parser.add_argument('--lambda_heatmap', type=float, default=1.0,
                                 help='weight for loss_heatmap')
        self.parser.add_argument('--lambda_pose', type=float, default=1e-1,
                                 help='weight for loss_pose')
        self.parser.add_argument('--lambda_heatmap_rec', type=float, default=1e-3,
                                 help='weight for loss_heatmap_rec')
        self.parser.add_argument('--lambda_cos_sim', type=float, default=-1e-2,
                                 help='weight for loss_cos_sim')
        self.parser.add_argument('--lambda_bone_length', type=float, default=0.5,
                                 help='weight for loss_bone_length')

        # ------------------------------ display the results ------------------------------ #
        self.parser.add_argument('--display_freq', type=int, default=4000,
                                 help='frequency of showing training results on screen')
        self.parser.add_argument('--print_freq', type=int, default=1000,
                                 help='frequency of showing training results on console')
        self.parser.add_argument('--save_latest_freq', type=int, default=4000,
                                 help='frequency of saving the latest results')
        self.parser.add_argument('--val_freq', type=int, default=4000,
                                 help='frequency of validation')
        self.parser.add_argument('--save_epoch_freq', type=int, default=1,
                                 help='frequency of saving checkpoints at the end of epochs')
        
        # ------------------------------ others ------------------------------ #



        self.isTrain = True
