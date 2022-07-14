import time
from tqdm import tqdm
import numpy as np
import os
from options.train_options import TrainOptions
from dataloader.data_loader import  dataloader_full
from model.models import create_model
from evaluate import evaluate, get_dict_motion_category
from utils.util import print_current_errors

if __name__ == '__main__':

    opt = TrainOptions().parse()

    print("preparing dataset ... ")
    train_dataset = dataloader_full(opt, mode='train')
    val_dataset = dataloader_full(opt, mode='validation')
    test_dataset = dataloader_full(opt, mode='test')

    print('train images = {}'.format(len(train_dataset) * opt.batch_size))
    print('validation images = {}'.format(len(val_dataset) * opt.batch_size))
    print('test images = {}'.format(len(test_dataset) * opt.batch_size))

    opt.display_freq = opt.display_freq * 32 // opt.batch_size
    opt.print_freq = opt.print_freq * 32 // opt.batch_size
    opt.save_latest_freq = opt.save_latest_freq * 32 // opt.batch_size
    opt.val_freq = opt.val_freq * 32 // opt.batch_size
    
    model = create_model(opt)

    total_steps=0
    current_best_metrics = np.inf
    best_metrics = None
    save_dir_pose = os.path.join(opt.save_dir_pose, opt.experiment_name)
    
    print('---------------------Start Training-----------------------')
    model.train()
    
    for epoch in range(opt.epoch_count, opt.niter+opt.niter_decay+1):
        epoch_iter = 0
        print('-----------------Train Epoch: {}-----------------'.format(str(epoch)))
        
        if opt.use_slurm is False:
            bar_train = tqdm(enumerate(train_dataset), total=len(train_dataset), desc=f"Epoch: {epoch}", position=0, leave=True)
        else:
            bar_train = enumerate(train_dataset) 

        # training
        for i, data in bar_train:

            iter_start_time = time.time()
            total_steps += 1
            epoch_iter += opt.batch_size
            model.set_input(data)
            model.optimize_parameters()

            if total_steps % opt.print_freq == 0:
                errors = model.get_current_errors()
                t = (time.time() - iter_start_time) / opt.batch_size
                print_current_errors(epoch, epoch_iter, errors, t)

            if (total_steps % opt.val_freq == 0):
                print('-----------------Validation Epoch: {}-----------------'.format(str(epoch)))
                metrics = evaluate(opt, model, val_dataset, epoch)

                if metrics['{}'.format(model.eval_key)] < current_best_metrics:
                    current_best_metrics = metrics['{}'.format(model.eval_key)]
                    model.save_networks('best')
                    best_metrics = metrics

        if epoch % opt.save_epoch_freq == 0:
            model.save_networks(epoch)

        model.update_learning_rate()

        print('dir name: {}'.format(opt.experiment_name)) 
    
    print("\n")
    print("train finished !!!")
    print("\n")
    print("best validation metrics: {}".format(best_metrics))
    print("\n")

    print('-----------------Test Best Model-----------------')
    print("\n")
    print("load best model ...")
    model.load_networks("best")
    metrics_test =  evaluate(opt, model, test_dataset, "best")

    print("\n")
    print("test finished !!!")
    print("\n")
    print("best test metrics:")
    for k, v in metrics_test.items():
        print("{}: {}".format(k, v))
    print("\n")

    print('-----------------Start Category-Specific Evaluation-----------------')
    print("\n")
    dict_motion_category = get_dict_motion_category()
    for key, value in dict_motion_category.items():
        key_test_dataset = dataloader_full(opt, mode="test", id=key)
        key_metrics_test = evaluate(opt, model, key_test_dataset, "best_" + key)
        print("category: {}".format(key + "_" + value))
        print("number of images: {}".format(len(key_test_dataset)))
        for k, v in key_metrics_test.items():
            print("{}: {}".format(k, v))
        print("\n")

    print('-----------------All Process Finished-----------------')
    print("\n")
