---
title: COST ESTIMATION FOR INFRASTRUCTURE
published: false
description: Cost estimation while using terraform to determine and manage the cost of a project
tags: 'azure, cloud, devops'
cover_image: 'https://miro.medium.com/v2/resize:fit:700/1*CjGEdkxtCmDqcuMmCvS8PA.png'
canonical_url: null
id: 1734110
---

# COST ESTIMATION FOR INFRASTRUCTURE

![Kunal Das, Author](https://miro.medium.com/v2/resize:fill:44:44/1*kfaefcgQPHrPsNobjuiiSg.jpeg)


- [COST ESTIMATION FOR INFRASTRUCTURE](#cost-estimation-for-infrastructure)
  - [1. Design Goals](#1-design-goals)
  - [1.1. Cost estimation](#11-cost-estimation)
  - [1.2. Options available](#12-options-available)
  - [1.3. Available tools](#13-available-tools)
  - [2. Infracost](#2-infracost)
  - [2.1. Overview](#21-overview)
  - [2.2. Advantages](#22-advantages)
  - [2.3 Limitations](#23-limitations)
  - [2.4 Use cases](#24-use-cases)
  - [2.5 Impact analysis](#25-impact-analysis)
  - [3. Workflow](#3-workflow)
  - [3.1 Basic workflow](#31-basic-workflow)
  - [3.2 DevOps workflow](#32-devops-workflow)
  - [3.2.1 Azure DevOps](#321-azure-devops)
  - [3.2.2 Jenkins](#322-jenkins)
  - [1. Implementation](#1-implementation)
  - [4.1 Steps for Azure DevOps](#41-steps-for-azure-devops)
  - [4.1.1 Installing extension](#411-installing-extension)
  - [4.1.2 Making the repo ready](#412-making-the-repo-ready)
  - [4.1.3 Adding Infracost code in pipeline](#413-adding-infracost-code-in-pipeline)
  - [4.1.1 Additional settings](#411-additional-settings)
  - [4.1.2 Creating a Pull Request](#412-creating-a-pull-request)
  - [4.1.3 Viewing the dashboard](#413-viewing-the-dashboard)
  - [4.1.1 Dashboard use cases](#411-dashboard-use-cases)
  - [1. Navigation](#1-navigation)
  - [5.1 PR cost difference](#51-pr-cost-difference)
  - [5.1 Detailed Cost estimation](#51-detailed-cost-estimation)
  - [6. Diagram](#6-diagram)
  - [6.1 New Branch](#61-new-branch)
  - [6.2 Making changes](#62-making-changes)
  - [6.3 Pull Request](#63-pull-request)
  - [6.4 Release](#64-release)
  - [1. Scope for improvement](#1-scope-for-improvement)
  - [2. Cost of Implementation](#2-cost-of-implementation)


## 1\. Design Goals

## 1.1. Cost estimation

Cost estimation is the process of predicting the cost of a project, product, or service. It involves identifying all the resources that will be needed and determining the associated costs to arrive at a total estimate. Cost estimation is a key part of project management and helps stakeholders understand the financial implications of their decisions. It can also help organizations make informed decisions about whether to pursue a project or service and how to allocate budgets for the best return on investment. There are many factors that can affect the cost of a project, including the complexity of the work, the skills and expertise of the team, and the availability of resources.

## 1.2. Options available

There are several options for cost estimation in the cloud:

ü Cost calculators: Most cloud providers offer cost calculators that allow you to estimate the cost of various cloud resources based on your usage patterns and requirements. These calculators can help you compare the cost of different options and choose the most cost-effective solution.

ü Cost optimization tools: Many cloud providers offer tools and services to help organizations optimize their resource usage and costs. These tools can help identify cost drivers, forecast future costs, and recommend optimization strategies.

ü Pricing plans: Many cloud providers offer a variety of pricing plans that offer different levels of resources and support at different price points. Carefully reviewing and comparing these plans can help you choose the one that best meets your needs and budget.

ü Cost monitoring and management tools: There are a variety of tools and services available that can help you monitor your cloud resource usage and costs in real-time. These tools can alert you to unexpected cost spikes and help you identify opportunities for cost optimization.

ü Negotiating with vendors: Some cloud providers may be willing to negotiate pricing or offer discounts for large or long-term commitments. It may be worth negotiating with your provider to see if you can get a better deal on your cloud resources.

ü Resource optimization: Identifying and eliminating unnecessary or underutilized resources can help reduce your overall cloud costs. This could include retiring or decommissioning old resources, optimizing resource allocation, and consolidating resources where possible.

## 1.3. Available tools

There are several tools available for cost estimation:

ü Cost calculators: Many cloud providers offer cost calculators that allow you to estimate the cost of various cloud resources based on your usage patterns and requirements. These calculators can help you compare the cost of different options and choose the most cost-effective solution. E.g. Total Cost of Ownership (TCO) Calculator in AWS, The Azure Pricing Calculator, Google Cloud Pricing Calculator

ü Cost monitoring and management tools: There are a variety of tools and services available that can help you monitor your cloud resource usage and costs in real-time. These tools can alert you to unexpected cost spikes and help you identify opportunities for cost optimization.

ü Project management software: Many project management software platforms offer cost estimation and budgeting tools to help organizations plan and track project costs.

ü Specialized cost estimation software: There are also specialized cost estimation software tools that are specifically designed for cost estimation. These tools often offer advanced features and capabilities, such as the ability to create detailed cost breakdowns and incorporate risk analysis.

ü Infracost: Infracost is a tool that helps users optimize their costs when using Terraform for infrastructure management. It provides real-time cost estimates for infrastructure resources and suggests ways to reduce costs through optimization.

ü Teracost: TeraCost is a cloud cost management and optimization platform that helps organizations optimize their cloud costs by providing visibility into resource usage and costs, identifying opportunities for optimization, and recommending actions to reduce costs. It offers a range of features, including cost forecasting, budget tracking, and resource optimization recommendations, and is designed to work with a variety of cloud providers, including Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP).

## 2\. Infracost

## 2.1. Overview

Infracost is a tool that is specifically designed to optimize costs in Terraform environments. It works by analysing the resources that are being created in a Terraform configuration and providing recommendations for cost optimization. This can include suggestions for using lower cost resource types, resizing resources to a more cost-effective size, or identifying resources that are no longer needed and can be safely deleted. Infracost also provides real-time cost estimates for the resources in a Terraform configuration, which can help teams make more informed decisions about the cost of their infrastructure. Overall, Infracost is a powerful tool that can help teams save money on their infrastructure costs by identifying opportunities for cost optimization and providing actionable recommendations for implementing those optimizations.

## 2.2. Advantages

Infracost is a tool that can be used for cost optimization in Terraform, a popular Infrastructure as Code (IaC) tool. It provides several advantages over other cost optimization tools available for Terraform:

ü Real-time cost estimation: Infracost provides real-time cost estimates for all the resources in your Terraform code, so you can make informed decisions about your infrastructure costs.

ü Integration with Terraform: Infracost integrates seamlessly with Terraform, so you can see the cost estimates for your infrastructure as you write your code. This helps you avoid costly mistakes and optimize your infrastructure costs from the start.

ü Custom pricing: Infracost allows you to set custom pricing for your resources, so you can better reflect your organization’s negotiated rates or your unique usage patterns.

ü Resource filtering: Infracost allows you to filter resources by tag, type, and name, making it easier to focus on specific resources and optimize their costs.

ü Resource grouping: Infracost groups similar resources together, making it easier to compare costs and identify opportunities for optimization.

ü Easy to use: Infracost is easy to use and requires minimal setup, so you can start optimizing your infrastructure costs quickly and easily.

Overall, Infracost provides a comprehensive and user-friendly solution for cost optimization in Terraform, making it an excellent choice for organizations looking to optimize their infrastructure costs.

## 2.3 Limitations

Infracost is a useful tool for gaining visibility into the cost of your infrastructure and optimizing your spend on cloud resources. However, it does have some limitations to consider:

ü Limited to supported cloud providers: Infracost currently supports only a limited number of cloud providers, including AWS, Azure, and Google Cloud. If you are using a different cloud provider or a combination of multiple providers, Infracost may not be able to provide cost estimates for your infrastructure.

ü Dependent on accurate resource pricing: Infracost relies on accurate resource pricing information from the supported cloud providers. If the pricing information is incorrect or out of date, Infracost cost estimates may not be accurate.

ü Limited to resources supported by the cloud providers: Infracost can only provide cost estimates for resources that are supported by the cloud providers it integrates with. If you are using custom resources or resources from third-party providers, Infracost may not be able to provide cost estimates for them.

ü Requires manual integration with infrastructure as code: While Infracost integrates with popular infrastructure as code tools such as Terraform and CloudFormation, it requires manual integration. This means you will need to set up Infracost and configure it to work with your infrastructure as code tools, which can be time-consuming and require some technical expertise.

ü Limited to infrastructure costs: Infracost only provides estimates for the cost of your infrastructure resources, such as compute instances and storage. It does not include other costs such as data transfer fees or licensing costs for third-party software.

ü Limited to current infrastructure: Infracost only provides cost estimates for your current infrastructure. It does not allow you to compare the cost of different infrastructure configurations or predict the cost of future infrastructure changes.

Overall, while Infracost is a useful tool for gaining visibility into the cost of your infrastructure and optimizing your spend on cloud resources, it is limited in its scope and may not be suitable for all organizations or infrastructure configurations.

## 2.4 Use cases

Some possible use cases for Infracost include:

ü Identifying and reducing over-provisioned resources: Infracost can help you identify resources that are over-provisioned, which means they have more capacity than is necessary to meet your workload demands. By reducing the capacity of these resources, you can save on your cloud costs.

ü Optimizing resource usage: Infracost can help you optimize resource usage by identifying underutilized resources and suggesting ways to improve their utilization. For example, if you have a virtual machine that is only running at 20% capacity, Infracost may suggest moving workloads to that machine to better utilize its capacity.

ü Estimating costs for infrastructure changes: Infracost can be used to estimate the costs of making changes to your infrastructure, such as adding or removing resources. This can help you plan for changes and ensure that they are cost-effective.

ü Analysing cloud cost trends: Infracost can provide detailed cost breakdowns and graphs that allow you to understand your cloud costs over time and identify trends that may impact your budget. This can help you plan and make decisions to optimize your costs.

ü Auditing and compliance: Infracost can be used to audit your infrastructure and ensure that it complies with company policies or regulatory requirements. It can also help you identify resources that may be overpriced or misconfigured, allowing you to take corrective action.

## 2.5 Impact analysis

Infracost is a tool that allows users to perform cost analysis on their infrastructure-as-code (IaC) resources. This means that users can see the estimated cost of their resources before they are deployed, allowing them to make informed decisions about their infrastructure and optimize for cost. One key use case for Infracost is in the development phase, where users can use it to identify and address potential cost issues before they become a problem. It can also be used in the operations phase to monitor the ongoing cost of infrastructure and identify opportunities for optimization. By providing visibility into the cost of infrastructure, Infracost can help organizations make informed decisions about how to allocate their resources and stay within budget. Overall, the use of Infracost can have a significant impact on the cost efficiency of an organization’s infrastructure, helping to reduce waste and ensure that resources are being used effectively.

## 3\. Workflow

## 3.1 Basic workflow

ü The workflow of infracost involves the following steps:

ü Install the infracost CLI tool: Infracost can be installed as a standalone CLI tool or as a Terraform plugin. To install the CLI tool, you can use the following command:

curl -sfL [https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh](https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh) | sh

ü Initialize infracost: Once you have installed the infracost CLI tool, you can initialize it by running the following command in your Terraform directory:

infracost init

ü This will create a default configuration file (infracost.yml) in your Terraform directory, which you can customize as per your needs.

ü Add infracost to your Terraform workflow: You can add infracost to your Terraform workflow by using the infracost command before or after running terraform plan or terraform apply. For example, you can run the following command to generate a cost estimate before applying your changes:

infracost plan

ü Alternatively, you can run the following command to generate a cost estimate after applying your changes:

infracost apply

ü Review the cost estimate: Infracost will generate a cost estimate in the form of a table, which will show you the estimated cost of each resource in your Terraform configuration. You can review the cost estimate and make any necessary changes to your configuration to optimize costs.

ü Repeat the process: You can repeat the process of running infracost before or after applying your changes as many times as you like, until you are satisfied with the cost estimate.

ü Use infracost with version control: You can also use infracost with version control systems like Git to track changes to your cost estimates over time. This can be useful for comparing the costs of different versions of your Terraform configuration and for identifying cost-saving opportunities.

ü Use infracost with CI/CD: You can also integrate infracost with your CI/CD pipeline to automate the process of generating and reviewing cost estimates. This can be especially useful if you have a large number of Terraform configurations that need to be regularly reviewed for cost optimization.

## 3.2 DevOps workflow

## 3.2.1 Azure DevOps

ü The workflow for using infracost with Azure DevOps involves integrating infracost into your Azure DevOps pipeline. This can be done by adding the infracost task to your pipeline and configuring it to run at the appropriate stage.

ü To begin, you will need to install the infracost extension from the Azure DevOps marketplace. Next, you will need to create a pipeline and add the infracost task to it. In the task configuration, you will need to specify the path to your Terraform configuration files, as well as any additional arguments that you want to pass to infracost.

ü Once the task is configured, you can run your pipeline as usual. As part of the pipeline execution, infracost will analyze your Terraform configuration and provide cost estimates for the resources that are being created. This information will be displayed in the pipeline output, allowing you to easily see the cost implications of your changes.

ü In addition to running infracost as part of your pipeline, you can also use it to create pull request checks. This allows you to enforce cost limits on pull requests, ensuring that any changes that are made do not exceed a certain budget.

ü Overall, integrating infracost into your Azure DevOps workflow can help you better understand the cost implications of your infrastructure changes, and ensure that you are making cost-effective decisions as you develop and deploy your applications.

## 3.2.2 Jenkins

The workflow for using infracost with Jenkins typically involves the following steps:

ü Install the infracost plugin in Jenkins. This can be done through the Jenkins Plugin Manager.

ü Configure the infracost plugin in the Jenkins Global Configuration page. This includes specifying the AWS access keys, the Terraform version, and the desired frequency for cost scans.

ü In your Jenkins job, add a build step to run infracost. This can be done by selecting “Infracost” from the Add Build Step dropdown menu.

ü In the infracost build step, specify the path to your Terraform configuration files and any additional command line options.

ü Run the Jenkins job to trigger the infracost scan. The infracost plugin will scan your Terraform configuration files and generate a report on the estimated cost of your infrastructure.

ü View the infracost report in the Jenkins build output. The report will contain a breakdown of the cost estimates for each resource, as well as a total estimate for the entire infrastructure.

ü Optionally, you can configure infracost to fail the Jenkins build if the estimated cost exceeds a certain threshold. This can help prevent overspending on infrastructure costs.

ü By integrating infracost into your Jenkins workflow, you can easily track the cost of your infrastructure and make informed decisions about resource allocation and optimization.

Apart from all Infracost supports multiple CI/CD platforms shown below,

![](https://miro.medium.com/v2/resize:fit:700/1*YE7MA6bv8msUvs771jnRAA.png)

## 1\. Implementation

## 4.1 Steps for Azure DevOps

## 4.1.1 Installing extension

ü Go to your organization setting page in Azure Devops

[https://dev.azure.com/{org\_name}/\_settings/extensions?tab=installed](https://dev.azure.com/%7Borg_name%7D/_settings/extensions?tab=installed)

ü Go to the marketplace link and install Infracost extension

[https://marketplace.visualstudio.com/items?itemName=Infracost.infracost-tasks](https://marketplace.visualstudio.com/items?itemName=Infracost.infracost-tasks)

ü Go to the Infracost Dashboard URL and login with your account

[https://dashboard.infracost.io/](https://dashboard.infracost.io/)

## 4.1.2 Making the repo ready

ü Upon login go to organization settings and copy the API and keep it in safe place for later use

ü If you do not already have a Terraform file, create one or coy from my repo,

[https://github.com/Kunaldastiger/Terraform-Sample/blob/main/Virtual-machines/MicrosoftWindowsServer.tf](https://github.com/Kunaldastiger/Terraform-Sample/blob/main/Virtual-machines/MicrosoftWindowsServer.tf)

ü Apart from this you must have a pipeline yaml file or a pipeline created in classic fashion,  
code for the same can be found here,

[https://github.com/Kunaldastiger/Terraform-Sample/blob/main/azure-deployment.yaml](https://github.com/Kunaldastiger/Terraform-Sample/blob/main/azure-deployment.yaml)

ü Now run the pipeline and check if resource is getting created or not, needless to say, you also need to have a service connection to azure.

If you do not have a service connection kindly follow below steps,

Ø Sign in to Azure DevOps and navigate to the Project Settings page.

Ø In the left menu, under “Pipelines,” select “Service Connections.”

Ø Click the “New Service Connection” button.

Ø In the “Add new service connection” dialog, select “Azure Resource Manager” from the “Type” dropdown menu.

Ø Give the service connection a name and click “Next.”

Ø In the “Authorize Azure Resource Manager” dialog, select the Azure subscription you want to use and click “Authorize.”

Ø After the authorization process is complete, click “Finish” to create the service connection.

You can now use this service connection in your Azure DevOps pipelines to access resources in your Azure subscription. For example, you could use it to deploy an application to an Azure web app, create or delete Azure resources, or run Azure Resource Manager templates.

## 4.1.3 Adding Infracost code in pipeline

Create a new pipeline, selecting

1.  **Azure Repos Git** when prompted in the **“Connect”** stage
2.  Select the appropriate repo you wish to integrate Infracost with in the **“Select”** stage
3.  Choose “Starter Pipeline” in the **“Configure”** stage
4.  Replace the Starter Pipeline yaml with the following:

```yaml
# The Azure Pipelines docs (https://docs.microsoft.com/en-us/azure/devops/pipelines/process/tasks) describe other options.
6. # Running on pull requests to `master` (or your default branch) is a good default.
7. pr:
8.   - main
9. 
10. variables:
11.   - name: TF_ROOT
12.     value: Terraform
13.   # If you use private modules you'll need this env variable to use 
14.   # the same ssh-agent socket value across all steps. 
15.   - name: SSH_AUTH_SOCK
16.     value: /tmp/ssh_agent.sock
17.   # This instructs the CLI to send cost estimates to Infracost Cloud. Our SaaS product
18.   #   complements the open source CLI by giving teams advanced visibility and controls.
19.   #   The cost estimates are transmitted in JSON format and do not contain any cloud 
20.   #   credentials or secrets (see https://infracost.io/docs/faq/ for more information).
21.   - name: INFRACOST_ENABLE_CLOUD
22.     value: true
23.   # If you're using Terraform Cloud/Enterprise and have variables stored on there
24.   # you can specify the following to automatically retrieve the variables:
25.   # env:
26.   # - name: INFRACOST_TERRAFORM_CLOUD_TOKEN
27.   #   value: $(tfcToken)
28.   # - name: INFRACOST_TERRAFORM_CLOUD_HOST
29.   #   value: app.terraform.io # Change this if you're using Terraform Enterprise
30. 
31. jobs:
32.   - job: infracost
33.     displayName: Run Infracost
34.     pool:
35.       vmImage: ubuntu-latest
36. 
37.     steps:
38.       # If you use private modules, add a base 64 encoded secret
39.       # called gitSshKeyBase64 with your private key, so Infracost can access
40.       # private repositories (similar to how Terraform/Terragrunt does).
41.       # - bash: |
42.       #     ssh-agent -a $(SSH_AUTH_SOCK)
43.       #     mkdir -p ~/.ssh
44.       #     echo "$(echo $GIT_SSH_KEY_BASE_64 | base64 -d)" | tr -d '\r' | ssh-add -
45.       #     # Update this to github.com, gitlab.com, bitbucket.org, ssh.dev.azure.com or your source control server's domain
46.       #     ssh-keyscan ssh.dev.azure.com >> ~/.ssh/known_hosts
47.       #   displayName: Add GIT_SSH_KEY
48.       #   env:
49.       #     GIT_SSH_KEY_BASE_64: $(gitSshKeyBase64)
50. 
51.       # Install the Infracost CLI, see https://github.com/infracost/infracost-azure-devops#infracostsetup
52.       # for other inputs such as version, and pricingApiEndpoint (for self-hosted users).
53.       - task: InfracostSetup@1
54.         displayName: Setup Infracost
55.         inputs:
56.           apiKey: $(infracostApiKey)
57. 
58.       # Clone the base branch of the pull request (e.g. main/master) into a temp directory.
59.       # - bash: |
60.       #     branch=$(System.PullRequest.TargetBranch)
61.       #     branch=${branch#refs/heads/}
62.       #     # Try adding the following to git clone if you're having issues cloning a private repo: --config http.extraheader="AUTHORIZATION: bearer $(System.AccessToken)"
63.       - task: Bash@3
64.         inputs:
65.               targetType: 'inline'
66.               script: 'git clone @dev.azure.com/{orgname}/{project_name}/{repo_path}">https://$(PATToken)@dev.azure.com/{orgname}/{project_name}/{repo_path} --branch=main  /tmp/base'
67.       #   displayName: Checkout base branch
68. 
69.       # Generate an Infracost cost estimate baseline from the comparison branch, so that Infracost can compare the cost difference.
70.       - bash: |
71.           infracost breakdown --path=$(TF_ROOT) \
72.                               --format=json \
73.                               --out-file=/tmp/infracost-base.json
74.         displayName: Generate Infracost cost estimate baseline
75. 
76.       # Generate an Infracost diff and save it to a JSON file.
77.       - bash: |
78.           infracost diff --path=$(TF_ROOT) \
79.                          --format=json \
80.                          --compare-to=/tmp/infracost-base.json \
81.                          --out-file=/tmp/infracost.json
82.         displayName: Generate Infracost diff
83. 
84.       # Posts a comment to the PR using the 'update' behavior.
85.       # This creates a single comment and updates it. The "quietest" option.
86.       # The other valid behaviors are:
87.       #   delete-and-new - Delete previous comments and create a new one.
88.       #   new - Create a new cost estimate comment on every push.
89.       # See https://www.infracost.io/docs/features/cli_commands/#comment-on-pull-requests for other options.
90.       - bash: |
91.            infracost comment azure-repos --path=/tmp/infracost.json \
92.                                          --azure-access-token=$(System.AccessToken) \
93.                                          --pull-request=$(System.PullRequest.PullRequestId) \
94.                                          --repo-url= '@dev.azure.com/kunaldas0966/test_project/_git/terracost-sample'">https://$(PATToken)@dev.azure.com/kunaldas0966/test_project/_git/terracost-sample' \
95.                                          --behavior=update
96.         displayName: Post Infracost comment

```

In the pipeline, variables add the below variables

![](https://miro.medium.com/v2/resize:fit:643/1*N40nSKnlEH0lfQDLAvpEPQ.png)

Ø To do the same,  
Sign into Azure DevOps and navigate to your project.

Ø In the left menu, under “Pipelines,” select “Pipelines.”

Ø Select the pipeline you want to add a variable to and click the “Edit” button.

Ø In the pipeline editor, click the “Variables” tab.

Ø Click the “Add” button to add a new variable.

Ø In the “Add variable” dialog, enter a name and value for the variable. You can also specify whether the variable is secret and should be masked in the log output.

Ø Click “Save” to add the variable to the pipeline.

You can now use the pipeline variable in your pipeline tasks by using the syntax $(variableName). You can also use pipeline variables to control the flow of your pipeline, by using conditions or branching.

## 4.1.1 Additional settings

ü Enable pull request build triggers. Without this, Azure Pipelines do not trigger builds with the pull request ID, thus comments cannot be posted by the integration.

ü From your Azure DevOps organization, click on your project > Project Settings > Repositories

ü Select the repository that your created the pipeline for in step 1

ü Select the Policies tab and under the Branch Policies select on your default branch (master or main)

ü Scroll to Build Validation and click + sign to add one if you don’t have one already

ü Set your ‘Build pipeline’ to the pipeline you created in step 1, leave ‘Path filter’ blank, set ‘Trigger’ to Automatic, and ‘Policy requirement’ to Optional (you can also use Required but we don’t recommend it).

ü Enable Azure Pipelines to post pull request comments

ü From your Azure DevOps organization, click on your project > Project Settings > Repositories > your repository.

ü Click on the Securities tab, scroll down to Users and click on the ‘\[project name\] Build Service (\[org name\])’ user, and set the ‘Contribute to pull requests’ to Allow.

If you are using github instead of azure repo the code for the same is available at below link,

[https://marketplace.visualstudio.com/items?itemName=Infracost.infracost-tasks&targetId=10277548-b72b-4200-99f2-565bf446c70d&utm\_source=vstsproduct&utm\_medium=ExtHubManageList](https://marketplace.visualstudio.com/items?itemName=Infracost.infracost-tasks&targetId=10277548-b72b-4200-99f2-565bf446c70d&utm_source=vstsproduct&utm_medium=ExtHubManageList)

## 4.1.2 Creating a Pull Request

Ø Not you have to create a new branch and make some changes in the new branch to that the resource cost may increase or decrease,  
To create a new branch and do a pull request in an Azure Repo, you’ll need to follow these steps:

Ø Navigate to the Azure Repos page in Azure DevOps.

Ø Select the repository that you want to create the branch and pull request in.

Ø On the repository page, click on the “Branches” tab.

Ø Click on the “New branch” button.

Ø Enter a name for the new branch and select the branch that you want to base the new branch on.

Ø Click on the “Create branch” button to create the new branch.

Once the new branch has been created, you can switch to it and make the necessary changes. When you’re ready to submit the changes for review, you can follow the steps above to create a pull request.

Ø Navigate to the Azure Repos page in Azure DevOps.

Ø Select the repository that you want to create the pull request in.

Ø On the repository page, click on the “Pull requests” tab.

Ø Click on the “New pull request” button.

Ø Select the source and target branches for the pull request. The source branch is the branch that contains the changes that you want to merge, and the target branch is the branch that you want to merge the changes into.

Ø Review the changes that will be included in the pull request. You can use the “Files changed” tab to view the individual changes and make any necessary adjustments.

Ø Add a title and optional description for the pull request.

Ø If you want to request a review from specific people or teams, you can use the “Reviewers” field to add them.

Ø When you’re ready to create the pull request, click on the “Create pull request” button.

After this you should see your pipeline starts running as the trigger is set as main pull request!

## 4.1.3 Viewing the dashboard

ü Log in to [https://dashboard.infracost.io/](https://dashboard.infracost.io/) and select the repo ,

![](https://miro.medium.com/v2/resize:fit:700/1*lr335paLDs5BXxIMUFiJdw.png)

You should be able to see similar kind of dashboard, there are many things to go through in the GUI,

The Infracost dashboard is a web-based tool that provides an overview of the cost of your infrastructure resources. It displays information about the total cost of your resources, as well as detailed information about each resource and its cost.

The dashboard is divided into several sections:

Ø Overview: This section provides a summary of your infrastructure costs, including the total cost of your resources and the breakdown of costs by resource type.

Ø Resources: This section lists all of the infrastructure resources in your project, along with their cost, resource type, and resource ID. You can use this section to view the cost of individual resources and identify opportunities for cost optimization.

Ø Billing: This section provides information about your billing history, including the total amount billed, the billing period, and the date of the most recent bill.

Ø Costs by resource type: This section displays a breakdown of your costs by resource type, showing you which types of resources are the most expensive.

Ø Costs by tag: This section displays a breakdown of your costs by tag, allowing you to see which resources are associated with a particular tag and their costs.

Ø Cost trends: This section displays a chart showing the trend in your infrastructure costs over time. You can use this chart to identify trends in your costs and identify opportunities for cost optimization.

## 4.1.1 Dashboard use cases

There are several things that you can do from the Infracost dashboard to manage and optimize the cost of your infrastructure resources:

Ø View a summary of your infrastructure costs: The dashboard provides an overview of your total infrastructure costs, as well as a breakdown of costs by resource type. This can help you understand the overall cost of your infrastructure and identify areas where you might be able to save money.

Ø View detailed information about individual resources: The dashboard provides detailed information about each infrastructure resource, including its cost, resource type, and resource ID. This can help you understand the cost of individual resources and identify opportunities for cost optimization.

Ø View your billing history: The dashboard includes a section on billing that provides information about your total amount billed, the billing period, and the date of the most recent bill. This can help you understand your billing history and track changes in your costs over time.

Ø View costs by resource type and tag: The dashboard provides a breakdown of costs by resource type and tag, which can help you understand which types of resources the most expensive and which resources are are associated with a particular tag.

Ø View cost trends over time: The dashboard includes a chart showing the trend in your infrastructure costs over time. This can help you identify trends in your costs and identify opportunities for cost optimization.

## 1\. Navigation

## 5.1 PR cost difference

ü Click on the repo and select the repository you are using in the Infracost dashboard,

![](https://miro.medium.com/v2/resize:fit:700/1*PoTqM2wA9xHgEBiPttzqSw.png)

Here, you will see all the price difference before you choose to merge the PR.

## 5.1 Detailed Cost estimation

Click to see the full cost estimate and it will open the detailed cost estimates in a separate

![](https://miro.medium.com/v2/resize:fit:700/1*mneFcpcqfz2on7hPsXwpjQ.png)

ü Here in the diff output tab you can see the difference that will occur if you merge the changes,

![](https://miro.medium.com/v2/resize:fit:700/1*70chuQkrt0JR9XwO85e3BQ.png)

ü Click on the Table output to see all the involved cost,

![](https://miro.medium.com/v2/resize:fit:700/1*GEAfTOXK8nr2XZyWioBklg.png)

ü Under each resource you can see detailed cost report of the individual items,

![](https://miro.medium.com/v2/resize:fit:700/1*BUm6Xnn_x2r0dWh7dSvisA.png)

ü You may also choose to export the data in CSV format by clicking on export data.

## 6\. Diagram

I have prepared a simple flow diagram that is very easy to understand, let’s go through each block one by one.

![](https://miro.medium.com/v2/resize:fit:700/1*CjGEdkxtCmDqcuMmCvS8PA.png)

## 6.1 New Branch

ü Here basically we are creating a new branch so that, we can start making changes to existing infrastructure, creating a new branch in a version control system like Azure Repos allows you to work on a copy of your codebase and make changes to it without affecting the main branch (often called the “master” branch). This is useful when you want to make changes to your infrastructure, as it allows you to test and validate your changes before merging them into the main branch.

ü By creating a new branch, you can make changes to your infrastructure in a safe and isolated environment, without worrying about breaking anything in the main branch. This can help you avoid disruptions to your infrastructure and ensure that any changes you make are well-tested and ready for production.

## 6.2 Making changes

ü When you make changes to your codebase in a feature branch, you are working on a copy of the code that is separate from the main branch (often called the “master” branch). This allows you to make changes and test them without affecting the main branch, which can be useful when you are developing new features or making changes to your infrastructure. So you can just pull the code to your IDE like VS code and start making changes in the TF file, once done you can then push it to the dev/feature branch,

## 6.3 Pull Request

ü Create a pull request: When you’re ready to merge your changes into the main branch, you’ll need to create a pull request. This will allow other members of your team to review your changes and decide whether to merge them into the main branch.

ü Here once you create a pull request the pipeline will start running,

ü Once pipeline run finishes you can go to Infracost dashboard and view the cost estimation.

## 6.4 Release

If satisfied with the cost estimation then merge the changes and as soon as it gets merged to the main branch, it will trigger the terraform pipeline which will then create the desired resources.

## 1\. Scope for improvement

The pipeline can be further automated to pass the Pull request automatically if certain conditions are met.  
suppose if cost increases/decreases < 5% then the pipeline should read that and merge the code,  
It needs further research and collaboration.

## 2\. Cost of Implementation

Infracost is an open-source tool though it has some pricing options, the free version provides plenty of options to get the job done, the features offered in the free versions are:

ü Open source

ü Get cost breakdowns and diffs

ü CI/CD integrations (GitHub, GitLab, Bitbucket, Azure DevOps…)

ü Works with Terraform Cloud & Terragrunt

ü Use our hosted Cloud Pricing API or self-host

ü Community supported

For an annual fee of $30 some additionally functionalities can be availed,

ü In addition to Infracost Community:

ü Visibility across all changes, see pull requests that increase/decrease costs the most

ü Guardrails with custom messages/notifications/actions

ü Policies in pull requests (e.g. gp2 to gp3)

ü Custom price books and discounts

ü Jira integration

ü Custom reports

ü GitHub App integration with pull request status/metadata

ü Team management

ü SSO

## Read my blogs : 
 
<a href="https://kunaldaskd.medium.com">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Medium_%28website%29_logo.svg/798px-Medium_%28website%29_logo.svg.png" alt="Medium Logo" height="20"width="100"/>
</a>
<a href="https://dev.to/kunaldas">
    <img src="https://dev-to-uploads.s3.amazonaws.com/uploads/logos/resized_logo_UQww2soKuUsjaOGNB38o.png" alt="Dev.to Logo" height="20"width="100"/>
</a>
<a href="https://kunaldas.hashnode.dev">
    <img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1675531271955/ALEtNA1cM.png?auto=compress" alt="Hashnode Logo" height="20"width="100"/>
</a>

## Connect with Me:

<p align="left">
<a href="https://twitter.com/kunald_official" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="kunald_official" height="30" width="40" /></a>
<a href="https://linkedin.com/in/kunaldaskd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="kunaldaskd" height="30" width="40" /></a>
</p>
