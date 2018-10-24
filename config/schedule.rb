set :chronic_options, hours24: true
set :output, "./log/cron.log"

ENV.each { |k, v| env(k, v) }

every 1.day, at: "00:00" do
  rake "products:store"
end
