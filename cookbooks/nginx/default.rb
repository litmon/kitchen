package "epel-release"
package "nginx"

service "nginx" do
  action [:enable, :start]
end

template "/etc/nginx/nginx.conf" do
  source "templates/nginx.conf.erb"
  variables(root: "/var/www/")
  notifies :reload, "service[nginx]"
end
