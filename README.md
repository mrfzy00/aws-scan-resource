<div align="center">
<h1 align="center">
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" />
<br></h1>
<h3> AWS Scan Resource Automation</h3>
<h3>Scan AWS Resources using AWS CLI with automation bash script.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=flat-square&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash" />
</p>
</div>

---

## Table of Contents
- [ Table of Contents](#-table-of-contents)
- [ Overview](#-overview)
- [ Features](#-features)
- [ Modules](#-modules)
- [ Repository Structure](#-repository-structure)
- [ Getting Started](#-getting-started)
    - [ Installation](#-installation)
    - [ Running ](#-running-)
---


##  Overview

► This repository contain some shell script to list all resources from AWS. 

---

## Features

► List all the target groups from Loadbalancers <br>
► List the attached target groups for status <br>
► List DB clusters from RDS <br>
► List DB instances from RDS <br>
► List DB Snapshots from RDS Backup

---


##  Repository Structure

```sh
/
├── README.md
├── aws-scan-oo-resources
│   ├── get_rds-db-clusters.sh
│   ├── get_rds-db-snapshots.sh
│   ├── get_rds_db-instances.sh
│   ├── get_target_groups.sh
│   ├── get_target_healths.sh
│   └── get_target_loadbalancer.sh
└── test-script
    └── temp_get_target_healths.sh

```

---


##  Modules

<details open><summary>aws-scan-oo-resources</summary>

| File                                   | Summary       |
| ---                                    | ---           |
| [get_target_groups.sh]({file_path})    | ► Get the Target Group attached to Loadbalancers |
| [get_target_healths.sh]({file_path})   | ► Get the attached of healths on Target Group |
| [get_rds-db_instances.sh]({file_path})    | ► Get the RDS DB Instances from RDS resources |
| [get_rds-db-clusters.sh]({file_path})   | ► Get the clusters from RDS resources |
| [get_rds-db-snapshots.sh]({file_path})    | ► Get the RDS DB Snapshots from resources |
| [get_target_loadbalancer.sh]({file_path}) | ► Get all Load balancers from the resources |

</details>

---

##  Getting Started

###  Installation

1. Clone the  repository:
```sh
git clone https://github.com/mrfzy00/aws-scan-resource.git
```

2. Change to the project directory:
```sh
cd 
```

3. Install the dependencies:
```sh
chmod +x aws-scan-oo-resources/*.sh
```

###  Running 

```sh
Example: 
./get_target_groups.sh

Output: 
Load Balancer ARN: arn:aws:elasticloadbalancing:ap-southeast-1:00000000000:loadbalancer/net/sample-nlb/000000000000000        
arn:aws:elasticloadbalancing:ap-southeast-1:257034807569:targetgroup/sample-tg-nlb/0000000000000
----------------------
```

---
