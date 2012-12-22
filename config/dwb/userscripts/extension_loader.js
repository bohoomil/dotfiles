#!javascript
//<googledocs___SCRIPT
/*<googledocs___DISABLED
extensions.load("googledocs", {
//<googledocs___CONFIG
  // An array of filename extensions, matching urls will be
  // loaded  with Google Docs, the extensions are case
  // insensitive. The default value is 
  // [ "doc", "docx", "xls", "xlsx", "odt", "ods" ]
  // Possible filetypes are
  // "DOC", "DOCX", "XLS", "XLSX", "PPT", "PPTX", "ODT", "ODS",
  // "PDF", "PAGES", "AI", "PSD", "TIFF", "DXF", "SVG", "EPS",
  // "PS", "TTF", "OTF", "XPS", "ZIP" and "RAR".
  filetypes: [ "doc", "docx", "xls", "xlsx", "odt", "ods" ],
//>googledocs___CONFIG
});
googledocs___DISABLED>*/
//>googledocs___SCRIPT

//<formfiller___SCRIPT
extensions.load("formfiller", {
//<formfiller___CONFIG
  // shortcut that gets and saves formdata
  scGetForm : "efg",

  // shortcut that fills a form
  scFillForm : "eff",

  // path to the formdata file
  formData : data.configDir + "/forms",

  // whether to use a gpg-encrypted file
  useGPG : false,

  // additional arguments passed to gpg2 when encrypting the formdata
  GPGOptEncrypt : "",

  // additional arguments passed to gpg2 when decrypting the formdata
  GPGOptDecrypt : "",

  // whether to save the password in memory when gpg is used
  keepPassword : true,
  
  // whether to save the whole formdata in memory when gpg is used
  keepFormdata : false

//>formfiller___CONFIG
});
//>formfiller___SCRIPT
