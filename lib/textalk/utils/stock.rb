module Textalk
  module Utils
    module Stock
      include Textalk::Helpers::Excel

      def generate_excel_workbook(article_query = {})
        xlsx = StringIO.new
        workbook = WriteXLSX.new(xlsx)
        generate_excel_worksheet(workbook, "All Stock", Article.list(article_query))
        workbook.close
        xlsx
      end

      def generate_excel_workbook_per_article_group
        xlsx = StringIO.new
        workbook = WriteXLSX.new(xlsx)

        groups = ArticleGroup.list.index_by(&:uid)
        Article.list.group_by { |art| art[:articlegroup] }.each do |art_group|
          group = groups[art_group.last.first[:articlegroup]]
          generate_excel_worksheet(workbook, group.name, art_group.last, show_variants: true)
        end

        workbook.close
        xlsx
      end

      def generate_excel_worksheet(workbook, name, articles, show_variants: false)
        @articles = articles || Article.list
        
        worksheet = workbook.add_worksheet(name)

        header_format = workbook.add_format(header_format_properties)
        content_format = workbook.add_format(content_format_properties)
        summery_format = workbook.add_format(summery_format_properties)

        worksheet.set_column(0, 0, 15)
        worksheet.write(0, 0, "#", header_format)
        worksheet.set_column(1, 1, 20)
        worksheet.write(0, 1, "SKU", header_format)
        worksheet.set_column(2, 2, 30)
        worksheet.write(0, 2, "Name", header_format)
        worksheet.set_column(3, 3, 20)
        worksheet.write(0, 3, "Total Stock", header_format)
      
        if show_variants
          variants = articles.first.variants
          variants&.each_with_index do |variant, index|
            worksheet.write(0, 5 + index, variant[:name], header_format)
          end
        end

        @articles.each_with_index do |article, index|
          worksheet.write(1 + index, 0, article[:articleNumber], content_format)
          worksheet.write(1 + index, 1, article[:sku], content_format)
          worksheet.write(1 + index, 2, article[:name][:sv], content_format)
          worksheet.write(1 + index, 3, article[:stock][:stock], content_format)
          
          if show_variants
            article.variants&.each_with_index do |variant, vi|
              worksheet.write(1 + index, 5 + vi, variant[:stock], content_format)
            end
          end
        end

        # Add summery field
        row = @articles.size + 1
        worksheet.write(row, 0, "Summery", summery_format)
        worksheet.write(row, 1, "", summery_format)
        worksheet.write(row, 2, "", summery_format)
        worksheet.write(row, 3, "Total", summery_format)

        worksheet.write(row + 1, 0, "=ROWS(A2:A#{row})", content_format)
        worksheet.write(row + 1, 3, "=SUM(D2:D#{row})", content_format)
      end

      extend self
    end
  end
end
