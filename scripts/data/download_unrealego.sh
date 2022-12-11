#!/bin/bash

declare -A unrealego_01=(
    ["FactoryEnv_Demonstration.tar.gz000"]=https://drive.google.com/file/d/1ORpzxfT-VBYjADouhsrGPX0XgBE-hy5j/view?usp=share_link
    ["FactoryEnv_Demonstration.tar.gz001"]=https://drive.google.com/file/d/1PjCHE1ypbD5iJP0lg6jniXO3iIYGe652/view?usp=share_link
    ["FactoryEnv_Demonstration.tar.gz002"]=https://drive.google.com/file/d/1SPn-0hxP7R9R4zoTjMcea2Q-GQTgXWSu/view?usp=share_link
    ["FactoryEnv_Demonstration.tar.gz003"]=https://drive.google.com/file/d/1T8qAG2vzGZEJYoF3nsGGup1EQPuNm4Bm/view?usp=share_link
    ["FactoryEnv_Demonstration.tar.gz004"]=https://drive.google.com/file/d/1TlVizaeKNMhQcWCAN9MraVazQ1Mh9hIu/view?usp=share_link
    ["FactoryEnv_Demonstration.tar.gz005"]=https://drive.google.com/file/d/1UHndvxLfA-_5P1zVjzUOfb-tWHVo2iMz/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz000"]=https://drive.google.com/file/d/1NrhXXKvTFUATYQ56Ucq6gOA_1pME2hgd/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz001"]=https://drive.google.com/file/d/1On_YStVcnjXy2KyYwRNipgYcyp5XP1qK/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz002"]=https://drive.google.com/file/d/1QJxUbhLvQfPkMMoRsWyAPDdRboHe-Yp8/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz003"]=https://drive.google.com/file/d/1SqvqrmQOsYKZZE9udNNGW36cHIo-tAlM/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz004"]=https://drive.google.com/file/d/1Te-ztkxkp0thrMajv01LKsDOLZCQdEQc/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz005"]=https://drive.google.com/file/d/1U6q66R-W4np-k7CeDn637oM2JDqEvpzK/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz006"]=https://drive.google.com/file/d/1-1LgkAxdeZRPKfAJbuSXBvv4auyTsJ29/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz007"]=https://drive.google.com/file/d/1-99KBNgM4rFEAaXBw3Elpxqfac6iMZM9/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz008"]=https://drive.google.com/file/d/1-Ee4pRpCTCaLz6BZ5dWqaA__gqWYz0oR/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz009"]=https://drive.google.com/file/d/1-Et7L82Ry7TFpVBd659eEkEvA6dHbBxb/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz010"]=https://drive.google.com/file/d/1-FtO1THzkiE_wHhKaKWWe5rNnBCTK4LM/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz011"]=https://drive.google.com/file/d/1--3cPiOzKN1_npqGDnnm6yWR6Js6aod3/view?usp=share_link
)

