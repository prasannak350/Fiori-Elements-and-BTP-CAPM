// updating the file size based on the file we uploaded and restricting the file size to 5 MB
import cds from '@sap/cds';

const MAX_FILE_SIZE = 5 * 1024 * 1024; // 5 MB

// CAP sends uploaded file content as a stream, not a plain buffer — must convert manually
function streamToBuffer(stream) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    stream.on('data', (chunk) => chunks.push(chunk));
    stream.on('end', () => resolve(Buffer.concat(chunks)));
    stream.on('error', reject);
  });
}

export default cds.service.impl(async function () {
  const { Documents } = this.entities;
  const Drafts = Documents.drafts;
  const targets = [Documents, Drafts];   // considering both Document entity and it's draft entity as well

  // Restrict Max File Size and update the documents entity with the fileSize
  this.before('UPDATE', targets, async (req) => {
    if (req.data.content) {
      let buffer = req.data.content;

      if (typeof buffer.pipe === 'function') {
        buffer = await streamToBuffer(buffer);
        req.data.content = buffer;             // feed converted buffer back so CAP can still save it
      }

      const size = Buffer.byteLength(buffer);

      if (size > MAX_FILE_SIZE) {
        req.reject(400, `File too large. Maximum allowed size is 5 MB.`);
      }

      req.data.fileSize = size;
    }
  });
});
