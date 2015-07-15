var addProjectAttachment = function(){
    var form = $('#edit_project_1')
    var count = $('.fields').length
    console.info('in ProjectAttachment')
    console.info($('#admin-controls').innerHtml)
    $('#admin-controls').before(
        "<div class=\"panel panel-default\">" +
        "  <div class=\"panel-heading\"> Upload an attachment </div>" +
        "  <div class=\"panel-body\">" +
        "    <div class=\"row fields\">\n" +
        "      <div class=\"col-xs-4 text-center\">\n" +
        "        <textarea name=\"project[attachments_attributes][" + count + '][notes]" id="project_attachments_attributes_' + count + '_notes" cols="25" rows="3"></textarea>' + "\n" +
        "      </div>\n" +
        "      <div class=\"col-xs-4 text-center\">&nbsp;</div>" +
        "      <div class=\"col-xs-4 text-center\">\n" +
        "        <span class=\"btn btn-primary btn-block btn-file\" id=\"btn-file-" + count + "\">" +
        "          Find File" +
        "          <input type=\"file\" name=\"project[attachments_attributes][" + count + '][attachment]" id="project_attachments_attributes_' + count + '_attachment"/>' +
        "        </span>" +
        "        <input type=\"hidden\" name=\"project[attachments_attributes][" + count + '][attachment_cache]" id="project_attachments_attributes_' + count + '_attachment_cache"/>' + "\n" +
        "      </div>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</div>\n"
    )
    $('#add_project_attachmnets_attributes_' + count + '_attachment').change({itemNumber: count},function(event){
        var tmppath = URL.createObjectURL(event.target.files[0]);
        $('#attachment_upload_' + event.data.itemNumber).attr('href',tmppath);
    })

}