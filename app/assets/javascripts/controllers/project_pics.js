var addProfilePic = function(){
    var form = $('#edit_project_1')
    var count = form.find('div.row.fields').length

    form.find('.row').last().before(
        "<div class=\"panel panel-default\">" +
        "  <div class=\"panel-heading\"> Upload a picture </div>" +
        "  <div class=\"panel-body\">" +
        "    <div class=\"row fields\">\n" +
        "      <div class=\"col-xs-4 text-center\">\n" +
        "        <textarea name=\"project[project_pics_attributes][" + count + '][notes]" id="add_project_project_pics_attributes_' + count + '_notes" cols="25" rows="5"></textarea>' + "\n" +
        "      </div>\n" +
        "      <div class=\"col-xs-4 text-center\"><img src=\"\" id=\"img_upload_" + count + "\" height=\"120\" width=\"160\"></div>\n" +
        "      <div class=\"col-xs-4 text-center\">\n" +
        "        <span class=\"btn btn-primary btn-block btn-file\">" +
        "          Find Picture" +
        "          <input type=\"file\" name=\"project[project_pics_attributes][" + count + '][picture]" id="add_project_project_pics_attributes_' + count + '_picture"/>' +
        "        </span>" +
        "        <input type=\"hidden\" name=\"project[project_pics_attributes][" + count + '][picture_cache]" id="add_project_project_pics_attributes_' + count + '_picture_cache"/>' + "\n" +
        "      </div>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</div>\n"
    )
    $('#add_project_project_pics_attributes_' + count + '_picture').change({imageNumber: count},function(event){
        var tmppath = URL.createObjectURL(event.target.files[0]);
        $('#img_upload_' + event.data.imageNumber).attr('src',tmppath);
    })

}