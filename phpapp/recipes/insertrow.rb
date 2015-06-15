node[:deploy].each do |app_name, deploy|
  execute "mysql-insert-row" do
    command "/usr/bin/mysql -u#{deploy[:database][:username]} -p#{deploy[:database][:password]} #{deploy[:database][:database]} -e'INSERT INTO #{node[:phpapp][:dbtable]}(message) values('Thermonuclear War.');"
    not_if "/usr/bin/mysql -u#{deploy[:database][:username]} -p#{deploy[:database][:password]} #{deploy[:database][:database]} -e'SHOW TABLES' | grep #{node[:phpapp][:dbtable]}"
    action :run
  end
end