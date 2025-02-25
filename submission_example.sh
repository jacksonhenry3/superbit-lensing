#!/bin/bash
#SBATCH -t 23:59:59
#SBATCH -N 1
#SBATCH -n 18
#SBATCH --mem-per-cpu=20g
#SBATCH --partition=short
#SBATCH -J Abell3411_b
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your_email@wpi.edu
#SBATCH -o slurm_outfiles/Abell3411_b_%j.out
#SBATCH -e slurm_outfiles/Abell3411_b_%j.err

module load miniconda3
source activate sblens1

echo "Proceeding with code..."

# Export all necessary variables (adjust these as needed)
export TARGET="Abell3411"      # e.g., Abell3411
export BAND="b"                # e.g., b, g, or u
export DATADIR="data"
export OUTDIR="data/${TARGET}/${BAND}/out"
export CODEDIR="superbit_lensing"
export REDSHIFT="0.1687"   # e.g., 0.1687
export DETECTION_BAND="b"         # usually the same as BAND

# New variables specific to ngmix v2:
export PSF_MODEL="gauss"
export GAL_MODEL="gauss"

echo "Output MEDS file will be: $OUTDIR/${TARGET}_${BAND}_meds.fits"

# ----- Step 1: Medsmaker -----
echo "Starting Medsmaker..."
python $CODEDIR/medsmaker/scripts/process_2023.py \
  -outdir=$OUTDIR \
  -psf_mode=psfex \
  -psf_seed=33876300 \
  -detection_bandpass=$DETECTION_BAND \
  -star_config_dir $CODEDIR/medsmaker/configs \
  --meds_coadd $TARGET $BAND $DATADIR

echo "Medsmaker step completed."

# ----- Step 2: Metacalibration using ngmix_v2 -----
echo "Starting Metacalibration..."
python $CODEDIR/metacalibration/ngmix_fit.py \
  -outdir=$OUTDIR \
  -n 48 \
  -seed=4225165605 \
  -psf_model=$PSF_MODEL \
  -gal_model=$GAL_MODEL \
  --overwrite \
  $OUTDIR/${TARGET}_${BAND}_meds.fits \
  ${TARGET}_${BAND}_mcal.fits

echo "Metacalibration step completed."

# ----- Step 3: Shear Profiles (Annular Catalog) -----
echo "Starting Annular Catalog creation..."
python $CODEDIR/shear_profiles/make_annular_catalog.py \
  -outdir=$OUTDIR \
  -cluster_redshift=$REDSHIFT \
  -detection_band=$BAND \
  --overwrite \
  -redshift_cat=$DATADIR/catalogs/redshifts/${TARGET}_NED_redshifts.csv \
  $DATADIR $TARGET $OUTDIR/${TARGET}_${BAND}_mcal.fits \
  $OUTDIR/${TARGET}_${BAND}_annular.fits

echo "Annular Catalog step completed
