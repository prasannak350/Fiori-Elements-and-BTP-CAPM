namespace doc.management;

using { cuid, managed } from '@sap/cds/common';

entity Documents : cuid, managed {
  title       : String(100);
  description : String(255);
  fileName    : String(255);
  fileSize    : Integer;
  mediaType   : String(100) @Core.IsMediaType : true;
  content     : LargeBinary @Core.MediaType : mediaType;
}
