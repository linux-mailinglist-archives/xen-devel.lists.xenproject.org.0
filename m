Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC8225CEA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 12:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTNV-0003oD-Gf; Mon, 20 Jul 2020 10:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tyb8=A7=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1jxTNT-0003o5-LD
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 10:50:35 +0000
X-Inumbo-ID: d63a88de-ca76-11ea-9f82-12813bfff9fa
Received: from gproxy2-pub.mail.unifiedlayer.com (unknown [69.89.18.3])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d63a88de-ca76-11ea-9f82-12813bfff9fa;
 Mon, 20 Jul 2020 10:50:34 +0000 (UTC)
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
 by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 3DEC01E0848
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 04:50:33 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id xTNQjcTqLpSV4xTNQj76Bh; Mon, 20 Jul 2020 04:50:33 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Ssa+FsG0 c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=yS0qNmEK8ed8yKyeR8R6rg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=DAwyPP_o2Byb1YXLmDAA:9
 a=cWRNjhkoAAAA:8 a=xRxrqt2KI6ooqX2xGaIA:9 a=4xei6IQbW6wRUEe6:21
 a=lo7-v151uZgEp9cj:21 a=CjuIK1q_8ugA:10:nop_charset_2
 a=UVKsufMBYgcA:10:demote_hacked_domain_1 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=oQ2D5r49MdXFBdUUMlEA:9 a=5RenllTrngEA09df:21 a=3nghbXPSgYU-dfqI:21
 a=gKO2Hq4RSVkA:10:nop_mshtml a=UiCQ7L4-1S4A:10:nop_mshtml_css_classes
 a=hTZeC7Yk6K0A:10:nop_msword_html a=frz4AuCg-hUA:10:nop_css_in_html
 a=sVa6W5Aao32NNC1mekxh:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4rQgmxbsGmqYbg6X7jut/vJRkZNUyR2y9GZ0TIL/6SI=; b=WDeghiXjHbOSSCObZhb7lW39eV
 xtgI5cKmEdvFCt7j7SQqfbIHf5u0ITE34ZDNMsWUu+2Iqsq8fJhcifuSZF+IBIdTHsM7BvwiDi369
 OdlobKwnPWzr9ECo6hfTMqB9CTfjHCsG8KIaLmYTzwyl1dGI3B4ZW/VU/rib+kum+AOQjcto2NjnP
 yelRiDI4VwfucMzxC/7iH2vu/XkcoZFEOOzVEy1QSMK1pL0rHM142eTZDIgcgHqVX5zFVdDqi+xMD
 hneqMRFeJhBZLZ7nc+83KRHr/b1iwFRXV+g2s6mePiZhlDf5CYoR0bEeUphrSrsbFD94qlgeGu7v8
 HjBi6IPg==;
Received: from 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 ([162.231.240.210]:49170 helo=SRINIASUSLAPTOP)
 by md-71.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <srini@yujala.com>) id 1jxTNQ-001Mh6-6b
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 10:50:32 +0000
From: "Srinivas Bangalore" <srini@yujala.com>
To: <xen-devel@lists.xenproject.org>
Subject: Porting Xen to Jetson Nano 
Date: Mon, 20 Jul 2020 03:50:30 -0700
Message-ID: <004f01d65e83$967c65f0$c37531d0$@yujala.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0050_01D65E48.EA235A50"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdZeg0x1DrNeeg9GRtKkTne7zCxl1g==
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-71.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yujala.com
X-BWhitelist: no
X-Source-IP: 162.231.240.210
X-Source-L: No
X-Exim-ID: 1jxTNQ-001Mh6-6b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 (SRINIASUSLAPTOP) [162.231.240.210]:49170
X-Source-Auth: srini@yujala.com
X-Email-Count: 1
X-Source-Cap: c3JpbmlxbGw7c3JpbmlxbGw7bWQtNzEud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multipart message in MIME format.

