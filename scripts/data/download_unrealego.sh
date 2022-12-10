#!/bin/bash

declare -A unrealego_01=(
    ["ArchVisInterior_ArchVis_RT"]=https://drive.google.com/drive/folders/1LtyjPCCu8T7aBdx_q91ziJoSYF5zVi_m?usp=share_link
    ["FactoryEnv_Demonstration"]=https://drive.google.com/drive/folders/1OJ1YJP4NRGJdIGGXqHHkF_ad3dPEbEh5?usp=share_link
    ["ModernChinese_Scene"]=https://drive.google.com/drive/folders/1MVuTgwPr5GeArldO1hn8lmQpBCGxxTHO?usp=share_link
    ["ModularBuilding_Demo_Scene"]=https://drive.google.com/drive/folders/1MS_j_Xb25-41EjMZzpQppqz_QCJBrJOe?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day"]=https://drive.google.com/drive/folders/1NglQF5T8MAD6tmLjkd7YsS8aPeBIQT8g?usp=share_link
)

declare -A unrealego_02=(
    ["KyotoAlley_Showcase"]=https://drive.google.com/drive/folders/1N95a7ElNxPRLA1vhl1DZUC3uVj2zaM0r?usp=share_link
)

declare -A unrealego_03=(
    ["Lab_Scene"]=https://drive.google.com/drive/folders/1MKyEqwKDzS1sj62SSfZSfpCFTxCPPw8W?usp=share_link
    ["ScienceLab_Day_01"]=https://drive.google.com/drive/folders/1M3iQyJyrDlFpyxlxzdPZ_ykyGLoutZnO?usp=share_link
    ["ScienceLab_Night_01"]=https://drive.google.com/drive/folders/1MFV8cUgO2x7NHZqfZIVXI-rxgyOnv1FL?usp=share_link
    ["SuburbNeighborhood_DemoMap_Night"]=https://drive.google.com/drive/folders/1M0ZT7K07i1JxdEaHt5bAFiaqgmdGyeeR?usp=share_link
)

declare -A unrealego_04=(
    ["DowntownWest_Demo_Environment"]=https://drive.google.com/drive/folders/1NIr08jXQwQ1F5bef2QqKDkjGYAzi_0S_?usp=share_link
)

declare -A unrealego_05=(
    ["CityPark_Showcase"]=https://drive.google.com/drive/folders/1O9AAd1qznilvHd1iCDNasHl6Q2edWAVA?usp=share_link
    ["Hutong_Pack_Night"]=https://drive.google.com/drive/folders/1OF6O0xnsxjI_RIGVNRsec2RBWLfJIwKr?usp=share_link
    ["JapaneseRestaurant_02"]=https://drive.google.com/drive/folders/1MhLA-Ipr2an-W4VrxMF4hIZnQHB2offc?usp=share_link
    ["SubwayTrain_Demonstration"]=https://drive.google.com/drive/folders/1MKyhLci2bMRv-Z386HitgaZ4xZDqNfaz?usp=share_link
)

declare -A unrealego_06=(
    ["KyotoAlley_Showcase_Night"]=https://drive.google.com/drive/folders/1MYprIpau3RSQrVDDDtX4D1D4UNkr-M9s?usp=share_link
    ["Maps_BigCompany"]=https://drive.google.com/drive/folders/1ODcHzGWjj8lYuIYfRPhjuTvIvtunnFRU?usp=share_link
)

