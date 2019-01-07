require "#{__dir__}/default"

module AwsResource
  class VpcRouteTable < Default

    def aws_region_services_name
      %w[EC2]
    end

    def friendly_service_name
      'VPC Route Tables'
    end

    def aws_client(region:,credentials:)
      Aws::EC2::Client.new(region: region, credentials: credentials)
    end

    def aws_client_method
      'describe_route_tables'
    end

    def aws_client_method_args
      {}
    end

    def aws_response_collection
      'route_tables'
    end

    def aws_response_resource_name
      'route_table_id'
    end

    def aws_event_name
      %w[CreateRouteTable]
    end

    def resource_name_exists?(**args)
      (args[:response_elements]['routeTable'] &&
          args[:response_elements]['routeTable']['routeTableId'])
    end

    def resource_name(**args)
      args[:response_elements]['routeTable']['routeTableId']
    end

  end

end
