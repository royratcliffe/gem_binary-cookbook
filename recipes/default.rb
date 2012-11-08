#
# Cookbook Name:: gem_binary
# Recipe:: default
#
# Copyright 2012, Pioneering Software, United Kingdom
# All rights reserved
#

# Iterate through all the gem_package resources changing the Gem binary to
# node[:gem_binary] unless already configured. Do this at the end of
# compilation, just before convergence when the gem_package resources perform
# their install action.
ruby_block "gem_binary" do
  block do
    run_context.resource_collection.select do |resource|
      resource.resource_name == :gem_package
    end.each do |resource|
      resource.gem_binary node[:gem_binary] unless resource.gem_binary
    end
  end
end
