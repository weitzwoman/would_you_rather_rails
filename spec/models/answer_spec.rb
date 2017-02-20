require 'rails_helper'

describe Answer do
  it { should belong_to :question }
  it { should validate_presence_of :content }
end
