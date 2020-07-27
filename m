Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3122FBE7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 00:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0BJd-00081l-9I; Mon, 27 Jul 2020 22:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNOj=BG=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1k0BJb-00081d-KT
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 22:09:47 +0000
X-Inumbo-ID: e14ad000-d055-11ea-8b02-bc764e2007e4
Received: from gproxy7-pub.mail.unifiedlayer.com (unknown [70.40.196.235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e14ad000-d055-11ea-8b02-bc764e2007e4;
 Mon, 27 Jul 2020 22:09:46 +0000 (UTC)
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
 by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id 67DDA215D8C
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2020 16:09:45 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id 0BJYkbcGVpSV40BJZk586l; Mon, 27 Jul 2020 16:09:45 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=GKEm7NFK c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=yS0qNmEK8ed8yKyeR8R6rg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=8nJEP1OIZ-IA:10:nop_charset_1
 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=V_Ht6SivflJ7o7_gc2UA:9
 a=wPNLvfGTeEIA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3SgGnnpZgltvxZCcexkSDs/YgGLWO8vqovnNKlIbfL8=; b=SFQ1ltdqB3XdNshHcGUlTKj0UC
 TAZ4OVnsq9iZ62JfL+M9C+vZMcKaSTSAFO4vrTTRzuaPX2pqjZooHpP/e0IwRF/dAg1VkaDLZBASg
 7Fz+o2lZRnmZ/99+vlB71GjlUo/wi13EyWWeiyb1/dwPSIzCnPoMA1y/S6Yt6erS7ck0uywlAhMtQ
 OWbeGCHXEBoUgm0Y9MR3Gtk7htgV2fMplZM7ZEG4XYHASD8JJSyc4cIjRTmTA5IQIMapJIEEAnmZG
 QFwBV34U4texTVXgpl6q2hBEtAgeqTwRIhogxuUPeabQr3yZSYnFLJmQSY+5WNeXrkzNu5VWkW0qe
 pEPD0hww==;
Received: from 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 ([162.231.240.210]:56562 helo=SRINIASUSLAPTOP)
 by md-71.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <srini@yujala.com>)
 id 1k0BJY-001dcD-9H; Mon, 27 Jul 2020 22:09:44 +0000
From: "Srinivas Bangalore" <srini@yujala.com>
To: "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>,
 "'Christopher Clark'" <christopher.w.clark@gmail.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
 <000001d661cb$45cdaa10$d168fe30$@yujala.com>
 <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
In-Reply-To: <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
Subject: RE: Porting Xen to Jetson Nano
Date: Mon, 27 Jul 2020 15:09:42 -0700
Message-ID: <002901d66462$a1dff530$e59fdf90$@yujala.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIl7jaf5+ZLFToUYJ/P44Ycp83hwAFkmiVWAaCz0KsBnyrDOahXwpMQ
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-71.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yujala.com
X-BWhitelist: no
X-Source-IP: 162.231.240.210
X-Source-L: No
X-Exim-ID: 1k0BJY-001dcD-9H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 (SRINIASUSLAPTOP) [162.231.240.210]:56562
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

Hi,


On 24/07/2020 16:01, Srinivas Bangalore wrote:
> Hi Julien,

Hello,

>=20
> Thanks for the tips. Comments inline...

I struggled to find your comment inline as your e-mail client doesn't =
quote
my answer. Please configure your e-mail client to use some form of =
quoting
(the usual is '>').

[<SB>] Done! Sorry about that.

> Here's the output, truncated since it goes into an infinite loop=20
> printing the same info:
> [..]
> (XEN) Allocating 1:1 mappings totalling 128MB for dom0:
> (XEN) BANK[0] 0x00000088000000-0x00000090000000 (128MB)
> (XEN) Grant table range: 0x000000fec00000-0x000000fec68000
> (XEN) Loading zImage from 00000000e1000000 to
> 0000000088080000-000000008a23c808
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading dom0 DTB to 0x000000008fe00000-0x000000008fe34444
> (XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs
> (XEN) ........done.
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) ***************************************************
> (XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
> (XEN) This option is intended to aid debugging of Xen by ensuring
> (XEN) that all output is synchronously delivered on the serial line.
> (XEN) However it can introduce SIGNIFICANT latencies and affect
> (XEN) timekeeping. It is NOT recommended for production use!
> (XEN) ***************************************************
> (XEN) 3... 2... 1...
> (XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch=20
> input to
> Xen)
> (XEN) Freed 296kB init memory.
> (XEN) dom0 IPA 0x0000000088080000
> (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
> (XEN) 0TH[0x0] =3D 0x004000017f0f377f
> (XEN) 1ST[0x2] =3D 0x02c00000800006fd
> (XEN) Mem access check
> (XEN) dom0 IPA 0x0000000088080000
> (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
> (XEN) 0TH[0x0] =3D 0x004000017f0f377f
> (XEN) 1ST[0x2] =3D 0x02c00000800006fd
> (XEN) Mem access check

The instruction abort issue looks normal as the mapping is marked as
non-executable.

Looking at the rest of bits, bits 55:58 indicates the type of mapping =
used.
The value suggest the mapping has been considered to be used
p2m_mmio_direct_c (RW cacheable MMIO). This looks wrong to me because =
RAM
should be mapped using p2m_ram_rw.

Looking at your DT, it looks like the region is marked as reserved. On =
Xen
4.8, reserved-memory region are not correctly handled (IIRC this was =
only
fixed in Xen 4.13). This should be possible to confirm by enable
CONFIG_DEVICE_TREE_DEBUG in your .config.

The option will debug more information about the mapping to dom0 on your
console.

However, given you are using an old release, you are at risk at keep =
finding
bugs that have been resolved in more recent releases. It would probably
better if you switch to Xen 4.14 and report any bug you can find there.

[<SB>] OK, I started porting the patch series to 4.14, but it is =
definitely
not straightforward ;) Will take some time to do this. BTW, I was =
looking at
xen/arch/arm/Rules.mk in 4.14 and it is blank. The previous releases had
some board-specific stuff in this file - esp the EARLY_PRINTK =
definitions.
Has this changed in 4.14?=20
=20
>=20
> [..]
>=20
> I added the printk for 'Mem access check' inside the 'case =
FSC_FLT_PERM'
of
> the switch (fsc) code following the lookup. That's what you see in the
> output above.
> So it does seem like there's a memory access fault somehow.
>  =20
>>
>> (XEN)=A0 HPFAR_EL2: 0000000000000000
>>
>> (XEN)=A0=A0=A0 FAR_EL2: 00000000a0080000
>>
>> (XEN)
>>
>> (XEN) Guest stack trace from sp=3D0:
>>
>> (XEN)=A0=A0 Failed to convert stack to physical address
>=20
> [...]
>=20
>> It seems the DOM0 kernel did not get added to the task list=85.
>=20
>   From a look at the dump, dom0 vCPU0 has been scheduled and running =
on
> pCPU0.
>=20
>>
>> Boot args for Xen and Dom0 are here:
>> (XEN) Checking for initrd in /chosen
>>
>> (XEN) linux,initrd limits invalid: 0000000084100000 >=3D
>> 0000000084100000
>>
>> (XEN) RAM: 0000000080000000 - 00000000fedfffff
>>
>> (XEN) RAM: 0000000100000000 - 000000017f1fffff
>>
>> (XEN)
>>
>> (XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
>>
>> (XEN) MODULE[1]: 00000000e1000000 - 00000000e31bc808 Kernel
>> console=3Dhvc0 earlyprintk=3Dxen earlycon=3Dxen rootfstype=3Dext4 rw =
rootwait
>> root=3D/dev/mmcblk0p1 rdinit=3D/sbin/init
>=20
> You want to use earlycon=3Dxenboot here.
>=20
>>
>> (XEN)=A0 RESVD[0]: 0000000080000000 - 0000000080020000
>>
>> (XEN)=A0 RESVD[1]: 00000000e3500000 - 00000000e3535000
>>
>> (XEN)=A0 RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
>>
>> (XEN)
>>
>> (XEN) Command line: console=3Ddtuart earlyprintk=3Dxen
>> earlycon=3Duart8250,mmio32,0x70006000 sync_console dom0_mem=3D512M
>> log_lvl=3Dall guest_loglvl=3Dall console_to_ring
>=20
> FWIW, earlyprintk and earlycon are not understood by Xen. They are =
only
> useful for Dom0.
>=20
> BTW, to Christopher's point, the dtb did have some issues. I had to =
hack
the
> 'interrupt-controller' node to get the GICv2 working.
> I have attached the .dts file that I'm using.
[<SB>]=20

Regards,
Srini



