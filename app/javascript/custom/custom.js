import * as FilePond from 'filepond';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';
import FilePondPluginImageCrop from 'filepond-plugin-image-crop';
import FilePondPluginImageEdit from 'filepond-plugin-image-edit';
import FilePondPluginFilePoster from 'filepond-plugin-file-poster';
import {
    // Image editor
    openEditor,
    processImage,
    createDefaultImageReader,
    createDefaultImageWriter,
    createDefaultImageOrienter,

    // Only needed if loading legacy image editor data
    legacyDataToImageState,

    // Import the editor default configuration
    getEditorDefaults,

    // The method used to register the plugins
    setPlugins,

    // The plugins we want to use
    plugin_crop,
    plugin_finetune,
    plugin_annotate,

    // The user interface and plugin locale objects
    locale_en_gb,
    plugin_crop_locale_en_gb,
    plugin_finetune_locale_en_gb,
    plugin_annotate_locale_en_gb,

    // Because we use the annotate plugin we also need
    // to import the markup editor locale and the shape preprocessor
    markup_editor_locale_en_gb,
    createDefaultShapePreprocessor,

    // Import the default configuration for the markup editor and finetune plugins
    markup_editor_defaults,
    plugin_finetune_defaults,
} from '@pqina/pintura';



// Register the plugin
document.addEventListener("turbo:load", loadFilePond);
function loadFilePond () {
    FilePond.registerPlugin(
        FilePondPluginFileValidateType,
        FilePondPluginImagePreview,
        FilePondPluginImageCrop,
        FilePondPluginImageEdit,
        FilePondPluginFilePoster
    );
    setPlugins(plugin_crop, plugin_finetune, plugin_annotate);


// Get a reference to the file input element
    const inputElement = document.querySelector("#post-images");
    const inputElement2 = document.querySelector("#story-images");

// Create a FilePond instance
    const pond = FilePond.create(inputElement, {
        filePosterMaxHeight: 256,

        // FilePond Image Editor plugin properties
        imageEditor: {
            // Maps legacy data objects to new imageState objects (optional)
            legacyDataToImageState: legacyDataToImageState,

            // Used to create the editor (required)
            createEditor: openEditor,

            // Used for reading the image data. See JavaScript installation for details on the `imageReader` property (required)
            imageReader: [
                createDefaultImageReader,
                {
                    // createDefaultImageReader options here
                },
            ],

            // Can leave out when not generating a preview thumbnail and/or output image (required)
            imageWriter: [
                createDefaultImageWriter,
                {
                    // We'll resize images to fit a 512 × 512 square
                    targetSize: {
                        width: 512,
                        height: 512,
                    },
                },
            ],

            // Used to generate poster images, runs an invisible "headless" editor instance. (optional)
            imageProcessor: processImage,

            // Pintura Image Editor options
            editorOptions: {
                // The markup editor default options, tools, shape style controls
                ...markup_editor_defaults,

                // The finetune util controls
                ...plugin_finetune_defaults,

                // This handles complex shapes like arrows / frames
                shapePreprocessor: createDefaultShapePreprocessor(),

                // This will set a square crop aspect ratio
                imageCropAspectRatio: 1,

                // The icons and labels to use in the user interface (required)
                locale: {
                    ...locale_en_gb,
                    ...plugin_crop_locale_en_gb,
                    ...plugin_finetune_locale_en_gb,
                    ...plugin_annotate_locale_en_gb,
                    ...markup_editor_locale_en_gb,
                },
            },
        },

        credits: {},
        storeAsFile: true,
        allowMultiple: true,
        allowReorder: true,
        allowImageCrop: true,
        acceptedFileTypes: ["image/*"]
    });
    const pond2 = FilePond.create(inputElement2, {
        credits: {},
        storeAsFile: true,
        allowMultiple: false,
        allowImageCrop: true,
        acceptedFileTypes: ["image/*"]
    });
}


