# Homework 1

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