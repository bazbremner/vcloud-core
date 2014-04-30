module Vcloud
  module Core
    class Vdc

      attr_reader :id

      def initialize(id)
        unless id =~ /^[-0-9a-f]+$/
          raise "vdc id : #{id} is not in correct format"
        end
        @id = id
      end

      def self.get_by_name(name)
        q = QueryRunner.new
        unless res = q.run('orgVdc', :filter => "name==#{name}")
          raise "Error finding vDC by name #{name}"
        end
        raise "vDc #{name} not found" unless res.size == 1
        return self.new(res.first[:href].split('/').last)
      end

      def vcloud_attributes
        Vcloud::Core::Fog::ServiceInterface.new.get_vdc(id)
      end

      def name
        vcloud_attributes[:name]
      end

      def href
        vcloud_attributes[:href]
      end

    end
  end
end
