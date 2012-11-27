#
# Cookbook Name:: gem_binary
# Recipe:: default
#
# Copyright 2012, Pioneering Software, United Kingdom
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Iterate through all the gem_package resources changing the gem binary to
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
