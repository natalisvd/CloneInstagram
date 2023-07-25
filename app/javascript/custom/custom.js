import * as FilePond from 'filepond';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';

// Register the plugin
document.addEventListener("turbo:load", loadFilePond);
function loadFilePond () {
    FilePond.registerPlugin(
        FilePondPluginFileValidateType,
        FilePondPluginImagePreview);

// Get a reference to the file input element
    const inputElement = document.querySelector("#post-images");
    const inputElement2 = document.querySelector("#story-images");

// Create a FilePond instance
    const pond = FilePond.create(inputElement, {
        credits: {},
        storeAsFile: true,
        allowMultiple: true,
        allowReorder: true,
        acceptedFileTypes: ["image/*"]
    });
    const pond2 = FilePond.create(inputElement2, {
        credits: {},
        storeAsFile: true,
        allowMultiple: false,
        acceptedFileTypes: ["image/*"]
    });
}


