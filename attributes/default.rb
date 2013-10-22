#
# Cookbook Name:: sublime
# Attributes:: default
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

default["sublime"]["version"] = "2.0.2"
default["sublime"]["file_name"] = "Sublime%20Text%20#{node["sublime"]["version"]}%20x64.tar.bz2"
default["sublime"]["file_download"] = "http://c758482.r82.cf2.rackcdn.com/#{node["sublime"]["file_name"]}"
default["sublime"]["install_directory"] = "sublime"
default["sublime"]["install_prefix"] = "/opt"
default["sublime"]["install_alias"] = "/usr/local/bin/subl"