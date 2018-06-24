module Textalk
  module Helpers
    module Excel
      def header_format_properties
        {
          font: "Courier New",
          bold: true,
          align: "center",
          bottom: 1
        }
      end

      def content_format_properties
        {
          font: "Courier New"
        }
      end

      def summery_format_properties
        {
          font: "Courier New",
          bold: true,
          align: "right",
          bottom: 1,
          top: 1
        }
      end
    end
  end
end
