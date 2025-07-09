
## Instructions for installing the virtual environment

```
1) conda create -n verl python==3.10
2) conda activate verl
3) USE_MEGATRON=0 bash scripts/install_vllm_sglang_mcore.sh
4) pip install word2number
5) pip install math_verify
6) huggingface-cli login
7) wandb login
```

### Instructions for running the code

```
source run.sh
```
Remember to change the file paths in the bash file.
