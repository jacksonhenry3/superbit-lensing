#!/bin/sh
#SBATCH -t 13:59:59
#SBATCH -N 1
#SBATCH -n 18
#SBATCH --mem-per-cpu=30g
#SBATCH --partition=short
#SBATCH -J meds
#SBATCH -v
#SBATCH -o slurm_outfiles/out_makemeds_%j.log
#SBATCH -e slurm_outfiles/err_makemeds_%j.err

# Load configuration file
source "$SLURM_SUBMIT_DIR/config.sh"

date

which python

# Path checking
#export PATH=$PATH:'/work/mccleary_group/Software/texlive-bin/x86_64-linux'
echo $PATH
echo $PYTHONPATH

dirname="slurm_outfiles"
if [ ! -d "$dirname" ]; then
     echo " Directory $dirname does not exist. Creating now"
     mkdir -p -- "$dirname"
     echo " $dirname created"
else
     echo " Directory $dirname exists"
fi

echo "Proceeding with code..."

python $CODEDIR/superbit_lensing/medsmaker/scripts/process_2023.py \
-outdir=$OUTDIR \
-psf_mode=psfex \
-psf_seed=$psf_seed \
-detection_bandpass=${detection_band} \
-star_config_dir $CODEDIR/superbit_lensing/medsmaker/configs \
--meds_coadd ${cluster_name} ${band_name} $DATADIR

# Check if the Python script ran successfully
: '
if [ $? -eq 0 ]; then
    echo "Python script executed successfully. Running multiple_ngmixrun.sh..."
    bash multiple_ngmixrun.sh
else
    echo "Python script failed. Exiting without running multiple_ngmixrun.sh."
    exit 1
fi
'
