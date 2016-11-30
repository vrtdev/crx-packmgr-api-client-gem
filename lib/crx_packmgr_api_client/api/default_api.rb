=begin
#CRX Package Manager API

#API for interacting with the CRX Package Manager in AEM.

OpenAPI spec version: 1.0.0
Contact: bryan.stopp@gmail.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require "uri"

module CrxPackageManager
  class DefaultApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Download a package
    # Downloads the package at the specified path. Returns a Tempfile object.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :path The path to the package to download.
    # @return [File]
    def download(opts = {})
      data, _status_code, _headers = download_with_http_info(opts)
      return data
    end

    # Download a package
    # Downloads the package at the specified path. Returns a Tempfile object.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :path The path to the package to download.
    # @return [Array<(File, Fixnum, Hash)>] File data, response status code and response headers
    def download_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.download ..."
      end
      # resource path
      local_var_path = "/download.jsp".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'path'] = opts[:'path'] if !opts[:'path'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/octet-stream', 'application/zip']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#download\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List package groups
    # Returns a list of all package groups available.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :compress_version Compress versions; count all versions of the same packages as a single entry.
    # @option opts [BOOLEAN] :include_all Return a total count of all packages. Default to false.
    # @option opts [BOOLEAN] :include_root Include the root package. Defaults to false.
    # @option opts [BOOLEAN] :include_my_packages Include the &#39;my_packages&#39; group. Only applicable if the group has no packages. Default to false.
    # @option opts [BOOLEAN] :only_top_level Only list top-level groups, ie. do not list all nested groups.
    # @return [GroupList]
    def groups(opts = {})
      data, _status_code, _headers = groups_with_http_info(opts)
      return data
    end

    # List package groups
    # Returns a list of all package groups available.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :compress_version Compress versions; count all versions of the same packages as a single entry.
    # @option opts [BOOLEAN] :include_all Return a total count of all packages. Default to false.
    # @option opts [BOOLEAN] :include_root Include the root package. Defaults to false.
    # @option opts [BOOLEAN] :include_my_packages Include the &#39;my_packages&#39; group. Only applicable if the group has no packages. Default to false.
    # @option opts [BOOLEAN] :only_top_level Only list top-level groups, ie. do not list all nested groups.
    # @return [Array<(GroupList, Fixnum, Hash)>] GroupList data, response status code and response headers
    def groups_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.groups ..."
      end
      # resource path
      local_var_path = "/groups.jsp".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'compressVersion'] = opts[:'compress_version'] if !opts[:'compress_version'].nil?
      query_params[:'includeAll'] = opts[:'include_all'] if !opts[:'include_all'].nil?
      query_params[:'includeRoot'] = opts[:'include_root'] if !opts[:'include_root'].nil?
      query_params[:'includeMyPackages'] = opts[:'include_my_packages'] if !opts[:'include_my_packages'].nil?
      query_params[:'onlyTopLevel'] = opts[:'only_top_level'] if !opts[:'only_top_level'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GroupList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#groups\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Metadata
    # Display metadata about this package manager.
    # @param [Hash] opts the optional parameters
    # @return [InitData]
    def init(opts = {})
      data, _status_code, _headers = init_with_http_info(opts)
      return data
    end

    # Metadata
    # Display metadata about this package manager.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InitData, Fixnum, Hash)>] InitData data, response status code and response headers
    def init_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.init ..."
      end
      # resource path
      local_var_path = "/init.jsp".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InitData')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#init\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Package Installation Status
    # Returns a status of the installation of OSGi packages.
    # @param [Hash] opts the optional parameters
    # @return [InstallStatus]
    def installstatus(opts = {})
      data, _status_code, _headers = installstatus_with_http_info(opts)
      return data
    end

    # Package Installation Status
    # Returns a status of the installation of OSGi packages.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InstallStatus, Fixnum, Hash)>] InstallStatus data, response status code and response headers
    def installstatus_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.installstatus ..."
      end
      # resource path
      local_var_path = "/installstatus.jsp".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InstallStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#installstatus\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List packages
    # Returns a list of all available packages defined.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :q Term to search within package names.
    # @option opts [BOOLEAN] :include_versions Include versions of package in results.
    # @option opts [String] :path The path to a specific package definition.
    # @return [PackageList]
    def list(opts = {})
      data, _status_code, _headers = list_with_http_info(opts)
      return data
    end

    # List packages
    # Returns a list of all available packages defined.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :q Term to search within package names.
    # @option opts [BOOLEAN] :include_versions Include versions of package in results.
    # @option opts [String] :path The path to a specific package definition.
    # @return [Array<(PackageList, Fixnum, Hash)>] PackageList data, response status code and response headers
    def list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list ..."
      end
      # resource path
      local_var_path = "/list.jsp".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?
      query_params[:'includeVersions'] = opts[:'include_versions'] if !opts[:'include_versions'].nil?
      query_params[:'path'] = opts[:'path'] if !opts[:'path'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PackageList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get screenshot
    # Returns the screenshot at the specified path.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :path The path to the screenshot.
    # @return [File]
    def screenshot(opts = {})
      data, _status_code, _headers = screenshot_with_http_info(opts)
      return data
    end

    # Get screenshot
    # Returns the screenshot at the specified path.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :path The path to the screenshot.
    # @return [Array<(File, Fixnum, Hash)>] File data, response status code and response headers
    def screenshot_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.screenshot ..."
      end
      # resource path
      local_var_path = "/screenshot.jsp".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'path'] = opts[:'path'] if !opts[:'path'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['image/jpg', 'image/jpeg', 'image/png']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#screenshot\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Generic operation service.
    # Provides endpoint for executing package manipulation commands.
    # @param cmd The command to execute.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name The name of the package on which to execute the command.
    # @option opts [String] :group The group of the package on which to execute the command.
    # @option opts [BOOLEAN] :strict Fail on an error.
    # @return [String]
    def service_get(cmd, opts = {})
      data, _status_code, _headers = service_get_with_http_info(cmd, opts)
      return data
    end

    # Generic operation service.
    # Provides endpoint for executing package manipulation commands.
    # @param cmd The command to execute.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name The name of the package on which to execute the command.
    # @option opts [String] :group The group of the package on which to execute the command.
    # @option opts [BOOLEAN] :strict Fail on an error.
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def service_get_with_http_info(cmd, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.service_get ..."
      end
      # verify the required parameter 'cmd' is set
      fail ArgumentError, "Missing the required parameter 'cmd' when calling DefaultApi.service_get" if cmd.nil?
      # verify enum value
      unless ['help', 'ls', 'rm', 'build', 'inst', 'uninst', 'get'].include?(cmd)
        fail ArgumentError, "invalid value for 'cmd', must be one of help, ls, rm, build, inst, uninst, get"
      end
      # resource path
      local_var_path = "/service.jsp".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'cmd'] = cmd
      query_params[:'name'] = opts[:'name'] if !opts[:'name'].nil?
      query_params[:'group'] = opts[:'group'] if !opts[:'group'].nil?
      query_params[:'strict'] = opts[:'strict'] if !opts[:'strict'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/octet-stream', 'application/zip', 'text/plain']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'String')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#service_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Generic operation service.
    # Provides endpoint for
    # @param file Package file to upload
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name The hint for the package&#39;s name if the definiton doesn&#39;t have one.
    # @option opts [BOOLEAN] :strict Fail on an error.
    # @option opts [BOOLEAN] :force Force the package upload.
    # @option opts [BOOLEAN] :install Install the package upon upload
    # @return [String]
    def service_post(file, opts = {})
      data, _status_code, _headers = service_post_with_http_info(file, opts)
      return data
    end

    # Generic operation service.
    # Provides endpoint for
    # @param file Package file to upload
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name The hint for the package&#39;s name if the definiton doesn&#39;t have one.
    # @option opts [BOOLEAN] :strict Fail on an error.
    # @option opts [BOOLEAN] :force Force the package upload.
    # @option opts [BOOLEAN] :install Install the package upon upload
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def service_post_with_http_info(file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.service_post ..."
      end
      # verify the required parameter 'file' is set
      fail ArgumentError, "Missing the required parameter 'file' when calling DefaultApi.service_post" if file.nil?
      # resource path
      local_var_path = "/service.jsp".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = []
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['multipart/form-data']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}
      form_params["file"] = file
      form_params["name"] = opts[:'name'] if !opts[:'name'].nil?
      form_params["strict"] = opts[:'strict'] if !opts[:'strict'].nil?
      form_params["force"] = opts[:'force'] if !opts[:'force'].nil?
      form_params["install"] = opts[:'install'] if !opts[:'install'].nil?

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'String')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#service_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get package thumbnail
    # Returns the package's thumbnail image.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :path The path to the package.
    # @return [File]
    def thumbnail(opts = {})
      data, _status_code, _headers = thumbnail_with_http_info(opts)
      return data
    end

    # Get package thumbnail
    # Returns the package&#39;s thumbnail image.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :path The path to the package.
    # @return [Array<(File, Fixnum, Hash)>] File data, response status code and response headers
    def thumbnail_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.thumbnail ..."
      end
      # resource path
      local_var_path = "/thumbnail.jsp".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'path'] = opts[:'path'] if !opts[:'path'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['image/jpg', 'image/jpeg', 'image/png']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#thumbnail\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update a package
    # Updates a package definition. Returns an UpdateStatus definition, but must be manually parsed due to MIME type incompatibilities. Note that if the name, group or version changes, this changes the path to the package for the next update or listing.
    # @param path The path to the package which needs updating.
    # @param package_name The package&#39;s name.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_name The package&#39;s group.
    # @option opts [String] :version The version for the package.
    # @option opts [String] :description The description for the package.
    # @option opts [File] :thumbnail The thumbnail for the package.
    # @option opts [String] :filter The filters for the package. The structure is specified in FilterData definition.
    # @option opts [String] :tested_with Product name and version this package is targeted for or is compatible with. eg: CQ 5.3
    # @option opts [String] :fixed_bugs List of fixed bugs or issues.
    # @option opts [Array<String>] :dependencies Packages on which this one depends.
    # @option opts [Array<String>] :replaces List of packages this one replaces.
    # @option opts [String] :provider_name Name of the provider. eg: Adobe Systems Incorporated
    # @option opts [String] :provider_url URL of the provider. eg: http://www.adobe.com
    # @option opts [String] :provider_link Package specific link to a provider page. eg: http://www.adobe.com/mypackage.html
    # @option opts [BOOLEAN] :requires_root Specifies if this package requires root to install.
    # @option opts [BOOLEAN] :requires_restart Specifies if this package requires a restart upon installation.
    # @option opts [String] :ac_handling How to handle ACL rules when installing the package.
    # @option opts [File] :screenshot Screen shot images for this package
    # @option opts [String] :screenshot_config Configuration details for existing screenshots. The structure is specified in ScreenshotConfig definition.
    # @return [String]
    def update(path, package_name, opts = {})
      data, _status_code, _headers = update_with_http_info(path, package_name, opts)
      return data
    end

    # Update a package
    # Updates a package definition. Returns an UpdateStatus definition, but must be manually parsed due to MIME type incompatibilities. Note that if the name, group or version changes, this changes the path to the package for the next update or listing.
    # @param path The path to the package which needs updating.
    # @param package_name The package&#39;s name.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_name The package&#39;s group.
    # @option opts [String] :version The version for the package.
    # @option opts [String] :description The description for the package.
    # @option opts [File] :thumbnail The thumbnail for the package.
    # @option opts [String] :filter The filters for the package. The structure is specified in FilterData definition.
    # @option opts [String] :tested_with Product name and version this package is targeted for or is compatible with. eg: CQ 5.3
    # @option opts [String] :fixed_bugs List of fixed bugs or issues.
    # @option opts [Array<String>] :dependencies Packages on which this one depends.
    # @option opts [Array<String>] :replaces List of packages this one replaces.
    # @option opts [String] :provider_name Name of the provider. eg: Adobe Systems Incorporated
    # @option opts [String] :provider_url URL of the provider. eg: http://www.adobe.com
    # @option opts [String] :provider_link Package specific link to a provider page. eg: http://www.adobe.com/mypackage.html
    # @option opts [BOOLEAN] :requires_root Specifies if this package requires root to install.
    # @option opts [BOOLEAN] :requires_restart Specifies if this package requires a restart upon installation.
    # @option opts [String] :ac_handling How to handle ACL rules when installing the package.
    # @option opts [File] :screenshot Screen shot images for this package
    # @option opts [String] :screenshot_config Configuration details for existing screenshots. The structure is specified in ScreenshotConfig definition.
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def update_with_http_info(path, package_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.update ..."
      end
      # verify the required parameter 'path' is set
      fail ArgumentError, "Missing the required parameter 'path' when calling DefaultApi.update" if path.nil?
      # verify the required parameter 'package_name' is set
      fail ArgumentError, "Missing the required parameter 'package_name' when calling DefaultApi.update" if package_name.nil?
      if opts[:'ac_handling'] && !['-', 'ignore', 'overwrite', 'merge', 'merge_preserve', 'clear'].include?(opts[:'ac_handling'])
        fail ArgumentError, 'invalid value for "ac_handling", must be one of -, ignore, overwrite, merge, merge_preserve, clear'
      end
      # resource path
      local_var_path = "/update.jsp".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['text/html']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['multipart/form-data']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}
      form_params["path"] = path
      form_params["packageName"] = package_name
      form_params["groupName"] = opts[:'group_name'] if !opts[:'group_name'].nil?
      form_params["version"] = opts[:'version'] if !opts[:'version'].nil?
      form_params["description"] = opts[:'description'] if !opts[:'description'].nil?
      form_params["thumbnail"] = opts[:'thumbnail'] if !opts[:'thumbnail'].nil?
      form_params["filter"] = opts[:'filter'] if !opts[:'filter'].nil?
      form_params["testedWith"] = opts[:'tested_with'] if !opts[:'tested_with'].nil?
      form_params["fixedBugs"] = opts[:'fixed_bugs'] if !opts[:'fixed_bugs'].nil?
      form_params["dependencies"] = @api_client.build_collection_param(opts[:'dependencies'], :multi) if !opts[:'dependencies'].nil?
      form_params["replaces"] = @api_client.build_collection_param(opts[:'replaces'], :multi) if !opts[:'replaces'].nil?
      form_params["providerName"] = opts[:'provider_name'] if !opts[:'provider_name'].nil?
      form_params["providerUrl"] = opts[:'provider_url'] if !opts[:'provider_url'].nil?
      form_params["providerLink"] = opts[:'provider_link'] if !opts[:'provider_link'].nil?
      form_params["requiresRoot"] = opts[:'requires_root'] if !opts[:'requires_root'].nil?
      form_params["requiresRestart"] = opts[:'requires_restart'] if !opts[:'requires_restart'].nil?
      form_params["acHandling"] = opts[:'ac_handling'] if !opts[:'ac_handling'].nil?
      form_params["screenshot"] = opts[:'screenshot'] if !opts[:'screenshot'].nil?
      form_params["screenshotConfig"] = opts[:'screenshot_config'] if !opts[:'screenshot_config'].nil?

      # http body (model)
      post_body = nil
      auth_names = ['basic']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'String')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
