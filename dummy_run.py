import torch
import multiprocessing as mp
import time
import os

def dummy_gpu_process(gpu_id):
    torch.cuda.set_device(gpu_id)
    print(f"Starting dummy process on GPU {gpu_id} (PID {os.getpid()})")

    # Allocate two large tensors on the GPU
    a = torch.randn((4096, 4096), device=f"cuda:{gpu_id}")
    b = torch.randn((4096, 4096), device=f"cuda:{gpu_id}")

    while True:
        c = torch.matmul(a, b)  # Dummy matrix multiplication
        del c  # Free memory immediately
        torch.cuda.synchronize(gpu_id)  # Ensure operation completes

if __name__ == "__main__":
    num_gpus = torch.cuda.device_count()
    print(f"Detected {num_gpus} GPUs")

    processes = []
    for i in range(num_gpus):
        p = mp.Process(target=dummy_gpu_process, args=(i,))
        p.start()
        processes.append(p)

    try:
        for p in processes:
            p.join()
    except KeyboardInterrupt:
        print("Interrupted by user, terminating all processes...")
        for p in processes:
            p.terminate()
            p.join()
 