# judol
dns &amp; ip of scrapping from judi online abuse in top 100 rank google search querries.

# usage scenario
1. in domain and wildcard list can use with [dnscrypt-proxy](https://github.com/DNSCrypt/dnscrypt-proxy) or similar proxy dns. 
   dst-nat your router dns on port 53/udp or with 853/tcp to your internal proxy server. in wilcard domain using some 'prefix' keyword for fast   blocking, just make sure your proxy syntax support the list.
2. dnscrypt-proxy also can be use in ips blacklist or with another firewall chains for outbound connection ex, [fort-firewall](https://github.com/tnodir/fort) opensource firewall for windows. or use [csf firewall](https://configserver.com/configserver-security-and-firewall/) in production environment. since many domain sit behind reverse proxy ips blocker may produce some false positive so you can make your own whitelist.
3. recommeded using list together with vpn, proxy and doh server list from [hagezi repo](https://github.com/hagezi/dns-blocklists) preventing the escape query.
