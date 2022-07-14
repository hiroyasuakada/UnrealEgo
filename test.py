import os
from options.test_options import TestOptions
from dataloader.data_loader import dataloader_full
from model.models import create_model
from evaluate import evaluate, get_dict_motion_category

if __name__ == "__main__":

    opt = TestOptions().parse()

    print("preparing dataset ... ")

    test_dataset = dataloader_full(opt, mode='test')

    print('test images = {}'.format(len(test_dataset) * opt.batch_size))

    model = create_model(opt)

    print('-----------------Test Best Model-----------------')
    print("\n")
    print("load best model ...")
    model.load_networks("best")
    metrics_test =  evaluate(opt, model, test_dataset, "best", save_eval_pose=opt.save_eval_pose)

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