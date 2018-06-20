module Textalk
  module Utils
    module Stock
      def generate_excel_workbook(article_query = {})
        xlsx = StringIO.new
        workbook = WriteXLSX.new(xlsx)
        generate_excel_worksheet(workbook, "All Stock", article_query)
        workbook.close
        xlsx
      end

      def generate_excel_worksheet(workbook, name, article_query = {})
        generate_data article_query
        
        worksheet = workbook.add_worksheet(name)

        header_format = workbook.add_format(header_format_properties)
        content_format = workbook.add_format(content_format_properties)

        worksheet.set_column(0, 0, 15)
        worksheet.write(0, 0, "#", header_format)
        worksheet.set_column(1, 1, 20)
        worksheet.write(0, 1, "SKU", header_format)
        worksheet.set_column(2, 2, 30)
        worksheet.write(0, 2, "Name", header_format)
        worksheet.set_column(3, 3, 10)
        worksheet.write(0, 3, "Stock", header_format)
      
        @articles.each_with_index do |article, index|
          worksheet.write(1 + index, 0, article["articleNumber"], content_format)
          worksheet.write(1 + index, 1, article["sku"], content_format)
          worksheet.write(1 + index, 2, article["name"]["sv"], content_format)
          worksheet.write(1 + index, 3, article["stock"]["stock"], content_format)
        end
      end

      def generate_data(article_query = {})
        @articles = Article.list(article_query)
      end

      def header_format_properties
        {
          font: "Courier New",
          bold: true,
          align: "center"
        }
      end

      def content_format_properties
        {
          font: "Courier New"
        }
      end

      extend self
    end
  end
end
