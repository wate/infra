require 'spec_helper'

describe package('ufw') do
  it { should be_installed }
end

describe service('ufw') do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe command('ufw status verbose') do
  its(:stdout) { should match(/Status: active/) }
  its(:stdout) { should match(/Logging: on/) }
  its(:stdout) { should match(/Default: deny/) }
end
