
## Instructions to install the virtual environment

```conda create -n verl python==3.10
conda activate verl
USE_MEGATRON=0 bash scripts/install_vllm_sglang_mcore.sh'''
pip install word2number
pip install math_verify
huggingface-cli login
wandb login
