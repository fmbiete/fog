module Fog
  module Storage
    class Rackspace
      class Real

        # Copy object
        #
        # ==== Parameters
        # * source_container_name<~String> - Name of source bucket
        # * source_object_name<~String> - Name of source object
        # * target_container_name<~String> - Name of bucket to create copy in
        # * target_object_name<~String> - Name for new copy of object
        # * options<~Hash> - Additional headers
        # @raise [Fog::Storage::Rackspace::NotFound] - HTTP 404
        # @raise [Fog::Storage::Rackspace::BadRequest] - HTTP 400
        # @raise [Fog::Storage::Rackspace::InternalServerError] - HTTP 500
        # @raise [Fog::Storage::Rackspace::ServiceError]
        def copy_object(source_container_name, source_object_name, target_container_name, target_object_name, options={})
          headers = { 'X-Copy-From' => "/#{source_container_name}/#{source_object_name}" }.merge(options)
          request({
                    :expects  => 201,
            :headers  => headers,
            :method   => 'PUT',
            :path     => "#{Fog::Rackspace.escape(target_container_name)}/#{Fog::Rackspace.escape(target_object_name)}"
          })
        end

      end
    end
  end
end
