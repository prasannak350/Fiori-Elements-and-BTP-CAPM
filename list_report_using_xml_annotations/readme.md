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
In this project, we have developed a fiori elements list report page using CAPM + XML annotations

create annotation.xml file to add xml annotations
add this in manifest.json -->

"localAnnotations": {
        "uri": "annotations/annotations.xml",
        "type": "ODataAnnotation
}


Note --> firstly package.json file was not created. So we gave  "cds add nodejs" in the terminal to generate package.json file.