declare -A unrealego_02=(
    ["KyotoAlley_Showcase.tar.gz000"]=https://drive.google.com/file/d/1-OgWiwTowWw7CmoSUxLzvhYd14njsLls/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz001"]=https://drive.google.com/file/d/10Dq43PtQZsaEfTjFQPGIZmi0bkVp-pil/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz002"]=https://drive.google.com/file/d/1NfTKQoQdpfqNdT4doyUZjoa5oT7HpuiK/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz003"]=https://drive.google.com/file/d/1NrWtPgIlwRYsYwOShdfEjHTUONSO1FMV/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz004"]=https://drive.google.com/file/d/1OsEUYKsiXb5kDBNffaYIDvQkqjzJGBRe/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz005"]=https://drive.google.com/file/d/1QCo56c8KNnjaeUj2NmaQ4RVWtKecUDE4/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz006"]=https://drive.google.com/file/d/1Skb1ccnk-WCB8ELmfHFALqspAoYcaojK/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz007"]=https://drive.google.com/file/d/1TdVwohc7LV_0GC2s0s0ZdRPznBFS18iV/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz008"]=https://drive.google.com/file/d/1U5rIgLAw1AxdqvGzQWRcLlkj9IAbpWus/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz009"]=https://drive.google.com/file/d/1-PMpnQzbqnuwZsWnXmctB0OC-D33JmB_/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz010"]=https://drive.google.com/file/d/10Ifejqmd3pQjtxAWfXIfTazGra5sYnsZ/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz011"]=https://drive.google.com/file/d/114tmg6Yt_ASxMWPEw8HIIPCZQBOMbzEa/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz012"]=https://drive.google.com/file/d/11Qtrbjb_-Ajg3z4F5_896-Y68S27WcAn/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz013"]=https://drive.google.com/file/d/1NnliGazZPrDigQ7lEqC52-P8kPpYjwHG/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz014"]=https://drive.google.com/file/d/1NvsEG9PBngJSnUWqgXB5ysrqSBva8hW4/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz015"]=https://drive.google.com/file/d/1PfQbHocNmm_yY26teSQFfGMT5zldkxXR/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz016"]=https://drive.google.com/file/d/1Qh35wv7eVesFhWSX6uygnz6P9qKm_WuN/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz017"]=https://drive.google.com/file/d/1T5abnpjETk_P8FbqYrgkpFW6iM7FHEiw/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz018"]=https://drive.google.com/file/d/1TkgjgVLu7146L-P8Amn_2TaJEGwZMPHh/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz019"]=https://drive.google.com/file/d/1UFiXOg1Bk5cPolvaxjs5mYZOFTp8q3BQ/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz020"]=https://drive.google.com/file/d/1-PR-6q2K1HL5_HRhz7j11BV8WZ99vI6X/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz021"]=https://drive.google.com/file/d/10JTPeZyT_oKUW_c-8fGAVdBR8WDMiGEv/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz022"]=https://drive.google.com/file/d/118-_atOfOlEWbX8K5WAHJ24sY5U1gA-d/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz023"]=https://drive.google.com/file/d/11T4O52hTu5LauHdpAFps_OHhFA0uPZHq/view?usp=share_link
)

declare -A unrealego_03=(
    ["ArchVisInterior_ArchVis_RT.tar.gz000"]=https://drive.google.com/file/d/1Lw_NfQMQElPGG6DfefNqbLKf067jNhcJ/view?usp=share_link
    ["ModernChinese_Scene.tar.gz000"]=https://drive.google.com/file/d/1Me8IWog96U5yebcDXh-hS1eVR4nASaCa/view?usp=share_link
    ["ModularBuilding_Demo_Scene.tar.gz000"]=https://drive.google.com/file/d/1MlnqMtrSZDTPjKbQCE0WG8PF6BzCRjva/view?usp=share_link
    ["Lab_Scene.tar.gz000"]=https://drive.google.com/file/d/1MqUk7PwuA10D_GxJNXa9yr5CqH61T69I/view?usp=share_link
    ["ScienceLab_Day_01.tar.gz000"]=https://drive.google.com/file/d/1MvN-SmwM69t59iaXtJyVnhS20h87gPDq/view?usp=share_link
    ["ScienceLab_Day_01.tar.gz001"]=https://drive.google.com/file/d/1N34Ms4k1HigCbovVWRiP_RM20V97MaSs/view?usp=share_link
    ["ScienceLab_Night_01.tar.gz000"]=https://drive.google.com/file/d/1MuP3Wf4QMRPuQd9hBzCLW2nQdP5kbwDU/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Night.tar.gz000"]=https://drive.google.com/file/d/1M7MsTQt7NQc3TcIxpmvuwvJmqNqMCPRn/view?usp=share_link
    ["KyotoAlley_Showcase_Night.tar.gz000"]=https://drive.google.com/file/d/1N2KFsgWomS-_3P9_VcRt772M_VS0W0Xu/view?usp=share_link
    ["SubwayTrain_Demonstration.tar.gz000"]=https://drive.google.com/file/d/1MVIYEvhh0q7hRyjTCyof2O4vNtpe8vEc/view?usp=share_link
    ["JapaneseRestaurant_02.tar.gz000"]=https://drive.google.com/file/d/1MmTC2cek-On6BWHwNuC1ayAX_DIJAOcu/view?usp=share_link
)

