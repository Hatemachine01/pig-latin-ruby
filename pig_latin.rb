class PigLatin

	def self.translate(word)

		#down cases string for
		word = word.downcase

		vowels = ['a', 'e', 'i', 'o', 'u']
		consonants = ('a'..'z').to_a - vowels

		#checks for words starting with vowels, words starting with "xr" and words starting with "yt"
		if vowels.include?(word[0]) or ( word[0]== 'x' && word[1] == 'r') or  ( word[0]== 'y' && word[1] == 't')  
			word << 'ay'

		#checks for two letter words and the I test case
		elsif (word.length == 2 && word[1] == 'y')
			word = word[1] + word[0] + 'ay'

		#checks for words starting with QU 
		elsif ( word[0]== 'q' && word[1] == 'u')

			word =  word[2..word.length] + word[0..1] + 'ay'

		#checks for letters starting with three consonant clusters such as "thr" and "sch"
		elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
		 
		 	word = word[2..word.length] + word[0] + word[1]  + "#{word[2]}ay" 
		 	word[0]= ""

		#checks for letters starting with two consonant clusters such as "ch" and "th"
		elsif consonants.include?(word[0]) && consonants.include?(word[1])
		 	word = word[1..word.length] + word[0] + "#{word[1]}ay" 
		 	word[0]= ""

		#checks for letters starting with one consonant such as "t"

		else consonants.include?(word[0]) 
		 	word = word[1..word.length] + "#{word[0]}ay" 
		end
		 #returns word unchanged
		word
	end
end



