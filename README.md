
## Instructions for installing the virtual environment

```
1) conda create -n verl python==3.10
2) conda activate verl
3) USE_MEGATRON=0 bash scripts/install_vllm_sglang_mcore.sh
4) pip install word2number
5) pip install math_verify
6) huggingface-cli login
    Copy and paste your huggingface access token key
7) wandb login
    Copy and paste your wandb access token key
```

### Instructions for running the code

```
source run.sh
```
Remember to change the file paths in the bash file.

### Instructions to run the code on multiple nodes

```
1) On the main/parent node where the code is present run: ray start --head --dashboard-host=0.0.0.0
2) On the children nodes run: ray start --address=<address>. <address> is displayed after executing (1)
3) In run.sh uncomment the first line and change the ip-address as shown in (1). Then change --trainer.nnodes depending on how many nodes we want to use.
```