------=_NextPart_000_0050_01D65E48.EA235A50
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I am trying to get Xen working on a Jetson Nano board (which is based on
NVIDIA's Tegra210 SoC). After some searching through the Xen-devel archives,
I learnt that there was a set of patches developed in 2017 to port Xen to
Tegra
(https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg00991.html)
. However these patches don't appear in the main source repository.
Therefore, I applied these manually to Xen-4.8.5. With these changes, Xen
now boots up successfully on the Jetson Nano, but there is no Dom0 output on
the console. I can switch between Xen and Dom0 with CTRL-a-a-a.

 

I am using Linux kernel version 5.7 for Dom0. I also tried using the native
Linux kernel that comes with the Nano board, but that doesn't help.

 

Here's the console screen capture:

 

## Flattened Device Tree blob at e3000000

   Booting using the fdt blob at 0xe3000000

   reserving fdt memory region: addr=80000000 size=20000

   reserving fdt memory region: addr=e3000000 size=35000

   Loading Device Tree to 00000000fc7f8000, end 00000000fc82ffff ... OK

 

Starting kernel ...

 

- UART enabled -

- CPU 00000000 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Zero BSS -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Checking for initrd in /chosen

(XEN) linux,initrd limits invalid: 0000000084100000 >= 0000000084100000

(XEN) RAM: 0000000080000000 - 00000000fedfffff

(XEN) RAM: 0000000100000000 - 000000017f1fffff

(XEN)

(XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree

(XEN) MODULE[1]: 00000000e1000000 - 00000000e2cbe200 Kernel
console=hvc0 earlyprintk=uart8250-32bit,0x70006000 rootfstype=ext4 rw
rootwait root=/dev/mmcblk0p1

(XEN)  RESVD[0]: 0000000080000000 - 0000000080020000

(XEN)  RESVD[1]: 00000000e3000000 - 00000000e3035000

(XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000

(XEN)

(XEN) Command line: console=dtuart earlyprintk=xen earlycon=xenboot
dom0_mem=512M loglevel=all

(XEN) Placing Xen at 0x00000000fec00000-0x00000000fee00000

(XEN) Update BOOTMOD_XEN from 0000000080080000-0000000080188e01 =>
00000000fec00000-00000000fed08e01

(XEN) Domain heap initialised

(XEN) Taking dtuart configuration from /chosen/stdout-path

(XEN) Looking for dtuart at "/serial@70 Xen 4.8.5

(XEN) Xen version 4.8.5 (srinivas@) (aarch64-linux-gnu-gcc (Ubuntu/Linaro
7.5.0-3ubuntu1~18.04) 7.5.0) debug=n  Sun Jul 19 07:44:00 PDT 2020

(XEN) Latest ChangeSet:

(XEN) Processor: 411fd071: "ARM Limited", variant: 0x1, part 0xd07, rev 0x1

(XEN) 64-bit Execution:

(XEN)   Processor Features: 0000000000002222 0000000000000000

(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32

(XEN)     Extensions: FloatingPoint AdvancedSIMD

(XEN)   Debug Features: 0000000010305106 0000000000000000

(XEN)   Auxiliary Features: 0000000000000000 0000000000000000

(XEN)   Memory Model Features: 0000000000001124 0000000000000000

(XEN)   ISA Features:  0000000000011120 0000000000000000

(XEN) 32-bit Execution:

(XEN)   Processor Features: 00000131:00011011

(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle

(XEN)     Extensions: GenericTimer Security

(XEN)   Debug Features: 03010066

(XEN)   Auxiliary Features: 00000000

(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211

(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121

(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 19200 KHz

(XEN) GICv2 initialization:

(XEN)         gic_dist_addr=0000000050041000

(XEN)         gic_cpu_addr=0000000050042000

(XEN)         gic_hyp_addr=0000000050044000

(XEN)         gic_vcpu_addr=0000000050046000

(XEN)         gic_maintenance_irq=25

(XEN) GICv2: 224 lines, 4 cpus, secure (IID 0200143b).

(XEN) Using scheduler: SMP Credit Scheduler (credit)

(XEN) Allocated console ring of 16 KiB.

(XEN) Bringing up CPU1

- CPU 00000001 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Bringing up CPU2

- CPU 00000002 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Bringing up CPU3

- CPU 00000003 booting -

- Current EL 00000008 -

- Xen starting at EL2 -

- Setting up control registers -

- Turning on paging -

- Ready -

(XEN) Brought up 4 CPUs

(XEN) P2M: 44-bit IPA with 44-bit PA

(XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594

(XEN) I/O virtualisation disabled

(XEN) *** LOADING DOMAIN 0 ***

(XEN) Loading kernel from boot module @ 00000000e1000000

(XEN) Allocating 1:1 mappings totalling 512MB for dom0:

(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)

(XEN) Grant table range: 0x000000fec00000-0x000000fec60000

(XEN) Loading zImage from 00000000e1000000 to
00000000a0080000-00000000a1d3e200

(XEN) Allocating PPI 16 for event channel interrupt

(XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a8034354

(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs

(XEN) ........done.

(XEN) Initial low memory virq threshold set at 0x4000 pages.

(XEN) Std. Loglevel: Errors and warnings

(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)

(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to
Xen)

(XEN) Freed 300kB init memory.

 

Any suggestions/pointers to move forward would be much appreciated.

 

Thanks,

Srini


------=_NextPart_000_0050_01D65E48.EA235A50
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am trying =
to get Xen working on a Jetson Nano board (which is based on =
NVIDIA&#8217;s Tegra210 SoC). After some searching through the Xen-devel =
archives, I learnt that there was a set of patches developed in 2017 to =
port Xen to Tegra (<a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg0=
0991.html">https://lists.xenproject.org/archives/html/xen-devel/2017-04/m=
sg00991.html</a>). However these patches don&#8217;t appear in the main =
source repository. Therefore, I applied these manually to Xen-4.8.5. =
With these changes, Xen now boots up successfully on the Jetson Nano, =
but there is no Dom0 output on the console. I can switch between Xen and =
Dom0 with CTRL-a-a-a.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am using =
Linux kernel version 5.7 for Dom0. I also tried using the native Linux =
kernel that comes with the Nano board, but that doesn&#8217;t =
help.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Here&#8217;s the console screen =
capture:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> ## Flattened Device Tree blob at =
e3000000<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; Booting using =
the fdt blob at 0xe3000000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; reserving fdt memory region: =
addr=3D80000000 size=3D20000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; reserving fdt memory region: =
addr=3De3000000 size=3D35000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; Loading Device Tree to 00000000fc7f8000, =
end 00000000fc82ffff ... OK<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Starting =
kernel ...<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>- UART enabled -<o:p></o:p></p><p class=3DMsoNormal>- =
CPU 00000000 booting -<o:p></o:p></p><p class=3DMsoNormal>- Current EL =
00000008 -<o:p></o:p></p><p class=3DMsoNormal>- Xen starting at EL2 =
-<o:p></o:p></p><p class=3DMsoNormal>- Zero BSS -<o:p></o:p></p><p =
class=3DMsoNormal>- Setting up control registers -<o:p></o:p></p><p =
class=3DMsoNormal>- Turning on paging -<o:p></o:p></p><p =
class=3DMsoNormal>- Ready -<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Checking for initrd in /chosen<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
linux,initrd limits invalid: 0000000084100000 &gt;=3D =
0000000084100000<o:p></o:p></p><p class=3DMsoNormal>(XEN) RAM: =
0000000080000000 - 00000000fedfffff<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) RAM: 0000000100000000 - =
000000017f1fffff<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device =
Tree<o:p></o:p></p><p class=3DMsoNormal>(XEN) MODULE[1]: =
00000000e1000000 - 00000000e2cbe200 =
Kernel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console=3Dhvc0 =
earlyprintk=3Duart8250-32bit,0x70006000 rootfstype=3Dext4 rw rootwait =
root=3D/dev/mmcblk0p1<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
RESVD[0]: 0000000080000000 - 0000000080020000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; RESVD[1]: 00000000e3000000 - =
00000000e3035000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp; =
RESVD[2]: 00000000fc7f8000 - 00000000fc82d000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Command =
line: console=3Ddtuart earlyprintk=3Dxen earlycon=3Dxenboot =
dom0_mem=3D512M loglevel=3Dall<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Placing Xen at 0x00000000fec00000-0x00000000fee00000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Update BOOTMOD_XEN from =
0000000080080000-0000000080188e01 =3D&gt; =
00000000fec00000-00000000fed08e01<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Domain heap initialised<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Taking dtuart configuration from =
/chosen/stdout-path<o:p></o:p></p><p class=3DMsoNormal>(XEN) Looking for =
dtuart at &quot;/serial@70 Xen 4.8.5<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Xen version 4.8.5 (srinivas@) =
(aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0) =
debug=3Dn&nbsp; Sun Jul 19 07:44:00 PDT 2020<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Latest ChangeSet:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Processor: 411fd071: &quot;ARM Limited&quot;, =
variant: 0x1, part 0xd07, rev 0x1<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) 64-bit Execution:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Processor Features: 0000000000002222 =
0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Exception Levels: =
EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Extensions: =
FloatingPoint AdvancedSIMD<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Debug Features: 0000000010305106 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; =
Auxiliary Features: 0000000000000000 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Memory Model Features: =
0000000000001124 0000000000000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; ISA Features:&nbsp; 0000000000011120 =
0000000000000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) 32-bit =
Execution:<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; =
Processor Features: 00000131:00011011<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Instruction Sets: =
AArch32 A32 Thumb Thumb-2 Jazelle<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Extensions: GenericTimer =
Security<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; Debug =
Features: 03010066<o:p></o:p></p><p class=3DMsoNormal>(XEN)&nbsp;&nbsp; =
Auxiliary Features: 00000000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp; Memory Model Features: 10101105 =
40000000 01260000 02102211<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp; ISA Features: 02101110 13112111 21232042 =
01112131 00011142 00011121<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 19200 =
KHz<o:p></o:p></p><p class=3DMsoNormal>(XEN) GICv2 =
initialization:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_dist_addr=3D0000000050041000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_cpu_addr=3D0000000050042000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_hyp_addr=3D0000000050044000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_vcpu_addr=3D0000000050046000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gic_maintenance_irq=3D25<o:p></o:p></p><p class=3DMsoNormal>(XEN) GICv2: =
224 lines, 4 cpus, secure (IID 0200143b).<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Using scheduler: SMP Credit Scheduler =
(credit)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Allocated console ring =
of 16 KiB.<o:p></o:p></p><p class=3DMsoNormal>(XEN) Bringing up =
CPU1<o:p></o:p></p><p class=3DMsoNormal>- CPU 00000001 booting =
-<o:p></o:p></p><p class=3DMsoNormal>- Current EL 00000008 =
-<o:p></o:p></p><p class=3DMsoNormal>- Xen starting at EL2 =
-<o:p></o:p></p><p class=3DMsoNormal>- Setting up control registers =
-<o:p></o:p></p><p class=3DMsoNormal>- Turning on paging =
-<o:p></o:p></p><p class=3DMsoNormal>- Ready -<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Bringing up CPU2<o:p></o:p></p><p =
class=3DMsoNormal>- CPU 00000002 booting -<o:p></o:p></p><p =
class=3DMsoNormal>- Current EL 00000008 -<o:p></o:p></p><p =
class=3DMsoNormal>- Xen starting at EL2 -<o:p></o:p></p><p =
class=3DMsoNormal>- Setting up control registers -<o:p></o:p></p><p =
class=3DMsoNormal>- Turning on paging -<o:p></o:p></p><p =
class=3DMsoNormal>- Ready -<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Bringing up CPU3<o:p></o:p></p><p class=3DMsoNormal>- CPU 00000003 =
booting -<o:p></o:p></p><p class=3DMsoNormal>- Current EL 00000008 =
-<o:p></o:p></p><p class=3DMsoNormal>- Xen starting at EL2 =
-<o:p></o:p></p><p class=3DMsoNormal>- Setting up control registers =
-<o:p></o:p></p><p class=3DMsoNormal>- Turning on paging =
-<o:p></o:p></p><p class=3DMsoNormal>- Ready -<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Brought up 4 CPUs<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) P2M: 44-bit IPA with 44-bit PA<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) P2M: 4 levels with order-0 root, VTCR =
0x80043594<o:p></o:p></p><p class=3DMsoNormal>(XEN) I/O virtualisation =
disabled<o:p></o:p></p><p class=3DMsoNormal>(XEN) *** LOADING DOMAIN 0 =
***<o:p></o:p></p><p class=3DMsoNormal>(XEN) Loading kernel from boot =
module @ 00000000e1000000<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Allocating 1:1 mappings totalling 512MB for dom0:<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 =
(512MB)<o:p></o:p></p><p class=3DMsoNormal>(XEN) Grant table range: =
0x000000fec00000-0x000000fec60000<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Loading zImage from 00000000e1000000 to =
00000000a0080000-00000000a1d3e200<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Allocating PPI 16 for event channel =
interrupt<o:p></o:p></p><p class=3DMsoNormal>(XEN) Loading dom0 DTB to =
0x00000000a8000000-0x00000000a8034354<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Scrubbing Free RAM on 1 nodes using 4 =
CPUs<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
........done.<o:p></o:p></p><p class=3DMsoNormal>(XEN) Initial low =
memory virq threshold set at 0x4000 pages.<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) Std. Loglevel: Errors and =
warnings<o:p></o:p></p><p class=3DMsoNormal>(XEN) Guest Loglevel: =
Nothing (Rate-limited: Errors and warnings)<o:p></o:p></p><p =
class=3DMsoNormal>(XEN) *** Serial input -&gt; DOM0 (type 'CTRL-a' three =
times to switch input to Xen)<o:p></o:p></p><p class=3DMsoNormal>(XEN) =
Freed 300kB init memory.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Any =
suggestions/pointers to move forward would be much =
appreciated.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Srini<o:p></o:p></p></div></body></html>
------=_NextPart_000_0050_01D65E48.EA235A50--