declare -A unrealego_04=(
    ["DowntownWest_Demo_Environment.tar.gz000"]=https://drive.google.com/file/d/1-SlXR06R2Tyg-dW-UknRloDnH9apQ3BH/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz001"]=https://drive.google.com/file/d/1-ThPkuuioetHYSqWS6y_W-Ik0ESlmjJB/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz002"]=https://drive.google.com/file/d/1-YxjoXb2Ohn8pF-0SoixtWcJ5UKzY70u/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz003"]=https://drive.google.com/file/d/1NoNhvK92wXf7nPYZrITI4TbiiKgtyt9Q/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz004"]=https://drive.google.com/file/d/1Okb76Y4M6hm1Ihm3-o6wdsgU1JzgQ3oB/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz005"]=https://drive.google.com/file/d/1PpsK8ZiA7Q3lArsDGMAo0I0AftWKpF6W/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz006"]=https://drive.google.com/file/d/1Shz3WFvs1hBHWAXpNJTmkvWSirxQ-UCT/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz007"]=https://drive.google.com/file/d/1TMmO6agCdE1BuI8rarlmGXe1hZpkRN0m/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz008"]=https://drive.google.com/file/d/1Ty0IQkeL4-mWnNBKwl3plBtdNrqmMfon/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz009"]=https://drive.google.com/file/d/1UMEukbYUoHE7xzFnFG_UgNagvvAH7jFN/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz010"]=https://drive.google.com/file/d/1-dFGosmAEXMNhyxVHEIrn8O_zTgkpx5v/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz011"]=https://drive.google.com/file/d/10LLldLiQbJmE4r_73wS0Y6vW5-5w8BdG/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz012"]=https://drive.google.com/file/d/1Nr-pgqB7NIglP6WRNyP_7gD9-4aA7AgZ/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz013"]=https://drive.google.com/file/d/1OlPpXTKYCVePuicC-R7pTB1DgSfsDsfA/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz014"]=https://drive.google.com/file/d/1Q0MIvV5usAMr0kvda-9SeQuy4efGkthS/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz015"]=https://drive.google.com/file/d/1SiqzW1VpHk4FngZkieilyc_3Dk3L2mRT/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz016"]=https://drive.google.com/file/d/1TVG27wtMW3sRUYgkoW671uza8qRjqLHT/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz017"]=https://drive.google.com/file/d/1U0yxneWki67xlsjD-qbuogsqtswj7_j0/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz018"]=https://drive.google.com/file/d/1-kY_nKWxtutwF69Fs3gt-lU8H3GVOEuG/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz019"]=https://drive.google.com/file/d/10_qVz-o8LyuiLdiGxECjpk30qfKj3X2h/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz020"]=https://drive.google.com/file/d/1-gZX7yf4FP65PTlruZ_vAvAMLQIh2zey/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz021"]=https://drive.google.com/file/d/1-jqCPiZjAUXPaqBOBrLHeYRniWZKDr8M/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz022"]=https://drive.google.com/file/d/1-oQoOMcuvSKlqjV-Pl8JR5G9Uw9B6qSx/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz023"]=https://drive.google.com/file/d/1Sh06uhDEJr2BZp6E6IEefqj_oW0ZAnZC/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz024"]=https://drive.google.com/file/d/1TKZCGbFWWmlZYrIHrcc3hDChb0J5C6TV/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz025"]=https://drive.google.com/file/d/1Tsq8IfwR4lSvOxUHr4ln5klVQb3h5MSU/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz026"]=https://drive.google.com/file/d/1-tGP7juvl4BrGQ7yT-vq-pBj5V3cvPBC/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz027"]=https://drive.google.com/file/d/10k1wgYSTSpAjCnTNYJ0VGZy_u3CZy0Fj/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz028"]=https://drive.google.com/file/d/1-GfFbj8Ng5YiVjsUvx3m0-OPcsMG4NT4/view?usp=share_link
)

