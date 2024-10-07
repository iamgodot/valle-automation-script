#!/bin/bash

# SLURM job parameters
#SBATCH --job-name=valle_train
#SBATCH --output=/courses/CS7980.202510/students/xu.zu/logs/%j_output.log
#SBATCH --error=/courses/CS7980.202510/students/xu.zu/logs/%j_error.log
#SBATCH --constraint=ib
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --gres=gpu:t4:1
#SBATCH --mem=15G
#SBATCH --cpus-per-task=8
#SBATCH --time=08:00:00
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=xu.zu@northeastern.edu

# Load required modules
module load singularity

# Set up environment variables
valle_root=/courses/CS7980.202510/students/xu.zu/vall-e
cd $valle_root/egs/libritts
singularity_image=/courses/CS7980.202510/shared/containers/valle_container/valle.sif

# Run training script within Singularity container
singularity run --nv --bind $valle_root:$valle_root $singularity_image \
    bash prepare.sh --stage -1 --stop-stage 3
