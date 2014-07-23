# cacrl_path.rb

Facter.add('cacrl_path') do
  setcode do
    Puppet[:cacrl]
  end
end
