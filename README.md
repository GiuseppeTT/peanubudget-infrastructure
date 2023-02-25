# PeanuBudget: Infrastructure

## Description

This repository holds the source code for the infrastructure of the PeanuBudget project. The infrastructure is hosted at Azure and is set up with Terraform. It's deployment is done with GitHub Actions.

You can find more information about the PeanuBudget project at the [index repository](https://github.com/GiuseppeTT/peanubudget).

## I'm completely lost, where should I start?

If you want to **understand the infrastructure**, check the `main.tf` file.

If you want to **understand the big picture**, check the [index repository](https://github.com/GiuseppeTT/peanubudget).

If you are new to Terraform, the [Get Started - Azure](https://developer.hashicorp.com/terraform/tutorials/azure-get-started) tutorial from HashiCorp (be sure to read the [Store Remote State
](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-remote) section) is a great place to start.

## How to ...

### ... Set up the project using devcontainer

You can quickly set up the project for development using [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) by following these steps in VSCode:

1. Open VSCode
1. Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
1. Open the command palette (press `F1` key), select the `Git: Clone` command (you may need to type it) and clone this repository https://github.com/GiuseppeTT/peanubudget-infrastructure.git
1. Create the `.env` file to set up the necessary environment variables by using the `.env.example` file as a guide
1. Open the command palette (press `F1` key) and select the `Dev Containers: Open Folder in Container...` command (you may need to type it)

After that, the project will be all set up.

> **Note:** You may need to install [docker](https://www.docker.com/) first.

> **Note:** You can check more instructions on the [Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers).

### ... Deploy

There is no manual deployment. The infrastructure is automatically deployed to Azure every time a commit is pushed to main (only possible through pull requests). You can check the CI/CD workflow responsible for that at the `.github/workflows/deploy-infrastructure.yaml` file.

### ... Perform local operations

There is a list of useful scripts for local operations in the `script/` folder. Assuming you are at the project root folder, you can execute the script `script-name.sh` with the `. script/script-name.sh` command.

## Repository structure

```
.
├── .devcontainer/       # Devcontainer's files
├── .git/                # [Git ignored] [Auto generated] Git files
├── .github/workflows/   # GitHub Actions's workflows (CI / CD)
├── .terraform/          # [Git ignored] [Auto generated] Terraform's files
├── script/              # Useful scripts for performing local operations
├── .env                 # [Git ignored] List of environment variables, mainly for secrets
├── .env.example         # Example of .env file
├── .gitignore           # List of files ignored by git
├── .terraform.lock.hcl  # [Auto generated] Terraform's lock file
├── LICENSE              # Project's license
├── README.md            # This very file you are reading
├── main.tf              # Terraform's code for cloud resources
├── outputs.tf           # Terraform's code for outputs
└── variables.tf         # Terraform's code for variables (input)
```
