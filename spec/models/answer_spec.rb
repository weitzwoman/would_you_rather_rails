require 'rails_helper'

describe Answer do

  it { should belong_to :question }
end
