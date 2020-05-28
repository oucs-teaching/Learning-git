from os import popen

##############

# list all the hashcodes found in the objects directory

filelist = popen('find -s .git/objects').readlines()

hashes = []

for filename in filelist:
   # ignore '.git/objects/' at the start and newline at the end
   hash = filename[13:-1]
   # want contents of directories, not directories themselves
   if hash.find('/') != -1:
      # recombine first two characters with rest of hash
      hash = hash.replace('/', '')
      hashes += [hash]

##############

# use 'cat-file -t' to check which hashes are for commit objects

commithashes = []

for hash in hashes:
   type = popen('git cat-file -t ' + hash).read()[:-1] # ignore newline
   if type == 'commit':
      commithashes += [hash]

# list now includes all commits (including unreachable ones)

##############

commitdata = []

for commit in commithashes:
   details = popen('git cat-file -p ' + commit).readlines()
   parents = []
   for line in details:
      if line.startswith('parent '):
         parents += [line[7:-1]]
   commitdata += [(commit, parents)]

for data in commitdata:
   print data[0], data[1]
