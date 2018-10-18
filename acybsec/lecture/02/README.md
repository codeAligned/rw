Lecture 2

201809013

_ must get textbook to pass class

## Confidentiality

encryption

## Integrity

hasing MD5 SHA1

## Availability

data and servives are available when needed - remove single point of failure (SPOF)

techniques:

- RAID
- server redundancy (clusters)
- load balancing
- site redundancies (warm site, boxed up servers there 8-12 hrs mttr), (cold site: just a place - 1-3 weeks mttr)
- backups
- alternate power (ups, backukp generator)
- cloud services: google drive, dropbox 

## hash value for download (supports integrity)

hash is digital fingerprint

example test.txt with content testing

use hashcalc from slavasoft  to create hash codes fo file

## non-repudiation

prevents entities from denying that they took an action

part of public/private key encryption

digitial signaures

## access control

Balancing CIA

- can never have perfect security
- increasing one item lowers others

## Patching (basic and important principle)

- software requires frequent updates
- patch management
    + testing patches to make sure they are not harmful
    + deploying them to all devices

example:

Home Depot POS system success hacked

installation engineers forgot to check box to check updates

update, update, update your systems

Safety

- safety of people # 1 concern
    + escape plans and routs for fire, earthquake
    + drills and training
- safety of assets
    + physical security controls
    + ...

Defense in Depth
    - layers of protection
    - example: cascaded firewalls
        different vendors
            * maybe not practical
            * palo alto router hacked but maybe cisco not
    - antivirus

NAT - Network Address Translation

- change an IP address while it is in transit across a router

use NAT to pick a class B addr instead of default class B
i.e. map 192.168.x.x to 172.16.x.x ?

Network zonss, interconnectiona an NAC (network access control)
    - lan v wan
    - dmz
    - intranet and extranet
    - NAC, i.e. plug in foreign computer - will not connect

Subnets with different polices each

VLAN - each port on a router, or groups of ports could be a seperat VLAN
- cant talk to each other
VLAN hopping

understand following terms

- saas
- iaas

Cloud security: someone is monitoring and managing data center

- ensure contracts - if you dissolve a contract with a provider - do you get your data back?
- SLAs or ELUAs typically give the data to providers

Server defences
- hardening
- os updates

Firewalls
- perosna

Packet filtering
MAC filtering - use it to protect your firewall

IDS: intrusion detection system

- device or software that monitores an individual computers sytem or network, portion and analyze data being passed through
- identify if any anomolies happen in a network
- host based
- network base
- statistical anomoly
- signature-based

- must establish a baseline
- then system will look to see anything outside baseline

load balancer

proxy servers

VPN/VPN concentrators (like a router/switch on internet, builds maintains built tunnels)

VPN can be used to counter security controls
VPN creates a tunnle that is encrupted

want firewalls and VPN for your system
- don't ever do anything financial on any free network

packet filters

spam

honeypot / honeynets

attract and trap potential attackers to counteract any attempts at unaurthroized access of the network

example: key with car

What is the meaning of the work Hack?

Encryption example - protect confidentiality

www.simonsingh.net ceasar cipher - symmetric encryption

plaintext + key -> cipher text

ex: passwords MD5 hash or SHA1 hash

rainbow tables can crack a hash

20, 30, 40 G files with nothing but hashes
brute force all the hashes

let me check your password for security
- they are creating a hash of your password and adding it to a rainbow 

How many total ports are available within the Internet/Network?

remember port #'s TCP, UDP - 65535 TCP poets and UDP ports

TCP has 3 way handshake - connection based protocol
w/ IP has sequence numbers and transmission capability
UDP - basket of conversation

well know poert 0 1013
reg 1024 49151

# typical ports
21 ftp
22 ssh
25 smpt
53 dns
80 http
110 pop3
139 netbios
143 imap
443 https
3389 rdp

OSI model

Application
Presentation
Session
Transport
Network
Data Link
Physical

TCP
application
tcp/udp
data link
physical

## Hacked Informationo

hackers like to brog

https://pastebin.com/ub7AEpew

Firewall

ACL access control list - define rules to allow access

never use ANY, ANY - undid all your previous rules

NDP - neighbor discovery protocol

TCP susceptible to man-in-the-middle attack

denial of service attack
unacknowledge tcp packets

ping of death attack:

ping -t -l 65510
-t manually stop it
-l size of the packet

IP v4 and v6

ARP can be used for man in middle attack - arp poisioning

tools for windows
cain abel http://www.oxid.it/cain.html
nighthawk https://code.google.com/p/nighthawk/downloads/list

linux

know IP address classes

trunkint

NAT

remote access protocoal

http://ipaddress.com/ - will tell you ip associated with a company


DNS records used for reverse DNS lookups


a
AAAA

ssh - port 22
ssl - tcp port 443, can also use LSAP and LDAPS
ssl is old had has security weaknesses

Want TLS 1.3 (or 1.2)
demo self signed certs

self signed cert devleoped by site proviter - not very secutelnet

telnet is in clear text
telnet tells all

IDS typically blocks telnet

SNMPv1 v2 sent "community strings" passwords in clear next

NetBIOS

LDAP - credential validation
kerberos (another word for ldap)

RDP - remote desktop protcol
