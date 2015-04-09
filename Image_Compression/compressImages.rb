 class CompressImages
	def initialize(filename)
      		@cnt=0
		@filename=filename
	end
	def listDirectories
		
		pqr=Dir.glob(@filename+'/**/*.png')
		puts pqr
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		pqr.each do |png|
				system("mogrify -format jpg "+png)
				File.delete(png)			
		end
		
		abc=Dir.glob(@filename+'/**/*.jpg')
		puts abc
	
		abc.each do |entry|
			puts "***********************************************************************************************************************************"
			puts "File : "+entry+" Size :"+File.size(entry).to_s()	
			system("mogrify -quality 18 "+entry)		
			puts "Compressed!! Size : "+File.size(entry).to_s()
			@cnt=@cnt+1
			puts @cnt		
		end	
	end

end


puts "Enter Folder Path"
path = gets.chomp
compress=CompressImages.new(path)
compress.listDirectories
