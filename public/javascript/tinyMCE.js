window.addEventListener("load", function () {

  tinymce.init({
    height: "600",
    width: "auto",
    selector: "#content",
    plugins: "image code paste",
    toolbar: "undo redo | link image | code | paste",
    skin: "oxide-dark",
    image_description: false,
    image_title: true,
    automatic_uploads: true,
    images_upload_credentials: true,
    images_resuse_filename: true,
    paste_data_images: true,
    add_form_submit_trigger: true,
    file_picker_types: "image",
    relative_urls: false,
    remove_script_host: false,
    convert_urls: true,

    file_picker_callback: function (cb, value, meta) {
      var input = document.createElement("input");
      input.setAttribute("type", "file");
      input.setAttribute("accept", "image/*");
      input.onchange = function () {
        var file = this.files[0];

        var reader = new FileReader();

        reader.onload = function () {
          var id = "blobid" + new Date().getTime();
          var blobCache = tinymce.activeEditor.editorUpload.blobCache;
          var base64 = reader.result.split(",")[1];
          var blobInfo = blobCache.create(id, file, base64);
          blobCache.add(blobInfo);
          cb(blobInfo.blobUri(), { title: file.name });
        };
        reader.readAsDataURL(file);
      };

      input.click();
    },
    images_upload_url: "/upload", // the url to handle image uploads
  });

  const discard_edit_button = document.getElementById("discardEdit");

  discard_edit_button.addEventListener("click", function () {
    history.back();
  });
  
});
