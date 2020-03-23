Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B3618FBAA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 18:39:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGR0P-0006ae-Be; Mon, 23 Mar 2020 17:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ILhC=5I=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1jGR0O-0006aT-E2
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 17:36:52 +0000
X-Inumbo-ID: e0ac6c9e-6d2c-11ea-830a-12813bfff9fa
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0ac6c9e-6d2c-11ea-830a-12813bfff9fa;
 Mon, 23 Mar 2020 17:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1584985009; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NqP9hGyfyQFvXxeutbhVZfrNorZN9wVW9PuzowSRubcLk+ZA9AQkw6xywT4/Y/gVBrpk7MECg5Vo7MUbsa1VWh55g5G4q8geJO7XTZnLm2YQxw2mXE3Dmy8PveTx0P+LrkQx2xXVCNSaop3HxgyvDfgakQ9boam+mYJtVEYqo64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; 
 t=1584985009; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=D07aIrUpUhoHFQzcJgeP6HisL4IoBMJROhjdZ0dD0wE=; 
 b=Zkr5/DTkPPEBvf6Y9+QoWJjlyT9mJK9ydcEBDom/yCNQt//vuGlNaMrj5z5T+SpBEtrC2DWMdR4EFsYZCN3yBAlAAuni91dWvyQLs8wAVeDsy32b0F7n0uHWDD74SQVUEu6Rosn7eUUvjeeR0u38QCVFwp7DY7Pn6UP7uDWgqmU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=qubes-os.org;
 spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
 dmarc=pass header.from=<frederic.pierret@qubes-os.org>
 header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584985009; 
 s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
 h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type;
 bh=D07aIrUpUhoHFQzcJgeP6HisL4IoBMJROhjdZ0dD0wE=;
 b=FvcKC+L0cjYrKdhFfuEx0BhwwmZ/BDL50Yd+d7pri4TDrBThQ14YwCdDSbTFx6G2
 qMuh22P+APge/ih2opZHv2xOmcS12VG7pgJUIW7ArTcJdP6ogAEzy+g8jqklaTinOzU
 TIS7VkiwSRteBBp1hfun+cXCaHkSvBYU1kqyo94I=
Received: from [10.137.0.45] (82.102.18.6 [82.102.18.6]) by mx.zohomail.com
 with SMTPS id 1584985007201544.8504890969405;
 Mon, 23 Mar 2020 10:36:47 -0700 (PDT)
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e883d548-fed2-f94a-9365-ca157e5dd442@qubes-os.org>
Date: Mon, 23 Mar 2020 18:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JpMzt3rk9C1KDHQIttRjC5cl16ZsJucaj"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Subject: [Xen-devel] Network performance issues on Qubes OS Server prototype
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JpMzt3rk9C1KDHQIttRjC5cl16ZsJucaj
Content-Type: multipart/mixed; boundary="dZnz1rjACAcboGcKXBEQuIqB3TjPWOTcX"

--dZnz1rjACAcboGcKXBEQuIqB3TjPWOTcX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm currently working on a Qubes OS server version (example architecture =
can been seen at https://raw.githubusercontent.com/fepitre/qubes-mgmt-sal=
t-qubes-server/devel-140320-extra/qubes-server.png). I'm using this confi=
guration since several months on Qubes R4.0 (xen-4.8) and recently on Qub=
es R4.1 (xen-4.13). I'm writing to you because since the beginning I'm ha=
ving network performance issues that I never succeeded to solve.

This setup is done on a HP Gen8 DL360p with 2*CPUs, 160GB memory, 1TB RAI=
D6 SAS.

On the picture I linked you, all the colored rectangles {zone}-* for zone=
 in (wan, dmz, lan, admin) are PVH VMs (Debian 10). There exist a VM not =
drawn in the picture, called 'sys-net-interfaces' which holds four 1Gbits=
 Ethernet controllers of the server using PCI passthrough. It is a HVM wi=
th Linux-based stubdomain.

All the inner links between VMs are NAT interfaces. All the outer links o=
n *-sys-net VMs are BRIDGE interfaces with backend 'sys-net-interfaces'. =
In VM 'sys-net-interfaces' a LACP bond0 is done with two Ethernet control=
lers, which is a trunk, then several vlan interfaces are generated with p=
arent device this bond, and finally, bridges are created and associated t=
o those vlans.

Here are my issues. Consider one computer named 'PC-LAN' in LAN network a=
nd another 'PC-DMZ' in DMZ network. The considered network path is the fo=
llowing:

	PC-LAN (1) <-- B --> lan-sys-net (2) <-- N --> lan-sys-firewall (3) <-- =
