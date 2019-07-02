namespace :factory_bot do
  desc "Verify that all FactoryBot factories are valid"
  task lint: :environment do
    if Rails.env.test?  
      puts "Checking your factories..."
        
      conn = ActiveRecord::Base.connection
      conn.transaction do
        FactoryBot.lint
        raise ActiveRecord::Rollback
      end
      puts "...Factory check completed"
    else
      puts "FactoryBot lint should only be run in  test environment"
    end
  end
end