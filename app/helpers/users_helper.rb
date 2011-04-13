module UsersHelper

  #method for the AJAX-request to resolve the address
  def ajax_request_to_resolve_address(zipcode = nil)
    "$.ajax({
      url: '#{address_url}',
      data: 'zipcode=#{zipcode ? "#{zipcode}'" : "' + $('input#user_zipcode')[0].value"},
      type: 'GET'})"
  end
end
