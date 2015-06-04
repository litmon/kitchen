package "epel-release"

execute "Add repository remi to rpm" do
  command "rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"
  not_if "rpm -q remi-release"
end

package "nginx"

service "nginx" do
  action [:enable, :start]
end

template "/etc/nginx/nginx.conf" do
  source "templates/nginx.conf.erb"
  variables(root: "/var/www/")
  notifies :reload, "service[nginx]"
end

package "php55" do
  action :install
  options "--enablerepo=remi --enablerepo=remi-php55"
end

package "php-fpm" do
  action :install
  options "--enablerepo=remi"
end
