# encoding: utf-8
# copyright: 2018, The Authors

title 'terraform validation'

control 'terraforn' do
  impact 1
  title 'Run terraform validate'

  describe command('cd terraform/stage && terraform validate -var-file=terraform.tfvars.example -check-variables=true') do
    its('stdout') { should_not match (/Error/) }
  end
end