require 'axlsx'

module Acme
  class AxlsxBuild < Grape::API
    desc "Axlsx."
    get "axlsx" do
      # header['Content-Disposition'] = "attachment; filename=report.xlsx"
      content_type 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'

      p = ::Axlsx::Package.new
      p.workbook.add_worksheet(:name => 'Test sheet') do |sheet|
        sheet.add_row ['Foobar test']
      end
      p.use_shared_strings = true
      p.serialize('simple.xlsx')

      # File.open('simple.xlsx').read
      p.to_stream.read
    end
  end
end
