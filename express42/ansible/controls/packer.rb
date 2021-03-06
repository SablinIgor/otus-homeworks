# encoding: utf-8
# copyright: 2018, The Authors

title 'packer validation'

control 'packer' do
  impact 1
  title 'Run packer validate'

  describe command('find packer ! -name "variables*.json" -name "*.json"  -depth 1 -type f -print0 | xargs -0 -n1 packer validate -var-file=packer/variables.json.example') do
    its('stdout') { should_not match (/Template validation failed/) }
  end
end
