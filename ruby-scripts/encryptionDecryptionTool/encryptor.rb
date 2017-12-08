class Encryptor
	def cipher(rotation) #this is our reference for encryption

		characters = (' '..'z').to_a
		rotatedCharacters = characters.rotate(rotation)
		pair = characters.zip(rotatedCharacters)
		Hash[pair]

	end

	def encrypt_letter(letter, rotation)

		cipher(rotation)[letter]

	end

	def decrypt_letter(letter, rotation)

		cipher_rotated = cipher(rotation)
		inverted_cipher = cipher_rotated.invert
		decrypted_cipher = inverted_cipher[letter]
	end

	def encrypt(string, rotation)

		letters = string.split("")
		result = letters.map{ |letter| encrypted_letters = encrypt_letter(letter, rotation)	}

		result.join

	end

	def decrypt(string, rotation)
		letters = string.split("")
		result = letters.map{|letter| decrypted_letters = decrypt_letter(letter, rotation)}

		result.join
	end

	def encrypt_file(filename, rotation)
		the_file = File.open(filename, "r")
		passage = the_file.read
		encrypted_passage = encrypt(passage, rotation)
		the_file.close
		output = File.open("encryptedFile.txt", "w")
		output.write(encrypted_passage)
		output.close
	end

	def decrypt_file(filename, rotation)
		input = File.open(filename, "r")
		passage = input.read
		decrypted_passage = decrypt(passage, rotation)
		input.close
		output = File.open("decryptedFile.txt", "w")
		output.write(decrypted_passage)
		output.close
	end

	def crack(message)
		(' '..'z').to_a.count.times.map do |attempt|
			decrypt(message, attempt)
			
		end


	end

end

















