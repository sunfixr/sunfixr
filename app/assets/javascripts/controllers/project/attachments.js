var addAttachment = function(){
    var object_name = this.attributes['data'].value
    var count = $('.fields').length
    $('#admin-controls').before(
        "<div class=\"panel panel-default\">" +
        "  <div class=\"panel-heading\"> Upload an attachment </div>" +
        "  <div class=\"panel-body\">" +
        "    <div class=\"row fields\">\n" +
        "      <div class=\"col-xs-4 text-center\">\n" +
        "        <textarea name=\"" + object_name + "[attachments_attributes][" + count + '][notes]" id="' + object_name + '_attachments_attributes_' + count + '_notes" cols="25" rows="3"></textarea>' + "\n" +
        "      </div>\n" +
        "      <div class=\"col-xs-4 text-center\"><a href=\"\" id=\"attachment_upload_" + count + "\" target=\"_new\"></a> </div>" +
        "      <div class=\"col-xs-4 text-center\">\n" +
        "        <span class=\"btn btn-primary btn-block btn-file\" id=\"btn-file-" + count + "\">" +
        "          Find File" +
        "          <input type=\"file\" name=\"" + object_name + "[attachments_attributes][" + count + '][attachment]" id="' + object_name + '_attachments_attributes_' + count + '_attachment"/>' +
        "        </span>" +
        "        <input type=\"hidden\" name=\"" + object_name + "[attachments_attributes][" + count + '][attachment_cache]" id="' + object_name + '_attachments_attributes_' + count + '_attachment_cache"/>' + "\n" +
        "      </div>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</div>\n"
    )
    $('#' + object_name + '_attachments_attributes_' + count + '_attachment').change({itemNumber: count},function(event){
        var tmppath = URL.createObjectURL(event.target.files[0]);
        $('#attachment_upload_' + event.data.itemNumber).attr('href',tmppath);
        $('#attachment_upload_' + event.data.itemNumber).text(event.target.files[0].name)
    })

}