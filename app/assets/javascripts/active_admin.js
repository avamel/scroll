//= require active_admin/base



CKEDITOR.editorConfig = function( config ) {
// Define changes to default configuration here. For example:
// config.language = 'fr';
// config.uiColor = '#AADC6E';


    config.extraPlugins = 'oembed';
    config.allowedContent = true;

    config.oembed_maxWidth = '530';
    config.oembed_maxHeight = '300';
    config.oembed_WrapperClass = 'embededContent';


};
