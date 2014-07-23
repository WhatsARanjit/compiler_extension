# cacrl_path.rb

Facter.add('crl_path') do
  setcode do
    Puppet[:hostcrl]
  end
end