declare -A unrealego_05=(
    ["CityPark_Showcase.tar.gz000"]=https://drive.google.com/file/d/1OeCgg4Wpsp5KnQBWsorQsnRqBd4E1wZZ/view?usp=share_link
    ["CityPark_Showcase.tar.gz001"]=https://drive.google.com/file/d/1PeC8oyTnN49-Juqm2Fatoufu42T2Oj7a/view?usp=share_link
    ["CityPark_Showcase.tar.gz002"]=https://drive.google.com/file/d/1QfuI6WXLoZRxVcVe3Q5t6ZRBf-Z2vjUI/view?usp=share_link
    ["CityPark_Showcase.tar.gz003"]=https://drive.google.com/file/d/1T3VT_Frjim5rLrvlFTV0miVtIaus20Dx/view?usp=share_link
    ["CityPark_Showcase.tar.gz004"]=https://drive.google.com/file/d/1Tjt7ZUBWmcqkdMcfHnSeVVWHON3Ixv4d/view?usp=share_link
    ["CityPark_Showcase.tar.gz005"]=https://drive.google.com/file/d/11C-yrbJpO7Fh68pOc-mUuruZexmMxkKp/view?usp=share_link
    ["CityPark_Showcase.tar.gz006"]=https://drive.google.com/file/d/1-uns9dz2wNf7pnEaAN0lrcXRb_ZphUXH/view?usp=share_link
    ["CityPark_Showcase.tar.gz007"]=https://drive.google.com/file/d/10tzPTEdnIhhh-je-BlXqg9CEH5zi13uo/view?usp=share_link
    ["CityPark_Showcase.tar.gz008"]=https://drive.google.com/file/d/11QSW5yzqXC24WuegVF4W8fd_k8NqLsNW/view?usp=share_link
    ["CityPark_Showcase.tar.gz009"]=https://drive.google.com/file/d/100yv0YxHbjcd_ER_l38AHfMgiyUD6pg9/view?usp=share_link
    ["CityPark_Showcase.tar.gz010"]=https://drive.google.com/file/d/10xFg-HYSKUk5M3WmH93mOuVtE9XzVpdU/view?usp=share_link
    ["CityPark_Showcase.tar.gz011"]=https://drive.google.com/file/d/11ErmjZQjDJ2a_ZQ3GD1bk0xlRYcNF32b/view?usp=share_link
    ["Hutong_Pack_Night.tar.gz000"]=https://drive.google.com/file/d/1OYt5cN4-X_XC9LNYNddQ_wjVIiFtis6c/view?usp=share_link
    ["Hutong_Pack_Night.tar.gz001"]=https://drive.google.com/file/d/1Pl3aQrDlQwNnAPLhWnRtPLT6u3QpMXDO/view?usp=share_link
    ["Hutong_Pack_Night.tar.gz002"]=https://drive.google.com/file/d/1SWtPNy2JpBeSjL8UjYcmWCtRW8L_D8ua/view?usp=share_link
    ["Hutong_Pack_Night.tar.gz003"]=https://drive.google.com/file/d/1THceH-jGN_FA7tPAaPjBGRl2QwUTOzkY/view?usp=share_link
    ["Hutong_Pack_Night.tar.gz004"]=https://drive.google.com/file/d/1Tpx-7zUMrC0zBhrqdiLs28W2hSqjiF2w/view?usp=share_link
)

declare -A unrealego_06=(
    ["Maps_BigCompany.tar.gz000"]=https://drive.google.com/file/d/1Od735iYJPiFyZHXbghm9iKCN4VsYXP9K/view?usp=share_link
    ["Maps_BigCompany.tar.gz001"]=https://drive.google.com/file/d/1PK2G-Y6sY-n0DUT8EAp2DeV-5N2xdm3d/view?usp=share_link
    ["Maps_BigCompany.tar.gz002"]=https://drive.google.com/file/d/1Q_N0Z9t1nPChcll6Su7CfL6nYjAoT1am/view?usp=share_link
    ["Maps_BigCompany.tar.gz003"]=https://drive.google.com/file/d/1T-wa4MxTy6IhbpoG6im3kNHM60toDT0t/view?usp=share_link
    ["Maps_BigCompany.tar.gz004"]=https://drive.google.com/file/d/1Tg2lN0NAczGJhFJFcgnKMIo5xbtMOmOy/view?usp=share_link
    ["Maps_BigCompany.tar.gz005"]=https://drive.google.com/file/d/1UAza9AzuarV5Q1PAnW65XoYrGXcBnxyT/view?usp=share_link
    ["Maps_BigCompany.tar.gz006"]=https://drive.google.com/file/d/11fesvchpiJud9fewORarbzZwcH25VKe0/view?usp=share_link
    ["Maps_BigCompany.tar.gz007"]=https://drive.google.com/file/d/106oMJVKqDl02F3cRn29qS7XX4y4Vla7T/view?usp=share_link
    ["Maps_BigCompany.tar.gz008"]=https://drive.google.com/file/d/112U8Qqy9AwOl8D2aG5vpYuypLAN_iHHS/view?usp=share_link
    ["Maps_BigCompany.tar.gz009"]=https://drive.google.com/file/d/11Q-gCpulDu_XoZ_PO-zVbIrNhduaEAS1/view?usp=share_link
    ["Maps_BigCompany.tar.gz010"]=https://drive.google.com/file/d/11dbPm7UgitFaKuBm4xojI9zxrVHJkyUw/view?usp=share_link
    ["Maps_BigCompany.tar.gz011"]=https://drive.google.com/file/d/109I3_87xaBWe6sLT9607SJ2mFypm1ABE/view?usp=share_link
    ["Maps_BigCompany.tar.gz012"]=https://drive.google.com/file/d/1111ixY0F-yN0Gaxx9YWQuHjOeEGklwuC/view?usp=share_link
    ["Maps_BigCompany.tar.gz013"]=https://drive.google.com/file/d/11FwofOBjCL9Q9lRFBlt_jbDxbGsJdZ2X/view?usp=share_link
    ["Maps_BigCompany.tar.gz014"]=https://drive.google.com/file/d/11asoPq2U0naG-L5gDtEr78eyQho3Izw-/view?usp=share_link
    ["Maps_BigCompany.tar.gz015"]=https://drive.google.com/file/d/11eemE6gOIEWGQck1C6ozNSA7pj1BJ6iR/view?usp=share_link
    ["Maps_BigCompany.tar.gz016"]=https://drive.google.com/file/d/11hPIXGxF1sH6wHePt3hDlEypcnChxm4f/view?usp=share_link
)

