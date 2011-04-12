require 'spec_helper'

describe UsersHelper do
  describe "#ajax_request_to_resolve_address" do
    it "should send an AJAX request to solve the address" do
      helper.ajax_request_to_resolve_address ==  "$.ajax({\nurl: 'http://test.host/address',\ndata: 'zipcode=' + $('input#user_zipcode')[0].value,\ntype: 'GET'})"
    end
  end
end
