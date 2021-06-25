def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash.keys.select { |k| hash[k] == 1 }
end

def no_consecutive_repeats?(arr)
    (0...(arr.length - 1)).each { |i| return false if arr[i] == arr[i + 1] }
    true
end

def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |ch, idx| hash[ch] << idx }
    hash
end

def longest_streak(str)
    ch, ct, max = str[0], 1, 1
    (1...str.length).each do |i|
        if str[i] == str[i - 1]
            ct += 1
        else
            ct = 1
        end
        if ct >= max
            max = ct
            ch = str[i]
        end
    end
    return ch * max
end

def bi_prime?(num)
    div, ct = 2, 0
    while(num >= div)
        if num % div == 0
            ct += 1
            return false if ct == 3
            num /= div
        else
            div += 1
        end
    end
    ct == 2
end

def vigenere_cipher(str, keys)
    (0...str.length).each { |i| str[i] = ("a".ord + (str[i].ord - "a".ord + keys[i % keys.length]) % 26).chr }
    str
end

def vowel_rotate(str)
    arr = str.chars.select { |ch| "aeiou".include?(ch) }
    arr.rotate!(-1)
    i = 0
    (0...str.length).each do |j|
        next if !"aeiou".include?(str[j])
        str[j] = arr[i]
        i += 1
    end
    str
end

class String
    def select(&b)
        b ||= Proc.new { false }
        arr = self.split("").map do |ch|
            if b.call(ch)
                ch
            else
                ""
            end
        end
        arr.join
    end

    def map(&b)
        arr = self.chars.with_index { |ch, idx| arr[idx] = b.call(ch, idx) }
        arr.join
    end
end

def multiply(a, b)
    return multiply(-a, -b) if a < 0 && b < 0
    return multiply(b, a) if b < 0
    return 0 if b == 0
    a + multiply(a, b - 1)
end

def lucas_sequence(len)
    return [] if len == 0
    return [2] if len == 1
    return [2, 1] if len == 2
    arr = lucas_sequence(len - 1)
    arr << arr[-1] + arr[-2]
end

def prime_factorization(num)
    return [] if num == 1
    div = 2
    while num % div != 0
        div += 1
    end
    [div] + prime_factorization(num / div)
end

