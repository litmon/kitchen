require 'spec_helper'

describe package("epel-release") do
  it { should be_installed } 
end

describe package("remi-release") do
  it { should be_installed }
end

describe package("nginx") do
  it { should be_installed }

  describe file("/etc/nginx/nginx.conf") do
    it { should be_file }
    its(:content) { should match /root\s+\/var\/www\// }
  end
end

describe package("php55") do
  it { should be_installed }
end

describe package("php-fpm") do
  it { should be_installed }
end

describe port(22) do
  it { should be_listening }
end
