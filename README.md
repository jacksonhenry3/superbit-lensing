# superbit-lensing (WPI)

This is specific to the WPI SUPERBit ISU. For more general instructions,see the original repo at: https://github.com/superbit-collaboration/superbit-lensing

---

## There are four major steps to run this pipeline

1. Create the virtual environment that has all the required tools built in
2. set up your data and configure important variables.
3. Run the code!
4. Analyse the results


### 1. Build a Python Virtual Environment with All Required Tools

Before running the pipeline, you need to create a specific environment for superbit-lensing.

1. **Create a New Directory**  
   First, make a new directory named `weak-lensing` to organize your project files.  
   ```bash
   mkdir weak_lensing  # Creates a new folder called 'weak-lensing'
   cd weak_lensing
   ```  
   *Reference: [Linux mkdir Command](https://linux.die.net/man/1/mkdir)*

2. **Load the Anaconda Distribution**  
   This loads Miniconda, which lets you create and manage isolated Python environments. Anaconda/Miniconda is a distribution of Python that includes additional tools for managing dependencies.  
   ```bash
   module load miniconda3  # Loads the Miniconda module to manage Python environments.
   ```  
   *Reference: [Conda Documentation](https://docs.conda.io/projects/conda/en/latest/index.html)*

3. **Clone the Repository**  
   "Clone" means to create a local copy of the project from a remote server (like GitHub). A repository (repo) contains all the project's files and history.  
   ```bash
   git clone -b for_students https://github.com/jacksonhenry3/superbit-lensing.git  # Copies the project to your computer.
   ```  
   *Reference: [Git Basics](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)*

4. **Navigate into the Repository**  
   Change your current directory to the project folder.  
   ```bash
   cd superbit-lensing  # Moves into the project directory where the files are stored.
   ```

5. **Create the Virtual Environment**  
   A virtual environment is an isolated space that contains its own Python version and libraries. This step uses a YAML file (`sblens.yml`) to install all required packages.  
   ```bash
   conda env create --name sblens --file sblens.yml  # Creates an isolated environment named 'sblens'.
   cd ..  # Returns to the parent directory if needed.
   ```  
   *Reference: [Conda Environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)*

6. **Activate the Virtual Environment**  
   "Activate" means to switch your current session to use the new environment. All Python commands will then use the packages installed in it. Note that this is done in a way that makes things easier on the cluster.
   ```bash
   source activate sblens  # Switches to the 'sblens' environment.
   ```  

7. **Install the Project Package**  
   Installing in "editable" mode allows you to modify the source code, and your changes will be reflected immediately without reinstalling.  
   ```bash
   pip install -e .  # Installs the project so that any source code changes are updated immediately.
   ```  
--- 
### 2. Set up important variables and data 
1. run `post_installation.py` and accept the defaults.
```bash
python post_installation.py
```
2. When you are ready email jackson asking for the data.
3. Move the provided directory in to the data directory in this repository.
4. copy submission_example.sh and rename it (e.g. `Abell3411_submission.sh`)
5. Open your new submission file and modify it so that it has the correct cluster name, and the correct email. The default is Abel3411, so replace that everywhere you see it. Modify the email to be your wpi email.

### 3. Run the code
1. from inside the superbit-lensing directory run sbatch cluster_name.sh (e.g. `sbatch Abell3411_submission.sh`)
2. This will run the code on a compute node. If eveything is working it will take ~5 hours to run. You will get an email whenever your job status changes, this way you will know if it fails quickly and you need to change something.
3. you can check the job by running `squeue --me`, the job will be saving its output to two files both in the `slurm_outfiles` directory. These are update as the job runs, (but not while the file is open) so you can check for errors or see what the job is doing at any time by looking at the two files that are saved their. (e.g. `Abel3411_b_109123.out` and `Abel3411_b_109123.err`) When your job is done, check here for errors.

### 4. Analyse the results
---
 The module includes the following four submodules which can be used independently if desired:

  - `galsim`: Contains scripts that generate the simulated SuperBIT observations used for validation and forecasting analyses. (Broken, will be fixed soon)
  - `medsmaker`: Contains small modifications to the original superbit-ngmix scripts that make coadd images, runs SExtractor & PSFEx, and creates MEDS files.
  - `metacalibration`: Contains scripts used to run the ngmix/metacalibration algorithms on the MEDS files produced by Medsmaker.
  - `shear-profiles`: Contains scripts to compute the tangential/cross shear profiles and output to a file, as well as plots of the shear profiles.

More detailed descriptions for each stage are contained in their respective directories.
