# superbit-lensing (WPI)

This is specific to the WPI SUPERBit ISU. For more general instructions,see the original repo at: https://github.com/superbit-collaboration/superbit-lensing

 The module includes the following four submodules which can be used independently if desired:

  - `galsim`: Contains scripts that generate the simulated SuperBIT observations used for validation and forecasting analyses. (Broken, will be fixed soon)
  - `medsmaker`: Contains small modifications to the original superbit-ngmix scripts that make coadd images, runs SExtractor & PSFEx, and creates MEDS files.
  - `metacalibration`: Contains scripts used to run the ngmix/metacalibration algorithms on the MEDS files produced by Medsmaker.
  - `shear-profiles`: Contains scripts to compute the tangential/cross shear profiles and output to a file, as well as plots of the shear profiles.

More detailed descriptions for each stage are contained in their respective directories.


## Build a python virtual enviornment with all the required tools
Before running the pipeline, a specific environemnt for superbit-lensing must be created.

First load the anaconda python distribution:

```bash
module load miniconda3
```


In a folder for this project clone the repo:
```bash
git clone -b for_students https://github.com/jacksonhenry3/superbit-lensing.git
```

cd to this repo:
```bash
cd superbit-lensing
```

Create env from yml (e.g. `sblens.yml`):
```bash
conda env create --name sblens --file sblens.yml
cd ..
```

Activate new env:
```bash

source activate sblens
```

cd back out of superbit-lensing and Install psfex:
```bash
git clone https://github.com/esheldon/psfex.git
cd psfex
pip install -e .
 for_students
```

Conda install ngmix:
```bash
conda install conda-forge::ngmix
```

Install psfex:
```bash
git clone https://github.com/esheldon/psfex.git
cd psfex
pip install .
cd ..
```

Install meds:
```bash
git clone https://github.com/esheldon/meds.git
cd meds
pip install .
cd ..
```

Install superbit-lensing :
```bash
cd superbit-lensing
pip install -e . 
```
