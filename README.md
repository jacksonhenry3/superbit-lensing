# superbit-lensing (WPI)

This is specific to the WPI SUPERBit ISU. For more general instructions,see the original repo at: https://github.com/superbit-collaboration/superbit-lensing

---


## Build a Python Virtual Environment with All Required Tools

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


 The module includes the following four submodules which can be used independently if desired:

  - `galsim`: Contains scripts that generate the simulated SuperBIT observations used for validation and forecasting analyses. (Broken, will be fixed soon)
  - `medsmaker`: Contains small modifications to the original superbit-ngmix scripts that make coadd images, runs SExtractor & PSFEx, and creates MEDS files.
  - `metacalibration`: Contains scripts used to run the ngmix/metacalibration algorithms on the MEDS files produced by Medsmaker.
  - `shear-profiles`: Contains scripts to compute the tangential/cross shear profiles and output to a file, as well as plots of the shear profiles.

More detailed descriptions for each stage are contained in their respective directories.
