class RemoveOrganizationsWithNoName < ActiveRecord::Migration
  def change
    Organization.where(:name => nil).delete_all
    Organization.where(:name => '').delete_all
    Organization.where(:name => ' ').delete_all
    Organization.where(:active => nil).update_all(:active => false)
    Person.where("date_of_birth <= ?", 100.year.ago).delete_all
  end
end
