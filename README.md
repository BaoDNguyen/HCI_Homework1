# Homework 1

Class: Human Computer Interaction, CS 5332\
Name: Bao Dien Quoc Nguyen\
R#: R11660127\
No. : 12

## Getting C: ANALYZE AN INTERFACE

The figures below are interface of elevator in the building of Department of Industrial, Manufacturing & Systems Engineering.

![graph](https://github.com/BaoDNguyen/HCI_Homework1/blob/master/elevator0.png)

This interface has several excellent points as well as inconveniences for users, especially for international students.
However, I only focus on its bad design.

![graph](https://github.com/BaoDNguyen/HCI_Homework1/blob/master/elevator2.png)

One disadvantage is that the distance between buttons and their signs is too large.
Moreover, the color of these buttons is quite similar to the color of the elevator.
Those things may affect the interaction of users and the elevator, for black signs are more obvious over the background.
Someones might press a number to choose the desired floor instead of the beside button.

Another thing which we need to concern is positions of the button.
In this case, we must read from left to right.
Any students who are familiar with right to left languages might have some troubles with this design.

Finally, some letters below the buttons are not necessary, for we do not need two explanations for one button.
The signs are internationally used, so even non-English speakers can understand them much more than these phrases.

## Getting B: IMPROVE THE INTERFACE

Here is my design for the interface

![graph](https://github.com/BaoDNguyen/HCI_Homework1/blob/master/interface.png)

Firstly, I put the signs into the buttons with a light around each.
If the button is pressed, the blue light will turn to red to clarify that the elevator knows where it should go.
The color will turn to green when it comes to the floor which was required.
This might help to improve the interactions between users and the elevator.

![graph](https://github.com/BaoDNguyen/HCI_Homework1/blob/master/elevator3.png)

Secondly, the order of buttons is now vertical instead of horizontal one, for I believe it meets the common sense of most users.

Thirdly, I combine *Alarm* and *Help* into one button, called *Help*.
These buttons are utilized in emergency, and they play different role.
This sometimes makes users confuse which button they should press, especially when they are not calm enough.
Therefore, I believe an integrated button is better for emergency.

Fourthly, I give up the *Stop* because some individuals can use it for their criminal activities.
This button might be move to another area instead of the user one in case authority need to use it.

![graph](https://github.com/BaoDNguyen/HCI_Homework1/blob/master/elevator5.png)

Finally, I use Braille letter for blind people.
They can also touch the button to know if they come to the floor they want or not.
Because, the side size of the button can be change after being pressed and at the arrival.

## Getting A: INTERACTIVE INTERFACE

[Click here]() to get the zip file of application.




There are 235,545,792 edges in [refseq93.edge.tsv](http://biovis.net/2019/biovisChallenges_vis/), so it is impossible to create an network of all these edges in my computer. Therefore, I tried to look at the relationships of species instead of individual genomes.

To do so, I initially separated the genomes into isolated clusters. There is no connection between two genomes in any two of these clusters. I wrote a c++ code, namely [getclusters.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EWlz7NvZdhlGvrDChUfzqxQBvuhx7HGFjwvnUog0Rcs11A?e=fre6N8), to handle this job. The result was [cluster.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/EZK8MQoEiNpOmKbLYLqN0JEBy7BMGO1VSGQFfp0NYfHtVg?e=RDAQK8).
Then, I arranged the identified numbers of the clusters by [get_cluster_arrange.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EdU3YGh3qMBOiuVdYrYj_m8BUXOdcTNtETi0CQSwih1WZg?e=jUbxOn) to get [cluster_arrange.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/EdxAjyHmqNdNvpTHwZUthbIBgYAYFn7ouvLmAXmweQjyKQ?e=HexNVD).
After that, I removed any clusters in which there are only genomes of similar species by [get_cluster_reduced.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EcpxQdbYY-BHgq0o361hp4MBTlfY-lo_NAB564U7tPE6Zg?e=ygn6Oe), before get edges of genomes in the remaining clusters by [get_edges_from_cluster_reduced.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/Efp55P7GLCJFoLXQRCbDXeEB5-BZd8bMlRCFvU9FniEmTA?e=2Nr9ga).
Next, I continued deleting the edges of two genomes that are in the same species by [get_edges_from_cluster_reduced2.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EaenyvpU0StCi5fII_BLya8ByxyXfDbjBT0UXCu54AnzsA?e=FBOR29).
Finally, I replaced each genome by its color using [get_edges_color.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EVlM9srPUj1CqKb982SsKygBLlmrZQewchpcyiACndxzkA?e=6aNyeC), before reducing its size by [get_edges_color_reduced.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EYWYBlSNRfBImO9o72c2wR8B5234xsDJuFMET4rFwUcaNg?e=m5225a).

In the final file, namely [edges_color_reduced.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/EVKf4KS8Kt5IsIJcieZ1sHsB0hM9n3sZojnR3epEcn6Cuw?e=G94auG), there are only connections between species which are identified by colors, so the network of these edges shows the relationships of living species.

The [edges_color_reduced.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/EVKf4KS8Kt5IsIJcieZ1sHsB0hM9n3sZojnR3epEcn6Cuw?e=G94auG) network was performed by Cytoscape with a setting of 8 GB for both heap and stack memory. To illustrate the number of genomes of each species, I wrote [get_size.cc](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/EXB-WaItF3VDnvk_cZNxtv4Bf8lGTRwNUUz4uTnaQ9y3Iw?e=bcYw6b) to calculate the radius of the nodes as the square root of the number of genomes belong to them. In Cytoscape, the size function is a linear one which start from 30 (at the smallest radius) to 100 (at the largest one).

The file [nodes_color.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/ERBC4MW-TIFLhuZQTUjOEQUBMSZMgXM8h-mo5hfpriR31A?e=67SESP) is a brief version of [refseq93.color](http://biovis.net/2019/biovisChallenges_vis/) in which there are only two columns of genomes and their colors.

### Network

Cytoscape 3.7.1 was utilized to depict the bonds of species in file [edges_color_reduced.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/EVKf4KS8Kt5IsIJcieZ1sHsB0hM9n3sZojnR3epEcn6Cuw?e=G94auG0). Each species has a specific color. The small labels in each nodes are names of those corresponding species. I chose yFiles organic layout for the graph. The network can be downloaded at [here](https://texastechuniversity-my.sharepoint.com/:u:/g/personal/bao_d_nguyen_ttu_edu/ERpt_fAdBmNCtQwZSb5wgzIBHEslFaQef8AwHuQYuyc1lw?e=YQEPqP).

### Files

Please click the [link](https://texastechuniversity-my.sharepoint.com/:f:/g/personal/bao_d_nguyen_ttu_edu/Euvk6RlFLGtAmCsQf_T8LwwBj59n8T3QBTMC7905Eb3tDg?e=t1KnOz) to get files you need. All explanations of the files are in [Readme.txt](https://texastechuniversity-my.sharepoint.com/:t:/g/personal/bao_d_nguyen_ttu_edu/EWQCaTIkVLFAlM2vv_9My0IBu82Mk-j1DeItixWLeryAtQ?e=zeowZr). 

### Graph

![graph](https://github.com/BaoDNguyen/BioVis2019_DataChallenge/blob/master/img/mygraph.png)

### Poster

Please click the [link](https://texastechuniversity-my.sharepoint.com/:b:/g/personal/bao_d_nguyen_ttu_edu/EcNXi7MOvc9MmYalZmJRwlwBSxSi5HcFf4PQQeFi2441jw?e=IfyCGk) to view poster.