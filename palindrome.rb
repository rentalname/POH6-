class Palindrome
  def initialize
    @words = []
  end

  def <<(word)
    @words << word
  end

  def build
    s, m = filter(@words)

    l = s.sort
    r = l.reverse.map(&:reverse)

    (l + m + r).join("")
  end

  def info
    p(
      words: @words
    )
    p filter(@words)
  end

  private
  def filter(l)
    _r = {s: [], m: []}
    _l = l.dup
    while t = _l.pop
      if t == t.reverse
        _r[:m] << t
      elsif idx = _l.find_index(t.reverse)
        _l.delete_at(idx)
        _r[:s] << (t < t.reverse ? t : t.reverse)
      end
    end
    _r.values
  end
end

pa = Palindrome.new

$stdin = DATA
gets
ARGF.each do |word|
  pa << word.strip
end

pa.info
puts pa.build
puts pa.build == "bobohujxnrnwoownrnxjuhobob"

__END__
11
sk
nw
jx
ob
ob
ob
bo
bo
oo
xj
uh
rn
wn
hu
nr
