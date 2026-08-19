using DocumentService as service from '../../srv/document-service';

annotate service.Documents with @UI: {
  HeaderInfo: {
    TypeName: 'Document',
    TypeNamePlural: 'Documents',
    Title: { Value: title }
  },
  Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'General Information',
      Target : '@UI.FieldGroup#General'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Attachment',
      Target : '@UI.FieldGroup#Attachment'
    }
  ],
  FieldGroup#General: {
    Data: [
      { Value: title },
      { Value: fileName },
      { Value: description },
      { Value: fileSize }
    ]
  },
  FieldGroup#Attachment: {
    Data: [
      { Value: content }
    ]
  },
  LineItem: [
    { Value: title },
    { Value: fileName },
    { Value: mediaType },
    { Value: fileSize }
  ]
};

annotate service.Documents with {
  content  @Core.MediaType: mediaType 
           @Core.ContentDisposition.Filename: fileName
           @Core.AcceptableMediaTypes: ['application/pdf', 'image/png', 'image/jpeg']
           @Common.Label: 'File';                                                     // @Core.ContentDisposition.Filename: fileName . This tells Fiori Elements: "when a file is uploaded, automatically write its filename into the fileName property.
};


annotate service.Documents with {
    title @title : 'Title';
    fileName @title : 'File Name';
    mediaType @title : 'Media Type';
    description @title : 'Description';
    fileSize @title : 'File Size';
}

// Just using above annotations, we have implemented both upload and download functionalities

