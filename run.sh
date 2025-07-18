

#RAY_ADDRESS='http://10.1.79.226:8265' ray job submit --working-dir . --  HYDRA_FULL_ERROR=1 
python -m verl.trainer.main_ppo \
   data.train_files=/scratch/azureml/cr/j/76b115a71659407eb80125f03f9f1cbd//cap/data-capability/wd/INPUT_asdf/verl/verl/data/simplelr_zoo/train.parquet \
   data.val_files=/scratch/azureml/cr/j/76b115a71659407eb80125f03f9f1cbd//cap/data-capability/wd/INPUT_asdf/verl/verl/data/simplelr_zoo/test.parquet \
   algorithm.adv_estimator=grpo \
   algorithm.norm_adv_by_std_in_grpo=True \
   actor_rollout_ref.actor.use_kl_loss=False \
   actor_rollout_ref.actor.loss_agg_mode=token-mean \
   actor_rollout_ref.actor.importance_sampling=False \
   actor_rollout_ref.actor.clipping=False \
   data.train_batch_size=128 \
   data.max_prompt_length=1024 \
   actor_rollout_ref.actor.raft=True \
   data.max_response_length=8192 \
   trainer.val_before_train=False \
   data.filter_overlong_prompts=True \
   actor_rollout_ref.model.path=Qwen/Qwen2.5-7B \
   actor_rollout_ref.actor.optim.lr=1e-6 \
   actor_rollout_ref.model.use_remove_padding=True \
   actor_rollout_ref.actor.ppo_mini_batch_size=32 \
   actor_rollout_ref.actor.ppo_micro_batch_size_per_gpu=1 \
   actor_rollout_ref.actor.fsdp_config.param_offload=False \
   actor_rollout_ref.actor.fsdp_config.optimizer_offload=False \
   actor_rollout_ref.model.enable_gradient_checkpointing=True \
   actor_rollout_ref.rollout.log_prob_micro_batch_size_per_gpu=1 \
   actor_rollout_ref.rollout.tensor_model_parallel_size=1 \
   actor_rollout_ref.rollout.name=vllm \
   actor_rollout_ref.rollout.n=8 \
   actor_rollout_ref.rollout.gpu_memory_utilization=0.8 \
   actor_rollout_ref.ref.log_prob_micro_batch_size_per_gpu=1 \
   actor_rollout_ref.ref.fsdp_config.param_offload=True \
   algorithm.kl_ctrl.kl_coef=0.001 \
   trainer.logger=['console','wandb'] \
   trainer.project_name='verl_samyak_reasoning_7B'  \
   trainer.experiment_name='verl_math_Qwen2p5Math7B_NegativeRAFT_logalso_BS32_run_tokenmean' \
   trainer.rollout_data_dir='/scratch/azureml/cr/j/76b115a71659407eb80125f03f9f1cbd//cap/data-capability/wd/INPUT_asdf/checkpoints/verl_math_Qwen2p5Math7B_NegativeRAFT_logalso_BS32_run_tokenmean/rollouts' \
   trainer.n_gpus_per_node=8 \
   trainer.nnodes=1 \
   trainer.save_freq=100 \
   trainer.default_local_dir=/scratch/azureml/cr/j/76b115a71659407eb80125f03f9f1cbd//cap/data-capability/wd/INPUT_asdf/checkpoints/verl_math_Qwen2p5Math7B_NegativeRAFT_logalso_BS32_run_tokenmean \
   trainer.test_freq=1 \
   trainer.total_epochs=15 $@ | tee -a run_logs.txt