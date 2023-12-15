# agda-typecheck-web

1. Introduction 

Welcome to the user guide for our application! This guide provides step-by-step instructions for installing, configuring, and running the application successfully.

2. Installation 

Before you can run the application, you need to install the Agda compiler.Download and install the Agda compiler from Agda's official website. Follow the installation instructions provided on the website for your operating system.


3. Setting up the Working Directory

After installing Agda, create a directory to store your project files. This directory will be working directory. 


4. Configuring the Application

Now, it's time to configure the application. Edit the configuration file located in the repository. We recommend leaving most configurations unchanged, except for the working directory path ("agdaExec"). Follow these steps:


5. Building the Project

Build the project using the following command:

bash
* stack build *
This command compiles and builds the application based on the specified configurations.

6. Running the Application

To run the application, use the following command, specifying the configuration file:

bash
* stack run config.json *
Replace config.json with the name of your edited configuration file.



In case of any questions or doubts, please write to krystian.nieradko@gmail.com.

