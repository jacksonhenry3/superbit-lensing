# config.sh - Configuration file for submission.sh

# Define cluster-related variables
export cluster_name="Abell3411"
export band_name="b"
export cluster_redshift="0.1687"
export detection_band="b"

# Define directories
export DATADIR="/home/jhenry1/projects/weak_lensing/unchanged_weak_lensing/superbit-lensing/data/"
export CODEDIR="/home/jhenry1/projects/weak_lensing/unchanged_weak_lensing/superbit-lensing/"
export OUTDIR="${DATADIR}/${cluster_name}/${band_name}/out"

# Define ngmix parameters
export ngmix_nruns=50 
export PSF_MODEL="coellip5"
export GAL_MODEL="gauss"

# Seeds
export psf_seed=33876300
export base_ngmix_seed=701428540


module load miniconda3
# Set Conda environment
export CONDA_ENV="clean_sblens"

# Ensure the conda command is available
source ~/.bashrc
source activate $CONDA_ENV
