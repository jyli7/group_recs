namespace :cache do
  namespace :clear => :environment do
    Rails.cache.clear
  end
end
