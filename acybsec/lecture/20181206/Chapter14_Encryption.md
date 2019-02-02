
1970's understand the basic terminology of cryptography

symmetric, DES, originally called "Lucifer"

DES was symmetric - DES was cracked within a few years

formed triple DES

fear of breaking in was the cause for creating

AES - adam ... something something

Other algorithms:

- twofish
- blowfish
- RC4
- RC2

vs.

asymmetric ciphers - public key / private key

each can be used to encrypt and decrypt

--

hashing is like a fingerprint for a file - history (in order)

MD5
SHA
...

cyptography - the practice of studying and hiding the meaning of a message

encryption - the process fo changing information using an algorithm (or cipher) into another form that is readable by others

example mailvelope uses a public/private key pair

cipher - algorithm that produces

## Symmetric Keys

DES, 3DES, RC, AES

can encrypt based on a stream or a block


## Public Key Cryptography

diffey helmen - key distribution

public key is well known - any one can use it to encrypt a message - only person with private key can decrypt

steganography is the science (and art) of writing hidden messages; it a form of security through obscurity

i.e. embed a message in a wav file, i.e. phil collins wav file

can embed stuff in wav or image file

east-tc Invisible Secrets 4

embed content into something else

example play wav file with password - to unhide a secret message

stegnography, cryptograph -> confidentiality, integrity


Bruch Schneier has a great news letter on current security trends

PGP - was public - then Symantec bought it

HASHCALC

hashes are very important in chain of custody for legal cases

cryptograpyy - stegnography - important for DOD

personally could use it to send your tax info to your accountant

can have hash collisions

know the history of all the hashing

mimikatz can crack windows credentials passed along the wire

Does the order of public/private key encryption/decryption matter?
If I encrypt with my private key then my wife's public key
must it be decrypted with my wife's private key then my public key?
Does the order matter?

## Hash

Pass the hash attack - an attacker obtains the has of one or more user accounts and reapplies the has to a server or other system to foo the system into think that the attacer is authentic

birthday attach - send two message with same has function causing a collision

key streching

salting

complexity and length of password

limi the number of times a password can be typed

1 time passwords are more secure than passwords that are re used

---

## PKI and Encryption Protocols

Public key infrastrucutre log on log

PKI manages certificates

given a token from PKI it says what you can access (or are denied access to)

key type
length of key
validity of cert
who issued it

# Certificates

When an operating system (i.e. Windows) is built they reach out to vendors to get their latest certificates at the time of build

Look into content fields of a certificate.

PKI - is it symmetric?

SSL got replace by TLS (1.2?)

Registration Authority (RA)

Certificate Revocation List (CRL)

