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

    # List all available packages.
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

    # List all available packages.
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
      local_header_accept = ['text/plain', 'text/html', 'application/json', 'application/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded', 'multipart/form-data']
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
  end
end