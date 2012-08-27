require 'spec_helper'

describe GoCardless::PreAuthorization do
  before :each do
    @app_id = 'abc'
    @app_secret = 'xyz'
    GoCardless.account_details = {:app_id => @app_id, :app_secret => @app_secret,
                                  :token  => 'xxx manage_merchant:1'}
    @client = GoCardless.client
  end

  it "should be cancellable" do
    s = GoCardless::PreAuthorization.new_with_client(@client, :id => '009988')
    @client.expects(:api_put).with('/pre_authorizations/009988/cancel')
    s.cancel!
  end

end