declare -A unrealego_impl=(
    ["ArchVisInterior_ArchVis_RT.tar.gz000"]=https://drive.google.com/file/d/1R6FVDvMVfqan-pYH3w7fxop3vhwgYNmG/view?usp=share_link
    ["CityPark_Showcase.tar.gz000"]=https://drive.google.com/file/d/1RG384jm05VskN2SEl-7Z4VZRM9sMk84l/view?usp=share_link
    ["CityPark_Showcase.tar.gz001"]=https://drive.google.com/file/d/1Rzpsa_VIYrlLMwL8mBkWMv2YCsjx0NFA/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz000"]=https://drive.google.com/file/d/1RNdIhHf9Mnjdg6HQopqJN33x0zQVTXKA/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz001"]=https://drive.google.com/file/d/1S9w6lnendGAT1lQ-sUvhUXAOSPuBbjlh/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz002"]=https://drive.google.com/file/d/1SjESuaentz2X_wPxWAD7sEQIAr8ghaYz/view?usp=share_link
    ["DowntownWest_Demo_Environment.tar.gz003"]=https://drive.google.com/file/d/1TWS2uKGP2es84rjWtgtyto-D-989M7UF/view?usp=share_link
    ["FactoryEnv_Demonstration.tar.gz000"]=https://drive.google.com/file/d/1RPOL12bfLlOMuqsk4t8soFtjU3enGkZd/view?usp=share_link
    ["Hutong_Pack_Night.tar.gz000"]=https://drive.google.com/file/d/1RQo75NVqKHWR2X18bNHXmQbByOfRqgP4/view?usp=share_link
    ["JapaneseRestaurant_02.tar.gz000"]=https://drive.google.com/file/d/1RZw7_zffOaaevGby3LcT4FTqmO2NBmWy/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz000"]=https://drive.google.com/file/d/1Rh1Gm4EiNYiZtSf8tqpG1zXxKCXY49Gv/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz001"]=https://drive.google.com/file/d/1SEA766CKEjpdtTEzHyjn5eof6AupjBKh/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz002"]=https://drive.google.com/file/d/1SkFlr54rU1DSOnqcnHx37ijpur1WpaWS/view?usp=share_link
    ["KyotoAlley_Showcase.tar.gz003"]=https://drive.google.com/file/d/1TX3gr5INR7axx1zUFPSvGvW_mfrLyCTX/view?usp=share_link
    ["KyotoAlley_Showcase_Night.tar.gz000"]=https://drive.google.com/file/d/1pnaScXQ14geGWlHznayqmvHfZIBvoIsG/view?usp=share_link
    ["Lab_Scene.tar.gz000"]=https://drive.google.com/file/d/1RirH_jUrXneDYTfYm9YOAdoD29oU2S4M/view?usp=share_link
    ["Maps_BigCompany.tar.gz000"]=https://drive.google.com/file/d/1R2a_-rn9aiAyh8sumA1Lu5krhvqdYD0w/view?usp=share_link
    ["Maps_BigCompany.tar.gz001"]=https://drive.google.com/file/d/1SN7tvxvmwWqswmTtSlne8Y-dbaGAiD6U/view?usp=share_link
    ["Maps_BigCompany.tar.gz002"]=https://drive.google.com/file/d/1SyVh3mhAsr5kfBkihbNCyrvLaw3Krdvx/view?usp=share_link
    ["ModernChinese_Scene.tar.gz000"]=https://drive.google.com/file/d/1R2gba_q1SuYx4Nn3mGLQU9cMTlbX7_Ti/view?usp=share_link
    ["ModularBuilding_Demo_Scene.tar.gz000"]=https://drive.google.com/file/d/1R4xYBhK6MRnfJgPogo1I_mKFvtGLetoj/view?usp=share_link
    ["ScienceLab_Day_01.tar.gz000"]=https://drive.google.com/file/d/1RkK2HOQnWhjTkXRauPn9NcGeoLxu3ro3/view?usp=share_link
    ["ScienceLab_Night_01.tar.gz000"]=https://drive.google.com/file/d/1RtFZtVLnAVGnWUcjTQ7ikUeSrhpzh6h4/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz000"]=https://drive.google.com/file/d/1QvykCMLj5CHYLLaST8s9vuzn7ZfIBIcy/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Day.tar.gz001"]=https://drive.google.com/file/d/1S_R8u9GS5s481olhlEzzvm157vQ-mZ7t/view?usp=share_link
    ["SuburbNeighborhood_DemoMap_Night.tar.gz000"]=https://drive.google.com/file/d/1R0gOQuF65AsCH7lVnOdHW2PIDdmISszs/view?usp=share_link
    ["SubwayTrain_Demonstration.tar.gz000"]=https://drive.google.com/file/d/1RvM-qCa9RkVoewe7bPsuNHD3ued1K2Jw/view?usp=share_link
)

