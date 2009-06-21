module UsersHelper

  #method for the AJAX-request to resolve the address
  def resolve_address
    return remote_function(
            :url => addresses_url,
            :with => "'zipcode='+ window.document.forms[0][\'user[zipcode]\'].value",
            :update => 'zipResult')
  end
end
