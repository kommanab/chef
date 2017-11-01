# Author:: Shawn Neal (<sneal@sneal.net>)
# Cookbook Name:: visualstudio
# Attribute:: vs2015
#
# Copyright 2015, Shawn Neal
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

# Currently you cannot change this, doing so will break the cookbook
default['visualstudio']['2015']['install_dir'] =
  (ENV['ProgramFiles(x86)'] || 'C:\Program Files (x86)') + '\Microsoft Visual Studio 14.0'

# Community w/Update 3
default['visualstudio']['2015']['community']['installer_file'] = 'vs_community.exe'
default['visualstudio']['2015']['community']['filename'] =
  'vs2015.3.com_enu.iso'
default['visualstudio']['2015']['community']['package_name'] =
  'Microsoft Visual Studio Community 2015'
default['visualstudio']['2015']['community']['checksum'] =
  'ce124aec77f970605bb38352e59e7b3c7b51c0367f213cf5e6165b2698c1ba20'
default['visualstudio']['2015']['community']['default_source'] =
  'http://download.microsoft.com/download/b/e/d/bedddfc4-55f4-4748-90a8-ffe38a40e89f'

# Defaults for the <SelectableItemCustomization> in AdminDeployment.xml
# These are DEFAULTS. If you wish to change the selectable items installed edit the node attributes
# default['visualstudio']['install_items']['<feature>']['selected'] etc. (see README)
default['visualstudio']['2015']['community']['default_install_items'].tap do |h|
  h['TypeScriptV1']['selected'] = true
  h['TypeScriptV1']['friendly_name'] = 'TypeScript for Visual Studio'
  h['WebToolsV1']['selected'] = true
  h['WebToolsV1']['hidden'] = false
  h['WebToolsV1']['friendly_name'] = 'Microsoft Web Developer Tools'
  h['JavaJDKV1']['selected'] = true
  h['JavaJDKV1']['hidden'] = false
  h['JavaJDKV1']['friendly_name'] = 'Java SE Development Kit (7.0.550.13)'
  h['GitForWindowsV1']['selected'] = true
  h['GitForWindowsV1']['hidden'] = false
  h['GitForWindowsV1']['friendly_name'] = 'Git for Windows'
  h['MDDJSDependencyHiddenV1']['selected'] = true
  h['MDDJSDependencyHiddenV1']['friendly_name'] = 'MDDJSDependencyHidden'
  h['BlissHidden']['selected'] = true
  h['BlissHidden']['friendly_name'] = 'BlissHidden'
  h['HelpHidden']['selected'] = true
  h['HelpHidden']['friendly_name'] = 'HelpHidden'
  h['JavaScript']['selected'] = true
  h['JavaScript']['friendly_name'] = 'JavascriptHidden'
  h['PortableDTPHidden']['selected'] = true
  h['PortableDTPHidden']['friendly_name'] = 'PortableDTPHidden'
  h['PreEmptiveDotfuscatorHidden']['selected'] = true
  h['PreEmptiveDotfuscatorHidden']['friendly_name'] = 'PreEmptiveDotfuscatorHidden'
  h['PreEmptiveAnalyticsHidden']['selected'] = true
  h['PreEmptiveAnalyticsHidden']['friendly_name'] = 'PreEmptiveAnalyticsHidden'
  h['ProfilerHidden']['selected'] = true
  h['ProfilerHidden']['friendly_name'] = 'ProfilerHidden'
  h['RoslynLanguageServicesHidden']['selected'] = true
  h['RoslynLanguageServicesHidden']['friendly_name'] = 'RoslynLanguageServicesHidden'
  h['SDKTools3Hidden']['selected'] = true
  h['SDKTools3Hidden']['friendly_name'] = 'SDKTools3Hidden'
  h['SDKTools4Hidden']['selected'] = true
  h['SDKTools4Hidden']['friendly_name'] = 'SDKTools4Hidden'
  h['WCFDataServicesHidden']['selected'] = true
  h['WCFDataServicesHidden']['friendly_name'] = 'WCFDataServicesHidden'
end