N --> dmz-sys-firewall (4) <-- N --> dmz-sys-net (5) <-- B --> PC-DMZ (6)=


where B denotes bridge interface, N denotes NAT interface and numbers for=
 numbering machines. Up to 'wget', 'scp' (limited normally by ciphers), e=
tc., I ran multiple iperf3 tests over 20 seconds for having a clearer vie=
w of network issues.

Example 1: Full path

	From (1) to (6): 165 Mbits/s
	From (2) to (6): 196 Mbits/s
	From (3) to (6): 205 Mbits/s
	From (4) to (6): 203 Mbits/s
	From (5) to (6): 714 Mbits/s


Example 2: 'dmz-sys-net' as end node

	From (1) to (5): 194 Mbits/s
	From (2) to (5): 189 Mbits/s
	From (3) to (5): 258 Mbits/s
	From (4) to (5): 500 Mbits/s

Example 3: 'lan-sys-net' as end node

	From (1) to (2): 830 Mbits/s


I've another HP Gen8 with almost the same physical configuration and netw=
ork configuration (LACP+vlan+bridges) running under Debian 10 as bare met=
al KVM, and I obtain 1Gbits/s network workflows over bridges. The almost =
physical configuration is due to the related mail I sent you in july 2019=
 '[Xen-devel] Ethernet PCI passthrough problem'. The provided Ethernet ca=
rd with 4 ports (HP Ethernet 1Gb 4-port 331FLR Adapter) makes the driver =
tg3 crashing when attaching those into a VM. So the Debian KVM has those =
HP Ethernet controllers whereas on the Qubes server, it has a cheap PCI e=
xpress 4 Ethernet Realtek 8169 card.

Of course physical connections on the switches have been changed, 'switch=
ed' between the two servers for eliminating any hardware problem.

I had a look to https://wiki.xen.org/wiki/Network_Throughput_and_Performa=
nce_Guide. Unfortunately, trying some change of options with 'ethtool' in=
 'sys-net-interfaces', changing amount of RAM/VCPUs of it and other *-sys=
-net, does not do that much.

I'm writing to you for having some clues into where I can dig and what I =
can look in order to put in evidence the bottleneck. If it's purely dom0 =
side or backend network VM side (sys-net-interfaces) or elsewhere.

I would like to thank you a lot in advance for any help on this problem.

Best regards,
Fr=C3=A9d=C3=A9ric


--dZnz1rjACAcboGcKXBEQuIqB3TjPWOTcX--

--JpMzt3rk9C1KDHQIttRjC5cl16ZsJucaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl5486wACgkQSEAQtc3F
duIZpBAAxC0+j/7TlBVBtx0OkCToEEKWHWMWYeIZcAbixm3/bBRXlLkfShrJ6ccW
iD5iY1v3wuPjVLleJVfUTZmZXZT9j3cgCXq5BFvaf7v4h24dz9GqlY0JaWjstz+I
fRyg5KTCkjEgU3raKIwKHgToVeR+FdtouKClgLPCklI7tj8pYeELFka4ZS+7Gt8A
2cEr9HuMaooqZWk3xY7fQQ+1KdyU6k4WSmEus7vk8hsrqBnBhbsZuHrEhAzeaK4K
In3McFqYR6z76BdqbxuNoptBp9ZdXjgsDezWHSXDzwAe35K67Iil6xkkXZIkRBid
TftH5OUEQvojZz1escpPwkoj2HrKXrL0Xu4pjwRJIPsodWwVKpSABdUKUAnQZaCA
bnGZFREwwxdhaybKR7THjAvHxpNxS/8eAyg9QMfXsSeJmkqR6vZ3Lj/ML155cEuE
lDzuGKdWEzyBOc5KsCToTOlqRrlEfflSjmfOc1oMg9miFQ3/8oNasPdVqElVMAcK
OUgCd0ZexAKhwFN5Q/+sB9o9KUgFS64piT0tfDXl8KBVuzHCjx0x69zS5d6c1I/Q
QpdljIi8OOBPOrbBqnIu87mRfNiEbySWlU2W1y6wD9aei4BcoFm0FBa2JMC4qAZk
ch7dQPBpTSyAJCFFk8Zko584acAhdKh6smg7NiWpp+CwsolGIhw=
=q+c9
-----END PGP SIGNATURE-----

--JpMzt3rk9C1KDHQIttRjC5cl16ZsJucaj--

