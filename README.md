
## Instructions for installing the virtual environment

```
1) conda create -n verl python==3.10
2) conda activate verl
3) USE_MEGATRON=0 bash scripts/vllm.sh
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
The default values for args is taken from ppo_trainer.yaml.
Here are the different arguments passed on in the bash file:
```
* **data.train_files**: specify the path to training dataset.
* **data.val_files**: specify the path to the validation dataset.
*  **algorithm.adv_estimator**: algorithm used for calculating the advanteges. Options: grpo/gae
*  **algorithm.norm_adv_by_std_in_grpo**: advantages normalized by standard deviation as used in GRPO
*   **actor_rollout_ref.actor.use_kl_loss**: specify whether kl loss will be used or not
*   **actor_rollout_ref.actor.loss_agg_mode**: normalization used for calculating the loss
*   **actor_rollout_ref.actor.importance_sampling**: True if importance sampling is used
*   **actor_rollout_ref.actor.clipping**: True if clipping is used
*   **data.train_batch_size**: Specify the bach size for generating rollouts 
*   **data.max_prompt_length**: Maximum number of permissible tokens in the input prompts 
*   **actor_rollout_ref.actor.raft**: True if we want to use some reweighted version of MLE
*   **data.max_response_length**: Determines the maximum permissible number of tokens in the output
*   **trainer.val_before_train**: True if validation before training is to be done
*   **data.filter_overlong_prompts**: True if we want to filter out input prompts with length greater than max_prompt_length
*   **actor_rollout_ref.model.path**: Specify the model to be used for fine-tuning.
*   **actor_rollout_ref.actor.optim.lr**: Specify the fine-tuning learning rate
*   **actor_rollout_ref.actor.ppo_mini_batch_size**: Batch size of a single gradient update.
*   **actor_rollout_ref.actor.ppo_micro_batch_size_per_gpu**: training batch size per gpu
*   **actor_rollout_ref.actor.fsdp_config.param_offload**: Reduces the memory consumption by the training job
*   **actor_rollout_ref.actor.fsdp_config.optimizer_offload**: Reduces the memory consumption by the training job
*   **actor_rollout_ref.rollout.log_prob_micro_batch_size_per_gpu**:
*   **actor_rollout_ref.rollout.tensor_model_parallel_size**: Batch size of a rollout for a single gpu
*   **actor_rollout_ref.rollout.name**: library to be used to generate the rollouts
*   **actor_rollout_ref.rollout.n**: Number of rollouts for each input prompt
*   **actor_rollout_ref.rollout.gpu_memory_utilization**: Fraction of the gpus' memory to be used for training.
*   **actor_rollout_ref.ref.fsdp_config.param_offload**: Reduces the memory consumption by the training job
*   **algorithm.kl_ctrl.kl_coef**: weight of the KL loss
*   **trainer.logge**: type of logger-['console','wandb']
*   **trainer.project_name**: name of the wandb project
*   **trainer.experiment_name**: name of wandb experiment
*   **trainer.rollout_data_dir**: logging path for training time rollouts
*   **trainer.n_gpus_per_node**: number of gpus on each node
*   **trainer.nnodes**: number of nodes
*   **trainer.save_freq**: number of iterations between successive saved checkpoints
*   **trainer.default_local_dir**: logging path for trained checkpoints
*   **trainer.test_freq**: number of iterations between successive evals
```

### Todos
1) Add the eval code and corresponding instructions.
2) Add the features to run on multiple datasets like Numina and multiple models like llama8B.
