# encoding: utf-8
# copyright: 2018, The Authors

title 'packer validation'

control 'packer' do
  impact 1
  title 'Run packer validate'

  describe command('cd packer && find ./ ! -name "variables*.json" -name "*.json"  -type f -print0 | xargs -0 -n1 packer validate -var-file=variables.json.example') do
    its('stdout') { should_not match (/Template validation failed/) }
    its('stderr') { should eq '' }
  end
end
