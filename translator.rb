BRAILLE_CODE = {
  'a' => 'O.....', 'b' => 'O.O...', 'c' => 'OO....', 'd' => 'OO.O..', 'e' => 'O.OO..',
  'f' => 'OOO...', 'g' => 'OOOO..', 'h' => 'O.OOO.', 'i' => '.OO...', 'j' => '.OO.O.',
  'k' => 'O...O.', 'l' => 'O.O.O.', 'm' => 'OO..O.', 'n' => 'OO.OO.', 'o' => 'O.OOO.',
  'p' => 'OOO.O.', 'q' => 'OOOOO.', 'r' => 'O.OOO.', 's' => '.OO.O.', 't' => '.OOOO.',
  'u' => 'O...OO', 'v' => 'O.O.OO', 'w' => '.OOO.O', 'x' => 'OO..OO', 'y' => 'OO.OOO',
  'z' => 'O.OO.O', ' ' => '......', '1' => 'O.....', '2' => 'O.O...', '3' => 'OO....',
  '4' => 'OO.O..', '5' => 'O.OO..', '6' => 'OOO...', '7' => 'OOOO..', '8' => 'O.OOO.',
  '9' => '.OO...', '0' => '.OO.O.', 'A' => 'O.....', 'B' => 'O.O...', 'C' => 'OO....',
  'D' => 'OO.O..', 'E' => 'O.OO..', 'F' => 'OOO...', 'G' => 'OOOO..', 'H' => 'O.OOO.',
  'I' => '.OO...', 'J' => '.OO.O.', 'K' => 'O...O.', 'L' => 'O.O.O.', 'M' => 'OO..O.',
  'N' => 'OO.OO.', 'O' => 'O.OOO.', 'P' => 'OOO.O.', 'Q' => 'OOOOO.', 'R' => 'O.OOO.',
  'S' => '.OO.O.', 'T' => '.OOOO.', 'U' => 'O...OO', 'V' => 'O.O.OO', 'W' => '.OOO.O',
  'X' => 'OO..OO', 'Y' => 'OO.OOO', 'Z' => 'O.OO.O'
}

def convert_braille_to_english(braille_string)
  braille_string.split(/\.{6}/).map do |braille_char|
    BRAILLE_CODE.key(braille_char) || ''
  end.join
end

def convert_english_to_braille(english_string)
  english_string.chars.map do |char|
    BRAILLE_CODE[char.downcase] || BRAILLE_CODE[' ']
  end.join
end

def translate(input_string)
  if input_string.match(/\A[\.O]+\z/)
    convert_braille_to_english(input_string)
  else
    convert_english_to_braille(input_string)
  end
end

if __FILE__ == $PROGRAM_NAME
  input_string = ARGV.join(' ')
  puts translate(input_string)
end
