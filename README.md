# PeanuBudget: Infrastructure

## Description

This repository holds the source code for the infrastructure of the PeanuBudget project. The infrastructure is hosted at Azure and is set up with Terraform. It's deployment is done with GitHub Actions.

You can find more information about the PeanuBudget project at the [index repository](https://github.com/GiuseppeTT/peanubudget).

## I'm completely lost, where should I start?

If you want to **understand the infrastructure**, check the `main.tf` file.

If you want to **understand the big picture**, check the [index repository](https://github.com/GiuseppeTT/peanubudget).

## How to ...

### ... Set up the project using devcontainer

You can quickly set up the project for development using [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) by following these steps in VSCode:

1. Open VSCode
1. Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
1. Open the command palette (press `F1` key), select the command `Git: Clone` (you may need to type it) and clone this repository https://github.com/GiuseppeTT/peanubudget-infrastructure.git
1. Create the `.env` file to set up the necessary environment variables by using the `.env.example` file as a guide
1. Open the command palette (press `F1` key) and select the command `Dev Containers: Open Folder in Container...` (you may need to type it)

After that, the project will be all set up.

> **Note:** You may need to install [docker](https://www.docker.com/) first.

> **Note:** You can check more instructions on the [devcontainer documentation](https://code.visualstudio.com/docs/devcontainers/containers).

### ... Deploy

There is no manual deployment. The infrastructure is automatically deployed to Azure every time a commit is pushed to main (only possible through pull requests). You can check the CI/CD workflow responsible for that at `.github/workflows/deploy-infrastructure.yaml`.

## Repository structure

```
.
├── .devcontainer/       # Devcontainer's files
├── .git/                # [Git ignored] [Auto generated] Git files
├── .github/workflows/   # GitHub Actions's workflows (CI / CD)
├── .terraform/          # [Git ignored] [Auto generated] Terraform's files
├── script/              # Auxiliary scripts, mainly for doing things locally
├── .env                 # [Git ignored] List of environment variables, mainly for secrets
├── .env.example         # Example of .env file
├── .gitignore           # List of files ignored by git
├── .terraform.lock.hcl  # [Auto generated] Terraform's lock file
├── LICENSE              # Project's license
├── README.md            # This very file you are reading
├── main.tf              # Terraform's code, cloud resources
├── outputs.tf           # Terraform's code, outputs
└── variables.tf         # Terraform's code, variables, some of them are sensitive and provided through environment variables
```