declare -A unrealego_train_validation_test_split=(
    ["test.txt"]=https://drive.google.com/file/d/1Gu52d23yqcli86s5GS_FaS7vGIqqlg_W/view?usp=share_link
    ["train.txt"]=https://drive.google.com/file/d/1HJ2uXpbTfhplp6nyMB6ygGFdVsO7wxss/view?usp=share_link
    ["validation.txt"]=https://drive.google.com/file/d/1H8G42tMIIvJwAbnFBUKeI8_DL7dUydhm/view?usp=share_link
)


download_data () {

    declare -n ref_data=$1
    declare -p ref_data
    echo;

    declare -a unrealego_env=(
        "KyotoAlley_Showcase"
        "DowntownWest_Demo_Environment"
        "Maps_BigCompany"
        "CityPark_Showcase"
        "FactoryEnv_Demonstration"
        "SuburbNeighborhood_DemoMap_Day"
        "Hutong_Pack_Night"
        "KyotoAlley_Showcase_Night"
        "ScienceLab_Day_01"
        "Lab_Scene"
        "SuburbNeighborhood_DemoMap_Night"
        "ScienceLab_Night_01"
        "SubwayTrain_Demonstration"
        "ArchVisInterior_ArchVis_RT"
        "JapaneseRestaurant_02"
        "ModernChinese_Scene"
        "ModularBuilding_Demo_Scene"
    )

    for env in ${unrealego_env[@]}; do
        DO_CAT=false

        if [ ! -d ./$env ]; then

            for FILE_NAME in "${!ref_data[@]}"; do

                if [ ${FILE_NAME: 0:-10} = $env ]; then

                    echo "Donwloading ${FILE_NAME} from ${ref_data[${FILE_NAME}]} ..."
                    FILE_ID=${ref_data[${FILE_NAME}]:32:-20}

                    curl -C - -H "Authorization: Bearer $ACCESS_TOKEN" \
                        https://www.googleapis.com/drive/v3/files/$FILE_ID?alt=media -o $FILE_NAME

                    DO_CAT=true
                    echo;
                fi
            done

            if $DO_CAT; then
                cat $env.tar* | tar xzf -
                rm $env.tar*
                echo "Processed: $env"
                echo "----------------------------------------------------------------------------------------------------"
                echo;
            fi
        fi
    done

    echo "===================================================================================================="
    echo;
}


download_txt (){

    declare -n ref_data=$1
    declare -p ref_data
    echo;

    for FILE_NAME in "${!ref_data[@]}"; do
        echo "Donwloading ${FILE_NAME} from ${ref_data[${FILE_NAME}]} ..."
        FILE_ID=${ref_data[${FILE_NAME}]:32:-20}

        curl -C - -H "Authorization: Bearer $ACCESS_TOKEN" \
            https://www.googleapis.com/drive/v3/files/$FILE_ID?alt=media -o $FILE_NAME

        echo;
    done

    echo "===================================================================================================="
    echo;
}


ACCESS_TOKEN=$1

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