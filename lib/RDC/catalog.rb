# frozen_string_literal: true

require 'net/sftp'
require 'zip'
require 'active_support/core_ext/hash'
require_relative 'restaurant'

module RDC
  class Catalog
    class << self
      def fetch(skip_downloading = false)
        download_xml_catalog unless skip_downloading
        extract_zip_file     unless skip_downloading
        parse_xml_file
        process_xml_content
      end

      def download_xml_catalog
        puts '[RDC] Start Downloading ZIP File from FTP Server.'
        Net::SFTP.start(RDC.ftp_url, RDC.ftp_username, password: RDC.ftp_password) do |sftp|
          sftp.download!('/rdc_MemberHub.zip', downloads_directory.join('rdc_MemberHub.zip').to_s)
        end
        puts '[RDC] Finished Downloading ZIP File from FTP Server.'
      end

      def extract_zip_file
        puts '[RDC] Starting Extracting XML File from ZIP File.'
        Zip::File.open(downloads_directory.join('rdc_MemberHub.zip')) do |zip_file|
          zip_file.each do |f|
            fpath = File.join(downloads_directory.to_s, f.name)
            zip_file.extract(f, fpath) unless File.exist?(fpath)
          end
        end
        puts '[RDC] Done Extracting XML File from ZIP File.'
      end

      def parse_xml_file
        puts '[RDC] Parsing XML'
        xml_file_path = downloads_directory.join('rdc_MemberHub.xml')
        @xml = Hash.from_xml(File.open(xml_file_path))
        puts '[RDC] Finished parsing XML'
      end

      def process_xml_content
        puts '[RDC] Starting XML Processing'
        @catalog = @xml["Catalogs"]["catalog"].collect { |catalog_hash| RDC::Restaurant.new(catalog_hash) }
        puts '[RDC] Finished XML Processing'
        @catalog
      end

      private

      def downloads_directory
        @downloads_directory ||= Pathname.new(RDC.root).join('downloads')
      end
    end
  end
end
