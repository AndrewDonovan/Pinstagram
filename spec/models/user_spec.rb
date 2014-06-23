require 'spec_helper'

describe User do
	it { should have_db_column(:name)}
	it { should have_db_column(:uid)}
	it { should have_db_column(:nickname)}
	it { should have_db_column(:access_token)}
	it { should have_db_column(:provider)}
	it { should have_db_column(:created_at)}
	it { should have_db_column(:updated_at)}
end
