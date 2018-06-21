module Textalk
  module Utils
    module Labels
      class Generator < Prawn::Document
        def initialize(articles)
          super(page_size: "A4", page_layout: :landscape, margin: 0)
          @articles = articles
          
          # a["baseName"]
          # a["articleNumber"]

          cell_height = 22.mm
          cell_width = bounds.width / 3
          name_height = cell_height * 0.6
          art_height = cell_height - name_height 
          cell_count_y = (bounds.height / cell_height).to_i

          stroke_color "D3D3D3"
          fill_color "000000"
          cell_count_y.times do |y|
            3.times do |x|
              pos = [cell_width * x, bounds.height - cell_height * y]
              stroke_rectangle pos, cell_width, cell_height
          
              draw_text("Hello World", { 
                size: name_height,
                width: cell_width,
                height: name_height,
                at: [pos[0], pos[1]], 
                rotate: 0,
                rotate_around: :center
              })

              draw_text("(Hello World)", { 
                size: art_height,
                width: cell_width,
                height: art_height,
                at: [pos[0], pos[1] - name_height], 
                rotate: 0,
                rotate_around: :center
              }) 
            end
          end

        end
      end
       
      def generate_excel(article_query = {}, articles_per_row: 8)
        generate_data article_query
        Generator.new(@articles).render
      end

      def generate_data(article_query = {})
        @articles = Article.list(article_query)
        # { "baseName": true, "articleNumber": true })
      end

      extend self
    end
  end
end