declare -A unrealego_impl=(
    ["ArchVisInterior_ArchVis_RT"]=https://drive.google.com/drive/folders/1PIGbl-ligzI10v-FsvsT4HcICAYCL-84?usp=share_link
    ["CityPark_Showcase"]=https://drive.google.com/drive/folders/1PB_-VLS_ENIqsFFvjAJryXdjbie3j_yr?usp=share_link
    ["DowntownWest_Demo_Environment"]=https://drive.google.com/drive/folders/1P-xvws-gF6xnwLhuz37FeCeu7H36MmdG?usp=share_link
    ["FactoryEnv_Demonstration"]=https://drive.google.com/drive/folders/1P-t_kP1EbR_8zrMdvqgPDo64DRzP6WBq?usp=share_link
    ["Hutong_Pack_Night"]=https://drive.google.com/drive/folders/1P-dANsomOPQk9Hn8N-1LUshnU2_Rgug7?usp=share_link
    ["JapaneseRestaurant_02"]=https://drive.google.com/drive/folders/1OxHVBkNzGXJKgYhbvn6DgTyAcgP3lGXi?usp=share_link
    ["KyotoAlley_Showcase"]=https://drive.google.com/drive/folders/1OvyGbOIsmFUqSJAyQA-7a-M8odGHWoBO?usp=share_link
    ["KyotoAlley_Showcase_Night"]=https://drive.google.com/drive/folders/1XYXMVuFOK05OA1HNdHIVpwUE5d7Y1dO_?usp=share_link
    ["Lab_Scene"]=https://drive.google.com/drive/folders/1OuxcKw5Mdj8goqbNALhQHv9HnEgpZMvK?usp=share_link
    ["Maps_BigCompany"]=https://drive.google.com/drive/folders/1PdxUOkaxZnykjeOT3cLcj2N4jZORa9f3?usp=share_link
    ["ModernChinese_Scene"]=https://drive.google.com/drive/folders/1P_7dBw4qqDSzGv5uQpAVOmrVF1u7ZKAc?usp=share_link
    ["ModularBuilding_Demo_Scene"]=https://drive.google.com/drive/folders/1PYrW50oHzPoIflkfXIvVLq68GJfzbcIk?usp=share_link
    ["ScienceLab_Day_01"]=https://drive.google.com/drive/folders/1PV_00kAaOsNC_r8JDOYB9QvzM9d8Zw6F?usp=share_link
    ["ScienceLab_Night_01"]=https://drive.google.com/drive/folders/1PRFY_SJcvIjORNIrcue1U6lTXKpcJkVo?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day"]=https://drive.google.com/drive/folders/1PxZI2PTSkrO-jsmuSMp-KoigSFQx0GNp?usp=share_link
    ["SuburbNeighborhood_DemoMap_Night"]=https://drive.google.com/drive/folders/1PtUQvkLIuM3L1PYDvWv1kuG14Q40AV2N?usp=share_link
    ["SubwayTrain_Demonstration"]=https://drive.google.com/drive/folders/1PR7VJm2iTIvNLbd-bBYIRugOT7oId2g0?usp=share_link
)

declare -A unrealego_train_validation_test_split=(
    ["test.txt"]=https://drive.google.com/uc?id=1Gu52d23yqcli86s5GS_FaS7vGIqqlg_W
    ["train.txt"]=https://drive.google.com/uc?id=1HJ2uXpbTfhplp6nyMB6ygGFdVsO7wxss
    ["validation.txt"]=https://drive.google.com/uc?id=1H8G42tMIIvJwAbnFBUKeI8_DL7dUydhm
)



download_data () {

    declare -n ref_data=$1

    for key in "${!ref_data[@]}"; do
        echo "Donwloading ${key} from ${ref_data[${key}]} ..."
        gdown --folder ${ref_data[${key}]}
        mv ${key}/* ./
        rm -r ${key}
        cat ${key}.tar* | tar xzvf -
        rm ${key}.tar*
        echo;
    done
}

download_txt () {

    declare -n ref_data=$1

    for key in "${!ref_data[@]}"; do
        echo "Donwloading ${key} from ${ref_data[${key}]} ..."
        gdown ${ref_data[${key}]}
        echo;
    done
}



mkdir -p UnrealEgoData
cd UnrealEgoData

download_data unrealego_01
download_data unrealego_02
download_data unrealego_03
download_data unrealego_04
download_data unrealego_05
download_data unrealego_06
download_data unrealego_impl
download_txt unrealego_train_validation_test_split

echo "Finished !!!"