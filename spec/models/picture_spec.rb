require 'spec_helper'

describe Picture do
	it { should have_db_column(:url)}
	it { should have_db_column(:user_id)}
	it { should have_db_column(:created_at)}
	it { should have_db_column(:updated_at)}
end