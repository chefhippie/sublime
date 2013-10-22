#
# Cookbook Name:: sublime
# Recipe:: default
#
# Copyright 2013, Thomas Boerger
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file ::File.join(Chef::Config[:file_cache_path], node["sublime"]["file_name"]) do
  source node["sublime"]["file_download"]
  action :create_if_missing
end

bash "sublime_install" do
  code <<-EOH
    tar -jxvf #{node["sublime"]["file_name"]} --transform=s/Sublime\\ Text\\ 2/#{node["sublime"]["install_directory"]}/ -C #{node["sublime"]["install_prefix"]}
  EOH

  cwd Chef::Config[:file_cache_path]
  action :run

  not_if do
    ::File.directory? ::File.join(node["sublime"]["install_prefix"], node["sublime"]["install_directory"])
  end
end

link node["sublime"]["install_alias"] do
  to ::File.join(node["sublime"]["install_prefix"], node["sublime"]["install_directory"], "sublime_text")

  only_if do
    node["sublime"]["install_alias"]
  end
end
