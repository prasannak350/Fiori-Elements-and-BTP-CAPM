# Getting Started

Welcome to your new CAP project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Learn More

Learn more at <https://cap.cloud.sap>.

<!-- my learnings -->
<!-- Refer word doc - "Fiori Elements, capm, deploy apps" -->
In this project, we have developed a fiori elements list report application using CAPM

steps -->
first create cap project using cds init
then add data model and service files
and have v2 service proxy file to convert the service from v4 to v2


Now go to fiori application generator --
select list report application
for the data source - select "use local cap project"
choose main entity and select others and finish
UI application will be generated under app folder


UI developement --
add cap cds annotations in the srv file to display the columns, filters that we need