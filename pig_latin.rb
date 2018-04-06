class PigLatin

 	def self.translate(words)
		#This method splits the words on each white space between them, then 
		#iterates through them and calls the method translator on each of them. 
		#This allows the code to work on phrases as well as single words 
		words.split.map { |word| translator(word) }.join(" ")
 	end

	def self.translator(word)
		#this method converts the word into pig-latin

		#downcases string to avoid matching errors
		word = word.downcase

		vowels = ['a', 'e', 'i', 'o', 'u']
		consonants = ('a'..'z').to_a - vowels

		#checks for words starting with vowels, words starting with "xr" and words starting with "yt" 
		#and adds "ay" to the end of the word
		if vowels.include?(word[0]) or  ['x', 'y'].include?(word[0]) && ['r' , 't'].include?(word[1]) 
			word << 'ay'

		#checks for two letter words that end with "y" and moves the "y" to the beggining of the word and adds 
		# "ay" to the end of the word
		elsif (word.length == 2 && word[1] == 'y')
			word = word[1] + word[0] + 'ay'

		#checks for words starting with "qu" and moves the vowels after "qu to the beggining of the word,
		# and "qu" to the end of word + adds "ay" at the end
		elsif ( word[0]== 'q' && word[1] == 'u')

			word =  word[2..word.length] + word[0..1] + 'ay'

		else
		#If none of the conditions above were true, the word must then start with a consosant 
		#(excluding "y") and the consonant is moved to end of the word + "ay" is added to the end of the word. 
		#If the word starts with a clusters of consosants, these are all moved to the end of the consosant. 
		#Ex, school becomes "oolschay"

		 	word = word + word.slice!(0...(word.index(/[aeiouy]/,1)))+ "ay" 
		end
		
		#returns word unchanged
		word
	end
end



