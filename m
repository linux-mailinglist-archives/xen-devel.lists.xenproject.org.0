Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D822C8AE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 17:01:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyzCM-0006yZ-8k; Fri, 24 Jul 2020 15:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=59Ih=BD=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1jyzCL-0006yU-3D
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 15:01:21 +0000
X-Inumbo-ID: 874a03c6-cdbe-11ea-a405-12813bfff9fa
Received: from gproxy2-pub.mail.unifiedlayer.com (unknown [69.89.18.3])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 874a03c6-cdbe-11ea-a405-12813bfff9fa;
 Fri, 24 Jul 2020 15:01:18 +0000 (UTC)
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
 by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 7744A1E0703
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 09:01:15 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id yzCEjUjQUhDCCyzCEj3DMh; Fri, 24 Jul 2020 09:01:15 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Aayf4UfG c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=yS0qNmEK8ed8yKyeR8R6rg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=DAwyPP_o2Byb1YXLmDAA:9
 a=cWRNjhkoAAAA:8 a=0f1Y9JmXAAAA:8 a=pGLkceISAAAA:8 a=J1u6DroUJCJUO7YzKxcA:9
 a=RIVIM4Kt5FzBIjfJ:21 a=rUt3xXAb7zav4-gB:21 a=wPNLvfGTeEIA:10:nop_charset_2
 a=HMUB7uMQ5RUd_Y6GMyUA:9
 a=klsXiepXz4AA:10:nop_attachment_filename_extension_2
 a=sVa6W5Aao32NNC1mekxh:22 a=It28mvvgxjsq2WIeNnUB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
 References:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c1CcDszMDIMkDm680/pZlYp81gXv7XoTBl5DIYGxmxQ=; b=ng7FapfZthc1RWvNj7vx7kZLop
 pEXqx8kq+T3tnhvnFjpinN5vNIjxOLx2FPjX9bQTTqxnCRfp3BSVZx6IRpZTY8VR7CAzQCjVvMcTJ
 A/Ja7SfL3BiCo4gHNmdtirr+21C1sS21GHI3U1fb22hWzbHeOmbq054sT66CbHpLvNNsxlGmJQ79K
 Wy2a47nmVha+xqpT4MoYahDOudSV2+SD/c6leFrGDfpGGDON/IwkQ92rnI6wcxBJx+AWwo8kQWiIQ
 rbY90CPzdAAsYiNvSCsOtxAcsrY3xTKWs0yh32DEymmMNUru6AAlC4GpHHjnkBzuJ4UPICZLIxWV+
 muizxOdQ==;
Received: from 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 ([162.231.240.210]:50065 helo=SRINIASUSLAPTOP)
 by md-71.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <srini@yujala.com>)
 id 1jyzCD-001IUT-Mh; Fri, 24 Jul 2020 15:01:14 +0000
From: "Srinivas Bangalore" <srini@yujala.com>
To: "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>,
 "'Christopher Clark'" <christopher.w.clark@gmail.com>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
In-Reply-To: <9736680b-1c81-652b-552b-4103341bad50@xen.org>
Subject: RE: Porting Xen to Jetson Nano
Date: Fri, 24 Jul 2020 08:01:12 -0700
Message-ID: <000001d661cb$45cdaa10$d168fe30$@yujala.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0001_01D66190.996FE380"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIl7jaf5+ZLFToUYJ/P44Ycp83hwAFkmiVWqGyP/MA=
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
X-Exim-ID: 1jyzCD-001IUT-Mh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 (SRINIASUSLAPTOP) [162.231.240.210]:50065
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

------=_NextPart_000_0001_01D66190.996FE380
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for the tips. Comments inline...

Regards,
Srini

-----Original Message-----
From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Julien
Grall
Sent: Thursday, July 23, 2020 11:04 AM
To: Srinivas Bangalore <srini@yujala.com>; =
xen-devel@lists.xenproject.org;
Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: Porting Xen to Jetson Nano

On 22/07/2020 18:57, Srinivas Bangalore wrote:
> Dear Xen experts,

Hello,

> Would greatly appreciate some hints on how to move forward with this=20
> one=85

 From your first set of original log:

 > Xen version 4.8.5 (srinivas@) (aarch64-linux-gnu-gcc  > =
(Ubuntu/Linaro
7.5.0-3ubuntu1~18.04) 7.5.0) debug=3Dn  Sun Jul 19 07:44:00  > PDT 2020

I would recommend to compile Xen with debug enabled (CONFIG_DEBUG=3Dy) =
as it
may provide you more information of what's happening.

Xen image rebuild now with CONFIG_DEBUG=3Dy. Also changed bootargs as
suggested.

(XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
(XEN) MODULE[1]: 00000000e1000000 - 00000000e31bc808 Kernel
console=3Dhvc0 earlycon=3Dxenboot rootfstype=3Dext4 rw rootwait
root=3D/dev/mmcblk0p1 rdinit=3D/sbin/init clk_ignore_unused
(XEN)  RESVD[0]: 0000000080000000 - 0000000080020000
(XEN)  RESVD[1]: 00000000e3500000 - 00000000e3535000
(XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
(XEN)
(XEN) Command line: console=3Ddtuart sync_console dom0_mem=3D128M =
log_lvl=3Dall
guest_loglvl=3Dall console_to_ring
(XEN) Placing Xen at 0x00000000fec00000-0x00000000fee00000
(XEN) Update BOOTMOD_XEN from 0000000080080000-0000000080198e01 =3D>
00000000fec00000-00000000fed18e01
(XEN) Domain heap initialised
(XEN) Platform: Tegra
(XEN) Taking dtuart configuration from /chosen/stdout-path
(XEN) Looking for dtuart at "/serial@70 Xen 4.8.5
(XEN) Xen version 4.8.5 (srinivas@) (aarch64-linux-gnu-gcc =
(Ubuntu/Linaro
7.5.0-3ubuntu1~18.04) 7.5.0) debug=3Dy  Thu Jul 23 21:17:23 PDT 2020


Also, aside the Tegra series. Do you have any other patches on top?

No other patches.=20

[...]

> (XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)
>=20
> (XEN) Grant table range: 0x000000fec00000-0x000000fec60000
>=20
> (XEN) Loading zImage from 00000000e1000000 to
> 00000000a0080000-00000000a223c808
>=20
> (XEN) Allocating PPI 16 for event channel interrupt
>=20
> (XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a803435c

[...]

>=20
> (XEN) *** Dumping CPU0 guest state (d0v0): ***
>=20
> (XEN) ----[ Xen-4.8.5=A0 arm64=A0 debug=3Dn=A0=A0 Tainted:=A0 C=A0=A0 =
]----
>=20
> (XEN) CPU:=A0=A0=A0 0
>=20
> (XEN) PC:=A0=A0=A0=A0 00000000a0080000

PC is pointing to the entry point of your kernel...

>=20
> (XEN) LR:=A0=A0=A0=A0 0000000000000000
>=20
> (XEN) SP_EL0: 0000000000000000
>=20
> (XEN) SP_EL1: 0000000000000000
>=20
> (XEN) CPSR:=A0=A0 000001c5 MODE:64-bit EL1h (Guest Kernel, handler)
>=20
> (XEN)=A0=A0=A0=A0=A0 X0: 00000000a8000000=A0 X1: 0000000000000000=A0 =
X2:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0=A0 X3: 0000000000000000=A0 X4: 0000000000000000=A0 =
X5:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0=A0 X6: 0000000000000000=A0 X7: 0000000000000000=A0 =
X8:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0=A0 X9: 0000000000000000 X10: 0000000000000000 X11:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0 X12: 0000000000000000 X13: 0000000000000000 X14:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0 X15: 0000000000000000 X16: 0000000000000000 X17:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0 X18: 0000000000000000 X19: 0000000000000000 X20:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0 X21: 0000000000000000 X22: 0000000000000000 X23:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0 X24: 0000000000000000 X25: 0000000000000000 X26:=20
> 0000000000000000
>=20
> (XEN)=A0=A0=A0=A0 X27: 0000000000000000 X28: 0000000000000000=A0 FP:=20
> 0000000000000000
>=20
> (XEN)
>=20
> (XEN)=A0=A0=A0 ELR_EL1: 0000000000000000
>=20
> (XEN)=A0=A0=A0 ESR_EL1: 00000000
>=20
> (XEN)=A0=A0=A0 FAR_EL1: 0000000000000000
>=20
> (XEN)
>=20
> (XEN)=A0 SCTLR_EL1: 00c50838
>=20
> (XEN)=A0=A0=A0 TCR_EL1: 00000000
>=20
> (XEN)=A0 TTBR0_EL1: 0000000000000000
>=20
> (XEN)=A0 TTBR1_EL1: 0000000000000000
>=20
> (XEN)
>=20
> (XEN)=A0=A0 VTCR_EL2: 80043594
>=20
> (XEN)=A0 VTTBR_EL2: 000100017f0f9000
>=20
> (XEN)
>=20
> (XEN)=A0 SCTLR_EL2: 30cd183d
>=20
> (XEN)=A0=A0=A0 HCR_EL2: 000000008038663f
>=20
> (XEN)=A0 TTBR0_EL2: 00000000fecfc000
>=20
> (XEN)
>=20
> (XEN)=A0=A0=A0 ESR_EL2: 8200000d

... it looks like we are receiving a trap in EL2 because it can't =
execute
the instruction. This is a bit odd as the p2m (stage-2
page-tables) should be configured to allow execution. It would be useful =
if
you can dump the p2m walk here. This following patch should do the job =
(not
compiled test):

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c index
d578a5c598dd..af1834cdf735 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2489,9 +2489,14 @@ static void do_trap_instr_abort_guest(struct
cpu_user_regs *regs,
           */
          rc =3D gva_to_ipa(gva, &gpa, GV2M_READ);
          if ( rc =3D=3D -EFAULT )
+        {
+            printk("Unable to translate 0x%lx\n", gva);
              return; /* Try again */
+        }
      }

+    dump_p2m_walk(current->domain, gpa);
+
      switch ( fsc )
      {
      case FSC_FLT_PERM:

I believe you meant 'dump_p2m_lookup'? I couldn't find 'dump_p2m_walk' =
in
the source, so included 'dump_p2m_lookup' (which actually calls
'dump_pm_walk').
Here's the output, truncated since it goes into an infinite loop =
printing
the same info:
[..]
(XEN) Allocating 1:1 mappings totalling 128MB for dom0:
(XEN) BANK[0] 0x00000088000000-0x00000090000000 (128MB)
(XEN) Grant table range: 0x000000fec00000-0x000000fec68000
(XEN) Loading zImage from 00000000e1000000 to
0000000088080000-000000008a23c808
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading dom0 DTB to 0x000000008fe00000-0x000000008fe34444
(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs
(XEN) ........done.
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch =
input to
Xen)
(XEN) Freed 296kB init memory.
(XEN) dom0 IPA 0x0000000088080000
(XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
(XEN) 0TH[0x0] =3D 0x004000017f0f377f
(XEN) 1ST[0x2] =3D 0x02c00000800006fd
(XEN) Mem access check
(XEN) dom0 IPA 0x0000000088080000
(XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
(XEN) 0TH[0x0] =3D 0x004000017f0f377f
(XEN) 1ST[0x2] =3D 0x02c00000800006fd
(XEN) Mem access check

[..]

I added the printk for 'Mem access check' inside the 'case FSC_FLT_PERM' =
of
the switch (fsc) code following the lookup. That's what you see in the
output above.=20
So it does seem like there's a memory access fault somehow.
=20
>=20
> (XEN)=A0 HPFAR_EL2: 0000000000000000
>=20
> (XEN)=A0=A0=A0 FAR_EL2: 00000000a0080000
>=20
> (XEN)
>=20
> (XEN) Guest stack trace from sp=3D0:
>=20
> (XEN)=A0=A0 Failed to convert stack to physical address

[...]

> It seems the DOM0 kernel did not get added to the task list=85.

 From a look at the dump, dom0 vCPU0 has been scheduled and running on
pCPU0.

>=20
> Boot args for Xen and Dom0 are here:
> (XEN) Checking for initrd in /chosen
>=20
> (XEN) linux,initrd limits invalid: 0000000084100000 >=3D=20
> 0000000084100000
>=20
> (XEN) RAM: 0000000080000000 - 00000000fedfffff
>=20
> (XEN) RAM: 0000000100000000 - 000000017f1fffff
>=20
> (XEN)
>=20
> (XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
>=20
> (XEN) MODULE[1]: 00000000e1000000 - 00000000e31bc808 Kernel      =20
> console=3Dhvc0 earlyprintk=3Dxen earlycon=3Dxen rootfstype=3Dext4 rw =
rootwait
> root=3D/dev/mmcblk0p1 rdinit=3D/sbin/init

You want to use earlycon=3Dxenboot here.

>=20
> (XEN)=A0 RESVD[0]: 0000000080000000 - 0000000080020000
>=20
> (XEN)=A0 RESVD[1]: 00000000e3500000 - 00000000e3535000
>=20
> (XEN)=A0 RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
>=20
> (XEN)
>=20
> (XEN) Command line: console=3Ddtuart earlyprintk=3Dxen
> earlycon=3Duart8250,mmio32,0x70006000 sync_console dom0_mem=3D512M=20
> log_lvl=3Dall guest_loglvl=3Dall console_to_ring

FWIW, earlyprintk and earlycon are not understood by Xen. They are only
useful for Dom0.

BTW, to Christopher's point, the dtb did have some issues. I had to hack =
the
'interrupt-controller' node to get the GICv2 working.
I have attached the .dts file that I'm using.

Best regards,

--
Julien Grall

------=_NextPart_000_0001_01D66190.996FE380
Content-Type: application/octet-stream;
	name="jetson-nano-b00.dts"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="jetson-nano-b00.dts"

/dts-v1/;=0A=
=0A=
/memreserve/	0x0000000080000000 0x0000000000020000;=0A=
/ {=0A=
	compatible =3D "nvidia,p3449-0000-b00+p3448-0000-b00", =
"nvidia,jetson-nano", "nvidia,tegra210";=0A=
	interrupt-parent =3D <0x1>;=0A=
	#address-cells =3D <0x2>;=0A=
	#size-cells =3D <0x2>;=0A=
	nvidia,dtbbuildtime =3D "Jul 23 2020", "17:30:48";=0A=
	nvidia,boardids =3D "3448";=0A=
	nvidia,proc-boardid =3D "3448";=0A=
	nvidia,pmu-boardid =3D "3448";=0A=
	nvidia,fastboot-usb-pid =3D <0xb442>;=0A=
	model =3D "NVIDIA Jetson Nano Developer Kit";=0A=
	nvidia,dtsfilename =3D =
"../arch/arm64/boot/dts/../../../../../../hardware/nvidia/platform/t210/p=
org/kernel-dts/tegra210-p3448-0000-p3449-0000-b00.dts";=0A=
=0A=
	thermal-zones {=0A=
=0A=
		AO-therm {=0A=
			status =3D "okay";=0A=
			polling-delay =3D <0x3e8>;=0A=
			polling-delay-passive =3D <0x3e8>;=0A=
			thermal-sensors =3D <0x2>;=0A=
=0A=
			trips {=0A=
=0A=
				trip_shutdown {=0A=
					temperature =3D <0x1adb0>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "critical";=0A=
					writable;=0A=
				};=0A=
=0A=
				gpu-scaling0 {=0A=
					temperature =3D <0xffff9e58>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0xa7>;=0A=
					phandle =3D <0xa7>;=0A=
				};=0A=
=0A=
				gpu-scaling1 {=0A=
					temperature =3D <0x3a98>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x3>;=0A=
					phandle =3D <0x3>;=0A=
				};=0A=
=0A=
				gpu-scaling2 {=0A=
					temperature =3D <0x7530>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x5>;=0A=
					phandle =3D <0x5>;=0A=
				};=0A=
=0A=
				gpu-scaling3 {=0A=
					temperature =3D <0xc350>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x6>;=0A=
					phandle =3D <0x6>;=0A=
				};=0A=
=0A=
				gpu-scaling4 {=0A=
					temperature =3D <0x11170>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x7>;=0A=
					phandle =3D <0x7>;=0A=
				};=0A=
=0A=
				gpu-scaling5 {=0A=
					temperature =3D <0x19a28>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x8>;=0A=
					phandle =3D <0x8>;=0A=
				};=0A=
=0A=
				gpu-vmax1 {=0A=
					temperature =3D <0x14438>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x9>;=0A=
					phandle =3D <0x9>;=0A=
				};=0A=
=0A=
				core_dvfs_floor_trip0 {=0A=
					temperature =3D <0x3a98>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0xb>;=0A=
					phandle =3D <0xb>;=0A=
				};=0A=
=0A=
				core_dvfs_cap_trip0 {=0A=
					temperature =3D <0x14c08>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0xd>;=0A=
					phandle =3D <0xd>;=0A=
				};=0A=
=0A=
				dfll-floor-trip0 {=0A=
					temperature =3D <0x3a98>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0xf>;=0A=
					phandle =3D <0xf>;=0A=
				};=0A=
			};=0A=
=0A=
			thermal-zone-params {=0A=
				governor-name =3D "pid_thermal_gov";=0A=
			};=0A=
=0A=
			cooling-maps {=0A=
=0A=
				gpu-scaling-map1 {=0A=
					trip =3D <0x3>;=0A=
					cooling-device =3D <0x4 0x1 0x1>;=0A=
				};=0A=
=0A=
				gpu-scaling-map2 {=0A=
					trip =3D <0x5>;=0A=
					cooling-device =3D <0x4 0x2 0x2>;=0A=
				};=0A=
=0A=
				gpu_scaling_map3 {=0A=
					trip =3D <0x6>;=0A=
					cooling-device =3D <0x4 0x3 0x3>;=0A=
				};=0A=
=0A=
				gpu-scaling-map4 {=0A=
					trip =3D <0x7>;=0A=
					cooling-device =3D <0x4 0x4 0x4>;=0A=
				};=0A=
=0A=
				gpu-scaling-map5 {=0A=
					trip =3D <0x8>;=0A=
					cooling-device =3D <0x4 0x5 0x5>;=0A=
				};=0A=
=0A=
				gpu-vmax-map1 {=0A=
					trip =3D <0x9>;=0A=
					cooling-device =3D <0xa 0x1 0x1>;=0A=
				};=0A=
=0A=
				core_dvfs_floor_map0 {=0A=
					trip =3D <0xb>;=0A=
					cooling-device =3D <0xc 0x1 0x1>;=0A=
				};=0A=
=0A=
				core_dvfs_cap_map0 {=0A=
					trip =3D <0xd>;=0A=
					cooling-device =3D <0xe 0x1 0x1>;=0A=
				};=0A=
=0A=
				dfll-floor-map0 {=0A=
					trip =3D <0xf>;=0A=
					cooling-device =3D <0x10 0x1 0x1>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		CPU-therm {=0A=
			polling-delay =3D <0x0>;=0A=
			polling-delay-passive =3D <0x1f4>;=0A=
			thermal-sensors =3D <0x11 0x0>;=0A=
			status =3D "okay";=0A=
=0A=
			thermal-zone-params {=0A=
				governor-name =3D "step_wise";=0A=
				max_err_temp =3D <0x2328>;=0A=
				max_err_gain =3D <0x3e8>;=0A=
				gain_p =3D <0x3e8>;=0A=
				gain_d =3D <0x0>;=0A=
				up_compensation =3D <0x14>;=0A=
				down_compensation =3D <0x14>;=0A=
			};=0A=
=0A=
			trips {=0A=
=0A=
				dfll-cap-trip0 {=0A=
					temperature =3D <0x101d0>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x16>;=0A=
					phandle =3D <0x16>;=0A=
				};=0A=
=0A=
				dfll-cap-trip1 {=0A=
					temperature =3D <0x14ff0>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "active";=0A=
					linux,phandle =3D <0x18>;=0A=
					phandle =3D <0x18>;=0A=
				};=0A=
=0A=
				cpu_critical {=0A=
					temperature =3D <0x18e70>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "critical";=0A=
					writable;=0A=
				};=0A=
=0A=
				cpu_heavy {=0A=
					temperature =3D <0x18894>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "hot";=0A=
					writable;=0A=
					linux,phandle =3D <0x12>;=0A=
					phandle =3D <0x12>;=0A=
				};=0A=
=0A=
				cpu_throttle {=0A=
					temperature =3D <0x17ae8>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "passive";=0A=
					writable;=0A=
					linux,phandle =3D <0x14>;=0A=
					phandle =3D <0x14>;=0A=
				};=0A=
			};=0A=
=0A=
			cooling-maps {=0A=
=0A=
				map1 {=0A=
					trip =3D <0x12>;=0A=
					cdev-type =3D "tegra_heavy";=0A=
					cooling-device =3D <0x13 0x1 0x1>;=0A=
				};=0A=
=0A=
				map2 {=0A=
					trip =3D <0x14>;=0A=
					cdev-type =3D "cpu-balanced";=0A=
					cooling-device =3D <0x15 0xffffffff 0xffffffff>;=0A=
				};=0A=
=0A=
				dfll-cap-map0 {=0A=
					trip =3D <0x16>;=0A=
					cooling-device =3D <0x17 0x1 0x1>;=0A=
				};=0A=
=0A=
				dfll-cap-map1 {=0A=
					trip =3D <0x18>;=0A=
					cooling-device =3D <0x17 0x2 0x2>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		GPU-therm {=0A=
			polling-delay =3D <0x0>;=0A=
			polling-delay-passive =3D <0x1f4>;=0A=
			thermal-sensors =3D <0x11 0x2>;=0A=
			status =3D "okay";=0A=
=0A=
			thermal-zone-params {=0A=
				governor-name =3D "step_wise";=0A=
				max_err_temp =3D <0x2328>;=0A=
				max_err_gain =3D <0x3e8>;=0A=
				gain_p =3D <0x3e8>;=0A=
				gain_d =3D <0x0>;=0A=
				up_compensation =3D <0x14>;=0A=
				down_compensation =3D <0x14>;=0A=
			};=0A=
=0A=
			trips {=0A=
=0A=
				gpu_critical {=0A=
					temperature =3D <0x19064>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "critical";=0A=
					writable;=0A=
				};=0A=
=0A=
				gpu_heavy {=0A=
					temperature =3D <0x18a88>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "hot";=0A=
					writable;=0A=
					linux,phandle =3D <0x19>;=0A=
					phandle =3D <0x19>;=0A=
				};=0A=
=0A=
				gpu_throttle {=0A=
					temperature =3D <0x17cdc>;=0A=
					hysteresis =3D <0x0>;=0A=
					type =3D "passive";=0A=
					writable;=0A=
					linux,phandle =3D <0x1a>;=0A=
					phandle =3D <0x1a>;=0A=
				};=0A=
			};=0A=
=0A=
			cooling-maps {=0A=
=0A=
				map1 {=0A=
					trip =3D <0x19>;=0A=
					cdev-type =3D "tegra_heavy";=0A=
					cooling-device =3D <0x13 0x1 0x1>;=0A=
				};=0A=
=0A=
				map2 {=0A=
					trip =3D <0x1a>;=0A=
					cdev-type =3D "gpu-balanced";=0A=
					cooling-device =3D <0x1b 0xffffffff 0xffffffff>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		PLL-therm {=0A=
			polling-delay =3D <0x0>;=0A=
			polling-delay-passive =3D <0x3e8>;=0A=
			thermal-sensors =3D <0x11 0x3>;=0A=
			status =3D "okay";=0A=
=0A=
			thermal-zone-params {=0A=
				governor-name =3D "pid_thermal_gov";=0A=
				max_err_temp =3D <0x2328>;=0A=
				max_err_gain =3D <0x3e8>;=0A=
				gain_p =3D <0x3e8>;=0A=
				gain_d =3D <0x0>;=0A=
				up_compensation =3D <0x14>;=0A=
				down_compensation =3D <0x14>;=0A=
			};=0A=
=0A=
			trips {=0A=
=0A=
				dram-throttle {=0A=
					temperature =3D <0x11170>;=0A=
					hysteresis =3D <0x3e8>;=0A=
					type =3D "passive";=0A=
					writable;=0A=
					linux,phandle =3D <0x1c>;=0A=
					phandle =3D <0x1c>;=0A=
				};=0A=
			};=0A=
=0A=
			cooling-maps {=0A=
=0A=
				map-tegra-dram {=0A=
					trip =3D <0x1c>;=0A=
					cooling-device =3D <0x1d 0x1 0x1>;=0A=
					cdev-type =3D "tegra-dram";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		PMIC-Die {=0A=
			polling-delay =3D <0x0>;=0A=
			polling-delay-passive =3D <0x0>;=0A=
			thermal-sensors =3D <0x1e>;=0A=
=0A=
			trips {=0A=
=0A=
				hot-die {=0A=
					temperature =3D <0x1d4c0>;=0A=
					type =3D "active";=0A=
					hysteresis =3D <0x0>;=0A=
					linux,phandle =3D <0x1f>;=0A=
					phandle =3D <0x1f>;=0A=
				};=0A=
			};=0A=
=0A=
			cooling-maps {=0A=
=0A=
				map0 {=0A=
					trip =3D <0x1f>;=0A=
					cooling-device =3D <0x20 0xffffffff 0xffffffff>;=0A=
					contribution =3D <0x64>;=0A=
					cdev-type =3D "emergency-balanced";=0A=
				};=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	core_dvfs_cdev_floor {=0A=
		compatible =3D "nvidia,tegra-core-cdev-action";=0A=
		cdev-type =3D "CORE-floor";=0A=
		#cooling-cells =3D <0x2>;=0A=
		linux,phandle =3D <0xc>;=0A=
		phandle =3D <0xc>;=0A=
	};=0A=
=0A=
	core_dvfs_cdev_cap {=0A=
		compatible =3D "nvidia,tegra-core-cdev-action";=0A=
		cdev-type =3D "CORE-cap";=0A=
		#cooling-cells =3D <0x2>;=0A=
		clocks =3D <0x21 0x198 0x21 0x1a1 0x21 0x1b8 0x21 0x1f6 0x21 0x206>;=0A=
		clock-names =3D "c2bus_cap", "c3bus_cap", "sclk_cap", "host1x_cap", =
"adsp_cap";=0A=
		linux,phandle =3D <0xe>;=0A=
		phandle =3D <0xe>;=0A=
	};=0A=
=0A=
	power-domain {=0A=
		compatible =3D "tegra-power-domains";=0A=
=0A=
		host1x-pd {=0A=
			compatible =3D "nvidia,tegra210-host1x-pd";=0A=
			is_off;=0A=
			host1x;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			linux,phandle =3D <0x23>;=0A=
			phandle =3D <0x23>;=0A=
		};=0A=
=0A=
		ape-pd {=0A=
			compatible =3D "nvidia,tegra210-ape-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x1b>;=0A=
			clocks =3D <0x21 0xc6 0x21 0x6b 0x21 0xc7>;=0A=
			clock-names =3D "ape", "apb2ape", "adsp";=0A=
			linux,phandle =3D <0x22>;=0A=
			phandle =3D <0x22>;=0A=
		};=0A=
=0A=
		adsp-pd {=0A=
			compatible =3D "nvidia,tegra210-adsp-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x22>;=0A=
			linux,phandle =3D <0xdf>;=0A=
			phandle =3D <0xdf>;=0A=
		};=0A=
=0A=
		tsec-pd {=0A=
			compatible =3D "nvidia,tegra210-tsec-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			linux,phandle =3D <0x6b>;=0A=
			phandle =3D <0x6b>;=0A=
		};=0A=
=0A=
		nvdec-pd {=0A=
			compatible =3D "nvidia,tegra210-nvdec-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			partition-id =3D <0x19>;=0A=
			linux,phandle =3D <0x6c>;=0A=
			phandle =3D <0x6c>;=0A=
		};=0A=
=0A=
		ve2-pd {=0A=
			compatible =3D "nvidia,tegra210-ve2-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			partition-id =3D <0x1d>;=0A=
			linux,phandle =3D <0x5c>;=0A=
			phandle =3D <0x5c>;=0A=
		};=0A=
=0A=
		vic03-pd {=0A=
			compatible =3D "nvidia,tegra210-vic03-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			partition-id =3D <0x17>;=0A=
			linux,phandle =3D <0x69>;=0A=
			phandle =3D <0x69>;=0A=
		};=0A=
=0A=
		msenc-pd {=0A=
			compatible =3D "nvidia,tegra210-msenc-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			partition-id =3D <0x6>;=0A=
			linux,phandle =3D <0x6a>;=0A=
			phandle =3D <0x6a>;=0A=
		};=0A=
=0A=
		nvjpg-pd {=0A=
			compatible =3D "nvidia,tegra210-nvjpg-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			partition-id =3D <0x1a>;=0A=
			linux,phandle =3D <0x6d>;=0A=
			phandle =3D <0x6d>;=0A=
		};=0A=
=0A=
		pcie-pd {=0A=
			compatible =3D "nvidia,tegra210-pcie-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x3>;=0A=
			linux,phandle =3D <0x7a>;=0A=
			phandle =3D <0x7a>;=0A=
		};=0A=
=0A=
		ve-pd {=0A=
			compatible =3D "nvidia,tegra210-ve-pd";=0A=
			is_off;=0A=
			#power-domain-cells =3D <0x0>;=0A=
			power-domains =3D <0x23>;=0A=
			partition-id =3D <0x2>;=0A=
			linux,phandle =3D <0x59>;=0A=
			phandle =3D <0x59>;=0A=
		};=0A=
=0A=
		sata-pd {=0A=
			compatible =3D "nvidia,tegra210-sata-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x8>;=0A=
			linux,phandle =3D <0xe0>;=0A=
			phandle =3D <0xe0>;=0A=
		};=0A=
=0A=
		sor-pd {=0A=
			compatible =3D "nvidia,tegra210-sor-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x11>;=0A=
			linux,phandle =3D <0xe1>;=0A=
			phandle =3D <0xe1>;=0A=
		};=0A=
=0A=
		disa-pd {=0A=
			compatible =3D "nvidia,tegra210-disa-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x12>;=0A=
			linux,phandle =3D <0xe2>;=0A=
			phandle =3D <0xe2>;=0A=
		};=0A=
=0A=
		disb-pd {=0A=
			compatible =3D "nvidia,tegra210-disb-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x13>;=0A=
			linux,phandle =3D <0xe3>;=0A=
			phandle =3D <0xe3>;=0A=
		};=0A=
=0A=
		xusba-pd {=0A=
			compatible =3D "nvidia,tegra210-xusba-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x14>;=0A=
			linux,phandle =3D <0xe4>;=0A=
			phandle =3D <0xe4>;=0A=
		};=0A=
=0A=
		xusbb-pd {=0A=
			compatible =3D "nvidia,tegra210-xusbb-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x15>;=0A=
			linux,phandle =3D <0xe5>;=0A=
			phandle =3D <0xe5>;=0A=
		};=0A=
=0A=
		xusbc-pd {=0A=
			compatible =3D "nvidia,tegra210-xusbc-pd";=0A=
			#power-domain-cells =3D <0x0>;=0A=
			partition-id =3D <0x16>;=0A=
			linux,phandle =3D <0xe6>;=0A=
			phandle =3D <0xe6>;=0A=
		};=0A=
	};=0A=
=0A=
	actmon@6000c800 {=0A=
		status =3D "okay";=0A=
		#address-cells =3D <0x2>;=0A=
		#size-cells =3D <0x2>;=0A=
		compatible =3D "nvidia,tegra210-cactmon";=0A=
		reg =3D <0x0 0x6000c800 0x0 0x400>;=0A=
		interrupts =3D <0x0 0x2d 0x4>;=0A=
		clocks =3D <0x21 0x77>;=0A=
		clock-names =3D "actmon";=0A=
		resets =3D <0x21 0x77>;=0A=
		reset-names =3D "actmon";=0A=
		nvidia,sample_period =3D [14];=0A=
=0A=
		mc_all {=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			nvidia,con_id =3D "mc_all";=0A=
			nvidia,dev_id =3D "actmon";=0A=
			nvidia,reg_offs =3D <0x1c0>;=0A=
			nvidia,irq_mask =3D <0x4000000>;=0A=
			nvidia,suspend_freq =3D <0x324b0>;=0A=
			nvidia,boost_freq_step =3D <0x3e80>;=0A=
			nvidia,boost_up_coef =3D <0xc8>;=0A=
			nvidia,boost_down_coef =3D <0x32>;=0A=
			nvidia,boost_up_threshold =3D <0x3c>;=0A=
			nvidia,boost_down_threshold =3D <0x28>;=0A=
			nvidia,up_wmark_window =3D [01];=0A=
			nvidia,down_wmark_window =3D [03];=0A=
			nvidia,avg_window_log2 =3D [07];=0A=
			nvidia,count_weight =3D <0x400>;=0A=
			nvidia,max_dram_channels =3D [02];=0A=
			nvidia,type =3D <0x1>;=0A=
			status =3D "okay";=0A=
		};=0A=
	};=0A=
=0A=
	aliases {=0A=
		sdhci0 =3D "/sdhci@700b0000";=0A=
		sdhci1 =3D "/sdhci@700b0200";=0A=
		sdhci2 =3D "/sdhci@700b0400";=0A=
		sdhci3 =3D "/sdhci@700b0600";=0A=
		i2c0 =3D "/i2c@7000c000";=0A=
		i2c1 =3D "/i2c@7000c400";=0A=
		i2c2 =3D "/i2c@7000c500";=0A=
		i2c3 =3D "/i2c@7000c700";=0A=
		i2c4 =3D "/i2c@7000d000";=0A=
		i2c5 =3D "/i2c@7000d100";=0A=
		i2c6 =3D "/host1x/i2c@546c0000";=0A=
		spi0 =3D "/spi@7000d400";=0A=
		spi1 =3D "/spi@7000d600";=0A=
		spi2 =3D "/spi@7000d800";=0A=
		spi3 =3D "/spi@7000da00";=0A=
		qspi6 =3D "/spi@70410000";=0A=
		serial0 =3D "/serial@70006000";=0A=
		serial1 =3D "/serial@70006040";=0A=
		serial2 =3D "/serial@70006200";=0A=
		serial3 =3D "/serial@70006300";=0A=
		rtc0 =3D "/i2c@7000d000/max77620@3c";=0A=
		rtc1 =3D "/rtc";=0A=
	};=0A=
=0A=
	cpus {=0A=
		#address-cells =3D <0x2>;=0A=
		#size-cells =3D <0x0>;=0A=
		status =3D "okay";=0A=
=0A=
		cpu@0 {=0A=
			device_type =3D "cpu";=0A=
			compatible =3D "arm,cortex-a57-64bit", "arm,armv8";=0A=
			reg =3D <0x0 0x0>;=0A=
			enable-method =3D "psci";=0A=
			cpu-idle-states =3D <0x24>;=0A=
			errata_hwcaps =3D <0x7>;=0A=
			cpu-ipc =3D <0x400>;=0A=
			next-level-cache =3D <0x25>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0x126 0x21 0x127 0x21 0x103 0x21 0xf7 0x26>;=0A=
			clock-names =3D "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";=0A=
			clock-latency =3D <0x493e0>;=0A=
			linux,phandle =3D <0x27>;=0A=
			phandle =3D <0x27>;=0A=
		};=0A=
=0A=
		cpu@1 {=0A=
			device_type =3D "cpu";=0A=
			compatible =3D "arm,cortex-a57-64bit", "arm,armv8";=0A=
			reg =3D <0x0 0x1>;=0A=
			enable-method =3D "psci";=0A=
			cpu-idle-states =3D <0x24>;=0A=
			errata_hwcaps =3D <0x7>;=0A=
			cpu-ipc =3D <0x400>;=0A=
			next-level-cache =3D <0x25>;=0A=
			status =3D "okay";=0A=
			linux,phandle =3D <0x28>;=0A=
			phandle =3D <0x28>;=0A=
		};=0A=
=0A=
		cpu@2 {=0A=
			device_type =3D "cpu";=0A=
			compatible =3D "arm,cortex-a57-64bit", "arm,armv8";=0A=
			reg =3D <0x0 0x2>;=0A=
			enable-method =3D "psci";=0A=
			cpu-idle-states =3D <0x24>;=0A=
			errata_hwcaps =3D <0x7>;=0A=
			cpu-ipc =3D <0x400>;=0A=
			next-level-cache =3D <0x25>;=0A=
			status =3D "okay";=0A=
			linux,phandle =3D <0x29>;=0A=
			phandle =3D <0x29>;=0A=
		};=0A=
=0A=
		cpu@3 {=0A=
			device_type =3D "cpu";=0A=
			compatible =3D "arm,cortex-a57-64bit", "arm,armv8";=0A=
			reg =3D <0x0 0x3>;=0A=
			enable-method =3D "psci";=0A=
			cpu-idle-states =3D <0x24>;=0A=
			errata_hwcaps =3D <0x7>;=0A=
			cpu-ipc =3D <0x400>;=0A=
			next-level-cache =3D <0x25>;=0A=
			status =3D "okay";=0A=
			linux,phandle =3D <0x2a>;=0A=
			phandle =3D <0x2a>;=0A=
		};=0A=
=0A=
		idle-states {=0A=
			entry-method =3D "psci";=0A=
=0A=
			c7 {=0A=
				compatible =3D "arm,idle-state";=0A=
				arm,psci-suspend-param =3D <0x40000007>;=0A=
				wakeup-latency-us =3D <0x82>;=0A=
				min-residency-us =3D <0x3e8>;=0A=
				idle-state-name =3D "c7-cpu-powergated";=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0x24>;=0A=
				phandle =3D <0x24>;=0A=
			};=0A=
=0A=
			cc6 {=0A=
				compatible =3D "arm,idle-state";=0A=
				arm,psci-suspend-param =3D <0x40000010>;=0A=
				wakeup-latency-us =3D <0xe6>;=0A=
				min-residency-us =3D <0x2710>;=0A=
				idle-state-name =3D "cc6-cluster-powergated";=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xe7>;=0A=
				phandle =3D <0xe7>;=0A=
			};=0A=
		};=0A=
=0A=
		l2-cache {=0A=
			compatible =3D "cache";=0A=
			linux,phandle =3D <0x25>;=0A=
			phandle =3D <0x25>;=0A=
		};=0A=
	};=0A=
=0A=
	psci {=0A=
		compatible =3D "arm,psci-1.0";=0A=
		status =3D "okay";=0A=
		method =3D "smc";=0A=
	};=0A=
=0A=
	tlk {=0A=
		compatible =3D "android,tlk-driver";=0A=
		status =3D "disabled";=0A=
=0A=
		log {=0A=
			compatible =3D "android,ote-logger";=0A=
		};=0A=
	};=0A=
=0A=
	arm-pmu {=0A=
		compatible =3D "arm,armv8-pmuv3";=0A=
		status =3D "okay";=0A=
		interrupts =3D <0x0 0x90 0x4 0x0 0x91 0x4 0x0 0x92 0x4 0x0 0x93 0x4>;=0A=
		interrupt-affinity =3D <0x27 0x28 0x29 0x2a>;=0A=
	};=0A=
=0A=
	clock {=0A=
		compatible =3D "nvidia,tegra210-car";=0A=
		reg =3D <0x0 0x60006000 0x0 0x1000>;=0A=
		#clock-cells =3D <0x1>;=0A=
		#reset-cells =3D <0x1>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x21>;=0A=
		phandle =3D <0x21>;=0A=
	};=0A=
=0A=
	bwmgr {=0A=
		compatible =3D "nvidia,bwmgr";=0A=
		clocks =3D <0x21 0x212>;=0A=
		nvidia,bwmgr-use-shared-master;=0A=
		clock-names =3D "emc";=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	reserved-memory {=0A=
		#address-cells =3D <0x2>;=0A=
		#size-cells =3D <0x2>;=0A=
		ranges;=0A=
=0A=
		iram-carveout {=0A=
			compatible =3D "nvidia,iram-carveout";=0A=
			reg =3D <0x0 0x40001000 0x0 0x3f000>;=0A=
			no-map;=0A=
			linux,phandle =3D <0x2d>;=0A=
			phandle =3D <0x2d>;=0A=
		};=0A=
=0A=
		ramoops_carveout {=0A=
			compatible =3D "nvidia,ramoops";=0A=
			reg =3D <0x0 0xb0000000 0x0 0x200000>;=0A=
			no-map;=0A=
			linux,phandle =3D <0xe8>;=0A=
			phandle =3D <0xe8>;=0A=
		};=0A=
=0A=
		vpr-carveout {=0A=
			compatible =3D "nvidia,vpr-carveout";=0A=
			size =3D <0x0 0x19000000>;=0A=
			alignment =3D <0x0 0x400000>;=0A=
			alloc-ranges =3D <0x0 0x80000000 0x0 0x70000000>;=0A=
			reusable;=0A=
			linux,phandle =3D <0x2c>;=0A=
			phandle =3D <0x2c>;=0A=
		};=0A=
=0A=
		fb0_carveout {=0A=
			reg =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
			reg-names =3D "surface", "lut";=0A=
			no-map;=0A=
			linux,phandle =3D <0x5d>;=0A=
			phandle =3D <0x5d>;=0A=
		};=0A=
=0A=
		fb1_carveout {=0A=
			reg =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
			reg-names =3D "surface", "lut";=0A=
			no-map;=0A=
			linux,phandle =3D <0x66>;=0A=
			phandle =3D <0x66>;=0A=
		};=0A=
	};=0A=
=0A=
	tegra-carveouts {=0A=
		compatible =3D "nvidia,carveouts";=0A=
		iommus =3D <0x2b 0x6>;=0A=
		memory-region =3D <0x2c 0x2d>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	iommu {=0A=
		compatible =3D "nvidia,tegra210-smmu";=0A=
		reg =3D <0x0 0x70019000 0x0 0x1000 0x0 0x6000c000 0x0 0x1000>;=0A=
		status =3D "okay";=0A=
		#asids =3D <0x80>;=0A=
		dma-window =3D <0x0 0x80000000 0x0 0x7ff00000>;=0A=
		#iommu-cells =3D <0x1>;=0A=
		swgid-mask =3D <0x100fff 0xfffccdcf>;=0A=
		#num-translation-enable =3D <0x5>;=0A=
		#num-asid-security =3D <0x8>;=0A=
		domains =3D <0x2e 0x1004000 0x49 0x2f 0x80000000 0x0 0x30 0x0 0x4 0x31 =
0x404 0x0 0x31 0x8 0x0 0x32 0x1 0x0 0x32 0x2000000 0x0 0x32 0x4000000 =
0x0 0x32 0x8000000 0x0 0x32 0x10000000 0x0 0x32 0x2 0x0 0x32 0x0 =
0x100000 0x32 0xffffffff 0xffffffff>;=0A=
		linux,phandle =3D <0x2b>;=0A=
		phandle =3D <0x2b>;=0A=
=0A=
		address-space-prop {=0A=
=0A=
			common {=0A=
				iova-start =3D <0x0 0x80000000>;=0A=
				iova-size =3D <0x0 0x7ff00000>;=0A=
				num-pf-page =3D <0x0>;=0A=
				gap-page =3D <0x1>;=0A=
				linux,phandle =3D <0x32>;=0A=
				phandle =3D <0x32>;=0A=
			};=0A=
=0A=
			ppcs {=0A=
				iova-start =3D <0x0 0x80000000>;=0A=
				iova-size =3D <0x0 0x7ff00000>;=0A=
				num-pf-page =3D <0x1>;=0A=
				gap-page =3D <0x1>;=0A=
				linux,phandle =3D <0x2e>;=0A=
				phandle =3D <0x2e>;=0A=
			};=0A=
=0A=
			dc {=0A=
				iova-start =3D <0x0 0x10000>;=0A=
				iova-size =3D <0x0 0xfffeffff>;=0A=
				num-pf-page =3D <0x0>;=0A=
				gap-page =3D <0x0>;=0A=
				linux,phandle =3D <0x31>;=0A=
				phandle =3D <0x31>;=0A=
			};=0A=
=0A=
			gpu {=0A=
				iova-start =3D <0x0 0x100000>;=0A=
				iova-size =3D <0x3 0xffefffff>;=0A=
				alignment =3D <0x20000>;=0A=
				num-pf-page =3D <0x0>;=0A=
				gap-page =3D <0x0>;=0A=
				linux,phandle =3D <0x2f>;=0A=
				phandle =3D <0x2f>;=0A=
			};=0A=
=0A=
			ape {=0A=
				iova-start =3D <0x0 0x70300000>;=0A=
				iova-size =3D <0x0 0x8fc00000>;=0A=
				num-pf-page =3D <0x0>;=0A=
				gap-page =3D <0x1>;=0A=
				linux,phandle =3D <0x30>;=0A=
				phandle =3D <0x30>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	smmu_test {=0A=
		compatible =3D "nvidia,smmu_test";=0A=
		iommus =3D <0x2b 0x34>;=0A=
		linux,phandle =3D <0xe9>;=0A=
		phandle =3D <0xe9>;=0A=
	};=0A=
=0A=
	dma_test {=0A=
		compatible =3D "nvidia,dma_test";=0A=
		linux,phandle =3D <0xea>;=0A=
		phandle =3D <0xea>;=0A=
	};=0A=
=0A=
	bpmp {=0A=
		compatible =3D "nvidia,tegra210-bpmp";=0A=
		carveout-start =3D <0x80005000>;=0A=
		carveout-size =3D <0x10000>;=0A=
		resets =3D <0x21 0x1>;=0A=
		reset-names =3D "cop";=0A=
		clocks =3D <0x21 0x1ae>;=0A=
		clock-names =3D "sclk";=0A=
		reg =3D <0x0 0x70016000 0x0 0x2000 0x0 0x60001000 0x0 0x1000>;=0A=
		iommus =3D <0x2b 0x1>;=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	mc {=0A=
		compatible =3D "nvidia,tegra-mc";=0A=
		reg-ranges =3D <0xa>;=0A=
		reg =3D <0x0 0x70019000 0x0 0xc 0x0 0x70019050 0x0 0x19c 0x0 =
0x70019200 0x0 0x24 0x0 0x7001929c 0x0 0x1b8 0x0 0x70019464 0x0 0x198 =
0x0 0x70019604 0x0 0x3b0 0x0 0x700199bc 0x0 0x20 0x0 0x700199f8 0x0 0x8c =
0x0 0x70019ae4 0x0 0xb0 0x0 0x70019ba0 0x0 0x460 0x0 0x7001c000 0x0 0xc =
0x0 0x7001c050 0x0 0x198 0x0 0x7001c200 0x0 0x24 0x0 0x7001c29c 0x0 =
0x1b8 0x0 0x7001c464 0x0 0x198 0x0 0x7001c604 0x0 0x3b0 0x0 0x7001c9bc =
0x0 0x20 0x0 0x7001c9f8 0x0 0x8c 0x0 0x7001cae4 0x0 0xb0 0x0 0x7001cba0 =
0x0 0x460 0x0 0x7001d000 0x0 0xc 0x0 0x7001d050 0x0 0x198 0x0 0x7001d200 =
0x0 0x24 0x0 0x7001d29c 0x0 0x1b8 0x0 0x7001d464 0x0 0x198 0x0 =
0x7001d604 0x0 0x3b0 0x0 0x7001d9bc 0x0 0x20 0x0 0x7001d9f8 0x0 0x8c 0x0 =
0x7001dae4 0x0 0xb0 0x0 0x7001dba0 0x0 0x460>;=0A=
		interrupts =3D <0x0 0x4d 0x4>;=0A=
		int_mask =3D <0x23d40>;=0A=
		channels =3D <0x2>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	interrupt-controller {=0A=
		compatible =3D "arm,cortex-a15-gic";=0A=
		interrupt-parent =3D <0x33>;=0A=
		#interrupt-cells =3D <0x3>;=0A=
		interrupt-controller;=0A=
		reg =3D <0x0 0x50041000 0x0 0x1000 0x0 0x50042000 0x0 0x2000 0x0 =
0x50044000 0x0 0x2000 0x0 0x50046000 0x0 0x2000>;=0A=
		status =3D "okay";=0A=
		interrupts =3D <0x1 0x9 0xf04>;=0A=
		linux,phandle =3D <0x33>;=0A=
		phandle =3D <0x33>;=0A=
	};=0A=
=0A=
	interrupt-controller@60004000 {=0A=
		compatible =3D "nvidia,tegra210-ictlr";=0A=
		interrupt-parent =3D <0x33>;=0A=
		interrupt-controller;=0A=
		#interrupt-cells =3D <0x3>;=0A=
		reg =3D <0x0 0x60004000 0x0 0x40 0x0 0x60004100 0x0 0x40 0x0 =
0x60004200 0x0 0x40 0x0 0x60004300 0x0 0x40 0x0 0x60004400 0x0 0x40 0x0 =
0x60004500 0x0 0x40>;=0A=
		interrupts =3D <0x0 0x4 0x4 0x0 0x5 0x4 0x0 0x7 0x4 0x0 0x12 0x4>;=0A=
		outgoing-doorbell =3D <0x6>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x1>;=0A=
		phandle =3D <0x1>;=0A=
	};=0A=
=0A=
	flow-controller@60007000 {=0A=
		compatible =3D "nvidia,tegra210-flowctrl";=0A=
		reg =3D <0x0 0x60007000 0x0 0x1000>;=0A=
	};=0A=
=0A=
	ahb@6000c000 {=0A=
		compatible =3D "nvidia,tegra210-ahb", "nvidia,tegra30-ahb";=0A=
		reg =3D <0x0 0x6000c000 0x0 0x14f>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0xeb>;=0A=
		phandle =3D <0xeb>;=0A=
	};=0A=
=0A=
	aconnect@702c0000 {=0A=
		compatible =3D "nvidia,tegra210-aconnect";=0A=
		clocks =3D <0x21 0xc6 0x21 0x6b>;=0A=
		clock-names =3D "ape", "apb2ape";=0A=
		power-domains =3D <0x22>;=0A=
		#address-cells =3D <0x2>;=0A=
		#size-cells =3D <0x2>;=0A=
		ranges;=0A=
		status =3D "okay";=0A=
=0A=
		agic@702f9000 {=0A=
			compatible =3D "nvidia,tegra210-agic";=0A=
			#interrupt-cells =3D <0x4>;=0A=
			interrupt-controller;=0A=
			reg =3D <0x0 0x702f9000 0x0 0x2000 0x0 0x702fa000 0x0 0x2000>;=0A=
			interrupts =3D <0x0 0x66 0xf04>;=0A=
			clocks =3D <0x21 0xc6>;=0A=
			clock-names =3D "clk";=0A=
			linux,phandle =3D <0x34>;=0A=
			phandle =3D <0x34>;=0A=
		};=0A=
=0A=
		adsp {=0A=
			compatible =3D "nvidia,tegra210-adsp";=0A=
			wakeup-disable;=0A=
			interrupt-parent =3D <0x34>;=0A=
			reg =3D <0x0 0x702ef000 0x0 0x1000 0x0 0x702ec000 0x0 0x2000 0x0 =
0x702ee000 0x0 0x1000 0x0 0x702dc800 0x0 0x0 0x0 0x0 0x0 0x1 0x0 =
0x1000000 0x0 0x6f2c0000 0x0 0x70300000 0x0 0x8fd00000>;=0A=
			iommus =3D <0x2b 0x22>;=0A=
			dma-mask =3D <0x0 0xfff00000>;=0A=
			iommu-resv-regions =3D <0x0 0x0 0x0 0x70300000 0x0 0xfff00000 =
0xffffffff 0xffffffff>;=0A=
			iommu-group-id =3D <0x2>;=0A=
			nvidia,adsp_mem =3D <0x80300000 0x1000000 0x80b00000 0x800000 =
0x400000 0x10000 0x80300000 0x200000>;=0A=
			nvidia,adsp-evp-base =3D <0x702ef700 0x40>;=0A=
			interrupts =3D <0x0 0x5 0x4 0x0 0x0 0x0 0x4 0x0 0x0 0x2f 0x4 0x0 0x0 =
0x34 0x4 0x0 0x0 0x32 0x4 0x0 0x0 0x37 0x4 0x0 0x0 0x4 0x4 0x1 0x0 0x1 =
0x4 0x1 0x0 0x2 0x4 0x1>;=0A=
			clocks =3D <0x21 0x200 0x21 0x6b 0x21 0xda 0x21 0xc7 0x21 0x205>;=0A=
			clock-names =3D "adsp.ape", "adsp.apb2ape", "adspneon", "adsp", =
"adsp_cpu_abus";=0A=
			resets =3D <0x21 0xe1>;=0A=
			reset-names =3D "adspall";=0A=
			nvidia,adsp_unit_fpga_reset =3D <0x0 0x40>;=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		adma@702e2000 {=0A=
			compatible =3D "nvidia,tegra210-adma";=0A=
			interrupt-parent =3D <0x34>;=0A=
			reg =3D <0x0 0x702e2000 0x0 0x2000 0x0 0x702ec000 0x0 0x72>;=0A=
			clocks =3D <0x21 0x6a>;=0A=
			clock-names =3D "d_audio";=0A=
			interrupts =3D <0x0 0x18 0x4 0x0 0x0 0x19 0x4 0x0 0x0 0x1a 0x4 0x0 =
0x0 0x1b 0x4 0x0 0x0 0x1c 0x4 0x0 0x0 0x1d 0x4 0x0 0x0 0x1e 0x4 0x0 0x0 =
0x1f 0x4 0x0 0x0 0x20 0x4 0x0 0x0 0x21 0x4 0x0 0x0 0x22 0x4 0x0 0x0 0x23 =
0x4 0x0 0x0 0x24 0x4 0x0 0x0 0x25 0x4 0x0 0x0 0x26 0x4 0x0 0x0 0x27 0x4 =
0x0 0x0 0x28 0x4 0x0 0x0 0x29 0x4 0x0 0x0 0x2a 0x4 0x0 0x0 0x2b 0x4 0x0 =
0x0 0x2c 0x4 0x0 0x0 0x2d 0x4 0x0>;=0A=
			#dma-cells =3D <0x1>;=0A=
			status =3D "okay";=0A=
			linux,phandle =3D <0x35>;=0A=
			phandle =3D <0x35>;=0A=
		};=0A=
=0A=
		ahub {=0A=
			compatible =3D "nvidia,tegra210-axbar";=0A=
			wakeup-disable;=0A=
			reg =3D <0x0 0x702d0800 0x0 0x800>;=0A=
			clocks =3D <0x21 0x6a 0x21 0xf9 0x21 0xc6 0x21 0x6b>;=0A=
			clock-names =3D "ahub", "parent", "xbar.ape", "apb2ape";=0A=
			assigned-clocks =3D <0x21 0x6a>;=0A=
			assigned-clock-parents =3D <0x21 0xf3>;=0A=
			assigned-clock-rates =3D <0x4dd1e00>;=0A=
			status =3D "okay";=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x1>;=0A=
			ranges =3D <0x702d0000 0x0 0x702d0000 0x10000>;=0A=
			linux,phandle =3D <0x4d>;=0A=
			phandle =3D <0x4d>;=0A=
=0A=
			admaif@0x702d0000 {=0A=
				compatible =3D "nvidia,tegra210-admaif";=0A=
				reg =3D <0x702d0000 0x800>;=0A=
				dmas =3D <0x35 0x1 0x35 0x1 0x35 0x2 0x35 0x2 0x35 0x3 0x35 0x3 0x35 =
0x4 0x35 0x4 0x35 0x5 0x35 0x5 0x35 0x6 0x35 0x6 0x35 0x7 0x35 0x7 0x35 =
0x8 0x35 0x8 0x35 0x9 0x35 0x9 0x35 0xa 0x35 0xa>;=0A=
				dma-names =3D "rx1", "tx1", "rx2", "tx2", "rx3", "tx3", "rx4", =
"tx4", "rx5", "tx5", "rx6", "tx6", "rx7", "tx7", "rx8", "tx8", "rx9", =
"tx9", "rx10", "tx10";=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xec>;=0A=
				phandle =3D <0xec>;=0A=
			};=0A=
=0A=
			sfc@702d2000 {=0A=
				compatible =3D "nvidia,tegra210-sfc";=0A=
				reg =3D <0x702d2000 0x200>;=0A=
				nvidia,ahub-sfc-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xed>;=0A=
				phandle =3D <0xed>;=0A=
			};=0A=
=0A=
			sfc@702d2200 {=0A=
				compatible =3D "nvidia,tegra210-sfc";=0A=
				reg =3D <0x702d2200 0x200>;=0A=
				nvidia,ahub-sfc-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xee>;=0A=
				phandle =3D <0xee>;=0A=
			};=0A=
=0A=
			sfc@702d2400 {=0A=
				compatible =3D "nvidia,tegra210-sfc";=0A=
				reg =3D <0x702d2400 0x200>;=0A=
				nvidia,ahub-sfc-id =3D <0x2>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xef>;=0A=
				phandle =3D <0xef>;=0A=
			};=0A=
=0A=
			sfc@702d2600 {=0A=
				compatible =3D "nvidia,tegra210-sfc";=0A=
				reg =3D <0x702d2600 0x200>;=0A=
				nvidia,ahub-sfc-id =3D <0x3>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf0>;=0A=
				phandle =3D <0xf0>;=0A=
			};=0A=
=0A=
			spkprot@702d8c00 {=0A=
				compatible =3D "nvidia,tegra210-spkprot";=0A=
				reg =3D <0x702d8c00 0x400>;=0A=
				nvidia,ahub-spkprot-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
			};=0A=
=0A=
			amixer@702dbb00 {=0A=
				compatible =3D "nvidia,tegra210-amixer";=0A=
				reg =3D <0x702dbb00 0x800>;=0A=
				nvidia,ahub-amixer-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf1>;=0A=
				phandle =3D <0xf1>;=0A=
			};=0A=
=0A=
			i2s@702d1000 {=0A=
				compatible =3D "nvidia,tegra210-i2s";=0A=
				reg =3D <0x702d1000 0x100>;=0A=
				nvidia,ahub-i2s-id =3D <0x0>;=0A=
				status =3D "disabled";=0A=
				clocks =3D <0x21 0x1e 0x21 0xf9 0x21 0x109 0x21 0x15e>;=0A=
				clock-names =3D "i2s", "i2s_clk_parent", "ext_audio_sync", =
"audio_sync";=0A=
				assigned-clocks =3D <0x21 0x1e>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x177000>;=0A=
				pinctrl-names =3D "dap_active", "dap_inactive";=0A=
				pinctrl-0;=0A=
				pinctrl-1;=0A=
				linux,phandle =3D <0xae>;=0A=
				phandle =3D <0xae>;=0A=
			};=0A=
=0A=
			i2s@702d1100 {=0A=
				compatible =3D "nvidia,tegra210-i2s";=0A=
				reg =3D <0x702d1100 0x100>;=0A=
				nvidia,ahub-i2s-id =3D <0x1>;=0A=
				status =3D "disabled";=0A=
				clocks =3D <0x21 0xb 0x21 0xf9 0x21 0x10a 0x21 0x15f>;=0A=
				clock-names =3D "i2s", "i2s_clk_parent", "ext_audio_sync", =
"audio_sync";=0A=
				assigned-clocks =3D <0x21 0xb>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x177000>;=0A=
				pinctrl-names =3D "dap_active", "dap_inactive";=0A=
				pinctrl-0;=0A=
				pinctrl-1;=0A=
				linux,phandle =3D <0xf2>;=0A=
				phandle =3D <0xf2>;=0A=
			};=0A=
=0A=
			i2s@702d1200 {=0A=
				compatible =3D "nvidia,tegra210-i2s";=0A=
				reg =3D <0x702d1200 0x100>;=0A=
				nvidia,ahub-i2s-id =3D <0x2>;=0A=
				status =3D "okay";=0A=
				clocks =3D <0x21 0x12 0x21 0xf9 0x21 0x10b 0x21 0x160>;=0A=
				clock-names =3D "i2s", "i2s_clk_parent", "ext_audio_sync", =
"audio_sync";=0A=
				assigned-clocks =3D <0x21 0x12>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x177000>;=0A=
				prod-name =3D "i2s2_prod";=0A=
				pinctrl-names =3D "dap_active", "dap_inactive";=0A=
				pinctrl-0;=0A=
				pinctrl-1;=0A=
				regulator-supplies =3D "vdd-1v8-dmic";=0A=
				vdd-1v8-dmic-supply =3D <0x36>;=0A=
				fsync-width =3D <0xf>;=0A=
				linux,phandle =3D <0x50>;=0A=
				phandle =3D <0x50>;=0A=
			};=0A=
=0A=
			i2s@702d1300 {=0A=
				compatible =3D "nvidia,tegra210-i2s";=0A=
				reg =3D <0x702d1300 0x100>;=0A=
				nvidia,ahub-i2s-id =3D <0x3>;=0A=
				status =3D "okay";=0A=
				clocks =3D <0x21 0x65 0x21 0xf9 0x21 0x10c 0x21 0x161>;=0A=
				clock-names =3D "i2s", "i2s_clk_parent", "ext_audio_sync", =
"audio_sync";=0A=
				assigned-clocks =3D <0x21 0x65>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x177000>;=0A=
				pinctrl-names =3D "dap_active", "dap_inactive";=0A=
				pinctrl-0;=0A=
				pinctrl-1;=0A=
				regulator-supplies =3D "vddio-uart";=0A=
				vddio-uart-supply =3D <0x36>;=0A=
				fsync-width =3D <0xf>;=0A=
				enable-cya;=0A=
				linux,phandle =3D <0x4e>;=0A=
				phandle =3D <0x4e>;=0A=
			};=0A=
=0A=
			i2s@702d1400 {=0A=
				compatible =3D "nvidia,tegra210-i2s";=0A=
				reg =3D <0x702d1400 0x100>;=0A=
				nvidia,ahub-i2s-id =3D <0x4>;=0A=
				status =3D "disabled";=0A=
				clocks =3D <0x21 0x66 0x21 0xf9 0x21 0x10d 0x21 0x162>;=0A=
				clock-names =3D "i2s", "i2s_clk_parent", "ext_audio_sync", =
"audio_sync";=0A=
				assigned-clocks =3D <0x21 0x66>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x177000>;=0A=
				pinctrl-names =3D "dap_active", "dap_inactive";=0A=
				pinctrl-0;=0A=
				pinctrl-1;=0A=
				linux,phandle =3D <0xf3>;=0A=
				phandle =3D <0xf3>;=0A=
			};=0A=
=0A=
			amx@702d3000 {=0A=
				compatible =3D "nvidia,tegra210-amx";=0A=
				reg =3D <0x702d3000 0x100>;=0A=
				nvidia,ahub-amx-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf4>;=0A=
				phandle =3D <0xf4>;=0A=
			};=0A=
=0A=
			amx@702d3100 {=0A=
				compatible =3D "nvidia,tegra210-amx";=0A=
				reg =3D <0x702d3100 0x100>;=0A=
				nvidia,ahub-amx-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf5>;=0A=
				phandle =3D <0xf5>;=0A=
			};=0A=
=0A=
			adx@702d3800 {=0A=
				compatible =3D "nvidia,tegra210-adx";=0A=
				reg =3D <0x702d3800 0x100>;=0A=
				nvidia,ahub-adx-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf6>;=0A=
				phandle =3D <0xf6>;=0A=
			};=0A=
=0A=
			adx@702d3900 {=0A=
				compatible =3D "nvidia,tegra210-adx";=0A=
				reg =3D <0x702d3900 0x100>;=0A=
				nvidia,ahub-adx-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf7>;=0A=
				phandle =3D <0xf7>;=0A=
			};=0A=
=0A=
			dmic@702d4000 {=0A=
				compatible =3D "nvidia,tegra210-dmic";=0A=
				reg =3D <0x702d4000 0x100>;=0A=
				nvidia,ahub-dmic-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				clocks =3D <0x21 0xa1 0x21 0xf9>;=0A=
				clock-names =3D "dmic", "parent";=0A=
				assigned-clocks =3D <0x21 0xa1>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x2ee000>;=0A=
				regulator-supplies =3D "vdd-1v8-dmic";=0A=
				vdd-1v8-dmic-supply =3D <0x36>;=0A=
				linux,phandle =3D <0x52>;=0A=
				phandle =3D <0x52>;=0A=
			};=0A=
=0A=
			dmic@702d4100 {=0A=
				compatible =3D "nvidia,tegra210-dmic";=0A=
				reg =3D <0x702d4100 0x100>;=0A=
				nvidia,ahub-dmic-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				clocks =3D <0x21 0xa2 0x21 0xf9>;=0A=
				clock-names =3D "dmic", "parent";=0A=
				assigned-clocks =3D <0x21 0xa2>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x2ee000>;=0A=
				regulator-supplies =3D "vdd-1v8-dmic";=0A=
				vdd-1v8-dmic-supply =3D <0x36>;=0A=
				linux,phandle =3D <0x54>;=0A=
				phandle =3D <0x54>;=0A=
			};=0A=
=0A=
			dmic@702d4200 {=0A=
				compatible =3D "nvidia,tegra210-dmic";=0A=
				reg =3D <0x702d4200 0x100>;=0A=
				nvidia,ahub-dmic-id =3D <0x2>;=0A=
				status =3D "disabled";=0A=
				clocks =3D <0x21 0xc5 0x21 0xf9>;=0A=
				clock-names =3D "dmic", "parent";=0A=
				assigned-clocks =3D <0x21 0xc5>;=0A=
				assigned-clock-parents =3D <0x21 0xf9>;=0A=
				assigned-clock-rates =3D <0x2ee000>;=0A=
				linux,phandle =3D <0xf8>;=0A=
				phandle =3D <0xf8>;=0A=
			};=0A=
=0A=
			afc@702d7000 {=0A=
				compatible =3D "nvidia,tegra210-afc";=0A=
				reg =3D <0x702d7000 0x100>;=0A=
				nvidia,ahub-afc-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xf9>;=0A=
				phandle =3D <0xf9>;=0A=
			};=0A=
=0A=
			afc@702d7100 {=0A=
				compatible =3D "nvidia,tegra210-afc";=0A=
				reg =3D <0x702d7100 0x100>;=0A=
				nvidia,ahub-afc-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xfa>;=0A=
				phandle =3D <0xfa>;=0A=
			};=0A=
=0A=
			afc@702d7200 {=0A=
				compatible =3D "nvidia,tegra210-afc";=0A=
				reg =3D <0x702d7200 0x100>;=0A=
				nvidia,ahub-afc-id =3D <0x2>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xfb>;=0A=
				phandle =3D <0xfb>;=0A=
			};=0A=
=0A=
			afc@702d7300 {=0A=
				compatible =3D "nvidia,tegra210-afc";=0A=
				reg =3D <0x702d7300 0x100>;=0A=
				nvidia,ahub-afc-id =3D <0x3>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xfc>;=0A=
				phandle =3D <0xfc>;=0A=
			};=0A=
=0A=
			afc@702d7400 {=0A=
				compatible =3D "nvidia,tegra210-afc";=0A=
				reg =3D <0x702d7400 0x100>;=0A=
				nvidia,ahub-afc-id =3D <0x4>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xfd>;=0A=
				phandle =3D <0xfd>;=0A=
			};=0A=
=0A=
			afc@702d7500 {=0A=
				compatible =3D "nvidia,tegra210-afc";=0A=
				reg =3D <0x702d7500 0x100>;=0A=
				nvidia,ahub-afc-id =3D <0x5>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xfe>;=0A=
				phandle =3D <0xfe>;=0A=
			};=0A=
=0A=
			mvc@702da000 {=0A=
				compatible =3D "nvidia,tegra210-mvc";=0A=
				reg =3D <0x702da000 0x200>;=0A=
				nvidia,ahub-mvc-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0xff>;=0A=
				phandle =3D <0xff>;=0A=
			};=0A=
=0A=
			mvc@702da200 {=0A=
				compatible =3D "nvidia,tegra210-mvc";=0A=
				reg =3D <0x702da200 0x200>;=0A=
				nvidia,ahub-mvc-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0x100>;=0A=
				phandle =3D <0x100>;=0A=
			};=0A=
=0A=
			iqc@702de000 {=0A=
				compatible =3D "nvidia,tegra210-iqc";=0A=
				reg =3D <0x702de000 0x200>;=0A=
				nvidia,ahub-iqc-id =3D <0x0>;=0A=
				status =3D "disabled";=0A=
				linux,phandle =3D <0x101>;=0A=
				phandle =3D <0x101>;=0A=
			};=0A=
=0A=
			iqc@702de200 {=0A=
				compatible =3D "nvidia,tegra210-iqc";=0A=
				reg =3D <0x702de200 0x200>;=0A=
				nvidia,ahub-iqc-id =3D <0x1>;=0A=
				status =3D "disabled";=0A=
				linux,phandle =3D <0x102>;=0A=
				phandle =3D <0x102>;=0A=
			};=0A=
=0A=
			ope@702d8000 {=0A=
				compatible =3D "nvidia,tegra210-ope";=0A=
				reg =3D <0x702d8000 0x100 0x702d8100 0x100 0x702d8200 0x200>;=0A=
				nvidia,ahub-ope-id =3D <0x0>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0x103>;=0A=
				phandle =3D <0x103>;=0A=
=0A=
				peq@702d8100 {=0A=
					status =3D "okay";=0A=
				};=0A=
=0A=
				mbdrc@702d8200 {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			ope@702d8400 {=0A=
				compatible =3D "nvidia,tegra210-ope";=0A=
				reg =3D <0x702d8400 0x100 0x702d8500 0x100 0x702d8600 0x200>;=0A=
				nvidia,ahub-ope-id =3D <0x1>;=0A=
				status =3D "okay";=0A=
				linux,phandle =3D <0x104>;=0A=
				phandle =3D <0x104>;=0A=
=0A=
				peq@702d8500 {=0A=
					status =3D "okay";=0A=
				};=0A=
=0A=
				mbdrc@702d8600 {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			mvc@0x702da200 {=0A=
				status =3D "okay";=0A=
			};=0A=
		};=0A=
=0A=
		adsp_audio {=0A=
			compatible =3D "nvidia,tegra210-adsp-audio";=0A=
			wakeup-disable;=0A=
			iommus =3D <0x2b 0x22>;=0A=
			iommu-resv-regions =3D <0x0 0x0 0x0 0x70300000 0x0 0xfff00000 =
0xffffffff 0xffffffff>;=0A=
			iommu-group-id =3D <0x2>;=0A=
			nvidia,adma_ch_start =3D <0xb>;=0A=
			nvidia,adma_ch_cnt =3D <0xb>;=0A=
			interrupt-parent =3D <0x34>;=0A=
			interrupts =3D <0x0 0x23 0x4 0x1 0x0 0x24 0x4 0x1 0x0 0x25 0x4 0x1 =
0x0 0x26 0x4 0x1 0x0 0x27 0x4 0x1 0x0 0x28 0x4 0x1 0x0 0x29 0x4 0x1 0x0 =
0x2a 0x4 0x1 0x0 0x2b 0x4 0x1 0x0 0x2c 0x4 0x1 0x0 0x2d 0x4 0x1>;=0A=
			clocks =3D <0x21 0x6a 0x21 0xc6>;=0A=
			clock-names =3D "ahub", "ape";=0A=
			status =3D "okay";=0A=
			linux,phandle =3D <0x105>;=0A=
			phandle =3D <0x105>;=0A=
		};=0A=
	};=0A=
=0A=
	timer {=0A=
		compatible =3D "arm,armv8-timer";=0A=
		interrupt-parent =3D <0x33>;=0A=
		interrupts =3D <0x1 0xd 0xf08 0x1 0xe 0xf08 0x1 0xb 0xf08 0x1 0xa =
0xf08>;=0A=
		clock-frequency =3D <0x124f800>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	timer@60005000 {=0A=
		compatible =3D "nvidia,tegra210-timer", "nvidia,tegra30-timer", =
"nvidia,tegra30-timer-wdt";=0A=
		reg =3D <0x0 0x60005000 0x0 0x400>;=0A=
		interrupts =3D <0x0 0xb0 0x4 0x0 0xb1 0x4 0x0 0xb2 0x4 0x0 0xb3 0x4>;=0A=
		clocks =3D <0x21 0x5>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	rtc {=0A=
		compatible =3D "nvidia,tegra-rtc";=0A=
		reg =3D <0x0 0x7000e000 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x2 0x4>;=0A=
		status =3D "okay";=0A=
		nvidia,pmc-wakeup =3D <0x37 0x1 0x10 0x4>;=0A=
	};=0A=
=0A=
	dma@60020000 {=0A=
		compatible =3D "nvidia,tegra148-apbdma";=0A=
		reg =3D <0x0 0x60020000 0x0 0x1400>;=0A=
		clocks =3D <0x21 0x22>;=0A=
		clock-names =3D "dma";=0A=
		resets =3D <0x21 0x22>;=0A=
		reset-names =3D "dma";=0A=
		interrupts =3D <0x0 0x68 0x4 0x0 0x69 0x4 0x0 0x6a 0x4 0x0 0x6b 0x4 =
0x0 0x6c 0x4 0x0 0x6d 0x4 0x0 0x6e 0x4 0x0 0x6f 0x4 0x0 0x70 0x4 0x0 =
0x71 0x4 0x0 0x72 0x4 0x0 0x73 0x4 0x0 0x74 0x4 0x0 0x75 0x4 0x0 0x76 =
0x4 0x0 0x77 0x4 0x0 0x80 0x4 0x0 0x81 0x4 0x0 0x82 0x4 0x0 0x83 0x4 0x0 =
0x84 0x4 0x0 0x85 0x4 0x0 0x86 0x4 0x0 0x87 0x4 0x0 0x88 0x4 0x0 0x89 =
0x4 0x0 0x8a 0x4 0x0 0x8b 0x4 0x0 0x8c 0x4 0x0 0x8d 0x4 0x0 0x8e 0x4 0x0 =
0x8f 0x4>;=0A=
		#dma-cells =3D <0x1>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x4c>;=0A=
		phandle =3D <0x4c>;=0A=
	};=0A=
=0A=
	pinmux@700008d4 {=0A=
		compatible =3D "nvidia,tegra210-pinmux";=0A=
		reg =3D <0x0 0x700008d4 0x0 0x2a5 0x0 0x70003000 0x0 0x294>;=0A=
		#gpio-range-cells =3D <0x3>;=0A=
		status =3D "okay";=0A=
		pinctrl-names =3D "default", "drive", "unused";=0A=
		pinctrl-0 =3D <0x38>;=0A=
		pinctrl-1 =3D <0x39>;=0A=
		pinctrl-2 =3D <0x3a>;=0A=
		linux,phandle =3D <0x3b>;=0A=
		phandle =3D <0x3b>;=0A=
=0A=
		clkreq_0_bi_dir {=0A=
			linux,phandle =3D <0x7b>;=0A=
			phandle =3D <0x7b>;=0A=
=0A=
			clkreq0 {=0A=
				nvidia,pins =3D "pex_l0_clkreq_n_pa1";=0A=
				nvidia,tristate =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		clkreq_1_bi_dir {=0A=
			linux,phandle =3D <0x7c>;=0A=
			phandle =3D <0x7c>;=0A=
=0A=
			clkreq1 {=0A=
				nvidia,pins =3D "pex_l1_clkreq_n_pa4";=0A=
				nvidia,tristate =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		clkreq_0_in_dir {=0A=
			linux,phandle =3D <0x7d>;=0A=
			phandle =3D <0x7d>;=0A=
=0A=
			clkreq0 {=0A=
				nvidia,pins =3D "pex_l0_clkreq_n_pa1";=0A=
				nvidia,tristate =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		clkreq_1_in_dir {=0A=
			linux,phandle =3D <0x7e>;=0A=
			phandle =3D <0x7e>;=0A=
=0A=
			clkreq1 {=0A=
				nvidia,pins =3D "pex_l1_clkreq_n_pa4";=0A=
				nvidia,tristate =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x4>;=0A=
=0A=
			prod {=0A=
				status =3D "okay";=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0x1c4 0xf7f7f000 0x51212000 0x0 0x128 0x1f1f000 =
0x1010000 0x0 0x12c 0x1f1f000 0x1010000 0x0 0x1c8 0xf0003ffd 0x1040 0x0 =
0x1dc 0xf7f7f000 0x51212000 0x0 0x1e0 0xf0003ffd 0x1040 0x0 0x23c =
0x1f1f000 0x1f1f000 0x0 0x20 0x1f1f000 0x1010000 0x0 0x44 0x1f1f000 =
0x1010000 0x0 0x50 0x1f1f000 0x1010000 0x0 0x58 0x1f1f000 0x1010000 0x0 =
0x5c 0x1f1f000 0x1010000 0x0 0xa0 0x1f1f000 0x1010000 0x0 0xa4 0x1f1f000 =
0x1010000 0x0 0xa8 0x1f1f000 0x1010000 0x0 0xac 0x1f1f000 0x1010000 0x0 =
0xb0 0x1f1f000 0x1f1f000 0x0 0xb4 0x1f1f000 0x1f1f000 0x0 0xb8 0x1f1f000 =
0x1f1f000 0x0 0xbc 0x1f1f000 0x1f1f000 0x0 0xc0 0x1f1f000 0x1f1f000 0x0 =
0xc4 0x1f1f000 0x1f1f000 0x1 0x0 0x7200 0x2000 0x1 0x4 0x7200 0x2000 0x1 =
0x8 0x7200 0x2000 0x1 0xc 0x7200 0x2000 0x1 0x10 0x7200 0x2000 0x1 0x14 =
0x7200 0x2000 0x1 0x1c 0x7200 0x2000 0x1 0x20 0x7200 0x2000 0x1 0x24 =
0x7200 0x2000 0x1 0x28 0x7200 0x2000 0x1 0x2c 0x7200 0x2000 0x1 0x30 =
0x7200 0x2000 0x1 0x160 0x1000 0x1000>;=0A=
			};=0A=
=0A=
			i2s2_prod {=0A=
				prod =3D <0x0 0xb0 0x1f1f000 0x1010000 0x0 0xb4 0x1f1f000 0x1010000 =
0x0 0xb8 0x1f1f000 0x1010000 0x0 0xbc 0x1f1f000 0x1010000>;=0A=
			};=0A=
=0A=
			spi1_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0x200 0xf0000000 0x50000000 0x0 0x204 0xf0000000 =
0x50000000 0x0 0x208 0xf0000000 0x50000000 0x0 0x20c 0xf0000000 =
0x50000000 0x0 0x210 0xf0000000 0x50000000 0x1 0x50 0x6000 0x6040 0x1 =
0x54 0x6000 0x6040 0x1 0x58 0x6000 0x6040 0x1 0x5c 0x6000 0x6040 0x1 =
0x60 0x6000 0x6040>;=0A=
			};=0A=
=0A=
			spi2_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0x214 0xf0000000 0xd0000000 0x0 0x218 0xf0000000 =
0xd0000000 0x0 0x21c 0xf0000000 0xd0000000 0x0 0x220 0xf0000000 =
0xd0000000 0x0 0x224 0xf0000000 0xd0000000 0x1 0x64 0x6000 0x6040 0x1 =
0x68 0x6000 0x6040 0x1 0x6c 0x6000 0x6040 0x1 0x70 0x6000 0x6040 0x1 =
0x74 0x6000 0x6040>;=0A=
			};=0A=
=0A=
			spi3_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0xcc 0x1404000 0x1414000 0x0 0xd0 0x1404000 0x1414000 =
0x0 0x140 0x1404000 0x1414000 0x0 0x144 0x1404000 0x1414000>;=0A=
			};=0A=
=0A=
			spi4_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0x268 0x1404000 0x1414000 0x0 0x26c 0x1404000 =
0x1414000 0x0 0x270 0x1404000 0x1414000 0x0 0x274 0x1404000 0x1414000>;=0A=
			};=0A=
=0A=
			i2c0_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0xd4 0x1f1f000 0x1f000 0x0 0xd8 0x1f1f000 0x1f000 0x1 =
0xbc 0x1100 0x0 0x1 0xc0 0x1100 0x0>;=0A=
			};=0A=
=0A=
			i2c1_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0xdc 0x1f1f000 0x1f000 0x0 0xe0 0x1f1f000 0x1f000 0x1 =
0xc4 0x1100 0x0 0x1 0xc8 0x1100 0x0>;=0A=
			};=0A=
=0A=
			i2c2_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0xe4 0x1f1f000 0x1f000 0x0 0xe8 0x1f1f000 0x1f000 0x1 =
0xcc 0x1100 0x0 0x1 0xd0 0x1100 0x0 0x0 0x60 0x1f1f000 0x1f000 0x0 0x64 =
0x1f1f000 0x1f000 0x1 0xd4 0x1100 0x0 0x1 0xd8 0x1100 0x0>;=0A=
			};=0A=
=0A=
			i2c4_prod {=0A=
				nvidia,prod-boot-init;=0A=
				prod =3D <0x0 0x198 0x1f1f000 0x1f000 0x0 0x19c 0x1f1f000 0x1f000 =
0x1 0xdc 0x1100 0x0 0x1 0xe0 0x1100 0x0>;=0A=
			};=0A=
=0A=
			i2c0_hs_prod {=0A=
				prod =3D <0x0 0xd4 0x1f1f000 0x1f1f000 0x0 0xd8 0x1f1f000 0x1f1f000 =
0x1 0xbc 0x1100 0x1000 0x1 0xc0 0x1100 0x1000>;=0A=
			};=0A=
=0A=
			i2c1_hs_prod {=0A=
				prod =3D <0x0 0xdc 0x1f1f000 0x1f1f000 0x0 0xe0 0x1f1f000 0x1f1f000 =
0x1 0xc4 0x1100 0x1000 0x1 0xc8 0x1100 0x1000>;=0A=
			};=0A=
=0A=
			i2c2_hs_prod {=0A=
				prod =3D <0x0 0xe4 0x1f1f000 0x1f1f000 0x0 0xe8 0x1f1f000 0x1f1f000 =
0x1 0xcc 0x1100 0x1000 0x1 0xd0 0x1100 0x1000 0x0 0x60 0x1f1f000 =
0x1f1f000 0x0 0x64 0x1f1f000 0x1f1f000 0x1 0xd4 0x1100 0x1000 0x1 0xd8 =
0x1100 0x1000>;=0A=
			};=0A=
=0A=
			i2c4_hs_prod {=0A=
				prod =3D <0x0 0x198 0x1f1f000 0x1f1f000 0x0 0x19c 0x1f1f000 =
0x1f1f000 0x1 0xdc 0x1100 0x1000 0x1 0xe0 0x1100 0x1000>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_schmitt_enable {=0A=
			linux,phandle =3D <0x90>;=0A=
			phandle =3D <0x90>;=0A=
=0A=
			sdmmc1 {=0A=
				nvidia,pins =3D "sdmmc1_cmd_pm1", "sdmmc1_dat0_pm5", =
"sdmmc1_dat1_pm4", "sdmmc1_dat2_pm3", "sdmmc1_dat3_pm2";=0A=
				nvidia,schmitt =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_schmitt_disable {=0A=
			linux,phandle =3D <0x91>;=0A=
			phandle =3D <0x91>;=0A=
=0A=
			sdmmc1 {=0A=
				nvidia,pins =3D "sdmmc1_cmd_pm1", "sdmmc1_dat0_pm5", =
"sdmmc1_dat1_pm4", "sdmmc1_dat2_pm3", "sdmmc1_dat3_pm2";=0A=
				nvidia,schmitt =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_clk_schmitt_enable {=0A=
			linux,phandle =3D <0x92>;=0A=
			phandle =3D <0x92>;=0A=
=0A=
			sdmmc1 {=0A=
				nvidia,pins =3D "sdmmc1_clk_pm0";=0A=
				nvidia,schmitt =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_clk_schmitt_disable {=0A=
			linux,phandle =3D <0x93>;=0A=
			phandle =3D <0x93>;=0A=
=0A=
			sdmmc1 {=0A=
				nvidia,pins =3D "sdmmc1_clk_pm0";=0A=
				nvidia,schmitt =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_drv_code {=0A=
			linux,phandle =3D <0x94>;=0A=
			phandle =3D <0x94>;=0A=
=0A=
			sdmmc1 {=0A=
				nvidia,pins =3D "drive_sdmmc1";=0A=
				nvidia,pull-down-strength =3D <0x15>;=0A=
				nvidia,pull-up-strength =3D <0x11>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_default_drv_code {=0A=
			linux,phandle =3D <0x95>;=0A=
			phandle =3D <0x95>;=0A=
=0A=
			sdmmc1 {=0A=
				nvidia,pins =3D "drive_sdmmc1";=0A=
				nvidia,pull-down-strength =3D <0x12>;=0A=
				nvidia,pull-up-strength =3D <0x12>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_schmitt_enable {=0A=
			linux,phandle =3D <0x88>;=0A=
			phandle =3D <0x88>;=0A=
=0A=
			sdmmc3 {=0A=
				nvidia,pins =3D "sdmmc3_cmd_pp1", "sdmmc3_dat0_pp5", =
"sdmmc3_dat1_pp4", "sdmmc3_dat2_pp3", "sdmmc3_dat3_pp2";=0A=
				nvidia,schmitt =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_schmitt_disable {=0A=
			linux,phandle =3D <0x89>;=0A=
			phandle =3D <0x89>;=0A=
=0A=
			sdmmc3 {=0A=
				nvidia,pins =3D "sdmmc3_cmd_pp1", "sdmmc3_dat0_pp5", =
"sdmmc3_dat1_pp4", "sdmmc3_dat2_pp3", "sdmmc3_dat3_pp2";=0A=
				nvidia,schmitt =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_clk_schmitt_enable {=0A=
			linux,phandle =3D <0x8a>;=0A=
			phandle =3D <0x8a>;=0A=
=0A=
			sdmmc3 {=0A=
				nvidia,pins =3D "sdmmc3_clk_pp0";=0A=
				nvidia,schmitt =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_clk_schmitt_disable {=0A=
			linux,phandle =3D <0x8b>;=0A=
			phandle =3D <0x8b>;=0A=
=0A=
			sdmmc3 {=0A=
				nvidia,pins =3D "sdmmc3_clk_pp0";=0A=
				nvidia,schmitt =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_drv_code {=0A=
			linux,phandle =3D <0x8c>;=0A=
			phandle =3D <0x8c>;=0A=
=0A=
			sdmmc3 {=0A=
				nvidia,pins =3D "drive_sdmmc3";=0A=
				nvidia,pull-down-strength =3D <0x15>;=0A=
				nvidia,pull-up-strength =3D <0x11>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_default_drv_code {=0A=
			linux,phandle =3D <0x8d>;=0A=
			phandle =3D <0x8d>;=0A=
=0A=
			sdmmc3 {=0A=
				nvidia,pins =3D "drive_sdmmc3";=0A=
				nvidia,pull-down-strength =3D <0x12>;=0A=
				nvidia,pull-up-strength =3D <0x12>;=0A=
			};=0A=
		};=0A=
=0A=
		dvfs_pwm_active {=0A=
			linux,phandle =3D <0x9b>;=0A=
			phandle =3D <0x9b>;=0A=
=0A=
			dvfs_pwm_pbb1 {=0A=
				nvidia,pins =3D "dvfs_pwm_pbb1";=0A=
				nvidia,tristate =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		dvfs_pwm_inactive {=0A=
			linux,phandle =3D <0x9c>;=0A=
			phandle =3D <0x9c>;=0A=
=0A=
			dvfs_pwm_pbb1 {=0A=
				nvidia,pins =3D "dvfs_pwm_pbb1";=0A=
				nvidia,tristate =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		common {=0A=
			linux,phandle =3D <0x38>;=0A=
			phandle =3D <0x38>;=0A=
=0A=
			dvfs_pwm_pbb1 {=0A=
				nvidia,pins =3D "dvfs_pwm_pbb1";=0A=
				nvidia,function =3D "cldvfs";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dmic1_clk_pe0 {=0A=
				nvidia,pins =3D "dmic1_clk_pe0";=0A=
				nvidia,function =3D "i2s3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dmic1_dat_pe1 {=0A=
				nvidia,pins =3D "dmic1_dat_pe1";=0A=
				nvidia,function =3D "i2s3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dmic2_clk_pe2 {=0A=
				nvidia,pins =3D "dmic2_clk_pe2";=0A=
				nvidia,function =3D "i2s3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dmic2_dat_pe3 {=0A=
				nvidia,pins =3D "dmic2_dat_pe3";=0A=
				nvidia,function =3D "i2s3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			pe7 {=0A=
				nvidia,pins =3D "pe7";=0A=
				nvidia,function =3D "pwm3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			gen3_i2c_scl_pf0 {=0A=
				nvidia,pins =3D "gen3_i2c_scl_pf0";=0A=
				nvidia,function =3D "i2c3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			gen3_i2c_sda_pf1 {=0A=
				nvidia,pins =3D "gen3_i2c_sda_pf1";=0A=
				nvidia,function =3D "i2c3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			cam_i2c_scl_ps2 {=0A=
				nvidia,pins =3D "cam_i2c_scl_ps2";=0A=
				nvidia,function =3D "i2cvi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			cam_i2c_sda_ps3 {=0A=
				nvidia,pins =3D "cam_i2c_sda_ps3";=0A=
				nvidia,function =3D "i2cvi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			cam1_mclk_ps0 {=0A=
				nvidia,pins =3D "cam1_mclk_ps0";=0A=
				nvidia,function =3D "extperiph3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cam2_mclk_ps1 {=0A=
				nvidia,pins =3D "cam2_mclk_ps1";=0A=
				nvidia,function =3D "extperiph3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pex_l0_clkreq_n_pa1 {=0A=
				nvidia,pins =3D "pex_l0_clkreq_n_pa1";=0A=
				nvidia,function =3D "pe0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			pex_l0_rst_n_pa0 {=0A=
				nvidia,pins =3D "pex_l0_rst_n_pa0";=0A=
				nvidia,function =3D "pe0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			pex_l1_clkreq_n_pa4 {=0A=
				nvidia,pins =3D "pex_l1_clkreq_n_pa4";=0A=
				nvidia,function =3D "pe1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			pex_l1_rst_n_pa3 {=0A=
				nvidia,pins =3D "pex_l1_rst_n_pa3";=0A=
				nvidia,function =3D "pe1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			pex_wake_n_pa2 {=0A=
				nvidia,pins =3D "pex_wake_n_pa2";=0A=
				nvidia,function =3D "pe";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc1_clk_pm0 {=0A=
				nvidia,pins =3D "sdmmc1_clk_pm0";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc1_cmd_pm1 {=0A=
				nvidia,pins =3D "sdmmc1_cmd_pm1";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc1_dat0_pm5 {=0A=
				nvidia,pins =3D "sdmmc1_dat0_pm5";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc1_dat1_pm4 {=0A=
				nvidia,pins =3D "sdmmc1_dat1_pm4";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc1_dat2_pm3 {=0A=
				nvidia,pins =3D "sdmmc1_dat2_pm3";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc1_dat3_pm2 {=0A=
				nvidia,pins =3D "sdmmc1_dat3_pm2";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc3_clk_pp0 {=0A=
				nvidia,pins =3D "sdmmc3_clk_pp0";=0A=
				nvidia,function =3D "sdmmc3";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc3_cmd_pp1 {=0A=
				nvidia,pins =3D "sdmmc3_cmd_pp1";=0A=
				nvidia,function =3D "sdmmc3";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc3_dat0_pp5 {=0A=
				nvidia,pins =3D "sdmmc3_dat0_pp5";=0A=
				nvidia,function =3D "sdmmc3";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc3_dat1_pp4 {=0A=
				nvidia,pins =3D "sdmmc3_dat1_pp4";=0A=
				nvidia,function =3D "sdmmc3";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc3_dat2_pp3 {=0A=
				nvidia,pins =3D "sdmmc3_dat2_pp3";=0A=
				nvidia,function =3D "sdmmc3";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			sdmmc3_dat3_pp2 {=0A=
				nvidia,pins =3D "sdmmc3_dat3_pp2";=0A=
				nvidia,function =3D "sdmmc3";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			shutdown {=0A=
				nvidia,pins =3D "shutdown";=0A=
				nvidia,function =3D "shutdown";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			lcd_gpio2_pv4 {=0A=
				nvidia,pins =3D "lcd_gpio2_pv4";=0A=
				nvidia,function =3D "pwm1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pwr_i2c_scl_py3 {=0A=
				nvidia,pins =3D "pwr_i2c_scl_py3";=0A=
				nvidia,function =3D "i2cpmu";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			pwr_i2c_sda_py4 {=0A=
				nvidia,pins =3D "pwr_i2c_sda_py4";=0A=
				nvidia,function =3D "i2cpmu";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			clk_32k_in {=0A=
				nvidia,pins =3D "clk_32k_in";=0A=
				nvidia,function =3D "clk";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			clk_32k_out_py5 {=0A=
				nvidia,pins =3D "clk_32k_out_py5";=0A=
				nvidia,function =3D "soc";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			pz1 {=0A=
				nvidia,pins =3D "pz1";=0A=
				nvidia,function =3D "sdmmc1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			pz5 {=0A=
				nvidia,pins =3D "pz5";=0A=
				nvidia,function =3D "soc";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			core_pwr_req {=0A=
				nvidia,pins =3D "core_pwr_req";=0A=
				nvidia,function =3D "core";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pwr_int_n {=0A=
				nvidia,pins =3D "pwr_int_n";=0A=
				nvidia,function =3D "pmi";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			gen1_i2c_scl_pj1 {=0A=
				nvidia,pins =3D "gen1_i2c_scl_pj1";=0A=
				nvidia,function =3D "i2c1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			gen1_i2c_sda_pj0 {=0A=
				nvidia,pins =3D "gen1_i2c_sda_pj0";=0A=
				nvidia,function =3D "i2c1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			gen2_i2c_scl_pj2 {=0A=
				nvidia,pins =3D "gen2_i2c_scl_pj2";=0A=
				nvidia,function =3D "i2c2";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			gen2_i2c_sda_pj3 {=0A=
				nvidia,pins =3D "gen2_i2c_sda_pj3";=0A=
				nvidia,function =3D "i2c2";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			uart2_tx_pg0 {=0A=
				nvidia,pins =3D "uart2_tx_pg0";=0A=
				nvidia,function =3D "uartb";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart2_rx_pg1 {=0A=
				nvidia,pins =3D "uart2_rx_pg1";=0A=
				nvidia,function =3D "uartb";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			uart1_tx_pu0 {=0A=
				nvidia,pins =3D "uart1_tx_pu0";=0A=
				nvidia,function =3D "uarta";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart1_rx_pu1 {=0A=
				nvidia,pins =3D "uart1_rx_pu1";=0A=
				nvidia,function =3D "uarta";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			jtag_rtck {=0A=
				nvidia,pins =3D "jtag_rtck";=0A=
				nvidia,function =3D "jtag";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart3_tx_pd1 {=0A=
				nvidia,pins =3D "uart3_tx_pd1";=0A=
				nvidia,function =3D "uartc";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart3_rx_pd2 {=0A=
				nvidia,pins =3D "uart3_rx_pd2";=0A=
				nvidia,function =3D "uartc";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			uart3_rts_pd3 {=0A=
				nvidia,pins =3D "uart3_rts_pd3";=0A=
				nvidia,function =3D "uartc";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart3_cts_pd4 {=0A=
				nvidia,pins =3D "uart3_cts_pd4";=0A=
				nvidia,function =3D "uartc";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			uart4_tx_pi4 {=0A=
				nvidia,pins =3D "uart4_tx_pi4";=0A=
				nvidia,function =3D "uartd";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart4_rx_pi5 {=0A=
				nvidia,pins =3D "uart4_rx_pi5";=0A=
				nvidia,function =3D "uartd";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			uart4_rts_pi6 {=0A=
				nvidia,pins =3D "uart4_rts_pi6";=0A=
				nvidia,function =3D "uartd";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart4_cts_pi7 {=0A=
				nvidia,pins =3D "uart4_cts_pi7";=0A=
				nvidia,function =3D "uartd";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			qspi_io0_pee2 {=0A=
				nvidia,pins =3D "qspi_io0_pee2";=0A=
				nvidia,function =3D "qspi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			qspi_io1_pee3 {=0A=
				nvidia,pins =3D "qspi_io1_pee3";=0A=
				nvidia,function =3D "qspi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			qspi_sck_pee0 {=0A=
				nvidia,pins =3D "qspi_sck_pee0";=0A=
				nvidia,function =3D "qspi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			qspi_cs_n_pee1 {=0A=
				nvidia,pins =3D "qspi_cs_n_pee1";=0A=
				nvidia,function =3D "qspi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			qspi_io2_pee4 {=0A=
				nvidia,pins =3D "qspi_io2_pee4";=0A=
				nvidia,function =3D "qspi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			qspi_io3_pee5 {=0A=
				nvidia,pins =3D "qspi_io3_pee5";=0A=
				nvidia,function =3D "qspi";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dap2_din_paa2 {=0A=
				nvidia,pins =3D "dap2_din_paa2";=0A=
				nvidia,function =3D "i2s2";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dap2_dout_paa3 {=0A=
				nvidia,pins =3D "dap2_dout_paa3";=0A=
				nvidia,function =3D "i2s2";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dap2_fs_paa0 {=0A=
				nvidia,pins =3D "dap2_fs_paa0";=0A=
				nvidia,function =3D "i2s2";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dap2_sclk_paa1 {=0A=
				nvidia,pins =3D "dap2_sclk_paa1";=0A=
				nvidia,function =3D "i2s2";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			dp_hpd0_pcc6 {=0A=
				nvidia,pins =3D "dp_hpd0_pcc6";=0A=
				nvidia,function =3D "dp";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			hdmi_int_dp_hpd_pcc1 {=0A=
				nvidia,pins =3D "hdmi_int_dp_hpd_pcc1";=0A=
				nvidia,function =3D "dp";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			hdmi_cec_pcc0 {=0A=
				nvidia,pins =3D "hdmi_cec_pcc0";=0A=
				nvidia,function =3D "cec";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			cam1_pwdn_ps7 {=0A=
				nvidia,pins =3D "cam1_pwdn_ps7";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cam2_pwdn_pt0 {=0A=
				nvidia,pins =3D "cam2_pwdn_pt0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			sata_led_active_pa5 {=0A=
				nvidia,pins =3D "sata_led_active_pa5";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			pa6 {=0A=
				nvidia,pins =3D "pa6";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			als_prox_int_px3 {=0A=
				nvidia,pins =3D "als_prox_int_px3";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			temp_alert_px4 {=0A=
				nvidia,pins =3D "temp_alert_px4";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			button_power_on_px5 {=0A=
				nvidia,pins =3D "button_power_on_px5";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			button_vol_up_px6 {=0A=
				nvidia,pins =3D "button_vol_up_px6";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			button_home_py1 {=0A=
				nvidia,pins =3D "button_home_py1";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			lcd_bl_en_pv1 {=0A=
				nvidia,pins =3D "lcd_bl_en_pv1";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			pz2 {=0A=
				nvidia,pins =3D "pz2";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			pz3 {=0A=
				nvidia,pins =3D "pz3";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			wifi_en_ph0 {=0A=
				nvidia,pins =3D "wifi_en_ph0";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			wifi_wake_ap_ph2 {=0A=
				nvidia,pins =3D "wifi_wake_ap_ph2";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			ap_wake_bt_ph3 {=0A=
				nvidia,pins =3D "ap_wake_bt_ph3";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			bt_rst_ph4 {=0A=
				nvidia,pins =3D "bt_rst_ph4";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			bt_wake_ap_ph5 {=0A=
				nvidia,pins =3D "bt_wake_ap_ph5";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			ph6 {=0A=
				nvidia,pins =3D "ph6";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			ap_wake_nfc_ph7 {=0A=
				nvidia,pins =3D "ap_wake_nfc_ph7";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			nfc_en_pi0 {=0A=
				nvidia,pins =3D "nfc_en_pi0";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			nfc_int_pi1 {=0A=
				nvidia,pins =3D "nfc_int_pi1";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
			};=0A=
=0A=
			gps_en_pi2 {=0A=
				nvidia,pins =3D "gps_en_pi2";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pcc7 {=0A=
				nvidia,pins =3D "pcc7";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x0>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
				nvidia,io-high-voltage =3D <0x1>;=0A=
			};=0A=
=0A=
			usb_vbus_en0_pcc4 {=0A=
				nvidia,pins =3D "usb_vbus_en0_pcc4";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x2>;=0A=
				nvidia,tristate =3D <0x0>;=0A=
				nvidia,enable-input =3D <0x1>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		unused_lowpower {=0A=
			linux,phandle =3D <0x3a>;=0A=
			phandle =3D <0x3a>;=0A=
=0A=
			aud_mclk_pbb0 {=0A=
				nvidia,pins =3D "aud_mclk_pbb0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dvfs_clk_pbb2 {=0A=
				nvidia,pins =3D "dvfs_clk_pbb2";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			gpio_x1_aud_pbb3 {=0A=
				nvidia,pins =3D "gpio_x1_aud_pbb3";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			gpio_x3_aud_pbb4 {=0A=
				nvidia,pins =3D "gpio_x3_aud_pbb4";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap1_din_pb1 {=0A=
				nvidia,pins =3D "dap1_din_pb1";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap1_dout_pb2 {=0A=
				nvidia,pins =3D "dap1_dout_pb2";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap1_fs_pb0 {=0A=
				nvidia,pins =3D "dap1_fs_pb0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap1_sclk_pb3 {=0A=
				nvidia,pins =3D "dap1_sclk_pb3";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi2_mosi_pb4 {=0A=
				nvidia,pins =3D "spi2_mosi_pb4";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi2_miso_pb5 {=0A=
				nvidia,pins =3D "spi2_miso_pb5";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi2_sck_pb6 {=0A=
				nvidia,pins =3D "spi2_sck_pb6";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi2_cs0_pb7 {=0A=
				nvidia,pins =3D "spi2_cs0_pb7";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi2_cs1_pdd0 {=0A=
				nvidia,pins =3D "spi2_cs1_pdd0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dmic3_clk_pe4 {=0A=
				nvidia,pins =3D "dmic3_clk_pe4";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dmic3_dat_pe5 {=0A=
				nvidia,pins =3D "dmic3_dat_pe5";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pe6 {=0A=
				nvidia,pins =3D "pe6";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cam_rst_ps4 {=0A=
				nvidia,pins =3D "cam_rst_ps4";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cam_af_en_ps5 {=0A=
				nvidia,pins =3D "cam_af_en_ps5";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cam_flash_en_ps6 {=0A=
				nvidia,pins =3D "cam_flash_en_ps6";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cam1_strobe_pt1 {=0A=
				nvidia,pins =3D "cam1_strobe_pt1";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			motion_int_px2 {=0A=
				nvidia,pins =3D "motion_int_px2";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			touch_rst_pv6 {=0A=
				nvidia,pins =3D "touch_rst_pv6";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			touch_clk_pv7 {=0A=
				nvidia,pins =3D "touch_clk_pv7";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			touch_int_px1 {=0A=
				nvidia,pins =3D "touch_int_px1";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			modem_wake_ap_px0 {=0A=
				nvidia,pins =3D "modem_wake_ap_px0";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			button_vol_down_px7 {=0A=
				nvidia,pins =3D "button_vol_down_px7";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			button_slide_sw_py0 {=0A=
				nvidia,pins =3D "button_slide_sw_py0";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			lcd_te_py2 {=0A=
				nvidia,pins =3D "lcd_te_py2";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			lcd_bl_pwm_pv0 {=0A=
				nvidia,pins =3D "lcd_bl_pwm_pv0";=0A=
				nvidia,function =3D "rsvd3";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			lcd_rst_pv2 {=0A=
				nvidia,pins =3D "lcd_rst_pv2";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			lcd_gpio1_pv3 {=0A=
				nvidia,pins =3D "lcd_gpio1_pv3";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			ap_ready_pv5 {=0A=
				nvidia,pins =3D "ap_ready_pv5";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pz0 {=0A=
				nvidia,pins =3D "pz0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pz4 {=0A=
				nvidia,pins =3D "pz4";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			clk_req {=0A=
				nvidia,pins =3D "clk_req";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			cpu_pwr_req {=0A=
				nvidia,pins =3D "cpu_pwr_req";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap4_din_pj5 {=0A=
				nvidia,pins =3D "dap4_din_pj5";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap4_dout_pj6 {=0A=
				nvidia,pins =3D "dap4_dout_pj6";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap4_fs_pj4 {=0A=
				nvidia,pins =3D "dap4_fs_pj4";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			dap4_sclk_pj7 {=0A=
				nvidia,pins =3D "dap4_sclk_pj7";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart2_rts_pg2 {=0A=
				nvidia,pins =3D "uart2_rts_pg2";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart2_cts_pg3 {=0A=
				nvidia,pins =3D "uart2_cts_pg3";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart1_rts_pu2 {=0A=
				nvidia,pins =3D "uart1_rts_pu2";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			uart1_cts_pu3 {=0A=
				nvidia,pins =3D "uart1_cts_pu3";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk0 {=0A=
				nvidia,pins =3D "pk0";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk1 {=0A=
				nvidia,pins =3D "pk1";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk2 {=0A=
				nvidia,pins =3D "pk2";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk3 {=0A=
				nvidia,pins =3D "pk3";=0A=
				nvidia,function =3D "rsvd2";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk4 {=0A=
				nvidia,pins =3D "pk4";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk5 {=0A=
				nvidia,pins =3D "pk5";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk6 {=0A=
				nvidia,pins =3D "pk6";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pk7 {=0A=
				nvidia,pins =3D "pk7";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pl0 {=0A=
				nvidia,pins =3D "pl0";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			pl1 {=0A=
				nvidia,pins =3D "pl1";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi1_mosi_pc0 {=0A=
				nvidia,pins =3D "spi1_mosi_pc0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi1_miso_pc1 {=0A=
				nvidia,pins =3D "spi1_miso_pc1";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi1_sck_pc2 {=0A=
				nvidia,pins =3D "spi1_sck_pc2";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi1_cs0_pc3 {=0A=
				nvidia,pins =3D "spi1_cs0_pc3";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi1_cs1_pc4 {=0A=
				nvidia,pins =3D "spi1_cs1_pc4";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi4_mosi_pc7 {=0A=
				nvidia,pins =3D "spi4_mosi_pc7";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi4_miso_pd0 {=0A=
				nvidia,pins =3D "spi4_miso_pd0";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi4_sck_pc5 {=0A=
				nvidia,pins =3D "spi4_sck_pc5";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spi4_cs0_pc6 {=0A=
				nvidia,pins =3D "spi4_cs0_pc6";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			wifi_rst_ph1 {=0A=
				nvidia,pins =3D "wifi_rst_ph1";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			gps_rst_pi3 {=0A=
				nvidia,pins =3D "gps_rst_pi3";=0A=
				nvidia,function =3D "rsvd0";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spdif_out_pcc2 {=0A=
				nvidia,pins =3D "spdif_out_pcc2";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			spdif_in_pcc3 {=0A=
				nvidia,pins =3D "spdif_in_pcc3";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
			};=0A=
=0A=
			usb_vbus_en1_pcc5 {=0A=
				nvidia,pins =3D "usb_vbus_en1_pcc5";=0A=
				nvidia,function =3D "rsvd1";=0A=
				nvidia,pull =3D <0x1>;=0A=
				nvidia,tristate =3D <0x1>;=0A=
				nvidia,enable-input =3D <0x0>;=0A=
				nvidia,io-high-voltage =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		drive {=0A=
			linux,phandle =3D <0x39>;=0A=
			phandle =3D <0x39>;=0A=
		};=0A=
	};=0A=
=0A=
	gpio@6000d000 {=0A=
		compatible =3D "nvidia,tegra210-gpio", "nvidia,tegra124-gpio", =
"nvidia,tegra30-gpio";=0A=
		reg =3D <0x0 0x6000d000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0x20 0x4 0x0 0x21 0x4 0x0 0x22 0x4 0x0 0x23 0x4 =
0x0 0x37 0x4 0x0 0x57 0x4 0x0 0x59 0x4 0x0 0x7d 0x4>;=0A=
		#gpio-cells =3D <0x2>;=0A=
		gpio-controller;=0A=
		#interrupt-cells =3D <0x2>;=0A=
		interrupt-controller;=0A=
		gpio-ranges =3D <0x3b 0x0 0x0 0xf6>;=0A=
		status =3D "okay";=0A=
		gpio-init-names =3D "default";=0A=
		gpio-init-0 =3D <0x3c>;=0A=
		gpio-line-names =3D [00 00 00 00 00 00 00 00 00 00 00 00 53 50 49 31 =
5f 4d 4f 53 49 00 53 50 49 31 5f 4d 49 53 4f 00 53 50 49 31 5f 53 43 4b =
00 53 50 49 31 5f 43 53 30 00 53 50 49 30 5f 4d 4f 53 49 00 53 50 49 30 =
5f 4d 49 53 4f 00 53 50 49 30 5f 53 43 4b 00 53 50 49 30 5f 43 53 30 00 =
53 50 49 30 5f 43 53 31 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 47 50 49 4f 31 33 00 00 00 00 00 00 00 00 00 00 00 00 55 41 52 54 =
31 5f 52 54 53 00 55 41 52 54 31 5f 43 54 53 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 49 32 53 30 5f 46 53 00 =
49 32 53 30 5f 44 49 4e 00 49 32 53 30 5f 44 4f 55 54 00 49 32 53 30 5f =
53 43 4c 4b 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 47 50 49 4f 30 31 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 47 50 49 4f 30 37 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 47 50 49 4f 31 32 00 00 00 00 00 00 47 =
50 49 4f 31 31 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 47 50 49 =
4f 30 39 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 53 50 49 31 5f =
43 53 31 00 00 00 00 00 00 00 00];=0A=
		linux,phandle =3D <0x56>;=0A=
		phandle =3D <0x56>;=0A=
=0A=
		camera-control-output-low {=0A=
			gpio-hog;=0A=
			output-low;=0A=
			gpios =3D <0x97 0x0 0x98 0x0>;=0A=
			label =3D "cam1-pwdn", "cam2-pwdn";=0A=
		};=0A=
=0A=
		e2614-rt5658-audio {=0A=
			gpio-hog;=0A=
			function;=0A=
			gpios =3D <0x4c 0x0 0x4d 0x0 0x4e 0x0 0x4f 0x0 0xd8 0x0 0x95 0x0>;=0A=
			label =3D "I2S4_LRCLK", "I2S4_SDIN", "I2S4_SDOUT", "I2S4_CLK", =
"AUDIO_MCLK", "AUD_RST";=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0xdb>;=0A=
			phandle =3D <0xdb>;=0A=
		};=0A=
=0A=
		system-suspend-gpio {=0A=
			status =3D "okay";=0A=
			gpio-hog;=0A=
			output-high;=0A=
			gpio-suspend;=0A=
			suspend-output-low;=0A=
			gpios =3D <0x6 0x0>;=0A=
			linux,phandle =3D <0xb2>;=0A=
			phandle =3D <0xb2>;=0A=
		};=0A=
=0A=
		default {=0A=
			gpio-input =3D <0x5 0xbc 0xbd 0xbe 0xc1 0xa9 0xca 0x3a 0x3d 0x3e 0x41 =
0xe4>;=0A=
			gpio-output-low =3D <0x97 0x98 0xcb 0x38 0x3b 0x3c 0x3f 0x40 0x42>;=0A=
			gpio-output-high =3D <0x6 0xbb 0xe7>;=0A=
			linux,phandle =3D <0x3c>;=0A=
			phandle =3D <0x3c>;=0A=
		};=0A=
	};=0A=
=0A=
	xotg {=0A=
		compatible =3D "nvidia,tegra210-xotg";=0A=
		interrupts =3D <0x0 0x31 0x4 0x0 0x14 0x4>;=0A=
		status =3D "disabled";=0A=
		#extcon-cells =3D <0x1>;=0A=
	};=0A=
=0A=
	mailbox@70098000 {=0A=
		compatible =3D "nvidia,tegra210-xusb-mbox";=0A=
		reg =3D <0x0 0x70098000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0x28 0x4>;=0A=
		#mbox-cells =3D <0x0>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x46>;=0A=
		phandle =3D <0x46>;=0A=
	};=0A=
=0A=
	xusb_padctl@7009f000 {=0A=
		compatible =3D "nvidia,tegra210-xusb-padctl";=0A=
		reg =3D <0x0 0x7009f000 0x0 0x1000>;=0A=
		reg-names =3D "padctl";=0A=
		resets =3D <0x21 0x8e>;=0A=
		reset-names =3D "padctl";=0A=
		status =3D "okay";=0A=
		vddio-hsic-supply =3D <0x3d>;=0A=
		avdd_pll_uerefe-supply =3D <0x3e>;=0A=
		hvdd_pex_pll_e-supply =3D <0x36>;=0A=
		dvdd_pex_pll-supply =3D <0x3f>;=0A=
		hvddio_pex-supply =3D <0x36>;=0A=
		dvddio_pex-supply =3D <0x3f>;=0A=
		hvdd_sata-supply =3D <0x36>;=0A=
		dvdd_sata_pll-supply =3D <0x40>;=0A=
		hvddio_sata-supply =3D <0x36>;=0A=
		dvddio_sata-supply =3D <0x40>;=0A=
		linux,phandle =3D <0x44>;=0A=
		phandle =3D <0x44>;=0A=
=0A=
		pads {=0A=
=0A=
			usb2 {=0A=
				clocks =3D <0x21 0xd2>;=0A=
				clock-names =3D "trk";=0A=
				status =3D "okay";=0A=
=0A=
				lanes {=0A=
=0A=
					usb2-0 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "xusb";=0A=
						linux,phandle =3D <0x45>;=0A=
						phandle =3D <0x45>;=0A=
					};=0A=
=0A=
					usb2-1 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "xusb";=0A=
						linux,phandle =3D <0x49>;=0A=
						phandle =3D <0x49>;=0A=
					};=0A=
=0A=
					usb2-2 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "xusb";=0A=
						linux,phandle =3D <0x4a>;=0A=
						phandle =3D <0x4a>;=0A=
					};=0A=
=0A=
					usb2-3 {=0A=
						status =3D "disabled";=0A=
						#phy-cells =3D <0x0>;=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			pcie {=0A=
				clocks =3D <0x21 0x107>;=0A=
				clock-names =3D "pll";=0A=
				resets =3D <0x21 0xcd>;=0A=
				reset-names =3D "phy";=0A=
				status =3D "okay";=0A=
=0A=
				lanes {=0A=
=0A=
					pcie-0 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "pcie-x1";=0A=
						linux,phandle =3D <0x85>;=0A=
						phandle =3D <0x85>;=0A=
					};=0A=
=0A=
					pcie-1 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "pcie-x4";=0A=
						linux,phandle =3D <0x81>;=0A=
						phandle =3D <0x81>;=0A=
					};=0A=
=0A=
					pcie-2 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "pcie-x4";=0A=
						linux,phandle =3D <0x82>;=0A=
						phandle =3D <0x82>;=0A=
					};=0A=
=0A=
					pcie-3 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "pcie-x4";=0A=
						linux,phandle =3D <0x83>;=0A=
						phandle =3D <0x83>;=0A=
					};=0A=
=0A=
					pcie-4 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "pcie-x4";=0A=
						linux,phandle =3D <0x84>;=0A=
						phandle =3D <0x84>;=0A=
					};=0A=
=0A=
					pcie-5 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "xusb";=0A=
					};=0A=
=0A=
					pcie-6 {=0A=
						status =3D "okay";=0A=
						#phy-cells =3D <0x0>;=0A=
						nvidia,function =3D "xusb";=0A=
						linux,phandle =3D <0x4b>;=0A=
						phandle =3D <0x4b>;=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			sata {=0A=
				clocks =3D <0x21 0x107>;=0A=
				clock-names =3D "pll";=0A=
				resets =3D <0x21 0xcc>;=0A=
				reset-names =3D "phy";=0A=
				status =3D "disabled";=0A=
=0A=
				lanes {=0A=
=0A=
					sata-0 {=0A=
						status =3D "disabled";=0A=
						#phy-cells =3D <0x0>;=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			hsic {=0A=
				clocks =3D <0x21 0xd1>;=0A=
				clock-names =3D "trk";=0A=
				status =3D "disabled";=0A=
=0A=
				lanes {=0A=
=0A=
					hsic-0 {=0A=
						status =3D "disabled";=0A=
						#phy-cells =3D <0x0>;=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		ports {=0A=
=0A=
			usb2-0 {=0A=
				status =3D "okay";=0A=
				vbus-supply =3D <0x41>;=0A=
				mode =3D "otg";=0A=
				nvidia,usb3-port-fake =3D <0x3>;=0A=
			};=0A=
=0A=
			usb2-1 {=0A=
				status =3D "okay";=0A=
				vbus-supply =3D <0x42>;=0A=
				mode =3D "host";=0A=
				linux,phandle =3D <0xb4>;=0A=
				phandle =3D <0xb4>;=0A=
			};=0A=
=0A=
			usb2-2 {=0A=
				status =3D "okay";=0A=
				vbus-supply =3D <0x43>;=0A=
				mode =3D "host";=0A=
			};=0A=
=0A=
			usb2-3 {=0A=
				status =3D "disabled";=0A=
			};=0A=
=0A=
			usb3-0 {=0A=
				status =3D "okay";=0A=
				nvidia,usb2-companion =3D <0x1>;=0A=
			};=0A=
=0A=
			usb3-1 {=0A=
				status =3D "disabled";=0A=
			};=0A=
=0A=
			usb3-2 {=0A=
				status =3D "disabled";=0A=
			};=0A=
=0A=
			usb3-3 {=0A=
				status =3D "disabled";=0A=
			};=0A=
=0A=
			hsic-0 {=0A=
				status =3D "disabled";=0A=
			};=0A=
		};=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x4>;=0A=
=0A=
			prod_c_bias {=0A=
				prod =3D <0x0 0x284 0x3f 0x3a>;=0A=
			};=0A=
=0A=
			prod_c_bias_a02 {=0A=
				prod =3D <0x0 0x284 0x3f 0x38>;=0A=
			};=0A=
=0A=
			prod_c_utmi0 {=0A=
				prod =3D <0x0 0x84 0x20 0x40>;=0A=
			};=0A=
=0A=
			prod_c_utmi1 {=0A=
				prod =3D <0x0 0xc4 0x20 0x40>;=0A=
			};=0A=
=0A=
			prod_c_utmi2 {=0A=
				prod =3D <0x0 0x104 0x20 0x40>;=0A=
			};=0A=
=0A=
			prod_c_utmi3 {=0A=
				prod =3D <0x0 0x144 0x20 0x40>;=0A=
			};=0A=
=0A=
			prod_c_ss0 {=0A=
				prod =3D <0x0 0xa60 0x30000 0x20000 0x0 0xa64 0xffff 0xfc 0x0 0xa68 =
0xffffffff 0xc0077f1f 0x0 0xa74 0xffffffff 0xfcf01368>;=0A=
			};=0A=
=0A=
			prod_c_ss1 {=0A=
				prod =3D <0x0 0xaa0 0x30000 0x20000 0x0 0xaa4 0xffff 0xfc 0x0 0xaa8 =
0xffffffff 0xc0077f1f 0x0 0xab4 0xffffffff 0xfcf01368>;=0A=
			};=0A=
=0A=
			prod_c_ss2 {=0A=
				prod =3D <0x0 0xae0 0x30000 0x20000 0x0 0xae4 0xffff 0xfc 0x0 0xae8 =
0xffffffff 0xc0077f1f 0x0 0xaf4 0xffffffff 0xfcf01368>;=0A=
			};=0A=
=0A=
			prod_c_ss3 {=0A=
				prod =3D <0x0 0xb20 0x30000 0x20000 0x0 0xb24 0xffff 0xfc 0x0 0xb28 =
0xffffffff 0xc0077f1f 0x0 0xb34 0xffffffff 0xfcf01368>;=0A=
			};=0A=
=0A=
			prod_c_hsic0 {=0A=
				prod =3D <0x0 0x344 0x1f 0x1c>;=0A=
			};=0A=
=0A=
			prod_c_hsic1 {=0A=
				prod =3D <0x0 0x344 0x1f 0x1c>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	usb_cd {=0A=
		compatible =3D "nvidia,tegra210-usb-cd";=0A=
		nvidia,xusb-padctl =3D <0x44>;=0A=
		status =3D "disabled";=0A=
		reg =3D <0x0 0x7009f000 0x0 0x1000>;=0A=
		#extcon-cells =3D <0x1>;=0A=
		dt-override-status-odm-data =3D <0x1000000 0x1000000>;=0A=
		phys =3D <0x45>;=0A=
		phy-names =3D "otg-phy";=0A=
		linux,phandle =3D <0x9a>;=0A=
		phandle =3D <0x9a>;=0A=
	};=0A=
=0A=
	pinctrl@7009f000 {=0A=
		compatible =3D "nvidia,tegra21x-padctl-uphy";=0A=
		reg =3D <0x0 0x7009f000 0x0 0x1000>;=0A=
		reg-names =3D "padctl";=0A=
		resets =3D <0x21 0x8e 0x21 0xcc 0x21 0xcd>;=0A=
		reset-names =3D "padctl", "sata_uphy", "pex_uphy";=0A=
		clocks =3D <0x21 0xd1 0x21 0xd2 0x21 0x107>;=0A=
		clock-names =3D "hsic_trk", "usb2_trk", "pll_e";=0A=
		interrupts =3D <0x0 0x31 0x4>;=0A=
		mboxes =3D <0x46>;=0A=
		mbox-names =3D "xusb";=0A=
		#phy-cells =3D <0x1>;=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0x106>;=0A=
		phandle =3D <0x106>;=0A=
	};=0A=
=0A=
	xusb@70090000 {=0A=
		compatible =3D "nvidia,tegra210-xhci";=0A=
		reg =3D <0x0 0x70090000 0x0 0x8000 0x0 0x70098000 0x0 0x1000 0x0 =
0x70099000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0x27 0x4 0x0 0x28 0x4 0x0 0x31 0x4>;=0A=
		nvidia,xusb-padctl =3D <0x44>;=0A=
		clocks =3D <0x21 0x59 0x21 0x11d 0x21 0x9c 0x21 0x11f 0x21 0x122 0x21 =
0x11e 0x21 0xff 0x21 0xe9 0x21 0x107>;=0A=
		clock-names =3D "xusb_host", "xusb_falcon_src", "xusb_ss", =
"xusb_ss_src", "xusb_hs_src", "xusb_fs_src", "pll_u_480m", "clk_m", =
"pll_e";=0A=
		iommus =3D <0x2b 0x14>;=0A=
		status =3D "okay";=0A=
		hvdd_usb-supply =3D <0x47>;=0A=
		avdd_pll_utmip-supply =3D <0x36>;=0A=
		vddio_hsic-supply =3D <0x3d>;=0A=
		avddio_usb-supply =3D <0x3f>;=0A=
		dvdd_sata-supply =3D <0x40>;=0A=
		avddio_pll_uerefe-supply =3D <0x3e>;=0A=
		extcon-cables =3D <0x48 0x1>;=0A=
		extcon-cable-names =3D "id";=0A=
		phys =3D <0x45 0x49 0x4a 0x4b>;=0A=
		phy-names =3D "usb2-0", "usb2-1", "usb2-2", "usb3-0";=0A=
		#extcon-cells =3D <0x1>;=0A=
		nvidia,pmc-wakeup =3D <0x37 0x1 0x27 0x4 0x37 0x1 0x28 0x4 0x37 0x1 =
0x29 0x4 0x37 0x1 0x2a 0x4 0x37 0x1 0x2c 0x4>;=0A=
		nvidia,boost_cpu_freq =3D <0x4b0>;=0A=
	};=0A=
=0A=
	max16984-cdp {=0A=
		compatible =3D "maxim,max16984-tegra210-cdp-phy";=0A=
		#phy-cells =3D <0x1>;=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0x107>;=0A=
		phandle =3D <0x107>;=0A=
	};=0A=
=0A=
	serial@70006000 {=0A=
		compatible =3D "nvidia,tegra210-uart", "nvidia,tegra114-hsuart", =
"nvidia,tegra20-uart";=0A=
		reg =3D <0x0 0x70006000 0x0 0x40>;=0A=
		reg-shift =3D <0x2>;=0A=
		interrupts =3D <0x0 0x24 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		dmas =3D <0x4c 0x8 0x4c 0x8>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0x6 0x21 0xf3>;=0A=
		clock-names =3D "serial", "parent";=0A=
		nvidia,adjust-baud-rates =3D <0x1c200 0x1c200 0x64>;=0A=
		status =3D "okay";=0A=
		console-port;=0A=
		sqa-automation-port;=0A=
		enable-rx-poll-timer;=0A=
		linux,phandle =3D <0x108>;=0A=
		phandle =3D <0x108>;=0A=
	};=0A=
=0A=
	serial@70006040 {=0A=
		compatible =3D "nvidia,tegra114-hsuart";=0A=
		reg =3D <0x0 0x70006040 0x0 0x40>;=0A=
		reg-shift =3D <0x2>;=0A=
		interrupts =3D <0x0 0x25 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		dmas =3D <0x4c 0x9 0x4c 0x9>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0xe0 0x21 0xf3>;=0A=
		clock-names =3D "serial", "parent";=0A=
		resets =3D <0x21 0x7>;=0A=
		reset-names =3D "serial";=0A=
		nvidia,adjust-baud-rates =3D <0x1c200 0x1c200 0x64>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x109>;=0A=
		phandle =3D <0x109>;=0A=
	};=0A=
=0A=
	serial@70006200 {=0A=
		compatible =3D "nvidia,tegra114-hsuart";=0A=
		reg =3D <0x0 0x70006200 0x0 0x40>;=0A=
		reg-shift =3D <0x2>;=0A=
		interrupts =3D <0x0 0x2e 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		dmas =3D <0x4c 0xa 0x4c 0xa>;=0A=
		dma-names =3D "tx";=0A=
		clocks =3D <0x21 0x37 0x21 0xf3>;=0A=
		clock-names =3D "serial", "parent";=0A=
		resets =3D <0x21 0x37>;=0A=
		reset-names =3D "serial";=0A=
		nvidia,adjust-baud-rates =3D <0xe1000 0xe1000 0x64>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x10a>;=0A=
		phandle =3D <0x10a>;=0A=
	};=0A=
=0A=
	serial@70006300 {=0A=
		compatible =3D "nvidia,tegra114-hsuart";=0A=
		reg =3D <0x0 0x70006300 0x0 0x40>;=0A=
		reg-shift =3D <0x2>;=0A=
		interrupts =3D <0x0 0x5a 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		dmas =3D <0x4c 0x13 0x4c 0x13>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0x41 0x21 0xf3>;=0A=
		clock-names =3D "serial", "parent";=0A=
		resets =3D <0x21 0x41>;=0A=
		reset-names =3D "serial";=0A=
		nvidia,adjust-baud-rates =3D <0x1c200 0x1c200 0x64>;=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0x10b>;=0A=
		phandle =3D <0x10b>;=0A=
	};=0A=
=0A=
	sound {=0A=
		iommus =3D <0x2b 0x22>;=0A=
		dma-mask =3D <0x0 0xfff00000>;=0A=
		iommu-resv-regions =3D <0x0 0x0 0x0 0x70300000 0x0 0xfff00000 =
0xffffffff 0xffffffff>;=0A=
		iommu-group-id =3D <0x2>;=0A=
		status =3D "okay";=0A=
		compatible =3D "nvidia,tegra-audio-t210ref-mobile-rt565x";=0A=
		nvidia,model =3D "tegra-snd-t210ref-mobile-rt565x";=0A=
		clocks =3D <0x21 0xf8 0x21 0xf9 0x21 0x78>;=0A=
		clock-names =3D "pll_a", "pll_a_out0", "extern1";=0A=
		assigned-clocks =3D <0x21 0x78>;=0A=
		assigned-clock-parents =3D <0x21 0xf9>;=0A=
		nvidia,num-codec-link =3D <0x4>;=0A=
		nvidia,audio-routing =3D "x Headphone", "x OUT", "x IN", "x Mic", "y =
Headphone", "y OUT", "y IN", "y Mic", "a IN", "a Mic", "b IN", "b Mic";=0A=
		nvidia,xbar =3D <0x4d>;=0A=
		mclk-fs =3D <0x100>;=0A=
		linux,phandle =3D <0xaf>;=0A=
		phandle =3D <0xaf>;=0A=
=0A=
		nvidia,dai-link-1 {=0A=
			link-name =3D "spdif-dit-0";=0A=
			cpu-dai =3D <0x4e>;=0A=
			codec-dai =3D <0x4f>;=0A=
			cpu-dai-name =3D "I2S4";=0A=
			codec-dai-name =3D "dit-hifi";=0A=
			format =3D "i2s";=0A=
			bitclock-slave;=0A=
			frame-slave;=0A=
			bitclock-noninversion;=0A=
			frame-noninversion;=0A=
			bit-format =3D "s16_le";=0A=
			srate =3D <0xbb80>;=0A=
			num-channel =3D <0x2>;=0A=
			ignore_suspend;=0A=
			name-prefix =3D [78 00];=0A=
			status =3D "okay";=0A=
			linux,phandle =3D <0xda>;=0A=
			phandle =3D <0xda>;=0A=
		};=0A=
=0A=
		nvidia,dai-link-2 {=0A=
			link-name =3D "spdif-dit-1";=0A=
			cpu-dai =3D <0x50>;=0A=
			codec-dai =3D <0x51>;=0A=
			cpu-dai-name =3D "I2S3";=0A=
			codec-dai-name =3D "dit-hifi";=0A=
			format =3D "i2s";=0A=
			bitclock-slave;=0A=
			frame-slave;=0A=
			bitclock-noninversion;=0A=
			frame-noninversion;=0A=
			bit-format =3D "s16_le";=0A=
			srate =3D <0xbb80>;=0A=
			num-channel =3D <0x2>;=0A=
			ignore_suspend;=0A=
			name-prefix =3D [79 00];=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		nvidia,dai-link-3 {=0A=
			link-name =3D "spdif-dit-2";=0A=
			cpu-dai =3D <0x52>;=0A=
			codec-dai =3D <0x53>;=0A=
			cpu-dai-name =3D "DMIC1";=0A=
			codec-dai-name =3D "dit-hifi";=0A=
			format =3D "i2s";=0A=
			bit-format =3D "s16_le";=0A=
			srate =3D <0xbb80>;=0A=
			ignore_suspend;=0A=
			num-channel =3D <0x2>;=0A=
			name-prefix =3D [61 00];=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		nvidia,dai-link-4 {=0A=
			link-name =3D "spdif-dit-3";=0A=
			cpu-dai =3D <0x54>;=0A=
			codec-dai =3D <0x55>;=0A=
			cpu-dai-name =3D "DMIC2";=0A=
			codec-dai-name =3D "dit-hifi";=0A=
			format =3D "i2s";=0A=
			bit-format =3D "s16_le";=0A=
			srate =3D <0xbb80>;=0A=
			ignore_suspend;=0A=
			num-channel =3D <0x2>;=0A=
			name-prefix =3D [62 00];=0A=
			status =3D "okay";=0A=
		};=0A=
	};=0A=
=0A=
	sound_ref {=0A=
		iommus =3D <0x2b 0x22>;=0A=
		dma-mask =3D <0x0 0xfff00000>;=0A=
		iommu-resv-regions =3D <0x0 0x0 0x0 0x70300000 0x0 0xfff00000 =
0xffffffff 0xffffffff>;=0A=
		iommu-group-id =3D <0x2>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	pwm@7000a000 {=0A=
		compatible =3D "nvidia,tegra124-pwm", "nvidia,tegra20-pwm";=0A=
		reg =3D <0x0 0x7000a000 0x0 0x100>;=0A=
		#pwm-cells =3D <0x2>;=0A=
		status =3D "okay";=0A=
		clocks =3D <0x21 0x11 0x21 0xf3>;=0A=
		clock-names =3D "pwm", "parent";=0A=
		resets =3D <0x21 0x11>;=0A=
		reset-names =3D "pwm";=0A=
		nvidia,no-clk-sleeping-in-ops;=0A=
		linux,phandle =3D <0xa5>;=0A=
		phandle =3D <0xa5>;=0A=
	};=0A=
=0A=
	spi@7000d400 {=0A=
		compatible =3D "nvidia,tegra210-spi";=0A=
		reg =3D <0x0 0x7000d400 0x0 0x200>;=0A=
		interrupts =3D <0x0 0x3b 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		dmas =3D <0x4c 0xf 0x4c 0xf>;=0A=
		dma-names =3D "rx", "tx";=0A=
		nvidia,clk-parents =3D "pll_p", "clk_m";=0A=
		clocks =3D <0x21 0x29 0x21 0xf3 0x21 0xe9>;=0A=
		clock-names =3D "spi", "pll_p", "clk_m";=0A=
		resets =3D <0x21 0x29>;=0A=
		reset-names =3D "spi";=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x10c>;=0A=
		phandle =3D <0x10c>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod {=0A=
				prod =3D <0x4 0xfff 0x0>;=0A=
			};=0A=
=0A=
			prod_c_flash {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0x3f 0x7>;=0A=
			};=0A=
=0A=
			prod_c_loop {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0xfff 0x44b>;=0A=
			};=0A=
		};=0A=
=0A=
		spi@0 {=0A=
			compatible =3D "spidev";=0A=
			reg =3D <0x0>;=0A=
			spi-max-frequency =3D <0x1f78a40>;=0A=
=0A=
			controller-data {=0A=
				nvidia,enable-hw-based-cs;=0A=
				nvidia,rx-clk-tap-delay =3D <0x7>;=0A=
			};=0A=
		};=0A=
=0A=
		spi@1 {=0A=
			compatible =3D "spidev";=0A=
			reg =3D <0x1>;=0A=
			spi-max-frequency =3D <0x1f78a40>;=0A=
=0A=
			controller-data {=0A=
				nvidia,enable-hw-based-cs;=0A=
				nvidia,rx-clk-tap-delay =3D <0x7>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	spi@7000d600 {=0A=
		compatible =3D "nvidia,tegra210-spi";=0A=
		reg =3D <0x0 0x7000d600 0x0 0x200>;=0A=
		interrupts =3D <0x0 0x52 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		dmas =3D <0x4c 0x10 0x4c 0x10>;=0A=
		dma-names =3D "rx", "tx";=0A=
		nvidia,clk-parents =3D "pll_p", "clk_m";=0A=
		clocks =3D <0x21 0x2c 0x21 0xf3 0x21 0xe9>;=0A=
		clock-names =3D "spi", "pll_p", "clk_m";=0A=
		resets =3D <0x21 0x2c>;=0A=
		reset-names =3D "spi";=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x10d>;=0A=
		phandle =3D <0x10d>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod {=0A=
				prod =3D <0x4 0xfff 0x0>;=0A=
			};=0A=
=0A=
			prod_c_flash {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0x3f 0x6>;=0A=
			};=0A=
=0A=
			prod_c_loop {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0xfff 0x44b>;=0A=
			};=0A=
		};=0A=
=0A=
		spi@0 {=0A=
			compatible =3D "spidev";=0A=
			reg =3D <0x0>;=0A=
			spi-max-frequency =3D <0x1f78a40>;=0A=
=0A=
			controller-data {=0A=
				nvidia,enable-hw-based-cs;=0A=
				nvidia,rx-clk-tap-delay =3D <0x6>;=0A=
			};=0A=
		};=0A=
=0A=
		spi@1 {=0A=
			compatible =3D "spidev";=0A=
			reg =3D <0x1>;=0A=
			spi-max-frequency =3D <0x1f78a40>;=0A=
=0A=
			controller-data {=0A=
				nvidia,enable-hw-based-cs;=0A=
				nvidia,rx-clk-tap-delay =3D <0x6>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	spi@7000d800 {=0A=
		compatible =3D "nvidia,tegra210-spi";=0A=
		reg =3D <0x0 0x7000d800 0x0 0x200>;=0A=
		interrupts =3D <0x0 0x53 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		dmas =3D <0x4c 0x11 0x4c 0x11>;=0A=
		dma-names =3D "rx", "tx";=0A=
		nvidia,clk-parents =3D "pll_p", "clk_m";=0A=
		clocks =3D <0x21 0x2e 0x21 0xf3 0x21 0xe9>;=0A=
		clock-names =3D "spi", "pll_p", "clk_m";=0A=
		resets =3D <0x21 0x2e>;=0A=
		reset-names =3D "spi";=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0x10e>;=0A=
		phandle =3D <0x10e>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod {=0A=
				prod =3D <0x4 0xfff 0x0>;=0A=
			};=0A=
=0A=
			prod_c_flash {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0x3f 0x8>;=0A=
			};=0A=
=0A=
			prod_c_loop {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0xfff 0x44b>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	spi@7000da00 {=0A=
		compatible =3D "nvidia,tegra210-spi";=0A=
		reg =3D <0x0 0x7000da00 0x0 0x200>;=0A=
		interrupts =3D <0x0 0x5d 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		dmas =3D <0x4c 0x12 0x4c 0x12>;=0A=
		dma-names =3D "rx", "tx";=0A=
		nvidia,clk-parents =3D "pll_p", "clk_m";=0A=
		clocks =3D <0x21 0x44 0x21 0xf3 0x21 0xe9>;=0A=
		clock-names =3D "spi", "pll_p", "clk_m";=0A=
		resets =3D <0x21 0x44>;=0A=
		reset-names =3D "spi";=0A=
		status =3D "disabled";=0A=
		spi-max-frequency =3D <0xb71b00>;=0A=
		linux,phandle =3D <0x10f>;=0A=
		phandle =3D <0x10f>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod {=0A=
				prod =3D <0x4 0xfff 0x0>;=0A=
			};=0A=
=0A=
			prod_c_flash {=0A=
				status =3D "disabled";=0A=
				prod =3D <0x4 0xfff 0x44b>;=0A=
			};=0A=
=0A=
			prod_c_cs0 {=0A=
				prod =3D <0x4 0xfc0 0x400>;=0A=
			};=0A=
		};=0A=
=0A=
		spi-touch19x12@0 {=0A=
			compatible =3D "raydium,rm_ts_spidev";=0A=
			status =3D "disabled";=0A=
			reg =3D <0x0>;=0A=
			spi-max-frequency =3D <0xb71b00>;=0A=
			interrupt-parent =3D <0x56>;=0A=
			interrupts =3D <0xb9 0x1>;=0A=
			reset-gpio =3D <0x56 0xae 0x0>;=0A=
			config =3D <0x0>;=0A=
			platform-id =3D <0xd>;=0A=
			name-of-clock =3D "clk_out_2";=0A=
			name-of-clock-con =3D "extern2";=0A=
			avdd-supply =3D <0x57>;=0A=
			dvdd-supply =3D <0x58>;=0A=
		};=0A=
=0A=
		spi-touch25x16@0 {=0A=
			compatible =3D "raydium,rm_ts_spidev";=0A=
			status =3D "disabled";=0A=
			reg =3D <0x0>;=0A=
			spi-max-frequency =3D <0xb71b00>;=0A=
			interrupt-parent =3D <0x56>;=0A=
			interrupts =3D <0xb9 0x1>;=0A=
			reset-gpio =3D <0x56 0xae 0x0>;=0A=
			config =3D <0x0>;=0A=
			platform-id =3D <0x8>;=0A=
			name-of-clock =3D "clk_out_2";=0A=
			name-of-clock-con =3D "extern2";=0A=
			avdd-supply =3D <0x57>;=0A=
			dvdd-supply =3D <0x58>;=0A=
		};=0A=
=0A=
		spi-touch14x8@0 {=0A=
			compatible =3D "raydium,rm_ts_spidev";=0A=
			status =3D "disabled";=0A=
			reg =3D <0x0>;=0A=
			spi-max-frequency =3D <0xb71b00>;=0A=
			interrupt-parent =3D <0x56>;=0A=
			interrupts =3D <0xb9 0x1>;=0A=
			reset-gpio =3D <0x56 0xae 0x0>;=0A=
			config =3D <0x0>;=0A=
			platform-id =3D <0x9>;=0A=
			name-of-clock =3D "clk_out_2";=0A=
			name-of-clock-con =3D "extern2";=0A=
			avdd-supply =3D <0x57>;=0A=
			dvdd-supply =3D <0x58>;=0A=
		};=0A=
	};=0A=
=0A=
	spi@70410000 {=0A=
		compatible =3D "nvidia,tegra210-qspi";=0A=
		reg =3D <0x0 0x70410000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0xa 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		dmas =3D <0x4c 0x5 0x4c 0x5>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0xd3 0x21 0x119>;=0A=
		clock-names =3D "qspi", "qspi_out";=0A=
		resets =3D <0x21 0xd3>;=0A=
		reset-names =3D "qspi";=0A=
		status =3D "okay";=0A=
		spi-max-frequency =3D <0x632ea00>;=0A=
		linux,phandle =3D <0x110>;=0A=
		phandle =3D <0x110>;=0A=
=0A=
		spiflash@0 {=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x1>;=0A=
			compatible =3D "MX25U3235F";=0A=
			reg =3D <0x0>;=0A=
			spi-max-frequency =3D <0x632ea00>;=0A=
=0A=
			controller-data {=0A=
				nvidia,x1-len-limit =3D <0x10>;=0A=
				nvidia,x1-bus-speed =3D <0x632ea00>;=0A=
				nvidia,x1-dymmy-cycle =3D <0x8>;=0A=
				nvidia,ctrl-bus-clk-ratio =3D [01];=0A=
				nvidia,x4-bus-speed =3D <0x632ea00>;=0A=
				nvidia,x4-dymmy-cycle =3D <0x8>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	host1x {=0A=
		compatible =3D "nvidia,tegra210-host1x", "simple-bus";=0A=
		power-domains =3D <0x23>;=0A=
		wakeup-capable;=0A=
		reg =3D <0x0 0x50000000 0x0 0x34000>;=0A=
		interrupts =3D <0x0 0x41 0x4 0x0 0x43 0x4>;=0A=
		iommus =3D <0x2b 0x6>;=0A=
		#address-cells =3D <0x2>;=0A=
		#size-cells =3D <0x2>;=0A=
		status =3D "okay";=0A=
		ranges;=0A=
		clocks =3D <0x21 0x1f2 0x21 0x77>;=0A=
		clock-names =3D "host1x", "actmon";=0A=
		resets =3D <0x21 0x1c>;=0A=
		nvidia,ch-base =3D <0x0>;=0A=
		nvidia,nb-channels =3D <0xc>;=0A=
		nvidia,nb-hw-pts =3D <0xc0>;=0A=
		nvidia,pts-base =3D <0x0>;=0A=
		nvidia,nb-pts =3D <0xc0>;=0A=
		assigned-clocks =3D <0x21 0x7a 0x21 0x92 0x21 0x91 0x21 0x90 0x21 0xd0 =
0x21 0x166 0x21 0xe4 0x21 0x142 0x21 0x3>;=0A=
		assigned-clock-parents =3D <0x21 0xf3 0x21 0xf3 0x21 0xf3 0x21 0xf3 =
0x21 0xf3 0x21 0x7a 0x21 0xed 0x21 0xed 0x21 0x142>;=0A=
		assigned-clock-rates =3D <0x16e3600 0x6146580 0x6146580 0x6146580 =
0x6146580 0x16e3600 0x18519600 0x18519600 0x0>;=0A=
		linux,phandle =3D <0x78>;=0A=
		phandle =3D <0x78>;=0A=
=0A=
		vi {=0A=
			compatible =3D "nvidia,tegra210-vi", "simple-bus";=0A=
			power-domains =3D <0x59>;=0A=
			reg =3D <0x0 0x54080000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0x45 0x4>;=0A=
			iommus =3D <0x2b 0x12>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0x210 0x21 0x34 0x21 0x90 0x21 0x91 0x21 0x92 0x21 =
0xd0 0x21 0x51 0x21 0xfa 0x21 0x133>;=0A=
			clock-names =3D "vi", "csi", "cilab", "cilcd", "cile", "vii2c", =
"i2cslow", "pll_d", "pll_d_dsi_out";=0A=
			resets =3D <0x21 0x14>;=0A=
			reset-names =3D "vi";=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			avdd_dsi_csi-supply =3D <0x36>;=0A=
			num-channels =3D <0x2>;=0A=
			linux,phandle =3D <0xbd>;=0A=
			phandle =3D <0xbd>;=0A=
=0A=
			ports {=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
=0A=
				port@0 {=0A=
					reg =3D <0x0>;=0A=
					linux,phandle =3D <0xbe>;=0A=
					phandle =3D <0xbe>;=0A=
=0A=
					endpoint {=0A=
						port-index =3D <0x0>;=0A=
						bus-width =3D <0x2>;=0A=
						remote-endpoint =3D <0x5a>;=0A=
						linux,phandle =3D <0x75>;=0A=
						phandle =3D <0x75>;=0A=
					};=0A=
				};=0A=
=0A=
				port@1 {=0A=
					reg =3D <0x1>;=0A=
					linux,phandle =3D <0xcd>;=0A=
					phandle =3D <0xcd>;=0A=
=0A=
					endpoint {=0A=
						port-index =3D <0x4>;=0A=
						bus-width =3D <0x2>;=0A=
						remote-endpoint =3D <0x5b>;=0A=
						linux,phandle =3D <0x77>;=0A=
						phandle =3D <0x77>;=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		vi-bypass {=0A=
			compatible =3D "nvidia,tegra210-vi-bypass";=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		isp@54600000 {=0A=
			compatible =3D "nvidia,tegra210-isp";=0A=
			power-domains =3D <0x59>;=0A=
			reg =3D <0x0 0x54600000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0x47 0x4>;=0A=
			iommus =3D <0x2b 0x8>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0x1ab>;=0A=
			clock-names =3D "ispa";=0A=
			resets =3D <0x21 0x17>;=0A=
		};=0A=
=0A=
		isp@54680000 {=0A=
			compatible =3D "nvidia,tegra210-isp";=0A=
			power-domains =3D <0x5c>;=0A=
			reg =3D <0x0 0x54680000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0x46 0x4>;=0A=
			iommus =3D <0x2b 0x1d>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0x1ac>;=0A=
			clock-names =3D "ispb";=0A=
			resets =3D <0x21 0x3>;=0A=
		};=0A=
=0A=
		dc@54200000 {=0A=
			compatible =3D "nvidia,tegra210-dc";=0A=
			aux-device-name =3D "tegradc.0";=0A=
			reg =3D <0x0 0x54200000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0x49 0x4>;=0A=
			win-mask =3D <0x7>;=0A=
			nvidia,fb-win =3D <0x0>;=0A=
			iommus =3D <0x2b 0x2 0x2b 0xa>;=0A=
			clocks =3D <0x21 0x1b 0x21 0x5 0x21 0x1c5 0x21 0x1c7 0x21 0xf6 0x21 =
0xfb 0x21 0xfa>;=0A=
			clock-names =3D "disp1", "timer", "disp1_emc", "disp1_la_emc", =
"pll_p_out3", "pll_d_out0", "pll_d";=0A=
			resets =3D <0x21 0x1b>;=0A=
			reset-names =3D "dc_rst";=0A=
			status =3D "okay";=0A=
			nvidia,dc-ctrlnum =3D <0x0>;=0A=
			fb_reserved =3D <0x5d>;=0A=
			iommu-direct-regions =3D <0x5d>;=0A=
			pinctrl-names =3D "dsi-dpd-disable", "dsi-dpd-enable", =
"dsib-dpd-disable", "dsib-dpd-enable", "hdmi-dpd-disable", =
"hdmi-dpd-enable";=0A=
			pinctrl-0 =3D <0x5e>;=0A=
			pinctrl-1 =3D <0x5f>;=0A=
			pinctrl-2 =3D <0x60>;=0A=
			pinctrl-3 =3D <0x61>;=0A=
			pinctrl-4 =3D <0x62>;=0A=
			pinctrl-5 =3D <0x63>;=0A=
			avdd_hdmi-supply =3D <0x40>;=0A=
			avdd_hdmi_pll-supply =3D <0x36>;=0A=
			vdd_hdmi_5v0-supply =3D <0x64>;=0A=
			nvidia,dc-flags =3D <0x1>;=0A=
			nvidia,emc-clk-rate =3D <0x11e1a300>;=0A=
			nvidia,cmu-enable =3D <0x1>;=0A=
			nvidia,fb-bpp =3D <0x20>;=0A=
			nvidia,fb-flags =3D <0x1>;=0A=
			nvidia,dc-or-node =3D "/host1x/sor1";=0A=
			nvidia,dc-connector =3D <0x65>;=0A=
			linux,phandle =3D <0x111>;=0A=
			phandle =3D <0x111>;=0A=
=0A=
			rgb {=0A=
				status =3D "disabled";=0A=
			};=0A=
		};=0A=
=0A=
		dc@54240000 {=0A=
			compatible =3D "nvidia,tegra210-dc";=0A=
			aux-device-name =3D "tegradc.1";=0A=
			reg =3D <0x0 0x54240000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0x4a 0x4>;=0A=
			win-mask =3D <0x7>;=0A=
			nvidia,fb-win =3D <0x0>;=0A=
			iommus =3D <0x2b 0x3>;=0A=
			status =3D "okay";=0A=
			nvidia,dc-ctrlnum =3D <0x1>;=0A=
			clocks =3D <0x21 0x1a 0x21 0x5 0x21 0x1c6 0x21 0x1c8 0x21 0xfd 0x21 =
0xfc>;=0A=
			clock-names =3D "disp2", "timer", "disp2_emc", "disp2_la_emc", =
"pll_d2_out0", "pll_d2";=0A=
			resets =3D <0x21 0x1a>;=0A=
			reset-names =3D "dc_rst";=0A=
			fb_reserved =3D <0x66>;=0A=
			iommu-direct-regions =3D <0x66>;=0A=
			pinctrl-names =3D "dsi-dpd-disable", "dsi-dpd-enable", =
"dsib-dpd-disable", "dsib-dpd-enable", "hdmi-dpd-disable", =
"hdmi-dpd-enable";=0A=
			pinctrl-0 =3D <0x5e>;=0A=
			pinctrl-1 =3D <0x5f>;=0A=
			pinctrl-2 =3D <0x60>;=0A=
			pinctrl-3 =3D <0x61>;=0A=
			pinctrl-4 =3D <0x62>;=0A=
			pinctrl-5 =3D <0x63>;=0A=
			vdd-dp-pwr-supply =3D <0x67>;=0A=
			avdd-dp-pll-supply =3D <0x36>;=0A=
			vdd-edp-sec-mode-supply =3D <0x42>;=0A=
			vdd-dp-pad-supply =3D <0x42>;=0A=
			vdd_hdmi_5v0-supply =3D <0x64>;=0A=
			nvidia,dc-flags =3D <0x1>;=0A=
			nvidia,emc-clk-rate =3D <0x11e1a300>;=0A=
			nvidia,cmu-enable =3D <0x1>;=0A=
			nvidia,fb-bpp =3D <0x20>;=0A=
			nvidia,fb-flags =3D <0x1>;=0A=
			nvidia,dc-or-node =3D "/host1x/sor";=0A=
			nvidia,dc-connector =3D <0x68>;=0A=
			linux,phandle =3D <0x112>;=0A=
			phandle =3D <0x112>;=0A=
=0A=
			rgb {=0A=
				status =3D "disabled";=0A=
			};=0A=
		};=0A=
=0A=
		dsi {=0A=
			compatible =3D "nvidia,tegra210-dsi";=0A=
			reg =3D <0x0 0x54300000 0x0 0x40000 0x0 0x54400000 0x0 0x40000>;=0A=
			clocks =3D <0x21 0x30 0x21 0x93 0x21 0x52 0x21 0x94 0x21 0xf6 0x21 =
0xb1>;=0A=
			clock-names =3D "dsi", "dsia_lp", "dsib", "dsib_lp", "pll_p_out3", =
"clk72mhz";=0A=
			resets =3D <0x21 0x30 0x21 0x52>;=0A=
			reset-names =3D "dsia", "dsib";=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0x113>;=0A=
			phandle =3D <0x113>;=0A=
		};=0A=
=0A=
		vic {=0A=
			compatible =3D "nvidia,tegra210-vic";=0A=
			power-domains =3D <0x69>;=0A=
			reg =3D <0x0 0x54340000 0x0 0x40000>;=0A=
			iommus =3D <0x2b 0x13>;=0A=
			iommu-group-id =3D <0x1>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0x193 0x21 0x1e2 0x21 0x19f 0x21 0x1e3>;=0A=
			clock-names =3D "vic03", "emc", "vic_floor", "emc_shared";=0A=
			resets =3D <0x21 0xb2>;=0A=
		};=0A=
=0A=
		nvenc {=0A=
			compatible =3D "nvidia,tegra210-nvenc";=0A=
			power-domains =3D <0x6a>;=0A=
			reg =3D <0x0 0x544c0000 0x0 0x40000>;=0A=
			clocks =3D <0x21 0x19d>;=0A=
			clock-names =3D "msenc";=0A=
			resets =3D <0x21 0xdb>;=0A=
			iommus =3D <0x2b 0xb>;=0A=
			iommu-group-id =3D <0x1>;=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		tsec {=0A=
			compatible =3D "nvidia,tegra210-tsec";=0A=
			power-domains =3D <0x6b>;=0A=
			reg =3D <0x0 0x54500000 0x0 0x40000>;=0A=
			clocks =3D <0x21 0x53>;=0A=
			clock-names =3D "tsec";=0A=
			resets =3D <0x21 0x53>;=0A=
			iommus =3D <0x2b 0x17>;=0A=
			iommu-group-id =3D <0x1>;=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		tsecb {=0A=
			compatible =3D "nvidia,tegra210-tsec";=0A=
			power-domains =3D <0x6b>;=0A=
			reg =3D <0x0 0x54100000 0x0 0x40000>;=0A=
			clocks =3D <0x21 0x196>;=0A=
			clock-names =3D "tsecb";=0A=
			resets =3D <0x21 0xce>;=0A=
			iommus =3D <0x2b 0x29>;=0A=
			iommu-group-id =3D <0x1>;=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		nvdec {=0A=
			compatible =3D "nvidia,tegra210-nvdec";=0A=
			power-domains =3D <0x6c>;=0A=
			reg =3D <0x0 0x54480000 0x0 0x40000>;=0A=
			clocks =3D <0x21 0x19e>;=0A=
			clock-names =3D "nvdec";=0A=
			resets =3D <0x21 0xc2>;=0A=
			iommus =3D <0x2b 0x21>;=0A=
			iommu-group-id =3D <0x1>;=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		nvjpg {=0A=
			compatible =3D "nvidia,tegra210-nvjpg";=0A=
			power-domains =3D <0x6d>;=0A=
			reg =3D <0x0 0x54380000 0x0 0x40000>;=0A=
			clocks =3D <0x21 0x194>;=0A=
			clock-names =3D "nvjpg";=0A=
			resets =3D <0x21 0xc3>;=0A=
			iommus =3D <0x2b 0x24>;=0A=
			iommu-group-id =3D <0x1>;=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		sor {=0A=
			compatible =3D "nvidia,tegra210-sor";=0A=
			reg =3D <0x0 0x54540000 0x0 0x40000>;=0A=
			reg-names =3D "sor";=0A=
			status =3D "okay";=0A=
			nvidia,sor-ctrlnum =3D <0x0>;=0A=
			nvidia,dpaux =3D <0x6e>;=0A=
			nvidia,xbar-ctrl =3D <0x2 0x1 0x0 0x3 0x4>;=0A=
			clocks =3D <0x21 0xde 0x21 0xb6 0x21 0x12f>;=0A=
			clock-names =3D "sor_safe", "sor0", "pll_dp";=0A=
			resets =3D <0x21 0xb6>;=0A=
			reset-names =3D "sor0";=0A=
			nvidia,sor-audio-not-supported;=0A=
			nvidia,sor1-output-type =3D "dp";=0A=
			nvidia,active-panel =3D <0x6f>;=0A=
			linux,phandle =3D <0x68>;=0A=
			phandle =3D <0x68>;=0A=
=0A=
			hdmi-display {=0A=
				compatible =3D "hdmi,display";=0A=
				status =3D "disabled";=0A=
				linux,phandle =3D <0x114>;=0A=
				phandle =3D <0x114>;=0A=
			};=0A=
=0A=
			dp-display {=0A=
				compatible =3D "dp, display";=0A=
				status =3D "okay";=0A=
				nvidia,hpd-gpio =3D <0x56 0xe1 0x1>;=0A=
				nvidia,is_ext_dp_panel =3D <0x1>;=0A=
				linux,phandle =3D <0x6f>;=0A=
				phandle =3D <0x6f>;=0A=
=0A=
				disp-default-out {=0A=
					nvidia,out-type =3D <0x3>;=0A=
					nvidia,out-align =3D <0x0>;=0A=
					nvidia,out-order =3D <0x0>;=0A=
					nvidia,out-flags =3D <0x0>;=0A=
					nvidia,out-pins =3D <0x1 0x0 0x2 0x0 0x3 0x0 0x0 0x1>;=0A=
					nvidia,out-parent-clk =3D "pll_d_out0";=0A=
				};=0A=
=0A=
				dp-lt-settings {=0A=
=0A=
					lt-setting@0 {=0A=
						nvidia,drive-current =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,lane-preemphasis =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,post-cursor =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,tx-pu =3D <0x0>;=0A=
						nvidia,load-adj =3D <0x3>;=0A=
					};=0A=
=0A=
					lt-setting@1 {=0A=
						nvidia,drive-current =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,lane-preemphasis =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,post-cursor =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,tx-pu =3D <0x0>;=0A=
						nvidia,load-adj =3D <0x4>;=0A=
					};=0A=
=0A=
					lt-setting@2 {=0A=
						nvidia,drive-current =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,lane-preemphasis =3D <0x1 0x1 0x1 0x1>;=0A=
						nvidia,post-cursor =3D <0x0 0x0 0x0 0x0>;=0A=
						nvidia,tx-pu =3D <0x0>;=0A=
						nvidia,load-adj =3D <0x6>;=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			prod-settings {=0A=
				#prod-cells =3D <0x3>;=0A=
=0A=
				prod_c_dp {=0A=
					prod =3D <0x5c 0xf000f10 0x1000310 0x60 0x3f00100 0x400100 0x68 =
0x2000 0x2000 0x70 0xffffffff 0x0 0x180 0x1 0x1>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		sor1 {=0A=
			compatible =3D "nvidia,tegra210-sor1";=0A=
			reg =3D <0x0 0x54580000 0x0 0x40000>;=0A=
			reg-names =3D "sor";=0A=
			interrupts =3D <0x0 0x4c 0x4>;=0A=
			status =3D "okay";=0A=
			nvidia,sor-ctrlnum =3D <0x1>;=0A=
			nvidia,dpaux =3D <0x70>;=0A=
			nvidia,xbar-ctrl =3D <0x0 0x1 0x2 0x3 0x4>;=0A=
			clocks =3D <0x21 0x16f 0x21 0xde 0x21 0x16e 0x21 0xb7 0x21 0x12f 0x21 =
0xf3 0x21 0xca 0x21 0x7d 0x21 0x6f 0x21 0x80>;=0A=
			clock-names =3D "sor1_ref", "sor_safe", "sor1_pad_clkout", "sor1", =
"pll_dp", "pll_p", "maud", "hda", "hda2codec_2x", "hda2hdmi";=0A=
			resets =3D <0x21 0xb7 0x21 0x7d 0x21 0x6f 0x21 0x80>;=0A=
			reset-names =3D "sor1", "hda_rst", "hda2codec_2x_rst", "hda2hdmi_rst";=0A=
			nvidia,ddc-i2c-bus =3D <0x71>;=0A=
			nvidia,hpd-gpio =3D <0x56 0xe1 0x1>;=0A=
			nvidia,active-panel =3D <0x72>;=0A=
			linux,phandle =3D <0x65>;=0A=
			phandle =3D <0x65>;=0A=
=0A=
			hdmi-display {=0A=
				compatible =3D "hdmi,display";=0A=
				status =3D "okay";=0A=
				generic-infoframe-type =3D <0x87>;=0A=
				linux,phandle =3D <0x72>;=0A=
				phandle =3D <0x72>;=0A=
=0A=
				disp-default-out {=0A=
					nvidia,out-xres =3D <0x1000>;=0A=
					nvidia,out-yres =3D <0x870>;=0A=
					nvidia,out-type =3D <0x1>;=0A=
					nvidia,out-flags =3D <0x2>;=0A=
					nvidia,out-parent-clk =3D "pll_d2";=0A=
					nvidia,out-align =3D <0x0>;=0A=
					nvidia,out-order =3D <0x0>;=0A=
				};=0A=
			};=0A=
=0A=
			dp-display {=0A=
				compatible =3D "dp, display";=0A=
				status =3D "disabled";=0A=
				linux,phandle =3D <0x115>;=0A=
				phandle =3D <0x115>;=0A=
			};=0A=
=0A=
			prod-settings {=0A=
				#prod-cells =3D <0x3>;=0A=
				prod_list_hdmi_soc =3D "prod_c_hdmi_0m_54m", "prod_c_hdmi_54m_111m", =
"prod_c_hdmi_111m_223m", "prod_c_hdmi_223m_300m", =
"prod_c_hdmi_300m_600m";=0A=
				prod_list_hdmi_board =3D "prod_c_hdmi_0m_54m", =
"prod_c_hdmi_54m_75m", "prod_c_hdmi_75m_150m", "prod_c_hdmi_150m_300m", =
"prod_c_hdmi_300m_600m";=0A=
=0A=
				prod {=0A=
					prod =3D <0x3a0 0x1 0x1 0x5c 0xf000700 0x1000000 0x60 0xf01f00 =
0x300f80 0x68 0xf000000 0xe000000 0x138 0xffffffff 0x3c3c3c3c 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x401000>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_0m_54m {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x5000310 0x60 0xf01f00 =
0x1100 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x2d2f2f2f 0x148 =
0xffffffff 0x0 0x170 0xf040ff00 0x80406600>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_54m_111m {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x1000100 0x60 0xf01f00 =
0x401380 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x333a3a3a 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x404000>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_111m_223m {=0A=
					prod =3D <0x3a0 0x2 0x0 0x5c 0xf000700 0x1000300 0x60 0xff0fe0ff =
0x401380 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x333a3a3a 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x406600>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_223m_300m {=0A=
					prod =3D <0x3a0 0x2 0x0 0x5c 0xf000700 0x1000300 0x60 0xf01f00 =
0x401380 0x68 0xf000000 0xa000000 0x138 0xffffffff 0x333f3f3f 0x148 =
0xffffffff 0x171717 0x170 0x40ff00 0x406600>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_300m_600m {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x5000310 0x60 0xf01f00 =
0x300f00 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x30353537 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x406000>;=0A=
				};=0A=
=0A=
				prod_c_54M {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x1000000 0x60 0xf01f00 =
0x401380 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x333a3a3a 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x401000>;=0A=
				};=0A=
=0A=
				prod_c_75M {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x1000100 0x60 0xf01f00 =
0x401380 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x333a3a3a 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x404000>;=0A=
				};=0A=
=0A=
				prod_c_150M {=0A=
					prod =3D <0x3a0 0x2 0x0 0x5c 0xf000700 0x1000300 0x60 0xff0fe0ff =
0x401380 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x333a3a3a 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x406600>;=0A=
				};=0A=
=0A=
				prod_c_300M {=0A=
					prod =3D <0x3a0 0x2 0x0 0x5c 0xf000700 0x1000300 0x60 0xf01f00 =
0x401380 0x68 0xf000000 0xa000000 0x138 0xffffffff 0x333f3f3f 0x148 =
0xffffffff 0x171717 0x170 0x40ff00 0x406600>;=0A=
				};=0A=
=0A=
				prod_c_600M {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x1000300 0x60 0xf01f00 =
0x401380 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x333f3f3f 0x148 =
0xffffffff 0x0 0x170 0x40ff00 0x406600>;=0A=
				};=0A=
=0A=
				prod_c_dp {=0A=
					prod =3D <0x5c 0xf000f10 0x1000310 0x60 0x3f00100 0x400100 0x68 =
0x2000 0x2000 0x70 0xffffffff 0x0 0x180 0x1 0x1>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_54m_75m {=0A=
					prod =3D <0x3a0 0x2 0x2 0x5c 0xf000700 0x5000310 0x60 0xf01f00 =
0x301500 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x2d303030 0x148 =
0xffffffff 0x0 0x170 0xf040ff00 0x80406600>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_75m_150m {=0A=
					prod =3D <0x3a0 0x2 0x0 0x5c 0xf000700 0x1000300 0x60 0xf01f00 =
0x309300 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x2d303030 0x148 =
0xffffffff 0x0 0x170 0xf040ff00 0x80406600>;=0A=
				};=0A=
=0A=
				prod_c_hdmi_150m_300m {=0A=
					prod =3D <0x3a0 0x2 0x0 0x5c 0xf000700 0x1000300 0x60 0xf01f00 =
0x309300 0x68 0xf000000 0x8000000 0x138 0xffffffff 0x2d303430 0x148 =
0xffffffff 0x0 0x170 0xf040ff00 0x80406600>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		dpaux {=0A=
			compatible =3D "nvidia,tegra210-dpaux";=0A=
			reg =3D <0x0 0x545c0000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0x9f 0x4>;=0A=
			nvidia,dpaux-ctrlnum =3D <0x0>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0xb5>;=0A=
			clock-names =3D "dpaux";=0A=
			resets =3D <0x21 0xb5>;=0A=
			reset-names =3D "dpaux";=0A=
			linux,phandle =3D <0x6e>;=0A=
			phandle =3D <0x6e>;=0A=
=0A=
			prod-settings {=0A=
				#prod-cells =3D <0x3>;=0A=
=0A=
				prod_c_dpaux_dp {=0A=
					prod =3D <0x124 0x37fe 0x24c2>;=0A=
				};=0A=
=0A=
				prod_c_dpaux_hdmi {=0A=
					prod =3D <0x124 0x700 0x400>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		dpaux1 {=0A=
			compatible =3D "nvidia,tegra210-dpaux1";=0A=
			reg =3D <0x0 0x54040000 0x0 0x40000>;=0A=
			interrupts =3D <0x0 0xb 0x4>;=0A=
			nvidia,dpaux-ctrlnum =3D <0x1>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0xcf>;=0A=
			clock-names =3D "dpaux1";=0A=
			resets =3D <0x21 0xcf>;=0A=
			reset-names =3D "dpaux1";=0A=
			linux,phandle =3D <0x70>;=0A=
			phandle =3D <0x70>;=0A=
=0A=
			prod-settings {=0A=
				#prod-cells =3D <0x3>;=0A=
=0A=
				prod_c_dpaux_dp {=0A=
					prod =3D <0x124 0x37fe 0x24c2>;=0A=
				};=0A=
=0A=
				prod_c_dpaux_hdmi {=0A=
					prod =3D <0x124 0x700 0x400>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		i2c@546c0000 {=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			compatible =3D "nvidia,tegra210-vii2c";=0A=
			reg =3D <0x0 0x546c0000 0x0 0x34000>;=0A=
			iommus =3D <0x2b 0x12>;=0A=
			interrupts =3D <0x0 0x11 0x4>;=0A=
			scl-gpio =3D <0x56 0x92 0x0>;=0A=
			sda-gpio =3D <0x56 0x93 0x0>;=0A=
			status =3D "okay";=0A=
			clocks =3D <0x21 0xd0 0x21 0x51 0x21 0x1c>;=0A=
			clock-names =3D "vii2c", "i2cslow", "host1x";=0A=
			resets =3D <0x21 0xd0>;=0A=
			reset-names =3D "vii2c";=0A=
			clock-frequency =3D <0x61a80>;=0A=
			bus-pullup-supply =3D <0x42>;=0A=
			avdd_dsi_csi-supply =3D <0x36>;=0A=
			linux,phandle =3D <0xa8>;=0A=
			phandle =3D <0xa8>;=0A=
=0A=
			rbpcv2_imx219_a@10 {=0A=
				compatible =3D "nvidia,imx219";=0A=
				reg =3D <0x10>;=0A=
				devnode =3D "video0";=0A=
				physical_w =3D "3.680";=0A=
				physical_h =3D "2.760";=0A=
				sensor_model =3D "imx219";=0A=
				use_sensor_mode_id =3D "true";=0A=
				status =3D "disabled";=0A=
				reset-gpios =3D <0x56 0x97 0x0>;=0A=
				linux,phandle =3D <0xb9>;=0A=
				phandle =3D <0xb9>;=0A=
=0A=
				mode0 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "3264";=0A=
					active_h =3D "2464";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "21000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "21000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode1 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "3264";=0A=
					active_h =3D "1848";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "28000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "28000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode2 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1920";=0A=
					active_h =3D "1080";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "30000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "30000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode3 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1280";=0A=
					active_h =3D "720";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "60000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "60000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode4 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1280";=0A=
					active_h =3D "720";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "169600000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "120000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "120000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				ports {=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					port@0 {=0A=
						reg =3D <0x0>;=0A=
=0A=
						endpoint {=0A=
							port-index =3D <0x0>;=0A=
							bus-width =3D <0x2>;=0A=
							remote-endpoint =3D <0x73>;=0A=
							linux,phandle =3D <0xc2>;=0A=
							phandle =3D <0xc2>;=0A=
						};=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			ina3221x@40 {=0A=
				compatible =3D "ti,ina3221x";=0A=
				reg =3D <0x40>;=0A=
				status =3D "okay";=0A=
				ti,trigger-config =3D <0x7003>;=0A=
				ti,continuous-config =3D <0x7607>;=0A=
				ti,enable-forced-continuous;=0A=
				#io-channel-cells =3D <0x1>;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
				linux,phandle =3D <0xad>;=0A=
				phandle =3D <0xad>;=0A=
=0A=
				channel@0 {=0A=
					reg =3D <0x0>;=0A=
					ti,rail-name =3D "POM_5V_GPU";=0A=
					ti,shunt-resistor-mohm =3D <0x5>;=0A=
				};=0A=
=0A=
				channel@1 {=0A=
					reg =3D <0x1>;=0A=
					ti,rail-name =3D "POM_5V_IN";=0A=
					ti,shunt-resistor-mohm =3D <0x5>;=0A=
				};=0A=
=0A=
				channel@2 {=0A=
					reg =3D <0x2>;=0A=
					ti,rail-name =3D "POM_5V_CPU";=0A=
					ti,shunt-resistor-mohm =3D <0x5>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		nvcsi {=0A=
			num-channels =3D <0x2>;=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			linux,phandle =3D <0xbf>;=0A=
			phandle =3D <0xbf>;=0A=
=0A=
			channel@0 {=0A=
				reg =3D <0x0>;=0A=
				linux,phandle =3D <0xc0>;=0A=
				phandle =3D <0xc0>;=0A=
=0A=
				ports {=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					port@0 {=0A=
						reg =3D <0x0>;=0A=
						linux,phandle =3D <0xc1>;=0A=
						phandle =3D <0xc1>;=0A=
=0A=
						endpoint@0 {=0A=
							port-index =3D <0x0>;=0A=
							bus-width =3D <0x2>;=0A=
							remote-endpoint =3D <0x74>;=0A=
							linux,phandle =3D <0x73>;=0A=
							phandle =3D <0x73>;=0A=
						};=0A=
					};=0A=
=0A=
					port@1 {=0A=
						reg =3D <0x1>;=0A=
						linux,phandle =3D <0xc3>;=0A=
						phandle =3D <0xc3>;=0A=
=0A=
						endpoint@1 {=0A=
							remote-endpoint =3D <0x75>;=0A=
							linux,phandle =3D <0x5a>;=0A=
							phandle =3D <0x5a>;=0A=
						};=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			channel@1 {=0A=
				reg =3D <0x1>;=0A=
				linux,phandle =3D <0xce>;=0A=
				phandle =3D <0xce>;=0A=
=0A=
				ports {=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					port@2 {=0A=
						reg =3D <0x0>;=0A=
						linux,phandle =3D <0xcf>;=0A=
						phandle =3D <0xcf>;=0A=
=0A=
						endpoint@2 {=0A=
							port-index =3D <0x4>;=0A=
							bus-width =3D <0x2>;=0A=
							remote-endpoint =3D <0x76>;=0A=
							linux,phandle =3D <0xa9>;=0A=
							phandle =3D <0xa9>;=0A=
						};=0A=
					};=0A=
=0A=
					port@3 {=0A=
						reg =3D <0x1>;=0A=
						linux,phandle =3D <0xd0>;=0A=
						phandle =3D <0xd0>;=0A=
=0A=
						endpoint@3 {=0A=
							remote-endpoint =3D <0x77>;=0A=
							linux,phandle =3D <0x5b>;=0A=
							phandle =3D <0x5b>;=0A=
						};=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	gpu {=0A=
		compatible =3D "nvidia,tegra210-gm20b", "nvidia,gm20b";=0A=
		nvidia,host1x =3D <0x78>;=0A=
		reg =3D <0x0 0x57000000 0x0 0x1000000 0x0 0x58000000 0x0 0x1000000 0x0 =
0x538f0000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0x9d 0x4 0x0 0x9e 0x4>;=0A=
		interrupt-names =3D "stall", "nonstall";=0A=
		iommus =3D <0x2b 0x1f>;=0A=
		access-vpr-phys;=0A=
		status =3D "okay";=0A=
		resets =3D <0x21 0xb8>;=0A=
		reset-names =3D "gpu";=0A=
	};=0A=
=0A=
	mipical {=0A=
		compatible =3D "nvidia,tegra210-mipical";=0A=
		reg =3D <0x0 0x700e3000 0x0 0x100>;=0A=
		clocks =3D <0x21 0x38 0x21 0xb1>;=0A=
		clock-names =3D "mipi_cal", "uart_mipi_cal";=0A=
		status =3D "okay";=0A=
		assigned-clocks =3D <0x21 0xb1>;=0A=
		assigned-clock-parents =3D <0x21 0xf3>;=0A=
		assigned-clock-rates =3D <0x40d9900>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod_c_dphy_dsi {=0A=
				prod =3D <0x38 0x1f00 0x200 0x3c 0x1f00 0x200 0x40 0x1f00 0x200 0x44 =
0x1f00 0x200 0x5c 0xf00 0x300 0x60 0xf00f0 0x10010 0x64 0x1f 0x2 0x68 =
0x1f 0x2 0x70 0x1f 0x2 0x74 0x1f 0x2>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	pmc@7000e400 {=0A=
		compatible =3D "nvidia,tegra210-pmc";=0A=
		reg =3D <0x0 0x7000e400 0x0 0x400>;=0A=
		#padcontroller-cells =3D <0x1>;=0A=
		status =3D "okay";=0A=
		clocks =3D <0x21 0x125>;=0A=
		clock-names =3D "pclk";=0A=
		nvidia,secure-pmc;=0A=
		clear-all-io-pads-dpd;=0A=
		pinctrl-names =3D "default";=0A=
		pinctrl-0 =3D <0x79>;=0A=
		nvidia,restrict-voltage-switch;=0A=
		#nvidia,wake-cells =3D <0x3>;=0A=
		nvidia,invert-interrupt;=0A=
		nvidia,suspend-mode =3D <0x0>;=0A=
		nvidia,cpu-pwr-good-time =3D <0x0>;=0A=
		nvidia,cpu-pwr-off-time =3D <0x0>;=0A=
		nvidia,core-pwr-good-time =3D <0x11eb 0xf24>;=0A=
		nvidia,core-pwr-off-time =3D <0x9899>;=0A=
		nvidia,core-pwr-req-active-high;=0A=
		nvidia,sys-clock-req-active-high;=0A=
		linux,phandle =3D <0x37>;=0A=
		phandle =3D <0x37>;=0A=
=0A=
		pex_en {=0A=
			linux,phandle =3D <0x7f>;=0A=
			phandle =3D <0x7f>;=0A=
=0A=
			pex-io-dpd-signals-dis {=0A=
				pins =3D "pex-bias", "pex-clk1", "pex-clk2";=0A=
				low-power-disable;=0A=
			};=0A=
		};=0A=
=0A=
		pex_dis {=0A=
			linux,phandle =3D <0x80>;=0A=
			phandle =3D <0x80>;=0A=
=0A=
			pex-io-dpd-signals-en {=0A=
				pins =3D "pex-bias", "pex-clk1", "pex-clk2";=0A=
				low-power-enable;=0A=
			};=0A=
		};=0A=
=0A=
		hdmi-dpd-enable {=0A=
			linux,phandle =3D <0x63>;=0A=
			phandle =3D <0x63>;=0A=
=0A=
			hdmi-pad-lowpower-enable {=0A=
				pins =3D "hdmi";=0A=
				low-power-enable;=0A=
			};=0A=
		};=0A=
=0A=
		hdmi-dpd-disable {=0A=
			linux,phandle =3D <0x62>;=0A=
			phandle =3D <0x62>;=0A=
=0A=
			hdmi-pad-lowpower-disable {=0A=
				pins =3D "hdmi";=0A=
				low-power-disable;=0A=
			};=0A=
		};=0A=
=0A=
		dsi-dpd-enable {=0A=
			linux,phandle =3D <0x5f>;=0A=
			phandle =3D <0x5f>;=0A=
=0A=
			dsi-pad-lowpower-enable {=0A=
				pins =3D "dsi";=0A=
				low-power-enable;=0A=
			};=0A=
		};=0A=
=0A=
		dsi-dpd-disable {=0A=
			linux,phandle =3D <0x5e>;=0A=
			phandle =3D <0x5e>;=0A=
=0A=
			dsi-pad-lowpower-disable {=0A=
				pins =3D "dsi";=0A=
				low-power-disable;=0A=
			};=0A=
		};=0A=
=0A=
		dsib-dpd-enable {=0A=
			linux,phandle =3D <0x61>;=0A=
			phandle =3D <0x61>;=0A=
=0A=
			dsib-pad-lowpower-enable {=0A=
				pins =3D "dsib";=0A=
				low-power-enable;=0A=
			};=0A=
		};=0A=
=0A=
		dsib-dpd-disable {=0A=
			linux,phandle =3D <0x60>;=0A=
			phandle =3D <0x60>;=0A=
=0A=
			dsib-pad-lowpower-disable {=0A=
				pins =3D "dsib";=0A=
				low-power-disable;=0A=
			};=0A=
		};=0A=
=0A=
		iopad-defaults {=0A=
			linux,phandle =3D <0x79>;=0A=
			phandle =3D <0x79>;=0A=
=0A=
			audio-pads {=0A=
				pins =3D "audio";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			cam-pads {=0A=
				pins =3D "cam";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			dbg-pads {=0A=
				pins =3D "dbg";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			dmic-pads {=0A=
				pins =3D "dmic";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			pex-ctrl-pads {=0A=
				pins =3D "pex-ctrl";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			spi-pads {=0A=
				pins =3D "spi";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			uart-pads {=0A=
				pins =3D "uart";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			pex-io-pads {=0A=
				pins =3D "pex-bias", "pex-clk1", "pex-clk2";=0A=
				low-power-enable;=0A=
			};=0A=
=0A=
			audio-hv-pads {=0A=
				pins =3D "audio-hv";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			spi-hv-pads {=0A=
				pins =3D "spi-hv";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			gpio-pads {=0A=
				pins =3D "gpio";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
=0A=
			sdmmc-io-pads {=0A=
				pins =3D "sdmmc1", "sdmmc3";=0A=
				nvidia,enable-voltage-switching;=0A=
			};=0A=
		};=0A=
=0A=
		bootrom-commands {=0A=
			nvidia,command-retries-count =3D <0x2>;=0A=
			nvidia,delay-between-commands-us =3D <0xa>;=0A=
			nvidia,wait-start-bus-clear-us =3D <0xa>;=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
=0A=
			reset-commands {=0A=
				nvidia,command-retries-count =3D <0x2>;=0A=
				nvidia,delay-between-commands-us =3D <0xa>;=0A=
				nvidia,wait-start-bus-clear-us =3D <0xa>;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
=0A=
				commands@4-003c {=0A=
					nvidia,command-names =3D "pmic-rails";=0A=
					reg =3D <0x3c>;=0A=
					nvidia,enable-8bit-register;=0A=
					nvidia,enable-8bit-data;=0A=
					nvidia,controller-type-i2c;=0A=
					nvidia,controller-id =3D <0x4>;=0A=
					nvidia,enable-controller-reset;=0A=
					nvidia,write-commands =3D <0x16 0x20>;=0A=
				};=0A=
			};=0A=
=0A=
			power-off-commands {=0A=
				nvidia,command-retries-count =3D <0x2>;=0A=
				nvidia,delay-between-commands-us =3D <0xa>;=0A=
				nvidia,wait-start-bus-clear-us =3D <0xa>;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
=0A=
				commands@4-003c {=0A=
					nvidia,command-names =3D "pmic-rails";=0A=
					reg =3D <0x3c>;=0A=
					nvidia,enable-8bit-register;=0A=
					nvidia,enable-8bit-data;=0A=
					nvidia,controller-type-i2c;=0A=
					nvidia,controller-id =3D <0x4>;=0A=
					nvidia,enable-controller-reset;=0A=
					nvidia,write-commands =3D <0x3b 0x1 0x42 0x5b 0x41 0xf8>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_e_33V_enable {=0A=
			linux,phandle =3D <0x96>;=0A=
			phandle =3D <0x96>;=0A=
=0A=
			sdmmc1 {=0A=
				pins =3D "sdmmc1";=0A=
				nvidia,power-source-voltage =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc1_e_33V_disable {=0A=
			linux,phandle =3D <0x97>;=0A=
			phandle =3D <0x97>;=0A=
=0A=
			sdmmc1 {=0A=
				pins =3D "sdmmc1";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_e_33V_enable {=0A=
			linux,phandle =3D <0x8e>;=0A=
			phandle =3D <0x8e>;=0A=
=0A=
			sdmmc3 {=0A=
				pins =3D "sdmmc3";=0A=
				nvidia,power-source-voltage =3D <0x1>;=0A=
			};=0A=
		};=0A=
=0A=
		sdmmc3_e_33V_disable {=0A=
			linux,phandle =3D <0x8f>;=0A=
			phandle =3D <0x8f>;=0A=
=0A=
			sdmmc3 {=0A=
				pins =3D "sdmmc3";=0A=
				nvidia,power-source-voltage =3D <0x0>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	se@70012000 {=0A=
		compatible =3D "nvidia,tegra210-se";=0A=
		reg =3D <0x0 0x70012000 0x0 0x2000>;=0A=
		iommus =3D <0x2b 0x23 0x2b 0x26>;=0A=
		iommu-group-id =3D <0x4>;=0A=
		interrupts =3D <0x0 0x3a 0x4>;=0A=
		clocks =3D <0x21 0x195 0x21 0x95>;=0A=
		clock-names =3D "se", "entropy";=0A=
		status =3D "okay";=0A=
		supported-algos =3D "aes", "drbg", "rsa", "sha";=0A=
		linux,phandle =3D <0x116>;=0A=
		phandle =3D <0x116>;=0A=
	};=0A=
=0A=
	hda@70030000 {=0A=
		compatible =3D "nvidia,tegra30-hda";=0A=
		reg =3D <0x0 0x70030000 0x0 0x10000>;=0A=
		interrupts =3D <0x0 0x51 0x4>;=0A=
		clocks =3D <0x21 0x7d 0x21 0x80 0x21 0x6f 0x21 0xca>;=0A=
		clock-names =3D "hda", "hda2hdmi", "hda2codec_2x", "maud";=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	pcie@1003000 {=0A=
		compatible =3D "nvidia,tegra210-pcie", "nvidia,tegra124-pcie";=0A=
		power-domains =3D <0x7a>;=0A=
		device_type =3D "pci";=0A=
		reg =3D <0x0 0x1003000 0x0 0x800 0x0 0x1003800 0x0 0x800 0x0 =
0x11fff000 0x0 0x1000>;=0A=
		reg-names =3D "pads", "afi", "cs";=0A=
		interrupts =3D <0x0 0x62 0x4 0x0 0x63 0x4>;=0A=
		interrupt-names =3D "intr", "msi";=0A=
		clocks =3D <0x21 0x46 0x21 0x48 0x21 0x107 0x21 0x12c 0x21 0x63>;=0A=
		clock-names =3D "pex", "afi", "pll_e", "cml", "mselect";=0A=
		resets =3D <0x21 0x46 0x21 0x48 0x21 0x4a>;=0A=
		reset-names =3D "pex", "afi", "pcie_x";=0A=
		#interrupt-cells =3D <0x1>;=0A=
		interrupt-map-mask =3D <0x0 0x0 0x0 0x0>;=0A=
		interrupt-map =3D <0x0 0x0 0x0 0x0 0x33 0x0 0x62 0x4>;=0A=
		pinctrl-names =3D "clkreq-0-bi-dir-enable", "clkreq-1-bi-dir-enable", =
"clkreq-0-in-dir-enable", "clkreq-1-in-dir-enable", "pex-io-dpd-dis", =
"pex-io-dpd-en";=0A=
		pinctrl-0 =3D <0x7b>;=0A=
		pinctrl-1 =3D <0x7c>;=0A=
		pinctrl-2 =3D <0x7d>;=0A=
		pinctrl-3 =3D <0x7e>;=0A=
		pinctrl-4 =3D <0x7f>;=0A=
		pinctrl-5 =3D <0x80>;=0A=
		bus-range =3D <0x0 0xff>;=0A=
		#address-cells =3D <0x3>;=0A=
		#size-cells =3D <0x2>;=0A=
		ranges =3D <0x82000000 0x0 0x1000000 0x0 0x1000000 0x0 0x1000 =
0x82000000 0x0 0x1001000 0x0 0x1001000 0x0 0x1000 0x81000000 0x0 0x0 0x0 =
0x12000000 0x0 0x10000 0x82000000 0x0 0x13000000 0x0 0x13000000 0x0 =
0xd000000 0xc2000000 0x0 0x20000000 0x0 0x20000000 0x0 0x20000000>;=0A=
		status =3D "okay";=0A=
		nvidia,wake-gpio =3D <0x56 0x2 0x0>;=0A=
		nvidia,pmc-wakeup =3D <0x37 0x1 0x0 0x8>;=0A=
		avdd-pll-uerefe-supply =3D <0x3e>;=0A=
		hvddio-pex-supply =3D <0x36>;=0A=
		dvddio-pex-supply =3D <0x3f>;=0A=
		dvdd-pex-pll-supply =3D <0x3f>;=0A=
		hvdd-pex-pll-e-supply =3D <0x36>;=0A=
		vddio-pex-ctl-supply =3D <0x36>;=0A=
=0A=
		pci@1,0 {=0A=
			device_type =3D "pci";=0A=
			assigned-addresses =3D <0x82000800 0x0 0x1000000 0x0 0x1000>;=0A=
			reg =3D <0x800 0x0 0x0 0x0 0x0>;=0A=
			status =3D "okay";=0A=
			#address-cells =3D <0x3>;=0A=
			#size-cells =3D <0x2>;=0A=
			ranges;=0A=
			nvidia,num-lanes =3D <0x4>;=0A=
			nvidia,afi-ctl-offset =3D <0x110>;=0A=
			nvidia,disable-aspm-states =3D <0xf>;=0A=
			phys =3D <0x81 0x82 0x83 0x84>;=0A=
			phy-names =3D "pcie-0", "pcie-1", "pcie-2", "pcie-3";=0A=
		};=0A=
=0A=
		pci@2,0 {=0A=
			device_type =3D "pci";=0A=
			assigned-addresses =3D <0x82001000 0x0 0x1001000 0x0 0x1000>;=0A=
			reg =3D <0x1000 0x0 0x0 0x0 0x0>;=0A=
			status =3D "okay";=0A=
			#address-cells =3D <0x3>;=0A=
			#size-cells =3D <0x2>;=0A=
			ranges;=0A=
			nvidia,num-lanes =3D <0x1>;=0A=
			nvidia,afi-ctl-offset =3D <0x118>;=0A=
			nvidia,disable-aspm-states =3D <0xf>;=0A=
			phys =3D <0x85>;=0A=
			phy-names =3D "pcie-0";=0A=
			nvidia,plat-gpios =3D <0x56 0xbb 0x0>;=0A=
			linux,phandle =3D <0xc6>;=0A=
			phandle =3D <0xc6>;=0A=
=0A=
			ethernet@0,0 {=0A=
				reg =3D <0x0 0x0 0x0 0x0 0x0>;=0A=
				linux,phandle =3D <0xd4>;=0A=
				phandle =3D <0xd4>;=0A=
			};=0A=
		};=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod_c_pad {=0A=
				prod =3D <0xc8 0xffffffff 0x90b890b8>;=0A=
			};=0A=
=0A=
			prod_c_rp {=0A=
				prod =3D <0xe84 0xffff 0xf 0xea4 0xffff 0x8f 0xe90 0xffffffff =
0x55010000 0xe94 0xffffffff 0x1 0xeb0 0xffffffff 0x55010000 0xeb4 =
0xffffffff 0x1 0xe8c 0xffff0000 0x670000 0xeac 0xffff0000 0xc70000>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	i2c@7000c000 {=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		compatible =3D "nvidia,tegra210-i2c";=0A=
		reg =3D <0x0 0x7000c000 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x26 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		status =3D "okay";=0A=
		clock-frequency =3D <0x61a80>;=0A=
		dmas =3D <0x4c 0x15 0x4c 0x15>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0xc 0x21 0xf3>;=0A=
		clock-names =3D "div-clk", "parent";=0A=
		resets =3D <0x21 0xc>;=0A=
		reset-names =3D "i2c";=0A=
		linux,phandle =3D <0xab>;=0A=
		phandle =3D <0xab>;=0A=
=0A=
		temp-sensor@4c {=0A=
			#thermal-sensor-cells =3D <0x1>;=0A=
			compatible =3D "ti,tmp451";=0A=
			reg =3D <0x4c>;=0A=
			sensor-name =3D "tegra";=0A=
			supported-hwrev =3D <0x1>;=0A=
			offset =3D <0x0>;=0A=
			conv-rate =3D <0x6>;=0A=
			extended-rage =3D <0x1>;=0A=
			interrupt-parent =3D <0x56>;=0A=
			interrupts =3D <0xbc 0x8>;=0A=
			vdd-supply =3D <0x36>;=0A=
			temp-alert-gpio =3D <0x56 0xbc 0x0>;=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0x117>;=0A=
			phandle =3D <0x117>;=0A=
=0A=
			loc {=0A=
				shutdown-limit =3D <0x78>;=0A=
			};=0A=
=0A=
			ext {=0A=
				shutdown-limit =3D <0x69>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	i2c@7000c400 {=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		compatible =3D "nvidia,tegra210-i2c";=0A=
		reg =3D <0x0 0x7000c400 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x54 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		status =3D "okay";=0A=
		clock-frequency =3D <0x186a0>;=0A=
		dmas =3D <0x4c 0x16 0x4c 0x16>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0x36 0x21 0xf3>;=0A=
		clock-names =3D "div-clk", "parent";=0A=
		resets =3D <0x21 0x36>;=0A=
		reset-names =3D "i2c";=0A=
		linux,phandle =3D <0x118>;=0A=
		phandle =3D <0x118>;=0A=
=0A=
		i2cmux@70 {=0A=
			compatible =3D "nxp,pca9546";=0A=
			reg =3D <0x70>;=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			vcc-supply =3D <0x47>;=0A=
			vcc-pullup-supply =3D <0x47>;=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0xd5>;=0A=
			phandle =3D <0xd5>;=0A=
=0A=
			i2c@0 {=0A=
				reg =3D <0x0>;=0A=
				i2c-mux,deselect-on-exit;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
			};=0A=
=0A=
			i2c@1 {=0A=
				reg =3D <0x1>;=0A=
				i2c-mux,deselect-on-exit;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
=0A=
				ina3221x@40 {=0A=
					compatible =3D "ti,ina3221x";=0A=
					reg =3D <0x40>;=0A=
					ti,trigger-config =3D <0x7003>;=0A=
					ti,continuous-config =3D <0x7c07>;=0A=
					ti,enable-forced-continuous;=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					channel@0 {=0A=
						reg =3D <0x0>;=0A=
						ti,rail-name =3D "VDD_5V";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
=0A=
					channel@1 {=0A=
						reg =3D <0x1>;=0A=
						ti,rail-name =3D "VDD_3V3";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
=0A=
					channel@2 {=0A=
						reg =3D <0x2>;=0A=
						ti,rail-name =3D "VDD_1V8";=0A=
						ti,shunt-resistor-mohm =3D <0x1>;=0A=
					};=0A=
				};=0A=
=0A=
				ina3221x@41 {=0A=
					compatible =3D "ti,ina3221x";=0A=
					reg =3D <0x41>;=0A=
					ti,trigger-config =3D <0x7003>;=0A=
					ti,continuous-config =3D <0x7c07>;=0A=
					ti,enable-forced-continuous;=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					channel@0 {=0A=
						reg =3D <0x0>;=0A=
						ti,rail-name =3D "VDD_5V_AUD";=0A=
						ti,shunt-resistor-mohm =3D <0x1>;=0A=
					};=0A=
=0A=
					channel@1 {=0A=
						reg =3D <0x1>;=0A=
						ti,rail-name =3D "VDD_3V3_AUD";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
=0A=
					channel@2 {=0A=
						reg =3D <0x2>;=0A=
						ti,rail-name =3D "VDD_1V8_AUD";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
				};=0A=
=0A=
				ina3221x@42 {=0A=
					compatible =3D "ti,ina3221x";=0A=
					reg =3D <0x42>;=0A=
					ti,trigger-config =3D <0x7003>;=0A=
					ti,continuous-config =3D <0x7c07>;=0A=
					ti,enable-forced-continuous;=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					channel@0 {=0A=
						reg =3D <0x0>;=0A=
						ti,rail-name =3D "VDD_3V3_GPS";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
=0A=
					channel@1 {=0A=
						reg =3D <0x1>;=0A=
						ti,rail-name =3D "VDD_3V3_NFC";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
=0A=
					channel@2 {=0A=
						reg =3D <0x2>;=0A=
						ti,rail-name =3D "VDD_3V3_GYRO";=0A=
						ti,shunt-resistor-mohm =3D <0xa>;=0A=
					};=0A=
				};=0A=
			};=0A=
=0A=
			i2c@2 {=0A=
				reg =3D <0x2>;=0A=
				i2c-mux,deselect-on-exit;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
			};=0A=
=0A=
			i2c@3 {=0A=
				reg =3D <0x3>;=0A=
				i2c-mux,deselect-on-exit;=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
=0A=
				rt5659.12-001a@1a {=0A=
					compatible =3D "realtek,rt5658";=0A=
					reg =3D <0x1a>;=0A=
					status =3D "disabled";=0A=
					gpios =3D <0x56 0xe 0x0>;=0A=
					realtek,jd-src =3D <0x1>;=0A=
					realtek,dmic1-data-pin =3D <0x2>;=0A=
					linux,phandle =3D <0xdd>;=0A=
					phandle =3D <0xdd>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		gpio@20 {=0A=
			compatible =3D "ti,tca6416";=0A=
			reg =3D <0x20>;=0A=
			gpio-controller;=0A=
			#gpio-cells =3D <0x2>;=0A=
			vcc-supply =3D <0x47>;=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0xd6>;=0A=
			phandle =3D <0xd6>;=0A=
		};=0A=
=0A=
		icm20628@68 {=0A=
			compatible =3D "invensense,mpu6xxx";=0A=
			reg =3D <0x68>;=0A=
			interrupt-parent =3D <0x56>;=0A=
			interrupts =3D <0xc8 0x1>;=0A=
			accelerometer_matrix =3D [01 00 00 00 01 00 00 00 01];=0A=
			gyroscope_matrix =3D [01 00 00 00 01 00 00 00 01];=0A=
			geomagnetic_rotation_vector_disable =3D <0x1>;=0A=
			gyroscope_uncalibrated_disable =3D <0x1>;=0A=
			quaternion_disable =3D <0x1>;=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0xd7>;=0A=
			phandle =3D <0xd7>;=0A=
		};=0A=
=0A=
		ak8963@0d {=0A=
			compatible =3D "ak,ak89xx";=0A=
			reg =3D <0xd>;=0A=
			magnetic_field_matrix =3D [01 00 00 00 01 00 00 00 01];=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0xd8>;=0A=
			phandle =3D <0xd8>;=0A=
		};=0A=
=0A=
		cm32180@48 {=0A=
			compatible =3D "capella,cm32180";=0A=
			reg =3D <0x48>;=0A=
			gpio_irq =3D <0x56 0xc 0x1>;=0A=
			light_uncalibrated_lo =3D <0x1>;=0A=
			light_calibrated_lo =3D <0x96>;=0A=
			light_uncalibrated_hi =3D <0x17318>;=0A=
			light_calibrated_hi =3D <0x1ab3f0>;=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0xd9>;=0A=
			phandle =3D <0xd9>;=0A=
		};=0A=
=0A=
		iqs263@44 {=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0x119>;=0A=
			phandle =3D <0x119>;=0A=
		};=0A=
=0A=
		rt5659.1-001a@1a {=0A=
			compatible =3D "realtek,rt5658";=0A=
			reg =3D <0x1a>;=0A=
			status =3D "disabled";=0A=
			gpios =3D <0x56 0xe 0x0>;=0A=
			realtek,jd-src =3D <0x1>;=0A=
			realtek,dmic1-data-pin =3D <0x2>;=0A=
			linux,phandle =3D <0xdc>;=0A=
			phandle =3D <0xdc>;=0A=
		};=0A=
	};=0A=
=0A=
	i2c@7000c500 {=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		compatible =3D "nvidia,tegra210-i2c";=0A=
		reg =3D <0x0 0x7000c500 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x5c 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		status =3D "okay";=0A=
		clock-frequency =3D <0x61a80>;=0A=
		dmas =3D <0x4c 0x17 0x4c 0x17>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0x43 0x21 0xf3>;=0A=
		clock-names =3D "div-clk", "parent";=0A=
		resets =3D <0x21 0x43>;=0A=
		reset-names =3D "i2c";=0A=
		linux,phandle =3D <0xac>;=0A=
		phandle =3D <0xac>;=0A=
=0A=
		battery-charger@6b {=0A=
			status =3D "disabled";=0A=
		};=0A=
	};=0A=
=0A=
	i2c@7000c700 {=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		compatible =3D "nvidia,tegra210-i2c";=0A=
		reg =3D <0x0 0x7000c700 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x78 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		status =3D "okay";=0A=
		clock-frequency =3D <0x186a0>;=0A=
		dmas =3D <0x4c 0x1a 0x4c 0x1a>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0x67 0x21 0xf3>;=0A=
		clock-names =3D "div-clk", "parent";=0A=
		resets =3D <0x21 0x67>;=0A=
		reset-names =3D "i2c";=0A=
		nvidia,restrict-clk-change;=0A=
		print-rate-limit =3D <0x78 0x1>;=0A=
		linux,phandle =3D <0x71>;=0A=
		phandle =3D <0x71>;=0A=
	};=0A=
=0A=
	i2c@7000d000 {=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		compatible =3D "nvidia,tegra210-i2c";=0A=
		reg =3D <0x0 0x7000d000 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x35 0x4>;=0A=
		scl-gpio =3D <0x56 0xc3 0x0>;=0A=
		sda-gpio =3D <0x56 0xc4 0x0>;=0A=
		nvidia,require-cldvfs-clock;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		status =3D "okay";=0A=
		clock-frequency =3D <0xf4240>;=0A=
		dmas =3D <0x4c 0x18 0x4c 0x18>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0x2f 0x21 0xf3>;=0A=
		clock-names =3D "div-clk", "parent";=0A=
		resets =3D <0x21 0x2f>;=0A=
		reset-names =3D "i2c";=0A=
		nvidia,bit-bang-after-shutdown;=0A=
		linux,phandle =3D <0x11a>;=0A=
		phandle =3D <0x11a>;=0A=
=0A=
		max77620@3c {=0A=
			compatible =3D "maxim,max77620";=0A=
			reg =3D <0x3c>;=0A=
			interrupts =3D <0x0 0x56 0x0>;=0A=
			nvidia,pmc-wakeup =3D <0x37 0x1 0x33 0x8>;=0A=
			#interrupt-cells =3D <0x2>;=0A=
			interrupt-controller;=0A=
			gpio-controller;=0A=
			#gpio-cells =3D <0x2>;=0A=
			maxim,enable-clock32k-out;=0A=
			maxim,system-pmic-power-off;=0A=
			maxim,hot-die-threshold-temp =3D <0x1adb0>;=0A=
			#thermal-sensor-cells =3D <0x0>;=0A=
			pinctrl-names =3D "default";=0A=
			pinctrl-0 =3D <0x86>;=0A=
			maxim,power-shutdown-gpio-states =3D <0x1 0x0>;=0A=
			linux,phandle =3D <0x1e>;=0A=
			phandle =3D <0x1e>;=0A=
=0A=
			pinmux@0 {=0A=
				linux,phandle =3D <0x86>;=0A=
				phandle =3D <0x86>;=0A=
=0A=
				pin_gpio0 {=0A=
					pins =3D "gpio0";=0A=
					function =3D "gpio";=0A=
				};=0A=
=0A=
				pin_gpio1 {=0A=
					pins =3D "gpio1";=0A=
					function =3D "gpio";=0A=
					drive-open-drain =3D <0x1>;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
				};=0A=
=0A=
				pin_gpio2 {=0A=
					pins =3D "gpio2";=0A=
					maxim,active-fps-source =3D <0x0>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
				};=0A=
=0A=
				pin_gpio3 {=0A=
					pins =3D "gpio3";=0A=
					maxim,active-fps-source =3D <0x0>;=0A=
					maxim,active-fps-power-up-slot =3D <0x4>;=0A=
					maxim,active-fps-power-down-slot =3D <0x3>;=0A=
				};=0A=
=0A=
				pin_gpio2_3 {=0A=
					pins =3D "gpio2", "gpio3";=0A=
					function =3D "fps-out";=0A=
					drive-open-drain =3D <0x1>;=0A=
					maxim,active-fps-source =3D <0x0>;=0A=
				};=0A=
=0A=
				pin_gpio4 {=0A=
					pins =3D "gpio4";=0A=
					function =3D "32k-out1";=0A=
				};=0A=
=0A=
				pin_gpio5_6_7 {=0A=
					pins =3D "gpio5", "gpio6", "gpio7";=0A=
					function =3D "gpio";=0A=
					drive-push-pull =3D <0x1>;=0A=
				};=0A=
			};=0A=
=0A=
			spmic-default-output-high {=0A=
				gpio-hog;=0A=
				output-high;=0A=
				gpios =3D <0x1 0x0>;=0A=
				label =3D "spmic-default-output-high";=0A=
			};=0A=
=0A=
			watchdog {=0A=
				maxim,wdt-timeout =3D <0x10>;=0A=
				maxim,wdt-clear-time =3D <0xd>;=0A=
				status =3D "disabled";=0A=
				dt-override-status-odm-data =3D <0x20000 0x20000>;=0A=
				linux,phandle =3D <0xb6>;=0A=
				phandle =3D <0xb6>;=0A=
			};=0A=
=0A=
			fps {=0A=
				#address-cells =3D <0x1>;=0A=
				#size-cells =3D <0x0>;=0A=
=0A=
				fps0 {=0A=
					reg =3D <0x0>;=0A=
					maxim,shutdown-fps-time-periodi-us =3D <0x500>;=0A=
					maxim,fps-event-source =3D <0x0>;=0A=
				};=0A=
=0A=
				fps1 {=0A=
					reg =3D <0x1>;=0A=
					maxim,shutdown-fps-time-period-us =3D <0x500>;=0A=
					maxim,fps-event-source =3D <0x1>;=0A=
					maxim,device-state-on-disabled-event =3D <0x0>;=0A=
				};=0A=
=0A=
				fps2 {=0A=
					reg =3D <0x2>;=0A=
					maxim,fps-event-source =3D <0x0>;=0A=
				};=0A=
			};=0A=
=0A=
			backup-battery {=0A=
				maxim,backup-battery-charging-current =3D <0x64>;=0A=
				maxim,backup-battery-charging-voltage =3D <0x2dc6c0>;=0A=
				maxim,backup-battery-output-resister =3D <0x64>;=0A=
			};=0A=
=0A=
			regulators {=0A=
				in-ldo0-1-supply =3D <0x87>;=0A=
				in-ldo7-8-supply =3D <0x87>;=0A=
=0A=
				sd0 {=0A=
					regulator-name =3D "vdd-core";=0A=
					regulator-min-microvolt =3D <0xf4240>;=0A=
					regulator-max-microvolt =3D <0x11da50>;=0A=
					regulator-boot-on;=0A=
					regulator-always-on;=0A=
					maxim,active-fps-source =3D <0x1>;=0A=
					regulator-init-mode =3D <0x2>;=0A=
					maxim,active-fps-power-up-slot =3D <0x1>;=0A=
					maxim,active-fps-power-down-slot =3D <0x6>;=0A=
					regulator-enable-ramp-delay =3D <0x92>;=0A=
					regulator-disable-ramp-delay =3D <0xff0>;=0A=
					regulator-ramp-delay =3D <0x6b6c>;=0A=
					regulator-ramp-delay-scale =3D <0x12c>;=0A=
					linux,phandle =3D <0xa1>;=0A=
					phandle =3D <0xa1>;=0A=
				};=0A=
=0A=
				sd1 {=0A=
					regulator-name =3D "vdd-ddr-1v1";=0A=
					regulator-always-on;=0A=
					regulator-boot-on;=0A=
					regulator-init-mode =3D <0x2>;=0A=
					maxim,active-fps-source =3D <0x0>;=0A=
					maxim,active-fps-power-up-slot =3D <0x5>;=0A=
					maxim,active-fps-power-down-slot =3D <0x2>;=0A=
					regulator-min-microvolt =3D <0x118c30>;=0A=
					regulator-max-microvolt =3D <0x118c30>;=0A=
					regulator-enable-ramp-delay =3D <0x82>;=0A=
					regulator-disable-ramp-delay =3D <0x23988>;=0A=
					regulator-ramp-delay =3D <0x6b6c>;=0A=
					regulator-ramp-delay-scale =3D <0x12c>;=0A=
					linux,phandle =3D <0x11b>;=0A=
					phandle =3D <0x11b>;=0A=
				};=0A=
=0A=
				sd2 {=0A=
					regulator-name =3D "vdd-pre-reg-1v35";=0A=
					regulator-min-microvolt =3D <0x149970>;=0A=
					regulator-max-microvolt =3D <0x149970>;=0A=
					regulator-always-on;=0A=
					regulator-boot-on;=0A=
					maxim,active-fps-source =3D <0x1>;=0A=
					maxim,active-fps-power-up-slot =3D <0x2>;=0A=
					maxim,active-fps-power-down-slot =3D <0x5>;=0A=
					regulator-enable-ramp-delay =3D <0xb0>;=0A=
					regulator-disable-ramp-delay =3D <0x7d00>;=0A=
					regulator-ramp-delay =3D <0x6b6c>;=0A=
					regulator-ramp-delay-scale =3D <0x15e>;=0A=
					linux,phandle =3D <0x87>;=0A=
					phandle =3D <0x87>;=0A=
				};=0A=
=0A=
				sd3 {=0A=
					regulator-name =3D "vdd-1v8";=0A=
					regulator-min-microvolt =3D <0x1b7740>;=0A=
					regulator-max-microvolt =3D <0x1b7740>;=0A=
					regulator-always-on;=0A=
					regulator-boot-on;=0A=
					maxim,active-fps-source =3D <0x0>;=0A=
					regulator-init-mode =3D <0x2>;=0A=
					maxim,active-fps-power-up-slot =3D <0x3>;=0A=
					maxim,active-fps-power-down-slot =3D <0x4>;=0A=
					regulator-enable-ramp-delay =3D <0xf2>;=0A=
					regulator-disable-ramp-delay =3D <0x1ccf0>;=0A=
					regulator-ramp-delay =3D <0x6b6c>;=0A=
					regulator-ramp-delay-scale =3D <0x168>;=0A=
					linux,phandle =3D <0x36>;=0A=
					phandle =3D <0x36>;=0A=
				};=0A=
=0A=
				ldo0 {=0A=
					regulator-name =3D "avdd-sys-1v2";=0A=
					regulator-min-microvolt =3D <0x124f80>;=0A=
					regulator-max-microvolt =3D <0x124f80>;=0A=
					regulator-boot-on;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
					regulator-enable-ramp-delay =3D <0x1a>;=0A=
					regulator-disable-ramp-delay =3D <0x272>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					linux,phandle =3D <0x3d>;=0A=
					phandle =3D <0x3d>;=0A=
				};=0A=
=0A=
				ldo1 {=0A=
					regulator-name =3D "vdd-pex-1v0";=0A=
					regulator-min-microvolt =3D <0x100590>;=0A=
					regulator-max-microvolt =3D <0x100590>;=0A=
					regulator-always-on;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
					regulator-enable-ramp-delay =3D <0x16>;=0A=
					regulator-disable-ramp-delay =3D <0x276>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					linux,phandle =3D <0x3f>;=0A=
					phandle =3D <0x3f>;=0A=
				};=0A=
=0A=
				ldo2 {=0A=
					regulator-name =3D "vddio-sdmmc-ap";=0A=
					regulator-min-microvolt =3D <0x1b7740>;=0A=
					regulator-max-microvolt =3D <0x325aa0>;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
					regulator-enable-ramp-delay =3D <0x3e>;=0A=
					regulator-disable-ramp-delay =3D <0x28a>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					linux,phandle =3D <0x98>;=0A=
					phandle =3D <0x98>;=0A=
				};=0A=
=0A=
				ldo3 {=0A=
					regulator-name =3D "vdd-ldo3";=0A=
					regulator-min-microvolt =3D <0x2ab980>;=0A=
					regulator-max-microvolt =3D <0x2ab980>;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
					regulator-enable-ramp-delay =3D <0x32>;=0A=
					regulator-disable-ramp-delay =3D <0x456>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					status =3D "disabled";=0A=
					linux,phandle =3D <0x11c>;=0A=
					phandle =3D <0x11c>;=0A=
				};=0A=
=0A=
				ldo4 {=0A=
					regulator-name =3D "vdd-rtc";=0A=
					regulator-min-microvolt =3D <0xcf850>;=0A=
					regulator-max-microvolt =3D <0x10c8e0>;=0A=
					regulator-always-on;=0A=
					regulator-boot-on;=0A=
					maxim,active-fps-source =3D <0x0>;=0A=
					maxim,active-fps-power-up-slot =3D <0x1>;=0A=
					maxim,active-fps-power-down-slot =3D <0x6>;=0A=
					regulator-enable-ramp-delay =3D <0x16>;=0A=
					regulator-disable-ramp-delay =3D <0x262>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					regulator-disable-active-discharge;=0A=
					linux,phandle =3D <0x11d>;=0A=
					phandle =3D <0x11d>;=0A=
				};=0A=
=0A=
				ldo5 {=0A=
					regulator-name =3D "vdd-ldo5";=0A=
					regulator-min-microvolt =3D <0x325aa0>;=0A=
					regulator-max-microvolt =3D <0x325aa0>;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
					regulator-enable-ramp-delay =3D <0x3e>;=0A=
					regulator-disable-ramp-delay =3D <0x280>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					status =3D "disabled";=0A=
					linux,phandle =3D <0x57>;=0A=
					phandle =3D <0x57>;=0A=
				};=0A=
=0A=
				ldo6 {=0A=
					regulator-name =3D "vddio-sdmmc3-ap";=0A=
					regulator-min-microvolt =3D <0x1b7740>;=0A=
					regulator-max-microvolt =3D <0x325aa0>;=0A=
					regulator-boot-on;=0A=
					maxim,active-fps-source =3D <0x3>;=0A=
					maxim,active-fps-power-up-slot =3D <0x0>;=0A=
					maxim,active-fps-power-down-slot =3D <0x7>;=0A=
					regulator-enable-ramp-delay =3D <0x24>;=0A=
					regulator-disable-ramp-delay =3D <0x2a2>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					linux,phandle =3D <0x58>;=0A=
					phandle =3D <0x58>;=0A=
				};=0A=
=0A=
				ldo7 {=0A=
					regulator-name =3D "avdd-1v05-pll";=0A=
					regulator-min-microvolt =3D <0x100590>;=0A=
					regulator-max-microvolt =3D <0x100590>;=0A=
					regulator-always-on;=0A=
					regulator-boot-on;=0A=
					maxim,active-fps-source =3D <0x1>;=0A=
					maxim,active-fps-power-up-slot =3D <0x3>;=0A=
					maxim,active-fps-power-down-slot =3D <0x4>;=0A=
					regulator-enable-ramp-delay =3D <0x18>;=0A=
					regulator-disable-ramp-delay =3D <0xad0>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					linux,phandle =3D <0x3e>;=0A=
					phandle =3D <0x3e>;=0A=
				};=0A=
=0A=
				ldo8 {=0A=
					regulator-name =3D "avdd-io-hdmi-dp";=0A=
					regulator-min-microvolt =3D <0x100590>;=0A=
					regulator-max-microvolt =3D <0x100590>;=0A=
					regulator-boot-on;=0A=
					regulator-always-on;=0A=
					maxim,active-fps-source =3D <0x1>;=0A=
					maxim,active-fps-power-up-slot =3D <0x6>;=0A=
					maxim,active-fps-power-down-slot =3D <0x1>;=0A=
					regulator-enable-ramp-delay =3D <0x16>;=0A=
					regulator-disable-ramp-delay =3D <0x488>;=0A=
					regulator-ramp-delay =3D <0x186a0>;=0A=
					regulator-ramp-delay-scale =3D <0xc8>;=0A=
					linux,phandle =3D <0x40>;=0A=
					phandle =3D <0x40>;=0A=
				};=0A=
			};=0A=
=0A=
			low-battery-monitor {=0A=
				maxim,low-battery-shutdown-enable;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	i2c@7000d100 {=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		compatible =3D "nvidia,tegra210-i2c";=0A=
		reg =3D <0x0 0x7000d100 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x3f 0x4>;=0A=
		iommus =3D <0x2b 0xe>;=0A=
		status =3D "okay";=0A=
		clock-frequency =3D <0x61a80>;=0A=
		dmas =3D <0x4c 0x1e 0x4c 0x1e>;=0A=
		dma-names =3D "rx", "tx";=0A=
		clocks =3D <0x21 0xa6 0x21 0xf3>;=0A=
		clock-names =3D "div-clk", "parent";=0A=
		resets =3D <0x21 0xa6>;=0A=
		reset-names =3D "i2c";=0A=
		linux,phandle =3D <0x11e>;=0A=
		phandle =3D <0x11e>;=0A=
	};=0A=
=0A=
	sdhci@700b0600 {=0A=
		compatible =3D "nvidia,tegra210-sdhci";=0A=
		reg =3D <0x0 0x700b0600 0x0 0x200>;=0A=
		interrupts =3D <0x0 0x1f 0x4>;=0A=
		aux-device-name =3D "sdhci-tegra.3";=0A=
		iommus =3D <0x2b 0x1c>;=0A=
		nvidia,runtime-pm-type =3D <0x1>;=0A=
		clocks =3D <0x21 0xf 0x21 0xf3 0x21 0x134 0x21 0xc1>;=0A=
		clock-names =3D "sdmmc", "pll_p", "pll_c4_out0", "sdmmc_legacy_tm";=0A=
		resets =3D <0x21 0xf>;=0A=
		reset-names =3D "sdhci";=0A=
		status =3D "disabled";=0A=
		tap-delay =3D <0x4>;=0A=
		trim-delay =3D <0x8>;=0A=
		nvidia,is-ddr-tap-delay;=0A=
		nvidia,ddr-tap-delay =3D <0x0>;=0A=
		mmc-ocr-mask =3D <0x0>;=0A=
		max-clk-limit =3D <0xbebc200>;=0A=
		bus-width =3D <0x8>;=0A=
		built-in;=0A=
		calib-3v3-offsets =3D <0x505>;=0A=
		calib-1v8-offsets =3D <0x505>;=0A=
		compad-vref-3v3 =3D <0x7>;=0A=
		compad-vref-1v8 =3D <0x7>;=0A=
		nvidia,en-io-trim-volt;=0A=
		nvidia,is-emmc;=0A=
		nvidia,enable-cq;=0A=
		ignore-pm-notify;=0A=
		keep-power-in-suspend;=0A=
		non-removable;=0A=
		cap-mmc-highspeed;=0A=
		cap-sd-highspeed;=0A=
		mmc-ddr-1_8v;=0A=
		mmc-hs200-1_8v;=0A=
		mmc-hs400-1_8v;=0A=
		nvidia,enable-strobe-mode;=0A=
		mmc-hs400-enhanced-strobe;=0A=
		nvidia,min-tap-delay =3D <0x6a>;=0A=
		nvidia,max-tap-delay =3D <0xb9>;=0A=
		pll_source =3D "pll_p", "pll_c4_out2";=0A=
		vqmmc-supply =3D <0x36>;=0A=
		vmmc-supply =3D <0x47>;=0A=
		uhs-mask =3D <0x0>;=0A=
		power-off-rail;=0A=
		no-sdio;=0A=
		no-sd;=0A=
		linux,phandle =3D <0xb0>;=0A=
		phandle =3D <0xb0>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod_c_ds {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_ddr52 {=0A=
				prod =3D <0x100 0x1fff0000 0x0 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs200 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs400 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs533 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x2000 0x1e0 0xf 0x7 =
0x1e4 0x30000505 0x30000505>;=0A=
			};=0A=
=0A=
			prod {=0A=
				prod =3D <0x100 0x1fff000e 0x8090028 0x10c 0x3f00 0x2800 0x1c0 =
0x8001fc0 0x8000040 0x1c4 0x77 0x0 0x120 0x20001 0x1 0x128 0x43000000 =
0x0 0x1f0 0x80000 0x80000>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	sdhci@700b0400 {=0A=
		compatible =3D "nvidia,tegra210-sdhci";=0A=
		reg =3D <0x0 0x700b0400 0x0 0x200>;=0A=
		interrupts =3D <0x0 0x13 0x4>;=0A=
		aux-device-name =3D "sdhci-tegra.2";=0A=
		iommus =3D <0x2b 0x1b>;=0A=
		nvidia,runtime-pm-type =3D <0x0>;=0A=
		clocks =3D <0x21 0x45 0x21 0xf3 0x21 0x136 0x21 0xc1>;=0A=
		clock-names =3D "sdmmc", "pll_p", "pll_c4_out2", "sdmmc_legacy_tm";=0A=
		resets =3D <0x21 0x45>;=0A=
		reset-names =3D "sdhci";=0A=
		status =3D "disabled";=0A=
		tap-delay =3D <0x3>;=0A=
		trim-delay =3D <0x3>;=0A=
		mmc-ocr-mask =3D <0x3>;=0A=
		max-clk-limit =3D <0x61a80>;=0A=
		ddr-clk-limit =3D <0x2dc6c00>;=0A=
		bus-width =3D <0x4>;=0A=
		calib-3v3-offsets =3D <0x7d>;=0A=
		calib-1v8-offsets =3D <0x7b7b>;=0A=
		compad-vref-3v3 =3D <0x7>;=0A=
		compad-vref-1v8 =3D <0x7>;=0A=
		pll_source =3D "pll_p", "pll_c4_out2";=0A=
		ignore-pm-notify;=0A=
		cap-mmc-highspeed;=0A=
		cap-sd-highspeed;=0A=
		nvidia,en-io-trim-volt;=0A=
		nvidia,en-periodic-calib;=0A=
		cd-inverted;=0A=
		wp-inverted;=0A=
		pwrdet-support;=0A=
		nvidia,min-tap-delay =3D <0x6a>;=0A=
		nvidia,max-tap-delay =3D <0xb9>;=0A=
		pinctrl-names =3D "sdmmc_schmitt_enable", "sdmmc_schmitt_disable", =
"sdmmc_clk_schmitt_enable", "sdmmc_clk_schmitt_disable", =
"sdmmc_drv_code", "sdmmc_default_drv_code", "sdmmc_e_33v_enable", =
"sdmmc_e_33v_disable";=0A=
		pinctrl-0 =3D <0x88>;=0A=
		pinctrl-1 =3D <0x89>;=0A=
		pinctrl-2 =3D <0x8a>;=0A=
		pinctrl-3 =3D <0x8b>;=0A=
		pinctrl-4 =3D <0x8c>;=0A=
		pinctrl-5 =3D <0x8d>;=0A=
		pinctrl-6 =3D <0x8e>;=0A=
		pinctrl-7 =3D <0x8f>;=0A=
		vqmmc-supply =3D <0x36>;=0A=
		vmmc-supply =3D <0x47>;=0A=
		mmc-ddr-1_8v;=0A=
		uhs-mask =3D <0x0>;=0A=
		linux,phandle =3D <0xb8>;=0A=
		phandle =3D <0xb8>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod_c_ds {=0A=
				prod =3D <0x100 0xff0000 0x10000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x3000007d>;=0A=
			};=0A=
=0A=
			prod_c_hs {=0A=
				prod =3D <0x100 0xff0000 0x10000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x3000007d>;=0A=
			};=0A=
=0A=
			prod_c_sdr12 {=0A=
				prod =3D <0x100 0xff0000 0x10000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_sdr25 {=0A=
				prod =3D <0x100 0xff0000 0x10000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_sdr50 {=0A=
				prod =3D <0x100 0xff0000 0x10000 0x1c0 0xe000 0x8000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_sdr104 {=0A=
				prod =3D <0x100 0xff0000 0x10000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_ddr52 {=0A=
				prod =3D <0x100 0x1fff0000 0x0 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30007b7b>;=0A=
			};=0A=
=0A=
			prod {=0A=
				prod =3D <0x100 0x1fff000e 0x3090028 0x1c0 0x8001fc0 0x8000040 0x1c4 =
0x77 0x0 0x120 0x20001 0x1 0x128 0x43000000 0x0 0x1f0 0x80000 0x80000>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	sdhci@700b0200 {=0A=
		compatible =3D "nvidia,tegra210-sdhci";=0A=
		reg =3D <0x0 0x700b0200 0x0 0x200>;=0A=
		interrupts =3D <0x0 0xf 0x4>;=0A=
		aux-device-name =3D "sdhci-tegra.1";=0A=
		nvidia,runtime-pm-type =3D <0x1>;=0A=
		clocks =3D <0x21 0x9 0x21 0xf3 0x21 0xc1>;=0A=
		clock-names =3D "sdmmc", "pll_p", "sdmmc_legacy_tm";=0A=
		resets =3D <0x21 0x9>;=0A=
		reset-names =3D "sdhci";=0A=
		status =3D "disabled";=0A=
		tap-delay =3D <0x4>;=0A=
		trim-delay =3D <0x8>;=0A=
		mmc-ocr-mask =3D <0x0>;=0A=
		max-clk-limit =3D <0xc28cb00>;=0A=
		ddr-clk-limit =3D <0x2719c40>;=0A=
		bus-width =3D <0x4>;=0A=
		calib-3v3-offsets =3D <0x505>;=0A=
		calib-1v8-offsets =3D <0x505>;=0A=
		compad-vref-3v3 =3D <0x7>;=0A=
		compad-vref-1v8 =3D <0x7>;=0A=
		default-drive-type =3D <0x1>;=0A=
		nvidia,min-tap-delay =3D <0x6a>;=0A=
		nvidia,max-tap-delay =3D <0xb9>;=0A=
		pll_source =3D "pll_p";=0A=
		non-removable;=0A=
		cap-mmc-highspeed;=0A=
		cap-sd-highspeed;=0A=
		keep-power-in-suspend;=0A=
		ignore-pm-notify;=0A=
		nvidia,en-io-trim-volt;=0A=
		vqmmc-supply =3D <0x36>;=0A=
		vmmc-supply =3D <0x47>;=0A=
		uhs-mask =3D <0x8>;=0A=
		power-off-rail;=0A=
		force-non-removable-rescan;=0A=
		linux,phandle =3D <0x11f>;=0A=
		phandle =3D <0x11f>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod_c_ds {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_sdr12 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_sdr25 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_sdr50 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x8000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_sdr104 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_ddr52 {=0A=
				prod =3D <0x100 0x1fff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs200 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs400 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30000505>;=0A=
			};=0A=
=0A=
			prod_c_hs533 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x2000 0x1e0 0xf 0x7 =
0x1e4 0x30000505 0x30000505>;=0A=
			};=0A=
=0A=
			prod {=0A=
				prod =3D <0x100 0x1fff000e 0x8090028 0x1c0 0x8001fc0 0x8000040 0x1c4 =
0x77 0x0 0x120 0x20001 0x1 0x128 0x43000000 0x0 0x1f0 0x80000 0x80000>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	sdhci@700b0000 {=0A=
		compatible =3D "nvidia,tegra210-sdhci";=0A=
		reg =3D <0x0 0x700b0000 0x0 0x200>;=0A=
		interrupts =3D <0x0 0xe 0x4>;=0A=
		aux-device-name =3D "sdhci-tegra.0";=0A=
		iommus =3D <0x2b 0x19>;=0A=
		nvidia,runtime-pm-type =3D <0x1>;=0A=
		clocks =3D <0x21 0xe 0x21 0xf3 0x21 0xc1>;=0A=
		clock-names =3D "sdmmc", "pll_p", "sdmmc_legacy_tm";=0A=
		resets =3D <0x21 0xe>;=0A=
		reset-names =3D "sdhci";=0A=
		status =3D "okay";=0A=
		tap-delay =3D <0x4>;=0A=
		trim-delay =3D <0x2>;=0A=
		max-clk-limit =3D <0xc28cb00>;=0A=
		ddr-clk-limit =3D <0x2dc6c00>;=0A=
		bus-width =3D <0x4>;=0A=
		mmc-ocr-mask =3D <0x3>;=0A=
		calib-3v3-offsets =3D <0x7d>;=0A=
		calib-1v8-offsets =3D <0x7b7b>;=0A=
		compad-vref-3v3 =3D <0x7>;=0A=
		compad-vref-1v8 =3D <0x7>;=0A=
		cd-gpios =3D <0x56 0xc9 0x0>;=0A=
		pll_source =3D "pll_p";=0A=
		cap-mmc-highspeed;=0A=
		cap-sd-highspeed;=0A=
		nvidia,en-io-trim-volt;=0A=
		nvidia,en-periodic-calib;=0A=
		keep-power-in-suspend;=0A=
		ignore-pm-notify;=0A=
		cd-inverted;=0A=
		wp-inverted;=0A=
		nvidia,min-tap-delay =3D <0x6a>;=0A=
		nvidia,max-tap-delay =3D <0xb9>;=0A=
		pwrdet-support;=0A=
		pinctrl-names =3D "sdmmc_schmitt_enable", "sdmmc_schmitt_disable", =
"sdmmc_clk_schmitt_enable", "sdmmc_clk_schmitt_disable", =
"sdmmc_drv_code", "sdmmc_default_drv_code", "sdmmc_e_33v_enable", =
"sdmmc_e_33v_disable";=0A=
		pinctrl-0 =3D <0x90>;=0A=
		pinctrl-1 =3D <0x91>;=0A=
		pinctrl-2 =3D <0x92>;=0A=
		pinctrl-3 =3D <0x93>;=0A=
		pinctrl-4 =3D <0x94>;=0A=
		pinctrl-5 =3D <0x95>;=0A=
		pinctrl-6 =3D <0x96>;=0A=
		pinctrl-7 =3D <0x97>;=0A=
		vqmmc-supply =3D <0x98>;=0A=
		vmmc-supply =3D <0x99>;=0A=
		default-drv-type =3D <0x1>;=0A=
		sd-uhs-sdr104;=0A=
		sd-uhs-sdr50;=0A=
		sd-uhs-sdr25;=0A=
		sd-uhs-sdr12;=0A=
		mmc-ddr-1_8v;=0A=
		mmc-hs200-1_8v;=0A=
		nvidia,cd-wakeup-capable;=0A=
		nvidia,update-pinctrl-settings;=0A=
		nvidia,pmc-wakeup =3D <0x37 0x0 0x23 0x0>;=0A=
		uhs-mask =3D <0xc>;=0A=
		no-sdio;=0A=
		no-mmc;=0A=
		disable-wp;=0A=
		linux,phandle =3D <0xb1>;=0A=
		phandle =3D <0xb1>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x3>;=0A=
=0A=
			prod_c_ds {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x3000007d>;=0A=
			};=0A=
=0A=
			prod_c_hs {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x3000007d>;=0A=
			};=0A=
=0A=
			prod_c_sdr12 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_sdr25 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_sdr50 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x8000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_sdr104 {=0A=
				prod =3D <0x100 0xff0000 0x40000 0x1c0 0xe000 0x4000 0x1e0 0xf 0x7 =
0x1e4 0x30077f7f 0x30007b7b>;=0A=
			};=0A=
=0A=
			prod_c_ddr52 {=0A=
				prod =3D <0x100 0x1fff0000 0x0 0x1e0 0xf 0x7 0x1e4 0x30077f7f =
0x30007b7b>;=0A=
			};=0A=
=0A=
			prod {=0A=
				prod =3D <0x100 0x1fff000e 0x2090028 0x1c0 0x8001fc0 0x8000040 0x1c4 =
0x77 0x0 0x120 0x20001 0x1 0x128 0x43000000 0x0 0x1f0 0x80000 0x80000>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	efuse@7000f800 {=0A=
		compatible =3D "nvidia,tegra210-efuse";=0A=
		reg =3D <0x0 0x7000f800 0x0 0x400>;=0A=
		clocks =3D <0x21 0xe6>;=0A=
		clock-names =3D "fuse";=0A=
		nvidia,clock-always-on;=0A=
		status =3D "okay";=0A=
		vpp_fuse-supply =3D <0x36>;=0A=
=0A=
		efuse-burn {=0A=
			compatible =3D "nvidia,tegra210-efuse-burn";=0A=
			clocks =3D <0x21 0xe9>;=0A=
			clock-names =3D "clk_m";=0A=
			status =3D "okay";=0A=
		};=0A=
	};=0A=
=0A=
	kfuse@7000fc00 {=0A=
		compatible =3D "nvidia,tegra210-kfuse";=0A=
		reg =3D <0x0 0x7000fc00 0x0 0x400>;=0A=
		clocks =3D <0x21 0x28>;=0A=
		clock-names =3D "kfuse";=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	pmc-iopower {=0A=
		compatible =3D "nvidia,tegra210-pmc-iopower";=0A=
		pad-controllers =3D <0x37 0x32 0x37 0x2b 0x37 0x0 0x37 0x2 0x37 0x22 =
0x37 0x23 0x37 0x26 0x37 0x33 0x37 0x1 0x37 0xa 0x37 0xc 0x37 0x15 0x37 =
0x29 0x37 0x2a 0x37 0xf 0x37 0x10 0x37 0x11 0x37 0x12 0x37 0x17>;=0A=
		pad-names =3D "sys", "uart", "audio", "cam", "pex-ctrl", "sdmmc1", =
"sdmmc3", "hv", "audio-hv", "debug", "dmic", "gpio", "spi", "spi-hv", =
"dsia", "dsib", "dsic", "dsid", "hdmi";=0A=
		status =3D "okay";=0A=
		iopower-sys-supply =3D <0x36>;=0A=
		iopower-uart-supply =3D <0x36>;=0A=
		iopower-audio-supply =3D <0x36>;=0A=
		iopower-cam-supply =3D <0x36>;=0A=
		iopower-pex-ctrl-supply =3D <0x36>;=0A=
		iopower-sdmmc1-supply =3D <0x98>;=0A=
		iopower-sdmmc3-supply =3D <0x36>;=0A=
		iopower-sdmmc4-supply =3D <0x36>;=0A=
		iopower-audio-hv-supply =3D <0x36>;=0A=
		iopower-debug-supply =3D <0x36>;=0A=
		iopower-dmic-supply =3D <0x36>;=0A=
		iopower-gpio-supply =3D <0x36>;=0A=
		iopower-spi-supply =3D <0x36>;=0A=
		iopower-spi-hv-supply =3D <0x36>;=0A=
		iopower-sdmmc2-supply =3D <0x36>;=0A=
		iopower-dp-supply =3D <0x36>;=0A=
	};=0A=
=0A=
	dtv@7000c300 {=0A=
		compatible =3D "nvidia,tegra210-dtv";=0A=
		reg =3D <0x0 0x7000c300 0x0 0x100>;=0A=
		dmas =3D <0x4c 0xb>;=0A=
		dma-names =3D "rx";=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	xudc@700d0000 {=0A=
		compatible =3D "nvidia,tegra210-xudc";=0A=
		reg =3D <0x0 0x700d0000 0x0 0x8000 0x0 0x700d8000 0x0 0x1000 0x0 =
0x700d9000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0x2c 0x4>;=0A=
		clocks =3D <0x21 0x121 0x21 0x9c 0x21 0x13e 0x21 0x122 0x21 0x11e>;=0A=
		nvidia,xusb-padctl =3D <0x44>;=0A=
		iommus =3D <0x2b 0x15>;=0A=
		status =3D "okay";=0A=
		charger-detector =3D <0x9a>;=0A=
		hvdd_usb-supply =3D <0x47>;=0A=
		avdd_pll_utmip-supply =3D <0x36>;=0A=
		avddio_usb-supply =3D <0x3f>;=0A=
		avddio_pll_uerefe-supply =3D <0x3e>;=0A=
		extcon-cables =3D <0x48 0x0>;=0A=
		extcon-cable-names =3D "vbus";=0A=
		phys =3D <0x45>;=0A=
		phy-names =3D "usb2";=0A=
		#extcon-cells =3D <0x1>;=0A=
	};=0A=
=0A=
	memory-controller@70019000 {=0A=
		compatible =3D "nvidia,tegra210-mc";=0A=
		reg =3D <0x0 0x70019000 0x0 0x1000>;=0A=
		clocks =3D <0x21 0x20 0x21 0x39>;=0A=
		clock-names =3D "mc", "emc";=0A=
		interrupts =3D <0x0 0x4d 0x4>;=0A=
		#iommu-cells =3D <0x1>;=0A=
		#reset-cells =3D <0x1>;=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0x120>;=0A=
		phandle =3D <0x120>;=0A=
	};=0A=
=0A=
	pwm@70110000 {=0A=
		compatible =3D "nvidia,tegra210-dfll-pwm";=0A=
		reg =3D <0x0 0x70110000 0x0 0x400>;=0A=
		clocks =3D <0x21 0x128>;=0A=
		clock-names =3D "ref";=0A=
		pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";=0A=
		#pwm-cells =3D <0x2>;=0A=
		status =3D "okay";=0A=
		pinctrl-0 =3D <0x9b>;=0A=
		pinctrl-1 =3D <0x9c>;=0A=
		pwm-regulator =3D <0x9d>;=0A=
		linux,phandle =3D <0xde>;=0A=
		phandle =3D <0xde>;=0A=
	};=0A=
=0A=
	clock@70110000 {=0A=
		compatible =3D "nvidia,tegra210-dfll";=0A=
		reg =3D <0x0 0x70110000 0x0 0x100 0x0 0x70110000 0x0 0x100 0x0 =
0x70110100 0x0 0x100 0x0 0x70110200 0x0 0x100>;=0A=
		interrupts =3D <0x0 0x3e 0x4>;=0A=
		clocks =3D <0x21 0x129 0x21 0x128 0x21 0x2f>;=0A=
		clock-names =3D "soc", "ref", "i2c";=0A=
		resets =3D <0x21 0xe0>;=0A=
		reset-names =3D "dvco";=0A=
		#clock-cells =3D <0x0>;=0A=
		clock-output-names =3D "dfllCPU_out";=0A=
		out-clock-name =3D "dfll_cpu";=0A=
		status =3D "okay";=0A=
		vdd-cpu-supply =3D <0x9d>;=0A=
		nvidia,dfll-max-freq-khz =3D <0x169158>;=0A=
		nvidia,pwm-to-pmic;=0A=
		nvidia,init-uv =3D <0xf4240>;=0A=
		nvidia,sample-rate =3D <0x61a8>;=0A=
		nvidia,droop-ctrl =3D <0xf00>;=0A=
		nvidia,force-mode =3D <0x1>;=0A=
		nvidia,cf =3D <0x6>;=0A=
		nvidia,ci =3D <0x0>;=0A=
		nvidia,cg =3D <0x2>;=0A=
		nvidia,idle-override;=0A=
		nvidia,one-shot-calibrate;=0A=
		nvidia,pwm-period =3D <0x9c4>;=0A=
		pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";=0A=
		pinctrl-0 =3D <0x9b>;=0A=
		pinctrl-1 =3D <0x9c>;=0A=
		nvidia,align-offset-uv =3D <0xacda0>;=0A=
		nvidia,align-step-uv =3D <0x4b00>;=0A=
		linux,phandle =3D <0x26>;=0A=
		phandle =3D <0x26>;=0A=
	};=0A=
=0A=
	soctherm@0x700E2000 {=0A=
		compatible =3D "nvidia,tegra-soctherm", "nvidia,tegra210-soctherm";=0A=
		reg =3D <0x0 0x700e2000 0x0 0x600 0x0 0x60006000 0x0 0x400 0x0 =
0x70040000 0x0 0x200>;=0A=
		reg-names =3D "soctherm-reg", "car-reg", "ccroc-reg";=0A=
		interrupts =3D <0x0 0x30 0x4 0x0 0x33 0x4>;=0A=
		clocks =3D <0x21 0x64 0x21 0x4e>;=0A=
		clock-names =3D "tsensor", "soctherm";=0A=
		resets =3D <0x21 0x4e>;=0A=
		reset-names =3D "soctherm";=0A=
		#thermal-sensor-cells =3D <0x1>;=0A=
		status =3D "okay";=0A=
		interrupt-controller;=0A=
		#interrupt-cells =3D <0x2>;=0A=
		soctherm-clock-frequency =3D <0x30a32c0>;=0A=
		tsensor-clock-frequency =3D <0x61a80>;=0A=
		sensor-params-tall =3D <0x3fac>;=0A=
		sensor-params-tiddq =3D <0x1>;=0A=
		sensor-params-ten-count =3D <0x1>;=0A=
		sensor-params-tsample =3D <0x78>;=0A=
		sensor-params-pdiv =3D <0x8>;=0A=
		sensor-params-tsamp-ate =3D <0x1e0>;=0A=
		sensor-params-pdiv-ate =3D <0x8>;=0A=
		hw-pllx-offsets =3D <0x0 0x3e8 0x1b58 0x2 0x7d0 0xfa0>;=0A=
		nvidia,thermtrips =3D <0x0 0x19064 0x2 0x19258>;=0A=
		linux,phandle =3D <0x11>;=0A=
		phandle =3D <0x11>;=0A=
=0A=
		throttle-cfgs {=0A=
=0A=
			heavy {=0A=
				nvidia,priority =3D <0x64>;=0A=
				nvidia,cpu-throt-percent =3D <0x55>;=0A=
				nvidia,gpu-throt-level =3D <0x3>;=0A=
				#cooling-cells =3D <0x2>;=0A=
				linux,phandle =3D <0x13>;=0A=
				phandle =3D <0x13>;=0A=
			};=0A=
=0A=
			oc1 {=0A=
				nvidia,priority =3D <0x0>;=0A=
				nvidia,polarity-active-low =3D <0x0>;=0A=
				nvidia,count-threshold =3D <0x0>;=0A=
				nvidia,alarm-filter =3D <0x0>;=0A=
				nvidia,alarm-period =3D <0x0>;=0A=
				nvidia,cpu-throt-percent =3D <0x0>;=0A=
				nvidia,gpu-throt-level =3D <0x0>;=0A=
				linux,phandle =3D <0xc7>;=0A=
				phandle =3D <0xc7>;=0A=
			};=0A=
=0A=
			oc3 {=0A=
				nvidia,priority =3D <0x28>;=0A=
				nvidia,polarity-active-low =3D <0x1>;=0A=
				nvidia,count-threshold =3D <0xf>;=0A=
				nvidia,alarm-filter =3D <0x4dd1e0>;=0A=
				nvidia,alarm-period =3D <0x0>;=0A=
				nvidia,cpu-throt-percent =3D <0x4b>;=0A=
				nvidia,gpu-throt-level =3D <0x2>;=0A=
				linux,phandle =3D <0x121>;=0A=
				phandle =3D <0x121>;=0A=
			};=0A=
		};=0A=
=0A=
		fuse_war@fuse_rev_0_1 {=0A=
			device_type =3D "fuse_war";=0A=
			match_fuse_rev =3D <0x0 0x1>;=0A=
			cpu0 =3D <0x109cbc 0x61120>;=0A=
			cpu1 =3D <0x107160 0x106030>;=0A=
			cpu2 =3D <0x10dba0 0xfff695d8>;=0A=
			cpu3 =3D <0x10b0a8 0xfff23fb0>;=0A=
			mem0 =3D <0x108f74 0xfffe7fa0>;=0A=
			mem1 =3D <0x10dba0 0xfffe7d48>;=0A=
			gpu =3D <0x109168 0xffef40e4>;=0A=
			pllx =3D <0x107610 0xfff268b4>;=0A=
		};=0A=
=0A=
		fuse_war@fuse_rev_2 {=0A=
			device_type =3D "fuse_war";=0A=
			match_fuse_rev =3D <0x2>;=0A=
			cpu0 =3D <0x108e48 0x3180a8>;=0A=
			cpu1 =3D <0x112f38 0xfffef854>;=0A=
			cpu2 =3D <0x10c2a0 0x22595c>;=0A=
			cpu3 =3D <0x10e820 0x9324c>;=0A=
			mem0 =3D <0x105090 0x362acc>;=0A=
			mem1 =3D <0x11e8c4 0xffa06cd0>;=0A=
			gpu =3D <0x10647c 0x29bb34>;=0A=
			pllx =3D <0xfdd54 0x68342c>;=0A=
		};=0A=
=0A=
		throttle@critical {=0A=
			device_type =3D "throttlectl";=0A=
			cdev-type =3D "tegra-shutdown";=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x3>;=0A=
			#cooling-cells =3D <0x2>;=0A=
		};=0A=
=0A=
		throttle@heavy {=0A=
			device_type =3D "throttlectl";=0A=
			cdev-type =3D "tegra-heavy";=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x3>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			priority =3D <0x64>;=0A=
			throttle_dev =3D <0x9e 0x9f>;=0A=
		};=0A=
=0A=
		throttle_dev@cpu_high {=0A=
			depth =3D <0x55>;=0A=
			linux,phandle =3D <0x9e>;=0A=
			phandle =3D <0x9e>;=0A=
		};=0A=
=0A=
		throttle_dev@gpu_high {=0A=
			level =3D "heavy_throttling";=0A=
			linux,phandle =3D <0x9f>;=0A=
			phandle =3D <0x9f>;=0A=
		};=0A=
	};=0A=
=0A=
	tegra-aotag {=0A=
		compatible =3D "nvidia,tegra21x-aotag";=0A=
		parent-block =3D <0x37>;=0A=
		status =3D "okay";=0A=
		sensor-params-tall =3D <0x4c>;=0A=
		sensor-params-tiddq =3D <0x1>;=0A=
		sensor-params-ten-count =3D <0x10>;=0A=
		sensor-params-tsample =3D <0x9>;=0A=
		sensor-params-pdiv =3D <0x8>;=0A=
		sensor-params-tsamp-ate =3D <0x27>;=0A=
		sensor-params-pdiv-ate =3D <0x8>;=0A=
		#thermal-sensor-cells =3D <0x0>;=0A=
		sensor-name =3D "aotag0";=0A=
		sensor-id =3D <0x0>;=0A=
		advertised-sensor-id =3D <0x9>;=0A=
		sensor-nominal-temp-cp =3D <0x19>;=0A=
		sensor-nominal-temp-ft =3D <0x69>;=0A=
		sensor-compensation-a =3D <0x2988>;=0A=
		sensor-compensation-b =3D <0xfffef85e>;=0A=
		linux,phandle =3D <0x2>;=0A=
		phandle =3D <0x2>;=0A=
	};=0A=
=0A=
	tegra_cec {=0A=
		compatible =3D "nvidia,tegra210-cec";=0A=
		reg =3D <0x0 0x70015000 0x0 0x1000>;=0A=
		interrupts =3D <0x0 0x3 0x4>;=0A=
		clocks =3D <0x21 0x88>;=0A=
		clock-names =3D "cec";=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	watchdog@60005100 {=0A=
		compatible =3D "nvidia,tegra-wdt-t21x";=0A=
		reg =3D <0x0 0x60005100 0x0 0x20 0x0 0x60005088 0x0 0x8>;=0A=
		interrupts =3D <0x0 0x7b 0x4>;=0A=
		nvidia,expiry-count =3D <0x4>;=0A=
		nvidia,timer-index =3D <0x7>;=0A=
		nvidia,enable-on-init;=0A=
		status =3D "disabled";=0A=
		dt-override-status-odm-data =3D <0x10000 0x10000>;=0A=
		timeout-sec =3D <0x78>;=0A=
		linux,phandle =3D <0xb5>;=0A=
		phandle =3D <0xb5>;=0A=
	};=0A=
=0A=
	tegra_fiq_debugger {=0A=
		compatible =3D "nvidia,fiq-debugger";=0A=
		use-console-port;=0A=
		interrupts =3D <0x0 0x7b 0x4>;=0A=
	};=0A=
=0A=
	ptm {=0A=
		compatible =3D "nvidia,ptm";=0A=
		reg =3D <0x0 0x72010000 0x0 0x1000 0x0 0x72030000 0x0 0x1000 0x0 =
0x72040000 0x0 0x1000 0x0 0x72050000 0x0 0x1000 0x0 0x72060000 0x0 =
0x1000 0x0 0x73010000 0x0 0x1000 0x0 0x73440000 0x0 0x1000 0x0 =
0x73540000 0x0 0x1000 0x0 0x73640000 0x0 0x1000 0x0 0x73740000 0x0 =
0x1000 0x0 0x72820000 0x0 0x1000 0x0 0x72a1c000 0x0 0x1000>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	mselect {=0A=
		compatible =3D "nvidia,tegra-mselect";=0A=
		interrupts =3D <0x0 0xaf 0x4>;=0A=
		reg =3D <0x0 0x50060000 0x0 0x1000>;=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	cpuidle {=0A=
		compatible =3D "nvidia,tegra210-cpuidle";=0A=
		cc4-no-retention;=0A=
	};=0A=
=0A=
	apbmisc@70000800 {=0A=
		compatible =3D "nvidia,tegra210-apbmisc", "nvidia,tegra20-apbmisc";=0A=
		reg =3D <0x0 0x70000800 0x0 0x64 0x0 0x70000008 0x0 0x4>;=0A=
	};=0A=
=0A=
	nvdumper {=0A=
		compatible =3D "nvidia,tegra210-nvdumper";=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	tegra-pmc-blink-pwm {=0A=
		compatible =3D "nvidia,tegra210-pmc-blink-pwm";=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	nvpmodel {=0A=
		compatible =3D "nvidia,nvpmodel";=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	extcon {=0A=
		compatible =3D "simple-bus";=0A=
		device_type =3D "external-connection";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
=0A=
		disp-state {=0A=
			compatible =3D "extcon-disp-state";=0A=
			#extcon-cells =3D <0x1>;=0A=
		};=0A=
=0A=
		extcon@0 {=0A=
			compatible =3D "extcon-gpio";=0A=
			reg =3D <0x0>;=0A=
			extcon-gpio,name =3D "ID";=0A=
			gpio =3D <0x1e 0x0 0x0>;=0A=
			extcon-gpio,connection-state-low;=0A=
			extcon-gpio,cable-name =3D "USB-Host";=0A=
			#extcon-cells =3D <0x1>;=0A=
			status =3D "disabled";=0A=
			linux,phandle =3D <0x122>;=0A=
			phandle =3D <0x122>;=0A=
		};=0A=
=0A=
		extcon@1 {=0A=
			compatible =3D "extcon-gpio-states";=0A=
			reg =3D <0x1>;=0A=
			extcon-gpio,name =3D "VBUS";=0A=
			extcon-gpio,cable-states =3D <0x0 0x1 0x1 0x0>;=0A=
			gpios =3D <0x56 0xe4 0x0>;=0A=
			extcon-gpio,out-cable-names =3D <0x1 0x2 0x0>;=0A=
			wakeup-source;=0A=
			#extcon-cells =3D <0x1>;=0A=
			nvidia,pmc-wakeup =3D <0x37 0x0 0x36 0x0>;=0A=
			linux,phandle =3D <0x48>;=0A=
			phandle =3D <0x48>;=0A=
		};=0A=
	};=0A=
=0A=
	bthrot_cdev {=0A=
		compatible =3D "nvidia,tegra-balanced-throttle";=0A=
		clocks =3D <0x21 0x126 0x21 0x1ec 0x21 0x199 0x21 0x1a2 0x21 0x1b9 =
0x21 0x1d2>;=0A=
		clock-names =3D "cclk_g", "gpu", "cap.throttle.c2bus", =
"cap.throttle.c3bus", "cap.throttle.sclk", "emc";=0A=
=0A=
		skin_balanced {=0A=
			cdev-type =3D "skin-balanced";=0A=
			num_states =3D <0x42>;=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x42>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			status =3D "okay";=0A=
			throttle_table =3D <0x16358c 0xd4cb0 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x15e9bc 0xd1c9f 0x75300 0x7d000 0x5dc00 0xffffffff 0x159ded =
0xcec8f 0x75300 0x7d000 0x5dc00 0xffffffff 0x15521d 0xcbc7e 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x15064d 0xc8c6e 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x14ba7e 0xc5c5d 0x75300 0x7d000 0x5dc00 0xffffffff 0x146eae =
0xc2c4c 0x75300 0x7d000 0x5dc00 0xffffffff 0x1422de 0xbfc3c 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x13d70e 0xbcc2b 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x138b3f 0xb9c1a 0x75300 0x7d000 0x5dc00 0xffffffff 0x133f6f =
0xb6c0a 0x75300 0x7d000 0x5dc00 0xffffffff 0x12f39f 0xb3bf9 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x12a7d0 0xb0be9 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x125c00 0xadbd8 0x75300 0x7d000 0x5dc00 0xffffffff 0x121030 =
0xaabc7 0x75300 0x7d000 0x5dc00 0xffffffff 0x11c461 0xa7bb7 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x117891 0xa4ba6 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x112cc1 0xa1b96 0x75300 0x7d000 0x5dc00 0xffffffff 0x10e0f2 =
0x9eb85 0x75300 0x7d000 0x5dc00 0xffffffff 0x109522 0x9bb74 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x104952 0x98b64 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xffd82 0x95b53 0x75300 0x7d000 0x5dc00 0xffffffff 0xfb1b3 =
0x92b42 0x75300 0x7d000 0x5dc00 0xffffffff 0xf65e3 0x8fb32 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xf1a13 0x8cb21 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xece44 0x89b11 0x75300 0x7d000 0x5dc00 0xffffffff 0xe8274 =
0x86b00 0x75300 0x7d000 0x5dc00 0xffffffff 0xe36a4 0x83aef 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xdead5 0x80adf 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xd9f05 0x7dace 0x75300 0x7d000 0x5dc00 0xffffffff 0xd5335 =
0x7aabe 0x75300 0x7d000 0x5dc00 0xffffffff 0xd0766 0x77aad 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xcbb96 0x74a9c 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xc6fc6 0x71a8c 0x75300 0x7d000 0x5dc00 0xffffffff 0xc23f6 =
0x6ea7b 0x75300 0x7d000 0x5dc00 0xffffffff 0xbd827 0x6ba6a 0x75300 =
0x76c00 0x5dc00 0xffffffff 0xb8c57 0x68a5a 0x75300 0x76c00 0x5dc00 =
0xffffffff 0xb4087 0x65a49 0x75300 0x76c00 0x5dc00 0xffffffff 0xaf4b8 =
0x62a39 0x75300 0x76c00 0x5dc00 0xffffffff 0xaa8e8 0x5fa28 0x75300 =
0x76c00 0x5dc00 0xffffffff 0xa5d18 0x5ca17 0x75300 0x76c00 0x5dc00 =
0xffffffff 0xa1149 0x59a07 0x75300 0x76c00 0x5dc00 0xffffffff 0x9c579 =
0x569f6 0x75300 0x76c00 0x5dc00 0xffffffff 0x979a9 0x539e6 0x75300 =
0x76c00 0x5dc00 0xffffffff 0x92dda 0x509d5 0x75300 0x73a00 0x5dc00 =
0xffffffff 0x8e20a 0x4d9c4 0x75300 0x73a00 0x5dc00 0xffffffff 0x8963a =
0x4a9b4 0x75300 0x73a00 0x5dc00 0xffffffff 0x84a6a 0x479a3 0x75300 =
0x73a00 0x5dc00 0xffffffff 0x7fe9b 0x44992 0x75300 0x73a00 0x5dc00 =
0xffffffff 0x7b2cb 0x41982 0x75300 0x73a00 0x5dc00 0xffffffff 0x766fb =
0x3e971 0x75300 0x73a00 0x5dc00 0xffffffff 0x71b2c 0x3b961 0x75300 =
0x6a400 0x5dc00 0xffffffff 0x6cf5c 0x38950 0x75300 0x6a400 0x5dc00 =
0xffffffff 0x6838c 0x3593f 0x75300 0x6a400 0x5dc00 0xffffffff 0x637bd =
0x3292f 0x75300 0x6a400 0x5dc00 0xffffffff 0x5ebed 0x2f91e 0x75300 =
0x6a400 0x5dc00 0xffffffff 0x5a01d 0x2c90e 0x75300 0x6a400 0x5dc00 =
0xffffffff 0x5544e 0x298fd 0x75300 0x60e00 0x5dc00 0xffffffff 0x5087e =
0x268ec 0x75300 0x60e00 0x5dc00 0xffffffff 0x4bcae 0x238dc 0x75300 =
0x60e00 0x5dc00 0xffffffff 0x470de 0x208cb 0x75300 0x60e00 0x5dc00 =
0xffffffff 0x4250f 0x1d8ba 0x75300 0x60e00 0x5dc00 0xffffffff 0x3d93f =
0x1a8aa 0x75300 0x60e00 0x5dc00 0xffffffff 0x38d6f 0x17899 0x75300 =
0x60e00 0x5dc00 0xffffffff 0x341a0 0x14889 0x75300 0x60e00 0x5dc00 =
0xffffffff 0x2f5d0 0x11878 0x75300 0x60e00 0x5dc00 0xffffffff>;=0A=
		};=0A=
=0A=
		gpu_balanced {=0A=
			cdev-type =3D "gpu-balanced";=0A=
			num_states =3D <0x42>;=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x42>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			status =3D "okay";=0A=
			throttle_table =3D <0x16358c 0xceb08 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x15e9bc 0xcafb0 0x75300 0x7d000 0x5dc00 0xffffffff 0x159ded =
0xc7458 0x75300 0x7d000 0x5dc00 0xffffffff 0x15521d 0xc3900 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x15064d 0xbfda7 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x14ba7e 0xbc24f 0x75300 0x7d000 0x5dc00 0xffffffff 0x146eae =
0xb86f7 0x75300 0x7d000 0x5dc00 0xffffffff 0x1422de 0xb4b9f 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x13d70e 0xb1047 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x138b3f 0xad4ef 0x75300 0x7d000 0x5dc00 0xffffffff 0x133f6f =
0xa9996 0x75300 0x7d000 0x5dc00 0xffffffff 0x12f39f 0xa5e3e 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x12a7d0 0xa22e6 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x125c00 0x9e78e 0x75300 0x7d000 0x5dc00 0xffffffff 0x121030 =
0x9ac36 0x75300 0x7d000 0x5dc00 0xffffffff 0x11c461 0x970de 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x117891 0x93585 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x112cc1 0x8fa2d 0x75300 0x7d000 0x5dc00 0xffffffff 0x10e0f2 =
0x8bed5 0x75300 0x7d000 0x5dc00 0xffffffff 0x109522 0x8837d 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x104952 0x84825 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xffd82 0x80ccd 0x75300 0x7d000 0x5dc00 0xffffffff 0xfb1b3 =
0x7d175 0x75300 0x7d000 0x5dc00 0xffffffff 0xf65e3 0x7961c 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xf1a13 0x75ac4 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xece44 0x71f6c 0x75300 0x7d000 0x5dc00 0xffffffff 0xe8274 =
0x6e414 0x75300 0x7d000 0x5dc00 0xffffffff 0xe36a4 0x6a8bc 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xdead5 0x66d64 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xd9f05 0x6320b 0x75300 0x7d000 0x5dc00 0xffffffff 0xd5335 =
0x5f6b3 0x75300 0x7d000 0x5dc00 0xffffffff 0xd0766 0x5bb5b 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xcbb96 0x58003 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xc6fc6 0x544ab 0x75300 0x7d000 0x5dc00 0xffffffff 0xc23f6 =
0x50953 0x75300 0x7d000 0x5dc00 0xffffffff 0xbd827 0x4cdfb 0x75300 =
0x76c00 0x5dc00 0xffffffff 0xb8c57 0x492a2 0x75300 0x76c00 0x5dc00 =
0xffffffff 0xb4087 0x4574a 0x75300 0x76c00 0x5dc00 0xffffffff 0xaf4b8 =
0x41bf2 0x75300 0x76c00 0x5dc00 0xffffffff 0xaa8e8 0x3e09a 0x75300 =
0x76c00 0x5dc00 0xffffffff 0xa5d18 0x3a542 0x75300 0x76c00 0x5dc00 =
0xffffffff 0xa1149 0x369ea 0x75300 0x76c00 0x5dc00 0xffffffff 0x9c579 =
0x32e91 0x75300 0x76c00 0x5dc00 0xffffffff 0x979a9 0x2f339 0x75300 =
0x76c00 0x5dc00 0xffffffff 0x92dda 0x2b7e1 0x75300 0x73a00 0x5dc00 =
0xffffffff 0x8e20a 0x27c89 0x75300 0x73a00 0x5dc00 0xffffffff 0x8963a =
0x24131 0x75300 0x73a00 0x5dc00 0xffffffff 0x84a6a 0x205d9 0x75300 =
0x73a00 0x5dc00 0xffffffff 0x7fe9b 0x1ca80 0x75300 0x73a00 0x5dc00 =
0xffffffff 0x7b2cb 0x18f28 0x75300 0x73a00 0x5dc00 0xffffffff 0x766fb =
0x153d0 0x75300 0x73a00 0x5dc00 0xffffffff 0x71b2c 0xf168 0x75300 =
0x6a400 0x5dc00 0xffffffff>;=0A=
			linux,phandle =3D <0x1b>;=0A=
			phandle =3D <0x1b>;=0A=
		};=0A=
=0A=
		cpu_balanced {=0A=
			cdev-type =3D "cpu-balanced";=0A=
			num_states =3D <0x42>;=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x42>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			status =3D "okay";=0A=
			throttle_table =3D <0x16358c 0xffffffff 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x15e9bc 0xffffffff 0x75300 0x7d000 0x5dc00 0xffffffff =
0x159ded 0xffffffff 0x75300 0x7d000 0x5dc00 0xffffffff 0x15521d =
0xffffffff 0x75300 0x7d000 0x5dc00 0xffffffff 0x15064d 0xffffffff =
0x75300 0x7d000 0x5dc00 0xffffffff 0x14ba7e 0xffffffff 0x75300 0x7d000 =
0x5dc00 0xffffffff 0x146eae 0xffffffff 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x1422de 0xffffffff 0x75300 0x7d000 0x5dc00 0xffffffff =
0x13d70e 0xffffffff 0x75300 0x7d000 0x5dc00 0xffffffff 0x138b3f =
0xffffffff 0x75300 0x7d000 0x5dc00 0xffffffff 0x133f6f 0xe1000 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x12f39f 0xdd3a5 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x12a7d0 0xd974a 0x75300 0x7d000 0x5dc00 0xffffffff 0x125c00 =
0xd5aef 0x75300 0x7d000 0x5dc00 0xffffffff 0x121030 0xd1e94 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x11c461 0xce239 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x117891 0xca5df 0x75300 0x7d000 0x5dc00 0xffffffff 0x112cc1 =
0xc6984 0x75300 0x7d000 0x5dc00 0xffffffff 0x10e0f2 0xc2d29 0x75300 =
0x7d000 0x5dc00 0xffffffff 0x109522 0xbf0ce 0x75300 0x7d000 0x5dc00 =
0xffffffff 0x104952 0xbb473 0x75300 0x7d000 0x5dc00 0xffffffff 0xffd82 =
0xb7818 0x75300 0x7d000 0x5dc00 0xffffffff 0xfb1b3 0xb3bbd 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xf65e3 0xaff62 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xf1a13 0xac307 0x75300 0x7d000 0x5dc00 0xffffffff 0xece44 =
0xa86ac 0x75300 0x7d000 0x5dc00 0xffffffff 0xe8274 0xa4a51 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xe36a4 0xa0df7 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xdead5 0x9d19c 0x75300 0x7d000 0x5dc00 0xffffffff 0xd9f05 =
0x99541 0x75300 0x7d000 0x5dc00 0xffffffff 0xd5335 0x958e6 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xd0766 0x91c8b 0x75300 0x7d000 0x5dc00 =
0xffffffff 0xcbb96 0x8e030 0x75300 0x7d000 0x5dc00 0xffffffff 0xc6fc6 =
0x8a3d5 0x75300 0x7d000 0x5dc00 0xffffffff 0xc23f6 0x8677a 0x75300 =
0x7d000 0x5dc00 0xffffffff 0xbd827 0x82b1f 0x75300 0x76c00 0x5dc00 =
0xffffffff 0xb8c57 0x7eec4 0x75300 0x76c00 0x5dc00 0xffffffff 0xb4087 =
0x7b269 0x75300 0x76c00 0x5dc00 0xffffffff 0xaf4b8 0x7760f 0x75300 =
0x76c00 0x5dc00 0xffffffff 0xaa8e8 0x739b4 0x75300 0x76c00 0x5dc00 =
0xffffffff 0xa5d18 0x6fd59 0x75300 0x76c00 0x5dc00 0xffffffff 0xa1149 =
0x6c0fe 0x75300 0x76c00 0x5dc00 0xffffffff 0x9c579 0x684a3 0x75300 =
0x76c00 0x5dc00 0xffffffff 0x979a9 0x64848 0x75300 0x76c00 0x5dc00 =
0xffffffff 0x92dda 0x60bed 0x75300 0x73a00 0x5dc00 0xffffffff 0x8e20a =
0x5cf92 0x75300 0x73a00 0x5dc00 0xffffffff 0x8963a 0x59337 0x75300 =
0x73a00 0x5dc00 0xffffffff 0x84a6a 0x556dc 0x75300 0x73a00 0x5dc00 =
0xffffffff 0x7fe9b 0x51a81 0x75300 0x73a00 0x5dc00 0xffffffff 0x7b2cb =
0x4de27 0x75300 0x73a00 0x5dc00 0xffffffff 0x766fb 0x4a1cc 0x75300 =
0x73a00 0x5dc00 0xffffffff 0x71b2c 0x46571 0x75300 0x6a400 0x5dc00 =
0xffffffff 0x6cf5c 0x42916 0x75300 0x6a400 0x5dc00 0xffffffff 0x6838c =
0x3ecbb 0x75300 0x6a400 0x5dc00 0xffffffff 0x637bd 0x3b060 0x75300 =
0x6a400 0x5dc00 0xffffffff 0x5ebed 0x37405 0x75300 0x6a400 0x5dc00 =
0xffffffff 0x5a01d 0x337aa 0x75300 0x6a400 0x5dc00 0xffffffff 0x5544e =
0x2fb4f 0x75300 0x60e00 0x5dc00 0xffffffff 0x5087e 0x2bef4 0x75300 =
0x60e00 0x5dc00 0xffffffff 0x4bcae 0x28299 0x75300 0x60e00 0x5dc00 =
0xffffffff 0x470de 0x2463f 0x75300 0x60e00 0x5dc00 0xffffffff 0x4250f =
0x209e4 0x75300 0x60e00 0x5dc00 0xffffffff 0x3d93f 0x1cd89 0x75300 =
0x60e00 0x5dc00 0xffffffff 0x38d6f 0x1912e 0x75300 0x60e00 0x5dc00 =
0xffffffff 0x341a0 0x154d3 0x75300 0x60e00 0x5dc00 0xffffffff 0x2f5d0 =
0x11878 0x75300 0x60e00 0x5dc00 0xffffffff>;=0A=
			linux,phandle =3D <0x15>;=0A=
			phandle =3D <0x15>;=0A=
		};=0A=
=0A=
		emergency_balanced {=0A=
			cdev-type =3D "emergency-balanced";=0A=
			num_states =3D <0x1>;=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x1>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			status =3D "okay";=0A=
			throttle_table =3D <0x111ed0 0x5f758 0x46500 0x668a0 0x3d860 0x60ae0>;=0A=
			linux,phandle =3D <0x20>;=0A=
			phandle =3D <0x20>;=0A=
		};=0A=
	};=0A=
=0A=
	agic-controller {=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	adma@702e2000 {=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	ahub {=0A=
		status =3D "disabled";=0A=
=0A=
		admaif@0x702d0000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		sfc@702d2000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		sfc@702d2200 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		sfc@702d2400 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		sfc@702d2600 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		spkprot@702d8c00 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		amixer@702dbb00 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		i2s@702d1000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		i2s@702d1100 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		i2s@702d1200 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		i2s@702d1300 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		i2s@702d1400 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		amx@702d3000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		amx@702d3100 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		adx@702d3800 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		adx@702d3900 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		dmic@702d4000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		dmic@702d4100 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		dmic@702d4200 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		afc@702d7000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		afc@702d7100 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		afc@702d7200 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		afc@702d7300 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		afc@702d7400 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		afc@702d7500 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		mvc@702da000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		mvc@702da200 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		iqc@702de000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		iqc@702de200 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		ope@702d8000 {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		ope@702d8400 {=0A=
			status =3D "disabled";=0A=
		};=0A=
	};=0A=
=0A=
	adsp_audio {=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	sata@70020000 {=0A=
		status =3D "disabled";=0A=
		hvdd_sata-supply =3D <0x36>;=0A=
		hvdd_pex_pll_e-supply =3D <0x36>;=0A=
		l0_hvddio_sata-supply =3D <0x36>;=0A=
		l0_dvddio_sata-supply =3D <0x40>;=0A=
		dvdd_sata_pll-supply =3D <0x40>;=0A=
=0A=
		prod-settings {=0A=
			#prod-cells =3D <0x4>;=0A=
=0A=
			prod {=0A=
				prod =3D <0x0 0x680 0x1 0x1 0x0 0x690 0xfff 0x715 0x0 0x694 0xff0ff =
0xe01b 0x0 0x6d0 0xffffffff 0xab000f 0x0 0x170 0xf000 0x7000 0x2 0x960 =
0x3000000 0x1000000>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	modem {=0A=
		compatible =3D "nvidia,icera-i500";=0A=
		status =3D "disabled";=0A=
		nvidia,boot-gpio =3D <0x56 0x56 0x1>;=0A=
		nvidia,mdm-power-report-gpio =3D <0x56 0x59 0x1>;=0A=
		nvidia,reset-gpio =3D <0x56 0x58 0x1>;=0A=
		nvidia,mdm-en-gpio =3D <0x56 0x57 0x0>;=0A=
		nvidia,num-temp-sensors =3D <0x3>;=0A=
=0A=
		nvidia,phy-ehci-hsic {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		nvidia,phy-xhci-hsic {=0A=
			status =3D "disabled";=0A=
		};=0A=
=0A=
		nvidia,phy-xhci-utmi {=0A=
			status =3D "disabled";=0A=
		};=0A=
	};=0A=
=0A=
	trusty {=0A=
		compatible =3D "android,trusty-smc-v1";=0A=
		ranges;=0A=
		#address-cells =3D <0x2>;=0A=
		#size-cells =3D <0x2>;=0A=
		status =3D "disabled";=0A=
=0A=
		irq {=0A=
			compatible =3D "android,trusty-irq-v1";=0A=
			interrupt-templates =3D <0xa0 0x0 0x33 0x1 0x1 0x0 0x33 0x1 0x0 0x0>;=0A=
			interrupt-ranges =3D <0x0 0xf 0x0 0x10 0x1f 0x1 0x20 0xdf 0x2>;=0A=
		};=0A=
=0A=
		fiq {=0A=
			compatible =3D "android,trusty-fiq-v1";=0A=
		};=0A=
=0A=
		virtio {=0A=
			compatible =3D "android,trusty-virtio-v1";=0A=
		};=0A=
=0A=
		log {=0A=
			compatible =3D "android,trusty-log-v1";=0A=
		};=0A=
	};=0A=
=0A=
	smp-custom-ipi {=0A=
		compatible =3D "android,CustomIPI";=0A=
		#interrupt-cells =3D <0x1>;=0A=
		interrupt-controller;=0A=
		linux,phandle =3D <0xa0>;=0A=
		phandle =3D <0xa0>;=0A=
	};=0A=
=0A=
	psy_extcon_xudc {=0A=
		compatible =3D "power-supply-extcon";=0A=
		extcon-cables =3D <0x9a 0x1 0x9a 0x2 0x9a 0x3 0x9a 0x4 0x9a 0x5 0x9a =
0x6 0x9a 0x7 0x9a 0x8 0x9a 0x9>;=0A=
		extcon-cable-names =3D "usb-charger", "ta-charger", "maxim-charger", =
"qc2-charger", "downstream-charger", "slow-charger", "apple-500ma", =
"apple-1a", "apple-2a";=0A=
		status =3D "disabled";=0A=
	};=0A=
=0A=
	tegra-supply-tests {=0A=
		compatible =3D "nvidia,tegra-supply-tests";=0A=
		vdd-core-supply =3D <0xa1>;=0A=
	};=0A=
=0A=
	camera-pcl {=0A=
=0A=
		dpd {=0A=
			compatible =3D "nvidia,csi-dpd";=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			num =3D <0x6>;=0A=
=0A=
			csia {=0A=
				reg =3D <0x0 0x0 0x0 0x0>;=0A=
			};=0A=
=0A=
			csib {=0A=
				reg =3D <0x0 0x1 0x0 0x0>;=0A=
			};=0A=
=0A=
			csic {=0A=
				reg =3D <0x1 0xa 0x0 0x0>;=0A=
			};=0A=
=0A=
			csid {=0A=
				reg =3D <0x1 0xb 0x0 0x0>;=0A=
			};=0A=
=0A=
			csie {=0A=
				reg =3D <0x1 0xc 0x0 0x0>;=0A=
			};=0A=
=0A=
			csif {=0A=
				reg =3D <0x1 0xd 0x0 0x0>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	rollback-protection {=0A=
		device-name =3D "sdmmc";=0A=
		device-method =3D <0x1 0x2>;=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	external-memory-controller@7001b000 {=0A=
		#cooling-cells =3D <0x2>;=0A=
		compatible =3D "nvidia,tegra21-emc", "nvidia,tegra210-emc";=0A=
		reg =3D <0x0 0x7001b000 0x0 0x1000 0x0 0x7001e000 0x0 0x1000 0x0 =
0x7001f000 0x0 0x1000>;=0A=
		clocks =3D <0x21 0x39 0x21 0xf1 0x21 0xed 0x21 0xf3 0x21 0xe9 0x21 =
0x131 0x21 0x140 0x21 0x141 0x21 0x1e0>;=0A=
		clock-names =3D "emc", "pll_m", "pll_c", "pll_p", "clk_m", "pll_mb", =
"pll_mb_ud", "pll_p_ud", "emc_override";=0A=
		#thermal-sensor-cells =3D <0x0>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		nvidia,use-ram-code;=0A=
		linux,phandle =3D <0x1d>;=0A=
		phandle =3D <0x1d>;=0A=
=0A=
		emc-table@0 {=0A=
			nvidia,ram-code =3D <0x0>;=0A=
=0A=
			emc-table@204000 {=0A=
				compatible =3D "nvidia,tegra21-emc-table";=0A=
				nvidia,revision =3D <0x7>;=0A=
				nvidia,dvfs-version =3D "13_204000_12_V9.8.7_V1.6";=0A=
				clock-frequency =3D <0x31ce0>;=0A=
				nvidia,emc-min-mv =3D <0x320>;=0A=
				nvidia,gk20a-min-mv =3D <0x44c>;=0A=
				nvidia,source =3D "pllp_out0";=0A=
				nvidia,src-sel-reg =3D <0x40188002>;=0A=
				nvidia,needs-training =3D <0x0>;=0A=
				nvidia,training_pattern =3D <0x0>;=0A=
				nvidia,trained =3D <0x0>;=0A=
				nvidia,periodic_training =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,run_clocks =3D <0xd>;=0A=
				nvidia,tree_margin =3D <0x1>;=0A=
				nvidia,burst-regs-num =3D <0xdd>;=0A=
				nvidia,burst-regs-per-ch-num =3D <0x8>;=0A=
				nvidia,trim-regs-num =3D <0x8a>;=0A=
				nvidia,trim-regs-per-ch-num =3D <0xa>;=0A=
				nvidia,burst-mc-regs-num =3D <0x21>;=0A=
				nvidia,la-scale-regs-num =3D <0x18>;=0A=
				nvidia,vref-regs-num =3D <0x4>;=0A=
				nvidia,training-mod-regs-num =3D <0x14>;=0A=
				nvidia,dram-timing-regs-num =3D <0x5>;=0A=
				nvidia,min-mrs-wait =3D <0x16>;=0A=
				nvidia,emc-mrw =3D <0x88010004>;=0A=
				nvidia,emc-mrw2 =3D <0x88020000>;=0A=
				nvidia,emc-mrw3 =3D <0x880d0000>;=0A=
				nvidia,emc-mrw4 =3D <0xc0000000>;=0A=
				nvidia,emc-mrw9 =3D <0x8c0e7272>;=0A=
				nvidia,emc-mrs =3D <0x0>;=0A=
				nvidia,emc-emrs =3D <0x0>;=0A=
				nvidia,emc-emrs2 =3D <0x0>;=0A=
				nvidia,emc-auto-cal-config =3D <0xa01a51d8>;=0A=
				nvidia,emc-auto-cal-config2 =3D <0x5500000>;=0A=
				nvidia,emc-auto-cal-config3 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config4 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config5 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config6 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config7 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config8 =3D <0x770000>;=0A=
				nvidia,emc-cfg-2 =3D <0x110805>;=0A=
				nvidia,emc-sel-dpd-ctrl =3D <0x40008>;=0A=
				nvidia,emc-fdpd-ctrl-cmd-no-ramp =3D <0x1>;=0A=
				nvidia,dll-clk-src =3D <0x40188002>;=0A=
				nvidia,clk-out-enb-x-0-clk-enb-emc-dll =3D <0x1>;=0A=
				nvidia,emc-clock-latency-change =3D <0xd5c>;=0A=
				nvidia,ptfv =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0xa 0xa 0xa 0x1>;=0A=
				nvidia,emc-registers =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x4 0xb 0xd 0x8 =
0xb 0x0 0x4 0x20 0x6 0x6 0x6 0x3 0x0 0x6 0x4 0x2 0x0 0x4 0x8 0xd 0x6 0x5 =
0x0 0x0 0x3 0x88037171 0xc 0x1 0xa 0x10000 0x12 0x14 0x16 0x12 0x14 =
0x304 0x0 0xc1 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 0xd 0x3b 0x3b 0x5 0x5 =
0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 0x9160a00d 0x3bbf 0x2c00a0 =
0x8000 0xbe 0xfff0fff 0xfff0fff 0x0 0x0 0x0 0x0 0x880b0000 0xe0017 =
0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x450031 =
0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 0xe000e 0x140014 =
0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f 0x12 0x64000 =
0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 0x804 0x550 =
0xf3200000 0xfff0fff 0x713 0xa 0x0 0x0 0x1b 0x1b 0x20000 0x50037 0x0 =
0x10 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 0x1600 0x0 =
0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 0x400080 =
0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 0xc0c0c0c0 =
0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x0 0x0 0x14 0xa 0x16 =
0x88161414 0x12 0x10000 0x9080 0x7070404 0x40065 0x513801f 0x1f101100 =
0x14 0x107240 0x1124000 0x1125b6a 0xf081000 0x105800 0x1110fc00 =
0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-burst-regs-per-ch =3D <0x880c7272 0x880c7272 0xc80c7272 =
0xc80c7272 0x8c0e7272 0x8c0e7272 0x4c0e7272 0x4c0e7272>;=0A=
				nvidia,emc-shadow-regs-ca-train =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x4 =
0xb 0xd 0x8 0xb 0x0 0x4 0x20 0x6 0x6 0x6 0x3 0x0 0x6 0x4 0x2 0x0 0x4 0x8 =
0xd 0x6 0x5 0x0 0x0 0x3 0x88037171 0xc 0x1 0xa 0x10000 0x12 0x14 0x16 =
0x12 0x14 0x304 0x0 0xc1 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 0xd 0x3b 0x3b =
0x5 0x5 0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 0x9960a00d 0x3bbf =
0x2c00a0 0x8000 0x55 0xfff0fff 0xfff0fff 0x0 0x0 0x0 0x0 0x880b0000 =
0xe0017 0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 =
0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 0xe000e =
0x140014 0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f 0x12 =
0x64000 0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 0x804 =
0x550 0xf3200000 0xfff0fff 0x713 0xa 0x0 0x0 0x1b 0x1b 0x20000 0x5058033 =
0x5050000 0x0 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 =
0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 =
0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 =
0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x1 0x1f =
0x18 0x8 0x1a 0x88161414 0x10 0x10000 0x9080 0x7070404 0x40065 0x513801f =
0x1f101100 0x14 0x107240 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-shadow-regs-quse-train =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x4 =
0xa 0xd 0x8 0xb 0x0 0x4 0x20 0x6 0x6 0x6 0xc 0x0 0x6 0x4 0x2 0x0 0x4 0x8 =
0xd 0x3 0x2 0x10000000 0x0 0x3 0x88037171 0xb 0x1 0x80000000 0x40000 =
0x12 0x14 0x16 0x12 0x14 0x304 0x0 0xc1 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 =
0xd 0x3b 0x3b 0x5 0x5 0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 =
0x9160400d 0x3bbf 0x2c00a0 0x8000 0xbe 0xfff0fff 0xfff0fff 0x0 0x0 0x0 =
0x0 0x880b0000 0xe0017 0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb =
0x100004 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 =
0xe000e 0x140014 0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 =
0x804 0x550 0xf3200000 0xfff0fff 0x713 0xa 0x0 0x0 0x1b 0x1b 0x30020000 =
0x58037 0x0 0x10 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 =
0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 =
0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 =
0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x1 0x1f =
0x1e 0x14 0x20 0x88161414 0x1c 0x40000 0x9080 0x7070404 0x40065 =
0x513801f 0x1f101100 0x14 0x107240 0x1124000 0x1125b6a 0xf081000 =
0x105800 0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 =
0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-shadow-regs-rdwr-train =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x4 =
0xe 0xd 0x8 0xb 0x0 0x4 0x20 0x6 0x6 0x6 0x12 0x13 0x6 0x4 0x2 0x0 0x4 =
0x8 0xd 0x6 0x5 0x10000000 0x30000002 0x3 0x88037171 0xc 0x1 0xa 0x40000 =
0x12 0x14 0x16 0x12 0x14 0x304 0x0 0xc1 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 =
0xd 0x3b 0x3b 0x5 0x5 0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 =
0x9160a00d 0x3bbf 0x2c00a0 0x8000 0xbe 0xfff0fff 0xfff0fff 0x0 0x0 0x0 =
0x0 0x880b0000 0xe0017 0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb =
0x100004 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 =
0xe000e 0x140014 0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 =
0x804 0x550 0xf3200000 0xfff0fff 0x713 0xa 0x0 0x0 0x1b 0x1b 0x20000 =
0x50037 0x0 0x10 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 =
0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 =
0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 =
0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x1 0x0 =
0x14 0xa 0x16 0x88161414 0x12 0x40000 0xb080 0x7070404 0x40065 0x513801f =
0x1f101100 0x14 0x107240 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-trim-regs =3D <0x280028 0x280028 0x280028 0x280028 =
0x280028 0x280028 0x280028 0x280028 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x11111111 0x11111111 0x28282828 0x28282828 0x0 0x0 0x0 0x0 =
0xe0017 0x1c0014 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-trim-regs-per-ch =3D <0x0 0x0 0x249249 0x249249 0x249249 =
0x249249 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-vref-regs =3D <0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-dram-timing-regs =3D <0x12 0x104 0x118 0x18 0x6>;=0A=
				nvidia,emc-training-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-save-restore-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-burst-mc-regs =3D <0x8000001 0x8000004c 0xa1020 =
0x80001028 0x1 0x0 0x3 0x1 0x2 0x1 0x2 0x5 0x1 0x1 0x4 0x8 0x5 0x7 =
0x2020000 0x30201 0x72a30504 0x70000f0f 0x0 0x1f0000 0x80001a 0x80001a =
0x80001a 0x80001a 0x80001a 0x80001a 0x80001a 0x80001a 0x80001a>;=0A=
				nvidia,emc-la-scale-regs =3D <0x1b 0x80001a 0x24c 0xff00b2 0xff00da =
0xff009d 0xff00ff 0xff000c 0xff00ff 0xff000c 0x7f0049 0xff0080 0xff0004 =
0x800ad 0xff 0xff0004 0xff00c6 0xff00c6 0xff006d 0xff00ff 0xff00e2 0xff =
0x80 0xff00ff>;=0A=
			};=0A=
=0A=
			emc-table@1600000 {=0A=
				compatible =3D "nvidia,tegra21-emc-table";=0A=
				nvidia,revision =3D <0x7>;=0A=
				nvidia,dvfs-version =3D "13_1600000_12_V9.8.7_V1.6";=0A=
				clock-frequency =3D <0x186a00>;=0A=
				nvidia,emc-min-mv =3D <0x377>;=0A=
				nvidia,gk20a-min-mv =3D <0x44c>;=0A=
				nvidia,source =3D "pllm_ud";=0A=
				nvidia,src-sel-reg =3D <0x80188000>;=0A=
				nvidia,needs-training =3D <0x2f0>;=0A=
				nvidia,training_pattern =3D <0x0>;=0A=
				nvidia,trained =3D <0x0>;=0A=
				nvidia,periodic_training =3D <0x1>;=0A=
				nvidia,trained_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,run_clocks =3D <0x40>;=0A=
				nvidia,tree_margin =3D <0x1>;=0A=
				nvidia,burst-regs-num =3D <0xdd>;=0A=
				nvidia,burst-regs-per-ch-num =3D <0x8>;=0A=
				nvidia,trim-regs-num =3D <0x8a>;=0A=
				nvidia,trim-regs-per-ch-num =3D <0xa>;=0A=
				nvidia,burst-mc-regs-num =3D <0x21>;=0A=
				nvidia,la-scale-regs-num =3D <0x18>;=0A=
				nvidia,vref-regs-num =3D <0x4>;=0A=
				nvidia,training-mod-regs-num =3D <0x14>;=0A=
				nvidia,dram-timing-regs-num =3D <0x5>;=0A=
				nvidia,min-mrs-wait =3D <0x30>;=0A=
				nvidia,emc-mrw =3D <0x88010054>;=0A=
				nvidia,emc-mrw2 =3D <0x8802002d>;=0A=
				nvidia,emc-mrw3 =3D <0x880d0000>;=0A=
				nvidia,emc-mrw4 =3D <0xc0000000>;=0A=
				nvidia,emc-mrw9 =3D <0x8c0e4848>;=0A=
				nvidia,emc-mrs =3D <0x0>;=0A=
				nvidia,emc-emrs =3D <0x0>;=0A=
				nvidia,emc-emrs2 =3D <0x0>;=0A=
				nvidia,emc-auto-cal-config =3D <0xa01a51d8>;=0A=
				nvidia,emc-auto-cal-config2 =3D <0x5500000>;=0A=
				nvidia,emc-auto-cal-config3 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config4 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config5 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config6 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config7 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config8 =3D <0x770000>;=0A=
				nvidia,emc-cfg-2 =3D <0x110835>;=0A=
				nvidia,emc-sel-dpd-ctrl =3D <0x40000>;=0A=
				nvidia,emc-fdpd-ctrl-cmd-no-ramp =3D <0x1>;=0A=
				nvidia,dll-clk-src =3D <0x80188000>;=0A=
				nvidia,clk-out-enb-x-0-clk-enb-emc-dll =3D <0x0>;=0A=
				nvidia,emc-clock-latency-change =3D <0x49c>;=0A=
				nvidia,ptfv =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0xa 0xa 0xa 0x1>;=0A=
				nvidia,emc-registers =3D <0x60 0x1c0 0xe0 0x0 0x0 0x44 0x1d 0x29 =
0x21 0xc 0x2d 0x0 0x4 0x20 0x1d 0x1d 0x10 0x17 0x16 0x6 0xe 0xc 0xa 0xe =
0x8 0xd 0x24 0x8 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1c 0x1f 0xd =
0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x1820 0x0 0x608 0x10 0x10 0x3 0x3 0x3 =
0x38 0xe 0x2 0x2e 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x22 0x4 0x14 0xc803f1f1 =
0x1860 0x0 0x9960a00d 0x3bff 0xc00001bb 0x8000 0x55 0x0 0x0 0x0 0x0 0x0 =
0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 =
0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 0x90002 0xe000e 0x80008 =
0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f 0x12 0x64000 =
0x310640 0x6400030 0x1900017 0xc1e0030a 0x1f13612f 0x14 0x80d 0x550 =
0xf3200000 0x0 0x308c 0x2b 0x0 0x0 0x1b 0x1b 0x20000 0x33 0x0 0x11 =
0x3000 0x2000000 0x2000101 0x7 0x30808 0x15c00 0x102020 0x1fff1fff 0x0 =
0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 0x400080 =
0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefff2210 0x0 0x0 0xdcdcdcdc =
0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 0x0 0x0 0x3b 0x2b 0x3d =
0x88161414 0x33 0x6000c 0x9080 0x7070404 0x40320 0x513801f 0x1f101100 =
0x14 0x103200 0x1124000 0x1125b6a 0xf081000 0x105800 0x1110fc00 =
0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-burst-regs-per-ch =3D <0x880c4848 0x880c4848 0xc80c4848 =
0xc80c4848 0x8c0e4848 0x8c0e4848 0x4c0e4848 0x4c0e4848>;=0A=
				nvidia,emc-shadow-regs-ca-train =3D <0x60 0x1c0 0xe0 0x0 0x0 0x44 =
0x1d 0x29 0x21 0xc 0x2d 0x0 0x4 0x20 0x1d 0x1d 0x10 0x17 0x16 0x6 0xe =
0xc 0xa 0xe 0x8 0xd 0x24 0x8 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1c =
0x1f 0xd 0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x1820 0x0 0x608 0x10 0x10 0x3 =
0x3 0x3 0x38 0xe 0x2 0x2e 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x22 0x4 0x14 =
0xc803f1f1 0x1860 0x0 0x9960a00d 0x3bff 0xc00001bb 0x8000 0x55 0x0 0x0 =
0x0 0x0 0x0 0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c 0x1c001c =
0x1c001c 0x7 0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 0x90002 =
0xe000e 0x80008 0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x310640 0x6400030 0x1900017 0xc1e0030a 0x1f13612f 0x14 =
0x80d 0x550 0xf3200000 0x0 0x308c 0x2b 0x0 0x0 0x1b 0x1b 0x20000 0x8033 =
0x0 0x0 0x3000 0x2000000 0x2000101 0x7 0x30808 0x15c00 0x102020 =
0x1fff1fff 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 =
0x8000800 0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefff2210 0x0 =
0x0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 0x1 0x1f 0x41 =
0x2b 0x43 0x88161414 0x33 0x6000c 0x9080 0x7070404 0x40320 0x513801f =
0x1f101100 0x14 0x103200 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-shadow-regs-quse-train =3D <0x60 0x1c0 0xe0 0x0 0x0 0x44 =
0x1d 0x28 0x21 0xc 0x2d 0x0 0x4 0x20 0x1d 0x1d 0x10 0x11 0x16 0x6 0xe =
0xc 0xa 0xe 0x8 0xd 0x21 0x2 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1b =
0x1 0x80000000 0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x1820 0x0 0x608 0x10 =
0x10 0x3 0x3 0x3 0x38 0xe 0x2 0x2e 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x22 =
0x4 0x14 0xc803f1f1 0x1860 0x0 0x9960400d 0x3bff 0xc00001bb 0x8000 0x55 =
0x0 0x0 0x0 0x0 0x0 0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c =
0x1c001c 0x1c001c 0x7 0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 =
0x90002 0xe000e 0x80008 0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f =
0x220f40f 0x12 0x64000 0x310640 0x6400030 0x1900017 0xc1e0030a =
0x1f13612f 0x14 0x80d 0x550 0xf3200000 0x0 0x308c 0x2b 0x0 0x0 0x1b 0x1b =
0x30020000 0x8033 0x0 0x11 0x3000 0x2000000 0x2000101 0x7 0x30808 =
0x15c00 0x102020 0x1fff1fff 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 =
0x8000800 0x8000800 0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 =
0xefff2210 0x0 0x0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 =
0x1 0x1f 0x45 0x35 0x47 0x88161414 0x3d 0x6000c 0x9080 0x7070404 0x40320 =
0x513801f 0x1f101100 0x14 0x103200 0x1124000 0x1125b6a 0xf081000 =
0x105800 0x1110fc00 0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 =
0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-shadow-regs-rdwr-train =3D <0x60 0x1c0 0xe0 0x0 0x0 0x44 =
0x1d 0x29 0x21 0xc 0x2d 0x0 0x4 0x20 0x1d 0x1d 0x10 0x17 0x16 0x6 0xe =
0xc 0xa 0xe 0x8 0xd 0x24 0x8 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1c =
0x1f 0xd 0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x1820 0x0 0x608 0x10 0x10 0x3 =
0x3 0x3 0x38 0xe 0x2 0x2e 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x22 0x4 0x14 =
0xc803f1f1 0x1860 0x0 0x9960a00d 0x3bff 0xc00001bb 0x8000 0x55 0x0 0x0 =
0x0 0x0 0x0 0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c 0x1c001c =
0x1c001c 0x7 0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 0x90002 =
0xe000e 0x80008 0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x310640 0x6400030 0x1900017 0xc1e0030a 0x1f13612f 0x14 =
0x80d 0x550 0xf3200000 0x0 0x308c 0x2b 0x0 0x0 0x1b 0x1b 0x20000 0x33 =
0x0 0x11 0x3000 0x2000000 0x2000101 0x7 0x30808 0x15c00 0x102020 =
0x1fff1fff 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 =
0x8000800 0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefff2210 0x0 =
0x0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 0x1 0x0 0x3b 0x2b =
0x3d 0x88161414 0x33 0x6000c 0xb080 0x7070404 0x40320 0x513801f =
0x1f101100 0x14 0x103200 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-trim-regs =3D <0x200020 0x200020 0x200020 0x200020 =
0x200020 0x200020 0x200020 0x200020 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x11111111 0x11111111 0x11111111 0x11111111 0x2b0022 =
0x2b0026 0x260025 0x260026 0x8000e 0x11000c 0x2b0022 0x2b0026 0x260025 =
0x260026 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-trim-regs-per-ch =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0>;=0A=
				nvidia,emc-vref-regs =3D <0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-dram-timing-regs =3D <0x12 0x104 0x118 0x7 0x20>;=0A=
				nvidia,emc-training-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-save-restore-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x4 0x4 0x4 0x4>;=0A=
				nvidia,emc-burst-mc-regs =3D <0xc 0x80000080 0xa1020 0x80001028 0x6 =
0x7 0x18 0xf 0xf 0x3 0x3 0xd 0x1 0x1 0xc 0x8 0xa 0x37 0x5060000 0xd080c =
0x726c2419 0x70000f0f 0x0 0x1f0000 0x80001a 0x80001a 0x80001a 0x80001a =
0x80001a 0x80001a 0x80001a 0x80001a 0x80001a>;=0A=
				nvidia,emc-la-scale-regs =3D <0xd0 0x80001a 0x1203 0x80003d 0x800038 =
0x800041 0x800090 0x800005 0x800090 0x800005 0x340049 0x800080 0x800004 =
0x80016 0x80 0x800004 0x800019 0x800019 0x800018 0x800095 0x80001d 0x80 =
0x2c 0x800080>;=0A=
			};=0A=
=0A=
			emc-table-derated@204000 {=0A=
				compatible =3D "nvidia,tegra21-emc-table-derated";=0A=
				nvidia,revision =3D <0x7>;=0A=
				nvidia,dvfs-version =3D "13_derating_204000_V13_V13";=0A=
				clock-frequency =3D <0x31ce0>;=0A=
				nvidia,emc-min-mv =3D <0x320>;=0A=
				nvidia,gk20a-min-mv =3D <0x44c>;=0A=
				nvidia,source =3D "pllp_out0";=0A=
				nvidia,src-sel-reg =3D <0x40188002>;=0A=
				nvidia,needs-training =3D <0x0>;=0A=
				nvidia,training_pattern =3D <0x0>;=0A=
				nvidia,trained =3D <0x0>;=0A=
				nvidia,periodic_training =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,run_clocks =3D <0xd>;=0A=
				nvidia,tree_margin =3D <0x1>;=0A=
				nvidia,burst-regs-num =3D <0xdd>;=0A=
				nvidia,burst-regs-per-ch-num =3D <0x8>;=0A=
				nvidia,trim-regs-num =3D <0x8a>;=0A=
				nvidia,trim-regs-per-ch-num =3D <0xa>;=0A=
				nvidia,burst-mc-regs-num =3D <0x21>;=0A=
				nvidia,la-scale-regs-num =3D <0x18>;=0A=
				nvidia,vref-regs-num =3D <0x4>;=0A=
				nvidia,training-mod-regs-num =3D <0x14>;=0A=
				nvidia,dram-timing-regs-num =3D <0x5>;=0A=
				nvidia,min-mrs-wait =3D <0x16>;=0A=
				nvidia,emc-mrw =3D <0x88010004>;=0A=
				nvidia,emc-mrw2 =3D <0x88020000>;=0A=
				nvidia,emc-mrw3 =3D <0x880d0000>;=0A=
				nvidia,emc-mrw4 =3D <0xc0000000>;=0A=
				nvidia,emc-mrw9 =3D <0x8c0e7272>;=0A=
				nvidia,emc-mrs =3D <0x0>;=0A=
				nvidia,emc-emrs =3D <0x0>;=0A=
				nvidia,emc-emrs2 =3D <0x0>;=0A=
				nvidia,emc-auto-cal-config =3D <0xa01a51d8>;=0A=
				nvidia,emc-auto-cal-config2 =3D <0x5500000>;=0A=
				nvidia,emc-auto-cal-config3 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config4 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config5 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config6 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config7 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config8 =3D <0x770000>;=0A=
				nvidia,emc-cfg-2 =3D <0x110805>;=0A=
				nvidia,emc-sel-dpd-ctrl =3D <0x40008>;=0A=
				nvidia,emc-fdpd-ctrl-cmd-no-ramp =3D <0x1>;=0A=
				nvidia,dll-clk-src =3D <0x40188002>;=0A=
				nvidia,clk-out-enb-x-0-clk-enb-emc-dll =3D <0x1>;=0A=
				nvidia,emc-clock-latency-change =3D <0xd5c>;=0A=
				nvidia,ptfv =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0xa 0xa 0xa 0x1>;=0A=
				nvidia,emc-registers =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x5 0xb 0xd 0x8 =
0xb 0x0 0x4 0x20 0x6 0x6 0x6 0x3 0x0 0x6 0x4 0x2 0x0 0x4 0x8 0xd 0x5 0x6 =
0x0 0x0 0x2 0x88037171 0xd 0x0 0xb 0x10000 0x12 0x14 0x16 0x12 0x14 0xc1 =
0x0 0x30 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 0xe 0x3b 0x3b 0x5 0x5 0x4 0x9 =
0x5 0x4 0x9 0xc8037171 0x31c 0x0 0x9160a00d 0x3bbf 0x2c00a0 0x8000 0xbe =
0xfff0fff 0xfff0fff 0x0 0x0 0x0 0x0 0x880b0000 0xe0017 0x1c0014 0x450031 =
0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x450031 0x3f002b 0x3d0028 =
0x3d0031 0xb 0x100004 0x170017 0xe000e 0x140014 0x1c001c 0x17 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x8020221f 0x220f40f 0x12 0x64000 0x900cc 0xcc0016 0x33000a =
0xc1e00303 0x1f13412f 0x10014 0x804 0x550 0xf3200000 0xfff0fff 0x287 0xa =
0x0 0x0 0x1b 0x1b 0x20000 0x50037 0x0 0x10 0x3000 0xa000000 0x2000111 =
0x8 0x30808 0x15c00 0x101010 0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 =
0x8000800 0x8000800 0x8000800 0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 =
0x0 0x0 0xefffefff 0xc0c0c0c0 0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a =
0xa0a0a0a 0x1186033 0x0 0x0 0x14 0xa 0x16 0x88161414 0x12 0x10000 0x9080 =
0x7070404 0x40065 0x513801f 0x1f101100 0x14 0x107240 0x1124000 0x1125b6a =
0xf081000 0x105800 0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 =
0x107240 0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-burst-regs-per-ch =3D <0x880c7272 0x880c7272 0xc80c7272 =
0xc80c7272 0x8c0e7272 0x8c0e7272 0x4c0e7272 0x4c0e7272>;=0A=
				nvidia,emc-shadow-regs-ca-train =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x5 =
0xb 0xd 0x8 0xb 0x0 0x4 0x20 0x6 0x6 0x6 0x3 0x0 0x6 0x4 0x2 0x0 0x4 0x8 =
0xd 0x5 0x6 0x0 0x0 0x2 0x88037171 0xd 0x0 0xb 0x10000 0x12 0x14 0x16 =
0x12 0x14 0xc1 0x0 0x30 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 0xe 0x3b 0x3b =
0x5 0x5 0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 0x9960a00d 0x3bbf =
0x2c00a0 0x8000 0x55 0xfff0fff 0xfff0fff 0x0 0x0 0x0 0x0 0x880b0000 =
0xe0017 0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 =
0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 0xe000e =
0x140014 0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f 0x12 =
0x64000 0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 0x804 =
0x550 0xf3200000 0xfff0fff 0x287 0xa 0x0 0x0 0x1b 0x1b 0x20000 0x5058033 =
0x5050000 0x0 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 =
0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 =
0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 =
0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x1 0x1f =
0x18 0x8 0x1a 0x88161414 0x10 0x10000 0x9080 0x7070404 0x40065 0x513801f =
0x1f101100 0x14 0x107240 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-shadow-regs-quse-train =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x5 =
0xa 0xd 0x8 0xb 0x0 0x4 0x20 0x6 0x6 0x6 0xc 0x0 0x6 0x4 0x2 0x0 0x4 0x8 =
0xd 0x3 0x2 0x10000000 0x0 0x3 0x88037171 0xb 0x1 0x80000000 0x40000 =
0x12 0x14 0x16 0x12 0x14 0xc1 0x0 0x30 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 =
0xe 0x3b 0x3b 0x5 0x5 0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 =
0x9160400d 0x3bbf 0x2c00a0 0x8000 0xbe 0xfff0fff 0xfff0fff 0x0 0x0 0x0 =
0x0 0x880b0000 0xe0017 0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb =
0x100004 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 =
0xe000e 0x140014 0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 =
0x804 0x550 0xf3200000 0xfff0fff 0x287 0xa 0x0 0x0 0x1b 0x1b 0x30020000 =
0x58037 0x0 0x10 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 =
0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 =
0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 =
0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x1 0x1f =
0x1e 0x14 0x20 0x88161414 0x1c 0x40000 0x9080 0x7070404 0x40065 =
0x513801f 0x1f101100 0x14 0x107240 0x1124000 0x1125b6a 0xf081000 =
0x105800 0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 =
0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-shadow-regs-rdwr-train =3D <0xd 0x3a 0x1d 0x0 0x0 0x9 0x5 =
0xe 0xd 0x8 0xb 0x0 0x4 0x20 0x6 0x6 0x6 0x13 0x13 0x6 0x4 0x2 0x0 0x4 =
0x8 0xd 0x5 0x6 0x30000000 0x30000002 0x2 0x88037171 0xd 0x0 0xb 0x40000 =
0x12 0x14 0x16 0x12 0x14 0xc1 0x0 0x30 0x8 0x8 0x3 0x3 0x3 0x14 0x5 0x2 =
0xe 0x3b 0x3b 0x5 0x5 0x4 0x9 0x5 0x4 0x9 0xc8037171 0x31c 0x0 =
0x9160a00d 0x3bbf 0x2c00a0 0x8000 0xbe 0xfff0fff 0xfff0fff 0x0 0x0 0x0 =
0x0 0x880b0000 0xe0017 0x1c0014 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb =
0x100004 0x450031 0x3f002b 0x3d0028 0x3d0031 0xb 0x100004 0x170017 =
0xe000e 0x140014 0x1c001c 0x17 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x900cc 0xcc0016 0x33000a 0xc1e00303 0x1f13412f 0x10014 =
0x804 0x550 0xf3200000 0xfff0fff 0x287 0xa 0x0 0x0 0x1b 0x1b 0x20000 =
0x50037 0x0 0x10 0x3000 0xa000000 0x2000111 0x8 0x30808 0x15c00 0x101010 =
0x1600 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 =
0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefffefff 0xc0c0c0c0 =
0xc0c0c0c0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186033 0x1 0x0 =
0x14 0xa 0x16 0x88161414 0x12 0x40000 0xb080 0x7070404 0x40065 0x513801f =
0x1f101100 0x14 0x107240 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf081300 0x105800 0x1114fc00 0x7000300 0x107240 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-trim-regs =3D <0x280028 0x280028 0x280028 0x280028 =
0x280028 0x280028 0x280028 0x280028 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x11111111 0x11111111 0x28282828 0x28282828 0x0 0x0 0x0 0x0 =
0xe0017 0x1c0014 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-trim-regs-per-ch =3D <0x0 0x0 0x249249 0x249249 0x249249 =
0x249249 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-vref-regs =3D <0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-dram-timing-regs =3D <0x13 0x104 0x118 0x18 0x6>;=0A=
				nvidia,emc-training-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-save-restore-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-burst-mc-regs =3D <0x8000001 0x8000004c 0xa1020 =
0x80001028 0x1 0x1 0x3 0x1 0x2 0x1 0x2 0x4 0x1 0x1 0x4 0x8 0x5 0x7 =
0x2020000 0x30201 0x72a30504 0x70000f0f 0x0 0x1f0000 0x80001a 0x80001a =
0x80001a 0x80001a 0x80001a 0x80001a 0x80001a 0x80001a 0x80001a>;=0A=
				nvidia,emc-la-scale-regs =3D <0x1b 0x80001a 0x24c 0xff00b2 0xff00da =
0xff009d 0xff00ff 0xff000c 0xff00ff 0xff000c 0x7f0049 0xff0080 0xff0004 =
0x800ad 0xff 0xff0004 0xff00c6 0xff00c6 0xff006d 0xff00ff 0xff00e2 0xff =
0x80 0xff00ff>;=0A=
			};=0A=
=0A=
			emc-table-derated@1600000 {=0A=
				compatible =3D "nvidia,tegra21-emc-table-derated";=0A=
				nvidia,revision =3D <0x7>;=0A=
				nvidia,dvfs-version =3D "13_derating_1600000_V13_V13";=0A=
				clock-frequency =3D <0x186a00>;=0A=
				nvidia,emc-min-mv =3D <0x377>;=0A=
				nvidia,gk20a-min-mv =3D <0x44c>;=0A=
				nvidia,source =3D "pllm_ud";=0A=
				nvidia,src-sel-reg =3D <0x80188000>;=0A=
				nvidia,needs-training =3D <0x2f0>;=0A=
				nvidia,training_pattern =3D <0x0>;=0A=
				nvidia,trained =3D <0x0>;=0A=
				nvidia,periodic_training =3D <0x1>;=0A=
				nvidia,trained_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,trained_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c0d1u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d0u1 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u0 =3D <0x0>;=0A=
				nvidia,current_dram_clktree_c1d1u1 =3D <0x0>;=0A=
				nvidia,run_clocks =3D <0x40>;=0A=
				nvidia,tree_margin =3D <0x1>;=0A=
				nvidia,burst-regs-num =3D <0xdd>;=0A=
				nvidia,burst-regs-per-ch-num =3D <0x8>;=0A=
				nvidia,trim-regs-num =3D <0x8a>;=0A=
				nvidia,trim-regs-per-ch-num =3D <0xa>;=0A=
				nvidia,burst-mc-regs-num =3D <0x21>;=0A=
				nvidia,la-scale-regs-num =3D <0x18>;=0A=
				nvidia,vref-regs-num =3D <0x4>;=0A=
				nvidia,training-mod-regs-num =3D <0x14>;=0A=
				nvidia,dram-timing-regs-num =3D <0x5>;=0A=
				nvidia,min-mrs-wait =3D <0x30>;=0A=
				nvidia,emc-mrw =3D <0x88010054>;=0A=
				nvidia,emc-mrw2 =3D <0x8802002d>;=0A=
				nvidia,emc-mrw3 =3D <0x880d0000>;=0A=
				nvidia,emc-mrw4 =3D <0xc0000000>;=0A=
				nvidia,emc-mrw9 =3D <0x8c0e4848>;=0A=
				nvidia,emc-mrs =3D <0x0>;=0A=
				nvidia,emc-emrs =3D <0x0>;=0A=
				nvidia,emc-emrs2 =3D <0x0>;=0A=
				nvidia,emc-auto-cal-config =3D <0xa01a51d8>;=0A=
				nvidia,emc-auto-cal-config2 =3D <0x5500000>;=0A=
				nvidia,emc-auto-cal-config3 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config4 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config5 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config6 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config7 =3D <0x770000>;=0A=
				nvidia,emc-auto-cal-config8 =3D <0x770000>;=0A=
				nvidia,emc-cfg-2 =3D <0x110835>;=0A=
				nvidia,emc-sel-dpd-ctrl =3D <0x40000>;=0A=
				nvidia,emc-fdpd-ctrl-cmd-no-ramp =3D <0x1>;=0A=
				nvidia,dll-clk-src =3D <0x80188000>;=0A=
				nvidia,clk-out-enb-x-0-clk-enb-emc-dll =3D <0x0>;=0A=
				nvidia,emc-clock-latency-change =3D <0x49c>;=0A=
				nvidia,ptfv =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0xa 0xa 0xa 0x1>;=0A=
				nvidia,emc-registers =3D <0x66 0x1c0 0xe0 0x0 0x0 0x47 0x20 0x29 =
0x21 0xc 0x2d 0x0 0x4 0x20 0x20 0x20 0x13 0x17 0x16 0x6 0xe 0xc 0xa 0xe =
0x8 0xd 0x24 0x8 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1c 0x1f 0xd =
0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x5e9 0x0 0x17a 0x10 0x10 0x3 0x3 0x3 =
0x38 0xe 0x2 0x31 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x25 0x4 0x14 0xc803f1f1 =
0x1860 0x0 0x9960a00d 0x3bff 0xc00001bb 0x8000 0x55 0x0 0x0 0x0 0x0 0x0 =
0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 =
0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 0x90002 0xe000e 0x80008 =
0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f 0x12 0x64000 =
0x310640 0x6400030 0x1900017 0xc1e0030a 0x1f13612f 0x14 0x80d 0x550 =
0xf3200000 0x0 0xce6 0x2b 0x0 0x0 0x1b 0x1b 0x20000 0x33 0x0 0x11 0x3000 =
0x2000000 0x2000101 0x7 0x30808 0x15c00 0x102020 0x1fff1fff 0x0 0x0 0x0 =
0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 0x400080 0x8801004 =
0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefff2210 0x0 0x0 0xdcdcdcdc 0xa0a0a0a =
0xa0a0a0a 0xa0a0a0a 0x1186190 0x0 0x0 0x3b 0x2b 0x3d 0x88161414 0x33 =
0x6000c 0x9080 0x7070404 0x40320 0x513801f 0x1f101100 0x14 0x103200 =
0x1124000 0x1125b6a 0xf081000 0x105800 0x1110fc00 0xf085300 0x105800 =
0x1114fc00 0x7004300 0x103200 0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-burst-regs-per-ch =3D <0x880c4848 0x880c4848 0xc80c4848 =
0xc80c4848 0x8c0e4848 0x8c0e4848 0x4c0e4848 0x4c0e4848>;=0A=
				nvidia,emc-shadow-regs-ca-train =3D <0x66 0x1c0 0xe0 0x0 0x0 0x47 =
0x20 0x29 0x21 0xc 0x2d 0x0 0x4 0x20 0x20 0x20 0x13 0x17 0x16 0x6 0xe =
0xc 0xa 0xe 0x8 0xd 0x24 0x8 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1c =
0x1f 0xd 0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x5e9 0x0 0x17a 0x10 0x10 0x3 =
0x3 0x3 0x38 0xe 0x2 0x31 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x25 0x4 0x14 =
0xc803f1f1 0x1860 0x0 0x9960a00d 0x3bff 0xc00001bb 0x8000 0x55 0x0 0x0 =
0x0 0x0 0x0 0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c 0x1c001c =
0x1c001c 0x7 0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 0x90002 =
0xe000e 0x80008 0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x310640 0x6400030 0x1900017 0xc1e0030a 0x1f13612f 0x14 =
0x80d 0x550 0xf3200000 0x0 0xce6 0x2b 0x0 0x0 0x1b 0x1b 0x20000 0x8033 =
0x0 0x0 0x3000 0x2000000 0x2000101 0x7 0x30808 0x15c00 0x102020 =
0x1fff1fff 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 =
0x8000800 0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefff2210 0x0 =
0x0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 0x1 0x1f 0x41 =
0x2b 0x43 0x88161414 0x33 0x6000c 0x9080 0x7070404 0x40320 0x513801f =
0x1f101100 0x14 0x103200 0x1124000 0x1125b6a 0xf081000 0x105800 =
0x1110fc00 0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 0x55553c5a =
0xc8161414>;=0A=
				nvidia,emc-shadow-regs-quse-train =3D <0x66 0x1c0 0xe0 0x0 0x0 0x47 =
0x20 0x28 0x21 0xc 0x2d 0x0 0x4 0x20 0x20 0x20 0x13 0x11 0x16 0x6 0xe =
0xc 0xa 0xe 0x8 0xd 0x21 0x2 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1b =
0x1 0x80000000 0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x5e9 0x0 0x17a 0x10 =
0x10 0x3 0x3 0x3 0x38 0xe 0x2 0x31 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x25 =
0x4 0x14 0xc803f1f1 0x1860 0x0 0x9960400d 0x3bff 0xc00001bb 0x8000 0x55 =
0x0 0x0 0x0 0x0 0x0 0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c =
0x1c001c 0x1c001c 0x7 0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 =
0x90002 0xe000e 0x80008 0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f =
0x220f40f 0x12 0x64000 0x310640 0x6400030 0x1900017 0xc1e0030a =
0x1f13612f 0x14 0x80d 0x550 0xf3200000 0x0 0xce6 0x2b 0x0 0x0 0x1b 0x1b =
0x30020000 0x8033 0x0 0x11 0x3000 0x2000000 0x2000101 0x7 0x30808 =
0x15c00 0x102020 0x1fff1fff 0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 =
0x8000800 0x8000800 0x400080 0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 =
0xefff2210 0x0 0x0 0xdcdcdcdc 0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 =
0x1 0x1f 0x45 0x35 0x47 0x88161414 0x3d 0x6000c 0x9080 0x7070404 0x40320 =
0x513801f 0x1f101100 0x14 0x103200 0x1124000 0x1125b6a 0xf081000 =
0x105800 0x1110fc00 0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 =
0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-shadow-regs-rdwr-train =3D <0x66 0x1c0 0xe0 0x0 0x0 0x47 =
0x20 0x29 0x21 0xc 0x2d 0x0 0x4 0x20 0x20 0x20 0x13 0x17 0x16 0x6 0xe =
0xc 0xa 0xe 0x8 0xd 0x24 0x8 0x1000001c 0x10000002 0x14 0x8803f1f1 0x1c =
0x1f 0xd 0x6000c 0x33 0x3b 0x3d 0x39 0x3b 0x5e9 0x0 0x17a 0x10 0x10 0x3 =
0x3 0x3 0x38 0xe 0x2 0x31 0x1cc 0x1cc 0xd 0x18 0xc 0x40 0x25 0x4 0x14 =
0xc803f1f1 0x1860 0x0 0x9960a00d 0x3bff 0xc00001bb 0x8000 0x55 0x0 0x0 =
0x0 0x0 0x0 0x0 0x880b6666 0x8000e 0x11000c 0x1c001c 0x1c001c 0x1c001c =
0x1c001c 0x7 0x90002 0x1c001c 0x1c001c 0x1c001c 0x1c001c 0x7 0x90002 =
0xe000e 0x80008 0xc000c 0x110011 0xe 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8020221f 0x220f40f =
0x12 0x64000 0x310640 0x6400030 0x1900017 0xc1e0030a 0x1f13612f 0x14 =
0x80d 0x550 0xf3200000 0x0 0xce6 0x2b 0x0 0x0 0x1b 0x1b 0x20000 0x33 0x0 =
0x11 0x3000 0x2000000 0x2000101 0x7 0x30808 0x15c00 0x102020 0x1fff1fff =
0x0 0x0 0x0 0x34 0x40 0x18000800 0x8000800 0x8000800 0x8000800 0x400080 =
0x8801004 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0xefff2210 0x0 0x0 0xdcdcdcdc =
0xa0a0a0a 0xa0a0a0a 0xa0a0a0a 0x1186190 0x1 0x0 0x3b 0x2b 0x3d =
0x88161414 0x33 0x6000c 0xb080 0x7070404 0x40320 0x513801f 0x1f101100 =
0x14 0x103200 0x1124000 0x1125b6a 0xf081000 0x105800 0x1110fc00 =
0xf085300 0x105800 0x1114fc00 0x7004300 0x103200 0x55553c5a 0xc8161414>;=0A=
				nvidia,emc-trim-regs =3D <0x200020 0x200020 0x200020 0x200020 =
0x200020 0x200020 0x200020 0x200020 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x11111111 0x11111111 0x11111111 0x11111111 0x2b0022 =
0x2b0026 0x260025 0x260026 0x8000e 0x11000c 0x2b0022 0x2b0026 0x260025 =
0x260026 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-trim-regs-per-ch =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0>;=0A=
				nvidia,emc-vref-regs =3D <0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-dram-timing-regs =3D <0x13 0x104 0x118 0x7 0x20>;=0A=
				nvidia,emc-training-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
				nvidia,emc-save-restore-mod-regs =3D <0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x4 0x4 0x4 0x4>;=0A=
				nvidia,emc-burst-mc-regs =3D <0xc 0x80000080 0xa1020 0x80001028 0x6 =
0x7 0x19 0x10 0xf 0x4 0x3 0xe 0x1 0x1 0xc 0x8 0xa 0x37 0x5060000 0xe090c =
0x726c241a 0x70000f0f 0x0 0x1f0000 0x80001a 0x80001a 0x80001a 0x80001a =
0x80001a 0x80001a 0x80001a 0x80001a 0x80001a>;=0A=
				nvidia,emc-la-scale-regs =3D <0xd0 0x80001a 0x1203 0x80003d 0x800038 =
0x800041 0x800090 0x800005 0x800090 0x800005 0x340049 0x800080 0x800004 =
0x80016 0x80 0x800004 0x800019 0x800019 0x800018 0x800095 0x80001d 0x80 =
0x2c 0x800080>;=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	dummy-cool-dev {=0A=
		compatible =3D "dummy-cooling-dev";=0A=
		#cooling-cells =3D <0x2>;=0A=
		linux,phandle =3D <0x123>;=0A=
		phandle =3D <0x123>;=0A=
	};=0A=
=0A=
	regulators {=0A=
		compatible =3D "simple-bus";=0A=
		device_type =3D "fixed-regulators";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
=0A=
		regulator@0 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0x0>;=0A=
			regulator-name =3D "vdd-ac-bat";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			regulator-always-on;=0A=
			linux,phandle =3D <0x42>;=0A=
			phandle =3D <0x42>;=0A=
		};=0A=
=0A=
		regulator@1 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0x1>;=0A=
			regulator-name =3D "vdd-5v0-sys";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			regulator-enable-ramp-delay =3D <0xa0>;=0A=
			regulator-disable-ramp-delay =3D <0x2710>;=0A=
			linux,phandle =3D <0xa2>;=0A=
			phandle =3D <0xa2>;=0A=
		};=0A=
=0A=
		regulator@2 {=0A=
			compatible =3D "regulator-fixed-sync";=0A=
			reg =3D <0x2>;=0A=
			regulator-name =3D "vdd-3v3-sys";=0A=
			regulator-min-microvolt =3D <0x325aa0>;=0A=
			regulator-max-microvolt =3D <0x325aa0>;=0A=
			gpio =3D <0x1e 0x3 0x0>;=0A=
			enable-active-high;=0A=
			vin-supply =3D <0xa2>;=0A=
			regulator-enable-ramp-delay =3D <0xf0>;=0A=
			regulator-disable-ramp-delay =3D <0x2c4c>;=0A=
			linux,phandle =3D <0x47>;=0A=
			phandle =3D <0x47>;=0A=
		};=0A=
=0A=
		regulator@3 {=0A=
			compatible =3D "regulator-fixed-sync";=0A=
			reg =3D <0x3>;=0A=
			regulator-name =3D "vdd-3v3-sd";=0A=
			regulator-min-microvolt =3D <0x325aa0>;=0A=
			regulator-max-microvolt =3D <0x325aa0>;=0A=
			gpio =3D <0x56 0xcb 0x0>;=0A=
			enable-active-high;=0A=
			regulator-boot-on;=0A=
			vin-supply =3D <0x47>;=0A=
			linux,phandle =3D <0x99>;=0A=
			phandle =3D <0x99>;=0A=
		};=0A=
=0A=
		regulator@4 {=0A=
			compatible =3D "regulator-fixed-sync";=0A=
			reg =3D <0x4>;=0A=
			regulator-name =3D "avdd-io-edp-1v05";=0A=
			regulator-min-microvolt =3D <0x100590>;=0A=
			regulator-max-microvolt =3D <0x100590>;=0A=
			gpio =3D <0x1e 0x7 0x0>;=0A=
			enable-active-high;=0A=
			vin-supply =3D <0x3e>;=0A=
			linux,phandle =3D <0x67>;=0A=
			phandle =3D <0x67>;=0A=
		};=0A=
=0A=
		regulator@5 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0x5>;=0A=
			regulator-name =3D "vdd-5v0-hdmi";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			vin-supply =3D <0xa2>;=0A=
			linux,phandle =3D <0x64>;=0A=
			phandle =3D <0x64>;=0A=
		};=0A=
=0A=
		regulator@6 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0x6>;=0A=
			regulator-name =3D "vdd-1v8-sys";=0A=
			regulator-min-microvolt =3D <0x1b7740>;=0A=
			regulator-max-microvolt =3D <0x1b7740>;=0A=
			vin-supply =3D <0x47>;=0A=
			linux,phandle =3D <0xa3>;=0A=
			phandle =3D <0xa3>;=0A=
		};=0A=
=0A=
		regulator@7 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0x7>;=0A=
			regulator-name =3D "vdd-fan";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			vin-supply =3D <0xa2>;=0A=
			linux,phandle =3D <0xa4>;=0A=
			phandle =3D <0xa4>;=0A=
		};=0A=
=0A=
		regulator@8 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0x8>;=0A=
			regulator-name =3D "vdd-usb-vbus";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			vin-supply =3D <0xa2>;=0A=
			linux,phandle =3D <0x41>;=0A=
			phandle =3D <0x41>;=0A=
		};=0A=
=0A=
		regulator@9 {=0A=
			compatible =3D "regulator-fixed-sync";=0A=
			reg =3D <0x9>;=0A=
			regulator-name =3D "vdd-usb-hub-en";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			vin-supply =3D <0xa3>;=0A=
			linux,phandle =3D <0xb3>;=0A=
			phandle =3D <0xb3>;=0A=
		};=0A=
=0A=
		regulator@10 {=0A=
			compatible =3D "regulator-fixed";=0A=
			reg =3D <0xa>;=0A=
			regulator-name =3D "vdd-usb-vbus2";=0A=
			regulator-min-microvolt =3D <0x4c4b40>;=0A=
			regulator-max-microvolt =3D <0x4c4b40>;=0A=
			vin-supply =3D <0x47>;=0A=
			linux,phandle =3D <0x43>;=0A=
			phandle =3D <0x43>;=0A=
		};=0A=
	};=0A=
=0A=
	pwm-fan {=0A=
		vdd-fan-supply =3D <0xa4>;=0A=
		compatible =3D "pwm-fan";=0A=
		status =3D "okay";=0A=
		pwms =3D <0xa5 0x3 0xb116>;=0A=
		shared_data =3D <0xa6>;=0A=
		active_pwm =3D <0x0 0x50 0x78 0xa0 0xff 0xff 0xff 0xff 0xff 0xff>;=0A=
	};=0A=
=0A=
	dvfs_rails {=0A=
		compatible =3D "simple-bus";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
=0A=
		vdd-gpu-scaling-cdev@7 {=0A=
			status =3D "okay";=0A=
			reg =3D <0x7>;=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x5>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			compatible =3D "nvidia,tegra210-rail-scaling-cdev";=0A=
			cdev-type =3D "gpu_scaling";=0A=
			nvidia,constraint;=0A=
			nvidia,trips =3D <0xa7 0x3b6 0x3 0x0 0x5 0x0 0x6 0x0 0x7 0x0 0x8 0x0>;=0A=
			linux,phandle =3D <0x4>;=0A=
			phandle =3D <0x4>;=0A=
		};=0A=
=0A=
		vdd-gpu-vmax-cdev@9 {=0A=
			status =3D "okay";=0A=
			reg =3D <0x9>;=0A=
			cooling-min-state =3D <0x0>;=0A=
			cooling-max-state =3D <0x1>;=0A=
			#cooling-cells =3D <0x2>;=0A=
			compatible =3D "nvidia,tegra210-rail-vmax-cdev";=0A=
			cdev-type =3D "GPU-cap";=0A=
			nvidia,constraint-ucm2;=0A=
			nvidia,trips =3D <0x9 0x46c 0x442>;=0A=
			clocks =3D <0x21 0x1eb>;=0A=
			clock-names =3D "cap-clk";=0A=
			linux,phandle =3D <0xa>;=0A=
			phandle =3D <0xa>;=0A=
		};=0A=
	};=0A=
=0A=
	pfsd {=0A=
		num_resources =3D <0x0>;=0A=
		secret =3D <0x2f>;=0A=
		active_steps =3D <0xa>;=0A=
		active_rpm =3D <0x0 0x3e8 0x7d0 0xbb8 0xfa0 0x1388 0x1770 0x1b58 =
0x2710 0x2af8>;=0A=
		active_rru =3D <0x28 0x2 0x1 0x1 0x1 0x1 0x1 0x1 0x1 0x1>;=0A=
		active_rrd =3D <0x28 0x2 0x1 0x1 0x1 0x1 0x1 0x1 0x1 0x1>;=0A=
		state_cap_lookup =3D <0x2 0x2 0x2 0x2 0x3 0x3 0x3 0x4 0x4 0x4>;=0A=
		pwm_period =3D <0xb116>;=0A=
		pwm_id =3D <0x3>;=0A=
		step_time =3D <0x64>;=0A=
		state_cap =3D <0x7>;=0A=
		active_pwm_max =3D <0xff>;=0A=
		tach_gpio =3D <0x56 0xca 0x1>;=0A=
		pwm_gpio =3D <0x56 0x27 0x1>;=0A=
		pwm_polarity =3D <0x0>;=0A=
		suspend_state =3D <0x0>;=0A=
		tach_period =3D <0x3e8>;=0A=
		linux,phandle =3D <0xa6>;=0A=
		phandle =3D <0xa6>;=0A=
	};=0A=
=0A=
	tegra-camera-platform {=0A=
		compatible =3D "nvidia, tegra-camera-platform";=0A=
		status =3D "okay";=0A=
		num_csi_lanes =3D <0x4>;=0A=
		max_lane_speed =3D <0x16e360>;=0A=
		min_bits_per_pixel =3D <0xa>;=0A=
		vi_peak_byte_per_pixel =3D <0x2>;=0A=
		vi_bw_margin_pct =3D <0x19>;=0A=
		max_pixel_rate =3D <0x3a980>;=0A=
		isp_peak_byte_per_pixel =3D <0x5>;=0A=
		isp_bw_margin_pct =3D <0x19>;=0A=
		linux,phandle =3D <0xc4>;=0A=
		phandle =3D <0xc4>;=0A=
=0A=
		modules {=0A=
=0A=
			module0 {=0A=
				badge =3D "porg_front_RBPCV2";=0A=
				position =3D "front";=0A=
				orientation =3D [31 00];=0A=
				linux,phandle =3D <0xba>;=0A=
				phandle =3D <0xba>;=0A=
=0A=
				drivernode0 {=0A=
					pcl_id =3D "v4l2_sensor";=0A=
					devname =3D "imx219 7-0010";=0A=
					proc-device-tree =3D =
"/proc/device-tree/cam_i2cmux/i2c@0/rbpcv2_imx219_a@10";=0A=
					linux,phandle =3D <0xbb>;=0A=
					phandle =3D <0xbb>;=0A=
				};=0A=
=0A=
				drivernode1 {=0A=
					pcl_id =3D "v4l2_lens";=0A=
					proc-device-tree =3D "/proc/device-tree/lens_imx219@RBPCV2/";=0A=
					linux,phandle =3D <0xbc>;=0A=
					phandle =3D <0xbc>;=0A=
				};=0A=
			};=0A=
=0A=
			module1 {=0A=
				badge =3D "porg_rear_RBPCV2";=0A=
				position =3D "rear";=0A=
				orientation =3D [31 00];=0A=
				linux,phandle =3D <0xc5>;=0A=
				phandle =3D <0xc5>;=0A=
=0A=
				drivernode0 {=0A=
					pcl_id =3D "v4l2_sensor";=0A=
					devname =3D "imx219 8-0010";=0A=
					proc-device-tree =3D =
"/proc/device-tree/cam_i2cmux/i2c@1/rbpcv2_imx219_e@10";=0A=
					linux,phandle =3D <0xcb>;=0A=
					phandle =3D <0xcb>;=0A=
				};=0A=
=0A=
				drivernode1 {=0A=
					pcl_id =3D "v4l2_lens";=0A=
					proc-device-tree =3D "/proc/device-tree/lens_imx219@RBPCV2/";=0A=
					linux,phandle =3D <0xcc>;=0A=
					phandle =3D <0xcc>;=0A=
				};=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	lens_imx219@RBPCV2 {=0A=
		min_focus_distance =3D "0.0";=0A=
		hyper_focal =3D "0.0";=0A=
		focal_length =3D "3.04";=0A=
		f_number =3D "2.0";=0A=
		aperture =3D "0.0";=0A=
	};=0A=
=0A=
	cam_i2cmux {=0A=
		compatible =3D "i2c-mux-gpio";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
		mux-gpios =3D <0x56 0x40 0x0>;=0A=
		i2c-parent =3D <0xa8>;=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0xd1>;=0A=
		phandle =3D <0xd1>;=0A=
=0A=
		i2c@0 {=0A=
			status =3D "disabled";=0A=
			reg =3D <0x0>;=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			linux,phandle =3D <0xd2>;=0A=
			phandle =3D <0xd2>;=0A=
=0A=
			rbpcv2_imx219_a@10 {=0A=
				compatible =3D "nvidia,imx219";=0A=
				reg =3D <0x10>;=0A=
				devnode =3D "video0";=0A=
				physical_w =3D "3.680";=0A=
				physical_h =3D "2.760";=0A=
				sensor_model =3D "imx219";=0A=
				use_sensor_mode_id =3D "true";=0A=
				status =3D "disabled";=0A=
				reset-gpios =3D <0x56 0x97 0x0>;=0A=
				linux,phandle =3D <0xc9>;=0A=
				phandle =3D <0xc9>;=0A=
=0A=
				mode0 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "3264";=0A=
					active_h =3D "2464";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "21000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "21000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode1 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "3264";=0A=
					active_h =3D "1848";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "28000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "28000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode2 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1920";=0A=
					active_h =3D "1080";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "30000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "30000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode3 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1280";=0A=
					active_h =3D "720";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "60000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "60000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode4 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_a";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1280";=0A=
					active_h =3D "720";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "169600000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "120000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "120000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				ports {=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					port@0 {=0A=
						reg =3D <0x0>;=0A=
=0A=
						endpoint {=0A=
							port-index =3D <0x0>;=0A=
							bus-width =3D <0x2>;=0A=
							remote-endpoint =3D <0x73>;=0A=
							linux,phandle =3D <0x74>;=0A=
							phandle =3D <0x74>;=0A=
						};=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		i2c@1 {=0A=
			status =3D "disabled";=0A=
			reg =3D <0x1>;=0A=
			#address-cells =3D <0x1>;=0A=
			#size-cells =3D <0x0>;=0A=
			linux,phandle =3D <0xd3>;=0A=
			phandle =3D <0xd3>;=0A=
=0A=
			rbpcv2_imx219_e@10 {=0A=
				compatible =3D "nvidia,imx219";=0A=
				reg =3D <0x10>;=0A=
				devnode =3D "video1";=0A=
				physical_w =3D "3.680";=0A=
				physical_h =3D "2.760";=0A=
				sensor_model =3D "imx219";=0A=
				use_sensor_mode_id =3D "true";=0A=
				status =3D "disabled";=0A=
				reset-gpios =3D <0x56 0x98 0x0>;=0A=
				linux,phandle =3D <0xca>;=0A=
				phandle =3D <0xca>;=0A=
=0A=
				mode0 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_e";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "3264";=0A=
					active_h =3D "2464";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "21000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "21000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode1 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_e";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "3264";=0A=
					active_h =3D "1848";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "28000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "28000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode2 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_e";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1920";=0A=
					active_h =3D "1080";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "30000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "30000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode3 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_e";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1280";=0A=
					active_h =3D "720";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "182400000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "60000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "60000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				mode4 {=0A=
					mclk_khz =3D "24000";=0A=
					num_lanes =3D [32 00];=0A=
					tegra_sinterface =3D "serial_e";=0A=
					phy_mode =3D "DPHY";=0A=
					discontinuous_clk =3D "yes";=0A=
					dpcm_enable =3D "false";=0A=
					cil_settletime =3D [30 00];=0A=
					active_w =3D "1280";=0A=
					active_h =3D "720";=0A=
					pixel_t =3D "bayer_rggb";=0A=
					readout_orientation =3D "90";=0A=
					line_length =3D "3448";=0A=
					inherent_gain =3D [31 00];=0A=
					mclk_multiplier =3D "9.33";=0A=
					pix_clk_hz =3D "169600000";=0A=
					gain_factor =3D "16";=0A=
					framerate_factor =3D "1000000";=0A=
					exposure_factor =3D "1000000";=0A=
					min_gain_val =3D "16";=0A=
					max_gain_val =3D "170";=0A=
					step_gain_val =3D [31 00];=0A=
					default_gain =3D "16";=0A=
					min_hdr_ratio =3D [31 00];=0A=
					max_hdr_ratio =3D [31 00];=0A=
					min_framerate =3D "2000000";=0A=
					max_framerate =3D "120000000";=0A=
					step_framerate =3D [31 00];=0A=
					default_framerate =3D "120000000";=0A=
					min_exp_time =3D "13";=0A=
					max_exp_time =3D "683709";=0A=
					step_exp_time =3D [31 00];=0A=
					default_exp_time =3D "2495";=0A=
					embedded_metadata_height =3D [32 00];=0A=
				};=0A=
=0A=
				ports {=0A=
					#address-cells =3D <0x1>;=0A=
					#size-cells =3D <0x0>;=0A=
=0A=
					port@0 {=0A=
						reg =3D <0x0>;=0A=
=0A=
						endpoint {=0A=
							port-index =3D <0x4>;=0A=
							bus-width =3D <0x2>;=0A=
							remote-endpoint =3D <0xa9>;=0A=
							linux,phandle =3D <0x76>;=0A=
							phandle =3D <0x76>;=0A=
						};=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	tfesd {=0A=
		secret =3D <0x25>;=0A=
		toffset =3D <0x0>;=0A=
		polling_period =3D <0x44c>;=0A=
		ndevs =3D <0x2>;=0A=
		cdev_type =3D "pwm-fan";=0A=
		tzp_governor_name =3D "pid_thermal_gov";=0A=
		linux,phandle =3D <0xaa>;=0A=
		phandle =3D <0xaa>;=0A=
=0A=
		dev1 {=0A=
			dev_data =3D "CPU-therm";=0A=
			coeffs =3D <0x32 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
		};=0A=
=0A=
		dev2 {=0A=
			dev_data =3D "GPU-therm";=0A=
			coeffs =3D <0x32 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 =
0x0 0x0 0x0 0x0 0x0 0x0>;=0A=
		};=0A=
	};=0A=
=0A=
	thermal-fan-est {=0A=
		compatible =3D "thermal-fan-est";=0A=
		status =3D "okay";=0A=
		num_resources =3D <0x0>;=0A=
		shared_data =3D <0xaa>;=0A=
		trip_length =3D <0xa>;=0A=
		active_trip_temps =3D <0x0 0xc738 0xee48 0x11558 0x14050 0x222e0 =
0x249f0 0x27100 0x29810 0x2bf20>;=0A=
		active_hysteresis =3D <0x0 0x3a98 0x2328 0x2328 0x2710 0x0 0x0 0x0 0x0 =
0x0>;=0A=
	};=0A=
=0A=
	gpio-keys {=0A=
		compatible =3D "gpio-keys";=0A=
		gpio-keys,name =3D "gpio-keys";=0A=
		status =3D "okay";=0A=
		disable-on-recovery-kernel;=0A=
=0A=
		power {=0A=
			label =3D "Power";=0A=
			gpios =3D <0x56 0xbd 0x1>;=0A=
			linux,code =3D <0x74>;=0A=
			gpio-key,wakeup;=0A=
			debounce-interval =3D <0x1e>;=0A=
			nvidia,pmc-wakeup =3D <0x37 0x0 0x18 0x0>;=0A=
		};=0A=
=0A=
		forcerecovery {=0A=
			label =3D "Forcerecovery";=0A=
			gpios =3D <0x56 0xbe 0x1>;=0A=
			linux,code =3D <0x74>;=0A=
			gpio-key,wakeup;=0A=
			debounce-interval =3D <0x1e>;=0A=
		};=0A=
	};=0A=
=0A=
	gpio-timed-keys {=0A=
		compatible =3D "gpio-timed-keys";=0A=
		gpio-keys,name =3D "gpio-timed-keys";=0A=
		status =3D "disabled";=0A=
		disable-on-recovery-kernel;=0A=
=0A=
		power {=0A=
			label =3D "Power";=0A=
			gpios =3D <0x56 0xbd 0x1>;=0A=
			linux,num_codes =3D <0x3>;=0A=
			linux,press-time-secs =3D <0x1 0x3 0x5>;=0A=
			linux,key-codes =3D <0x6c 0x1af 0x1c>;=0A=
			gpio-key,wakeup;=0A=
		};=0A=
	};=0A=
=0A=
	spdif-dit.0@0 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x0 0x0 0x0>;=0A=
		linux,phandle =3D <0x4f>;=0A=
		phandle =3D <0x4f>;=0A=
	};=0A=
=0A=
	spdif-dit.1@1 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x1 0x0 0x0>;=0A=
		linux,phandle =3D <0x51>;=0A=
		phandle =3D <0x51>;=0A=
	};=0A=
=0A=
	spdif-dit.2@2 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x2 0x0 0x0>;=0A=
		linux,phandle =3D <0x53>;=0A=
		phandle =3D <0x53>;=0A=
	};=0A=
=0A=
	spdif-dit.3@3 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x3 0x0 0x0>;=0A=
		linux,phandle =3D <0x55>;=0A=
		phandle =3D <0x55>;=0A=
	};=0A=
=0A=
	spdif-dit.4@4 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x4 0x0 0x0>;=0A=
		linux,phandle =3D <0x124>;=0A=
		phandle =3D <0x124>;=0A=
	};=0A=
=0A=
	spdif-dit.5@5 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x5 0x0 0x0>;=0A=
		linux,phandle =3D <0x125>;=0A=
		phandle =3D <0x125>;=0A=
	};=0A=
=0A=
	spdif-dit.6@6 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x6 0x0 0x0>;=0A=
		linux,phandle =3D <0x126>;=0A=
		phandle =3D <0x126>;=0A=
	};=0A=
=0A=
	spdif-dit.7@7 {=0A=
		compatible =3D "linux,spdif-dit";=0A=
		reg =3D <0x0 0x7 0x0 0x0>;=0A=
		linux,phandle =3D <0x127>;=0A=
		phandle =3D <0x127>;=0A=
	};=0A=
=0A=
	cpufreq {=0A=
		compatible =3D "nvidia,tegra210-cpufreq";=0A=
=0A=
		cpu-scaling-data {=0A=
			freq-table =3D <0x18e70 0x31ce0 0x4b000 0x62700 0x7e900 0x96000 =
0xad700 0xc9900 0xe1000 0xfd200 0x114900 0x12ad40 0x143bb0 0x15ca20 =
0x169158 0x175890 0x18e700 0x1a7570 0x1c03e0 0x1d2eb4 0x1ebd24>;=0A=
			preserve-across-suspend;=0A=
		};=0A=
=0A=
		emc-scaling-data {=0A=
			emc-cpu-limit-table =3D <0x18e70 0x109a0 0x32000 0x18e70 0x4b000 =
0x31ce0 0x62638 0x639c0 0xad700 0xa2800 0xfd200 0x186a00>;=0A=
		};=0A=
	};=0A=
=0A=
	eeprom-manager {=0A=
		data-size =3D <0x100>;=0A=
=0A=
		bus@0 {=0A=
			i2c-bus =3D <0xab>;=0A=
			word-address-1-byte-slave-addresses =3D <0x50>;=0A=
		};=0A=
=0A=
		bus@1 {=0A=
			i2c-bus =3D <0xac>;=0A=
			word-address-1-byte-slave-addresses =3D <0x50 0x57>;=0A=
		};=0A=
	};=0A=
=0A=
	plugin-manager {=0A=
=0A=
		fragement@0 {=0A=
			ids =3D ">=3D3448-0000-100", ">=3D3448-0002-100";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xad>;=0A=
=0A=
				_overlay_ {=0A=
=0A=
					channel@0 {=0A=
						ti,rail-name =3D "POM_5V_IN";=0A=
					};=0A=
=0A=
					channel@1 {=0A=
						ti,rail-name =3D "POM_5V_GPU";=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment@1 {=0A=
			ids =3D ">=3D3448-0000-101", ">=3D3448-0002-101";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xa1>;=0A=
=0A=
				_overlay_ {=0A=
					regulator-min-microvolt =3D <0x927c0>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment@2 {=0A=
			ids =3D "<3448-0000-200", "<3448-0002-200";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xae>;=0A=
=0A=
				_overlay_ {=0A=
					regulator-supplies =3D "vdd-1v8-audio-hv", "vdd-1v8-audio-hv-bias";=0A=
					vdd-1v8-audio-hv-supply =3D <0x36>;=0A=
					vdd-1v8-audio-hv-bias-supply =3D <0x36>;=0A=
					fsync-width =3D <0xf>;=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0x4e>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
=0A=
			override@2 {=0A=
				target =3D <0xaf>;=0A=
=0A=
				_overlay_ {=0A=
=0A=
					nvidia,dai-link-1 {=0A=
						cpu-dai =3D <0xae>;=0A=
						cpu-dai-name =3D "I2S1";=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment@3 {=0A=
			ids =3D ">=3D3448-0002-100";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xb0>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xb1>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment@4 {=0A=
			ids =3D "3449-0000-000";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xb2>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xb3>;=0A=
=0A=
				_overlay_ {=0A=
					gpio =3D <0x56 0x6 0x0>;=0A=
					enable-active-low;=0A=
					gpio-open-drain;=0A=
				};=0A=
			};=0A=
=0A=
			override@2 {=0A=
				target =3D <0xb4>;=0A=
=0A=
				_overlay_ {=0A=
					vbus-supply =3D <0xb3>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment@5 {=0A=
			ids =3D "3449-0000-100", "3449-0000-200";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xb2>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xb3>;=0A=
=0A=
				_overlay_ {=0A=
					gpio =3D <0x56 0x6 0x0>;=0A=
					enable-active-high;=0A=
				};=0A=
			};=0A=
=0A=
			override@2 {=0A=
				target =3D <0xb4>;=0A=
=0A=
				_overlay_ {=0A=
					vbus-supply =3D <0xb3>;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragement@6 {=0A=
			odm-data =3D "enable-tegra-wdt";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xb5>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragement@7 {=0A=
			odm-data =3D "enable-pmic-wdt";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xb6>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragement@8 {=0A=
			odm-data =3D "enable-pmic-wdt", "enable-tegra-wdt";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xb7>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragement@9 {=0A=
			ids =3D "<3448-0000-300", "<3448-0002-300";=0A=
=0A=
			override@0 {=0A=
				target =3D <0x58>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xb8>;=0A=
=0A=
				_overlay_ {=0A=
					keep-power-in-suspend;=0A=
					non-removable;=0A=
				};=0A=
			};=0A=
=0A=
			override@2 {=0A=
				target =3D <0xb9>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@3 {=0A=
				target =3D <0xba>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					badge =3D "porg_front_RBPCV2";=0A=
					position =3D "front";=0A=
					orientation =3D [31 00];=0A=
				};=0A=
			};=0A=
=0A=
			override@4 {=0A=
				target =3D <0xbb>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					pcl_id =3D "v4l2_sensor";=0A=
					devname =3D "imx219 6-0010";=0A=
					proc-device-tree =3D =
"/proc/device-tree/host1x/i2c@546c0000/rbpcv2_imx219_a@10";=0A=
				};=0A=
			};=0A=
=0A=
			override@5 {=0A=
				target =3D <0xbc>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					pcl_id =3D "v4l2_lens";=0A=
					proc-device-tree =3D "/proc/device-tree/lens_imx219@RBPCV2/";=0A=
				};=0A=
			};=0A=
=0A=
			override@6 {=0A=
				target =3D <0xbd>;=0A=
=0A=
				_overlay_ {=0A=
					num-channels =3D <0x1>;=0A=
				};=0A=
			};=0A=
=0A=
			override@7 {=0A=
				target =3D <0xbe>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@8 {=0A=
				target =3D <0x75>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					port-index =3D <0x0>;=0A=
					bus-width =3D <0x2>;=0A=
					remote-endpoint =3D <0x5a>;=0A=
				};=0A=
			};=0A=
=0A=
			override@9 {=0A=
				target =3D <0xbf>;=0A=
=0A=
				_overlay_ {=0A=
					num-channels =3D <0x1>;=0A=
				};=0A=
			};=0A=
=0A=
			override@10 {=0A=
				target =3D <0xc0>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@11 {=0A=
				target =3D <0xc1>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@12 {=0A=
				target =3D <0x73>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					port-index =3D <0x0>;=0A=
					bus-width =3D <0x2>;=0A=
					remote-endpoint =3D <0xc2>;=0A=
				};=0A=
			};=0A=
=0A=
			override@13 {=0A=
				target =3D <0xc3>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@14 {=0A=
				target =3D <0x5a>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					remote-endpoint =3D <0x75>;=0A=
				};=0A=
			};=0A=
=0A=
			override@15 {=0A=
				target =3D <0xc4>;=0A=
=0A=
				_overlay_ {=0A=
					num_csi_lanes =3D <0x2>;=0A=
					max_lane_speed =3D <0x16e360>;=0A=
					min_bits_per_pixel =3D <0xa>;=0A=
					vi_peak_byte_per_pixel =3D <0x2>;=0A=
					vi_bw_margin_pct =3D <0x19>;=0A=
					max_pixel_rate =3D <0x3a980>;=0A=
					isp_peak_byte_per_pixel =3D <0x5>;=0A=
					isp_bw_margin_pct =3D <0x19>;=0A=
				};=0A=
			};=0A=
=0A=
			override@16 {=0A=
				target =3D <0xc5>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "disabled";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragement@10 {=0A=
			ids =3D ">=3D3448-0000-300", ">=3D3448-0002-300";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xc6>;=0A=
=0A=
				_overlay_ {=0A=
					nvidia,plat-gpios =3D <0x56 0xe7 0x0>;=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xb8>;=0A=
=0A=
				_overlay_ {=0A=
					vqmmc-supply =3D <0x58>;=0A=
					no-sdio;=0A=
					no-mmc;=0A=
					sd-uhs-sdr104;=0A=
					sd-uhs-sdr50;=0A=
					sd-uhs-sdr25;=0A=
					sd-uhs-sdr12;=0A=
				};=0A=
			};=0A=
=0A=
			override@2 {=0A=
				target =3D <0xc7>;=0A=
=0A=
				_overlay_ {=0A=
					nvidia,priority =3D <0x32>;=0A=
					nvidia,polarity-active-low =3D <0x1>;=0A=
					nvidia,count-threshold =3D <0x1>;=0A=
					nvidia,alarm-filter =3D <0x4dd1e0>;=0A=
					nvidia,alarm-period =3D <0x0>;=0A=
					nvidia,cpu-throt-percent =3D <0x4b>;=0A=
					nvidia,gpu-throt-level =3D <0x3>;=0A=
				};=0A=
			};=0A=
=0A=
			override@3 {=0A=
				target =3D <0xc8>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@4 {=0A=
				target =3D <0xc9>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@5 {=0A=
				target =3D <0xba>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					badge =3D "porg_front_RBPCV2";=0A=
					position =3D "front";=0A=
					orientation =3D [31 00];=0A=
				};=0A=
			};=0A=
=0A=
			override@6 {=0A=
				target =3D <0xbb>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					pcl_id =3D "v4l2_sensor";=0A=
					devname =3D "imx219 7-0010";=0A=
					proc-device-tree =3D =
"/proc/device-tree/cam_i2cmux/i2c@0/rbpcv2_imx219_a@10";=0A=
				};=0A=
			};=0A=
=0A=
			override@7 {=0A=
				target =3D <0xbc>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					pcl_id =3D "v4l2_lens";=0A=
					proc-device-tree =3D "/proc/device-tree/lens_imx219@RBPCV2/";=0A=
				};=0A=
			};=0A=
=0A=
			override@8 {=0A=
				target =3D <0xca>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@9 {=0A=
				target =3D <0xc5>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					badge =3D "porg_rear_RBPCV2";=0A=
					position =3D "rear";=0A=
					orientation =3D [31 00];=0A=
				};=0A=
			};=0A=
=0A=
			override@10 {=0A=
				target =3D <0xcb>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					pcl_id =3D "v4l2_sensor";=0A=
					devname =3D "imx219 8-0010";=0A=
					proc-device-tree =3D =
"/proc/device-tree/cam_i2cmux/i2c@1/rbpcv2_imx219_e@10";=0A=
				};=0A=
			};=0A=
=0A=
			override@11 {=0A=
				target =3D <0xcc>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					pcl_id =3D "v4l2_lens";=0A=
					proc-device-tree =3D "/proc/device-tree/lens_imx219@RBPCV2/";=0A=
				};=0A=
			};=0A=
=0A=
			override@12 {=0A=
				target =3D <0xbd>;=0A=
=0A=
				_overlay_ {=0A=
					num-channels =3D <0x2>;=0A=
				};=0A=
			};=0A=
=0A=
			override@13 {=0A=
				target =3D <0xbe>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@14 {=0A=
				target =3D <0xcd>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@15 {=0A=
				target =3D <0x75>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					port-index =3D <0x0>;=0A=
					bus-width =3D <0x2>;=0A=
					remote-endpoint =3D <0x5a>;=0A=
				};=0A=
			};=0A=
=0A=
			override@16 {=0A=
				target =3D <0x77>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					port-index =3D <0x4>;=0A=
					bus-width =3D <0x2>;=0A=
					remote-endpoint =3D <0x5b>;=0A=
				};=0A=
			};=0A=
=0A=
			override@17 {=0A=
				target =3D <0xbf>;=0A=
=0A=
				_overlay_ {=0A=
					num-channels =3D <0x2>;=0A=
				};=0A=
			};=0A=
=0A=
			override@18 {=0A=
				target =3D <0xc0>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@19 {=0A=
				target =3D <0xc1>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@20 {=0A=
				target =3D <0x73>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					port-index =3D <0x0>;=0A=
					bus-width =3D <0x2>;=0A=
					remote-endpoint =3D <0x74>;=0A=
				};=0A=
			};=0A=
=0A=
			override@21 {=0A=
				target =3D <0xc3>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@22 {=0A=
				target =3D <0x5a>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@23 {=0A=
				target =3D <0xce>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@24 {=0A=
				target =3D <0xcf>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@25 {=0A=
				target =3D <0xa9>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
					port-index =3D <0x4>;=0A=
					bus-width =3D <0x2>;=0A=
					remote-endpoint =3D <0x76>;=0A=
				};=0A=
			};=0A=
=0A=
			override@26 {=0A=
				target =3D <0xd0>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@27 {=0A=
				target =3D <0x5b>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@28 {=0A=
				target =3D <0xc4>;=0A=
=0A=
				_overlay_ {=0A=
					num_csi_lanes =3D <0x4>;=0A=
					max_lane_speed =3D <0x16e360>;=0A=
					min_bits_per_pixel =3D <0xa>;=0A=
					vi_peak_byte_per_pixel =3D <0x2>;=0A=
					vi_bw_margin_pct =3D <0x19>;=0A=
					max_pixel_rate =3D <0x3a980>;=0A=
					isp_peak_byte_per_pixel =3D <0x5>;=0A=
					isp_bw_margin_pct =3D <0x19>;=0A=
				};=0A=
			};=0A=
=0A=
			override@29 {=0A=
				target =3D <0xd1>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@30 {=0A=
				target =3D <0xd2>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@31 {=0A=
				target =3D <0xd3>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragement@11 {=0A=
			ids =3D ">=3D3448-0000-300", ">=3D3448-0002-300";=0A=
=0A=
			override@0 {=0A=
				target =3D <0xd4>;=0A=
=0A=
				_overlay_ {=0A=
					enable-aspm;=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment-e2614-common@0 {=0A=
			ids =3D "2614-0000-*";=0A=
=0A=
			overrides@0 {=0A=
				target =3D <0xd5>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@1 {=0A=
				target =3D <0xd6>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@2 {=0A=
				target =3D <0xd7>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@3 {=0A=
				target =3D <0xd8>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@4 {=0A=
				target =3D <0xd8>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@6 {=0A=
				target =3D <0xd9>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@7 {=0A=
				target =3D <0xd7>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@8 {=0A=
				target =3D <0xd8>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@9 {=0A=
				target =3D <0xaf>;=0A=
=0A=
				_overlay_ {=0A=
					nvidia,audio-routing =3D "x Headphone Jack", "x HPO L Playback", "x =
Headphone Jack", "x HPO R Playback", "x IN1P", "x Mic Jack", "x Int =
Spk", "x SPO Playback", "x DMIC L1", "x Int Mic", "x DMIC L2", "x Int =
Mic", "x DMIC R1", "x Int Mic", "x DMIC R2", "x Int Mic", "y Headphone", =
"y OUT", "y IN", "y Mic", "a IN", "a Mic", "b IN", "b Mic";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@10 {=0A=
				target =3D <0xda>;=0A=
=0A=
				_overlay_ {=0A=
					link-name =3D "rt565x-playback";=0A=
					codec-dai-name =3D "rt5659-aif1";=0A=
				};=0A=
			};=0A=
=0A=
			overrides@11 {=0A=
				target =3D <0xd9>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@12 {=0A=
				target =3D <0xdb>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment-e2614-a00@1 {=0A=
			ids =3D "2614-0000-000";=0A=
=0A=
			overrides@0 {=0A=
				target =3D <0xdc>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xaf>;=0A=
=0A=
				_overlay_ {=0A=
=0A=
					nvidia,dai-link-1 {=0A=
						codec-dai =3D <0xdc>;=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment-e2614-b00@2 {=0A=
			ids =3D "2614-0000-100";=0A=
=0A=
			overrides@0 {=0A=
				target =3D <0xdd>;=0A=
=0A=
				_overlay_ {=0A=
					status =3D "okay";=0A=
				};=0A=
			};=0A=
=0A=
			override@1 {=0A=
				target =3D <0xaf>;=0A=
=0A=
				_overlay_ {=0A=
=0A=
					nvidia,dai-link-1 {=0A=
						codec-dai =3D <0xdd>;=0A=
					};=0A=
				};=0A=
			};=0A=
		};=0A=
=0A=
		fragment-e2614-pins@3 {=0A=
			ids =3D "<3448-0000-200";=0A=
=0A=
			overrides@0 {=0A=
				target =3D <0xdb>;=0A=
=0A=
				_overlay_ {=0A=
					gpios =3D <0x8 0x0 0x9 0x0 0xa 0x0 0xb 0x0 0xd8 0x0 0x95 0x0>;=0A=
					label =3D "I2S1_LRCLK", "I2S1_SDIN", "I2S1_SDOUT", "I2S1_CLK", =
"AUDIO_MCLK", "AUD_RST";=0A=
				};=0A=
			};=0A=
		};=0A=
	};=0A=
=0A=
	mods-simple-bus {=0A=
		compatible =3D "simple-bus";=0A=
		device_type =3D "mods-simple-bus";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
=0A=
		mods-clocks {=0A=
			compatible =3D "nvidia,mods-clocks";=0A=
			status =3D "disabled";=0A=
			clocks =3D <0x21 0x3 0x21 0x4 0x21 0x5 0x21 0x6 0x21 0x8 0x21 0x9 =
0x21 0xb 0x21 0xc 0x21 0xe 0x21 0xf 0x21 0x11 0x21 0x12 0x21 0xe4 0x21 =
0x16 0x21 0x17 0x21 0x1a 0x21 0x1b 0x21 0x1c 0x21 0x1e 0x21 0x20 0x21 =
0x21 0x21 0x22 0x21 0x26 0x21 0x28 0x21 0x29 0x21 0x2c 0x21 0x2e 0x21 =
0x2f 0x21 0x30 0x21 0x34 0x21 0x36 0x21 0x37 0x21 0x38 0x21 0x39 0x21 =
0x3a 0x21 0x3f 0x21 0x41 0x21 0x43 0x21 0x44 0x21 0x45 0x21 0x46 0x21 =
0x47 0x21 0x48 0x21 0x49 0x21 0x4c 0x21 0x4e 0x21 0x4f 0x21 0x51 0x21 =
0x52 0x21 0x53 0x21 0x59 0x21 0x5c 0x21 0x63 0x21 0x64 0x21 0x65 0x21 =
0x66 0x21 0x67 0x21 0x6a 0x21 0x6b 0x21 0x6f 0x21 0x76 0x21 0x77 0x21 =
0x78 0x21 0x79 0x21 0x7a 0x21 0x7b 0x21 0x7c 0x21 0x7d 0x21 0x7f 0x21 =
0x80 0x21 0x81 0x21 0x88 0x21 0x8f 0x21 0x90 0x21 0x91 0x21 0x92 0x21 =
0x93 0x21 0x94 0x21 0x95 0x21 0x98 0x21 0x9c 0x21 0xa1 0x21 0xa2 0x21 =
0xa6 0x21 0xa7 0x21 0xa8 0x21 0xab 0x21 0xad 0x21 0xb1 0x21 0xb2 0x21 =
0xb5 0x21 0xb6 0x21 0xb7 0x21 0xb8 0x21 0xb9 0x21 0xbb 0x21 0xbd 0x21 =
0xc1 0x21 0xc2 0x21 0xc3 0x21 0xc5 0x21 0xc6 0x21 0xc7 0x21 0xc8 0x21 =
0xc9 0x21 0xca 0x21 0xce 0x21 0xcf 0x21 0xd0 0x21 0xd1 0x21 0xd2 0x21 =
0xd3 0x21 0xd4 0x21 0xda 0x21 0xdb 0x21 0xdc 0x21 0xdd 0x21 0xde 0x21 =
0xdf 0x21 0xe0 0x21 0xe1 0x21 0xe2 0x21 0xe3 0x21 0xe5 0x21 0xe6 0x21 =
0xe7 0x21 0xe8 0x21 0xe9 0x21 0xea 0x21 0xeb 0x21 0xec 0x21 0xed 0x21 =
0xee 0x21 0xef 0x21 0xf0 0x21 0xf1 0x21 0xf2 0x21 0xf3 0x21 0xf4 0x21 =
0xf5 0x21 0xf6 0x21 0xf7 0x21 0xf8 0x21 0xf9 0x21 0xfa 0x21 0xfb 0x21 =
0xfc 0x21 0xfd 0x21 0xfe 0x21 0xff 0x21 0x100 0x21 0x101 0x21 0x103 0x21 =
0x104 0x21 0x105 0x21 0x106 0x21 0x107 0x21 0x108 0x21 0x109 0x21 0x10a =
0x21 0x10b 0x21 0x10c 0x21 0x10d 0x21 0x10e 0x21 0x10f 0x21 0x110 0x21 =
0x111 0x21 0x112 0x21 0x113 0x21 0x114 0x21 0x115 0x21 0x116 0x21 0x117 =
0x21 0x118 0x21 0x119 0x21 0x11c 0x21 0x11d 0x21 0x11e 0x21 0x11f 0x21 =
0x120 0x21 0x121 0x21 0x122 0x21 0x123 0x21 0x124 0x21 0x125 0x21 0x126 =
0x21 0x127 0x21 0x128 0x21 0x129 0x21 0x12a 0x21 0x12b 0x21 0x12c 0x21 =
0x12d 0x21 0x12e 0x21 0x12f 0x21 0x130 0x21 0x131 0x21 0x132 0x21 0x133 =
0x21 0x134 0x21 0x135 0x21 0x136 0x21 0x137 0x21 0x138 0x21 0x139 0x21 =
0x13a 0x21 0x13b 0x21 0x13c 0x21 0x13d 0x21 0x13e 0x21 0x13f 0x21 0x140 =
0x21 0x141 0x21 0x142 0x21 0x143 0x21 0x144 0x21 0x15e 0x21 0x15f 0x21 =
0x160 0x21 0x161 0x21 0x162 0x21 0x163 0x21 0x164 0x21 0x165 0x21 0x166 =
0x21 0x167 0x21 0x168 0x21 0x169 0x21 0x16a 0x21 0x16b 0x21 0x16c 0x21 =
0x16d 0x21 0x16e 0x21 0x16f 0x21 0x170 0x21 0x171 0x21 0x172 0x21 0x173 =
0x21 0x174 0x21 0x175 0x21 0x176 0x21 0x177 0x21 0x178 0x21 0x179 0x21 =
0x17a 0x21 0x17b 0x21 0x17c 0x21 0x17d 0x21 0x17e 0x21 0x17f 0x21 0x180 =
0x21 0x181 0x21 0x182 0x21 0x183 0x21 0x184 0x21 0x185 0x21 0x186 0x21 =
0x187 0x21 0x188 0x21 0x189 0x21 0x18a 0x21 0x191 0x21 0x192 0x21 0x193 =
0x21 0x194 0x21 0x195 0x21 0x196 0x21 0x197 0x21 0x198 0x21 0x199 0x21 =
0x19a 0x21 0x19b 0x21 0x19c 0x21 0x19d 0x21 0x19e 0x21 0x19f 0x21 0x1a0 =
0x21 0x1a1 0x21 0x1a2 0x21 0x1a3 0x21 0x1a4 0x21 0x1a5 0x21 0x1a6 0x21 =
0x1a7 0x21 0x1a8 0x21 0x1a9 0x21 0x1aa 0x21 0x1ab 0x21 0x1ac 0x21 0x1ad =
0x21 0x1ae 0x21 0x1af 0x21 0x1b0 0x21 0x1b1 0x21 0x1b2 0x21 0x1b3 0x21 =
0x1b4 0x21 0x1b5 0x21 0x1b6 0x21 0x1b7 0x21 0x1b8 0x21 0x1b9 0x21 0x1ba =
0x21 0x1bb 0x21 0x1bc 0x21 0x1bd 0x21 0x1be 0x21 0x1bf 0x21 0x1c0 0x21 =
0x1c1 0x21 0x1c2 0x21 0x1c3 0x21 0x1c4 0x21 0x1c5 0x21 0x1c6 0x21 0x1c7 =
0x21 0x1c8 0x21 0x1c9 0x21 0x1ca 0x21 0x1cb 0x21 0x1cc 0x21 0x1cd 0x21 =
0x1ce 0x21 0x1cf 0x21 0x1d0 0x21 0x1d1 0x21 0x1d2 0x21 0x1d3 0x21 0x1d4 =
0x21 0x1d5 0x21 0x1d6 0x21 0x1d7 0x21 0x1d8 0x21 0x1d9 0x21 0x1da 0x21 =
0x1db 0x21 0x1dc 0x21 0x1dd 0x21 0x1de 0x21 0x1df 0x21 0x1e0 0x21 0x1e1 =
0x21 0x1e2 0x21 0x1e3 0x21 0x1e4 0x21 0x1e5 0x21 0x1e6 0x21 0x1e7 0x21 =
0x1e8 0x21 0x1e9 0x21 0x1ea 0x21 0x1eb 0x21 0x1ec 0x21 0x1ed 0x21 0x1ee =
0x21 0x1ef 0x21 0x1f0 0x21 0x1f1 0x21 0x1f2 0x21 0x1f3 0x21 0x1f4 0x21 =
0x1f5 0x21 0x1f6 0x21 0x1f7 0x21 0x1f8 0x21 0x1f9 0x21 0x1fa 0x21 0x1fb =
0x21 0x1fc 0x21 0x1fd 0x21 0x1fe 0x21 0x1ff 0x21 0x200 0x21 0x201 0x21 =
0x202 0x21 0x203 0x21 0x204 0x21 0x205 0x21 0x206 0x21 0x207 0x21 0x208 =
0x21 0x209 0x21 0x20a 0x21 0x20b 0x21 0x20c 0x21 0x20d 0x21 0x20e 0x21 =
0x20f>;=0A=
			clock-names =3D "ispb", "rtc", "timer", "uarta", "gpio", "sdmmc2", =
"i2s1", "i2c1", "sdmmc1", "sdmmc4", "pwm", "i2s2", "vi", "usbd", "ispa", =
"disp2", "disp1", "host1x", "i2s0", "mc", "ahbdma", "apbdma", "pmc", =
"kfuse", "sbc1", "sbc2", "sbc3", "i2c5", "dsia", "csi", "i2c2", "uartc", =
"mipi_cal", "emc", "usb2", "bsev", "uartd", "i2c3", "sbc4", "sdmmc3", =
"pcie", "owr", "afi", "csite", "la", "soc_therm", "dtv", "i2cslow", =
"dsib", "tsec", "xusb_host", "csus", "mselect", "tsensor", "i2s3", =
"i2s4", "i2c4", "d_audio", "apb2ape", "hda2codec_2x", "spdif_2x", =
"actmon", "extern1", "extern2", "extern3", "sata_oob", "sata", "hda", =
"se", "hda2hdmi", "sata_cold", "cec", "xusb_gate", "cilab", "cilcd", =
"cile", "dsialp", "dsiblp", "entropy", "dp2", "xusb_ss", "dmic1", =
"dmic2", "i2c6", "mc_capa", "mc_cbpa", "vim2_clk", "mipibif", =
"clk72mhz", "vic03", "dpaux", "sor0", "sor1", "gpu", "dbgapb", =
"pll_p_out_adsp", "pll_g_ref", "sdmmc_legacy", "nvdec", "nvjpg", =
"dmic3", "ape", "adsp", "mc_cdpa", "mc_ccpa", "maud", "tsecb", "dpaux1", =
"vi_i2c", "hsic_trk", "usb2_trk", "qspi", "uartape", "adsp_neon", =
"nvenc", "iqc2", "iqc1", "sor_safe", "pll_p_out_cpu", "uartb", "vfir", =
"spdif_in", "spdif_out", "vi_sensor", "fuse", "fuse_burn", "clk_32k", =
"clk_m", "clk_m_div2", "clk_m_div4", "pll_ref", "pll_c", "pll_c_out1", =
"pll_c2", "pll_c3", "pll_m", "pll_m_out1", "pll_p", "pll_p_out1", =
"pll_p_out2", "pll_p_out3", "pll_p_out4", "pll_a", "pll_a_out0", =
"pll_d", "pll_d_out0", "pll_d2", "pll_d2_out0", "pll_u", "pll_u_480m", =
"pll_u_60m", "pll_u_48m", "pll_x", "pll_x_out0", "pll_re_vco", =
"pll_re_out", "pll_e", "spdif_in_sync", "i2s0_sync", "i2s1_sync", =
"i2s2_sync", "i2s3_sync", "i2s4_sync", "vimclk_sync", "audio0", =
"audio1", "audio2", "audio3", "audio4", "spdif", "clk_out_1", =
"clk_out_2", "clk_out_3", "blink", "qspi_out", "xusb_host_src", =
"xusb_falcon_src", "xusb_fs_src", "xusb_ss_src", "xusb_dev_src", =
"xusb_dev", "xusb_hs_src", "sclk", "hclk", "pclk", "cclk_g", "cclk_lp", =
"dfll_ref", "dfll_soc", "vi_sensor2", "pll_p_out5", "cml0", "cml1", =
"pll_c4", "pll_dp", "pll_e_mux", "pll_mb", "pll_a1", "pll_d_dsi_out", =
"pll_c4_out0", "pll_c4_out1", "pll_c4_out2", "pll_c4_out3", "pll_u_out", =
"pll_u_out1", "pll_u_out2", "usb2_hsic_trk", "pll_p_out_hsio", =
"pll_p_out_xusb", "xusb_ssp_src", "pll_re_out1", "pll_mb_ud", =
"pll_p_ud", "isp", "pll_a_out_adsp", "pll_a_out0_out_adsp", =
"audio0_mux", "audio1_mux", "audio2_mux", "audio3_mux", "audio4_mux", =
"spdif_mux", "clk_out_1_mux", "clk_out_2_mux", "clk_out_3_mux", =
"dsia_mux", "dsib_mux", "sor0_lvds", "xusb_ss_div2", "pll_m_ud", =
"pll_c_ud", "sclk_mux", "sor1_brick", "sor1_mux", "pd2vi", "vi_output", =
"aclk", "sclk_skipper", "disp1_slcg_ovr", "disp2_slcg_ovr", =
"vi_slcg_ovr", "ispa_slcg_ovr", "ispb_slcg_ovr", "nvdec_slcg_ovr", =
"nvenc_slcg_ovr", "nvjpg_slcg_ovr", "vic03_slcg_ovr", =
"xusb_dev_slcg_ovr", "xusb_host_slcg_ovr", "d_audio_slcg_ovr", =
"ape_slcg_ovr", "sata_slcg_ovr", "sata_slcg_ovr_ipfs", =
"sata_slcg_ovr_fpci", "dmic1_sync_clk", "dmic1_sync_clk_mux", =
"dmic2_sync_clk", "dmic2_sync_clk_mux", "dmic3_sync_clk", =
"dmic3_sync_clk_mux", "aclk_slcg_ovr", "c2bus", "c3bus", "vic03_cbus", =
"nvjpg_cbus", "se_cbus", "tsecb_cbus", "cap_c2bus", "cap_vcore_c2bus", =
"cap_throttle_c2bus", "floor_c2bus", "override_c2bus", "edp_c2bus", =
"nvenc_cbus", "nvdec_cbus", "vic_floor_cbus", "cap_c3bus", =
"cap_vcore_c3bus", "cap_throttle_c3bus", "floor_c3bus", =
"override_c3bus", "vi_cbus", "isp_cbus", "override_cbus", =
"cap_vcore_cbus", "via_vi_cbus", "vib_vi_cbus", "ispa_isp_cbus", =
"ispb_isp_cbus", "sbus", "avp_sclk", "bsea_sclk", "usbd_sclk", =
"usb1_sclk", "usb2_sclk", "usb3_sclk", "wake_sclk", "camera_sclk", =
"mon_avp", "cap_sclk", "cap_vcore_sclk", "cap_throttle_sclk", =
"floor_sclk", "override_sclk", "sbc1_sclk", "sbc2_sclk", "sbc3_sclk", =
"sbc4_sclk", "qspi_sclk", "boot_apb_sclk", "emc_master", "avp_emc", =
"cpu_emc", "disp1_emc", "disp2_emc", "disp1_la_emc", "disp2_la_emc", =
"usbd_emc", "usb1_emc", "usb2_emc", "usb3_emc", "sdmmc3_emc", =
"sdmmc4_emc", "mon_emc", "cap_emc", "cap_vcore_emc", "cap_throttle_emc", =
"gr3d_emc", "nvenc_emc", "nvjpg_emc", "nvdec_emc", "tsec_emc", =
"tsecb_emc", "camera_emc", "via_emc", "vib_emc", "ispa_emc", "ispb_emc", =
"iso_emc", "floor_emc", "override_emc", "edp_emc", "vic_emc", =
"vic_shared_emc", "ape_emc", "pcie_emc", "xusb_emc", "gbus", =
"gm20b_gbus", "cap_gbus", "edp_gbus", "cap_vgpu_gbus", =
"cap_throttle_gbus", "cap_profile_gbus", "override_gbus", "floor_gbus", =
"floor_profile_gbus", "host1x_master", "nv_host1x", "vi_host1x", =
"vii2c_host1x", "cap_host1x", "cap_vcore_host1x", "floor_host1x", =
"override_host1x", "mselect_master", "cpu_mselect", "pcie_mselect", =
"cap_vcore_mselect", "override_mselect", "ape_master", "adma_ape", =
"adsp_ape", "xbar_ape", "cap_vcore_ape", "override_ape", "abus", =
"adsp_cpu_abus", "cap_vcore_abus", "override_abus", "vcm_sclk", =
"vcm_ahb_sclk", "vcm_apb_sclk", "ahb_sclk", "apb_sclk", =
"sdmmc4_ahb_sclk", "battery_emc", "cbus";=0A=
			resets =3D <0x21 0x3 0x21 0x4 0x21 0x5 0x21 0x6 0x21 0x8 0x21 0x9 =
0x21 0xb 0x21 0xc 0x21 0xe 0x21 0xf 0x21 0x11 0x21 0x12 0x21 0xe4 0x21 =
0x16 0x21 0x17 0x21 0x1a 0x21 0x1b 0x21 0x1c 0x21 0x1e 0x21 0x20 0x21 =
0x21 0x21 0x22 0x21 0x26 0x21 0x28 0x21 0x29 0x21 0x2c 0x21 0x2e 0x21 =
0x2f 0x21 0x30 0x21 0x34 0x21 0x36 0x21 0x37 0x21 0x38 0x21 0x39 0x21 =
0x3a 0x21 0x3f 0x21 0x41 0x21 0x43 0x21 0x44 0x21 0x45 0x21 0x46 0x21 =
0x47 0x21 0x48 0x21 0x49 0x21 0x4c 0x21 0x4e 0x21 0x4f 0x21 0x51 0x21 =
0x52 0x21 0x53 0x21 0x59 0x21 0x5c 0x21 0x63 0x21 0x64 0x21 0x65 0x21 =
0x66 0x21 0x67 0x21 0x6a 0x21 0x6b 0x21 0x6f 0x21 0x76 0x21 0x77 0x21 =
0x78 0x21 0x79 0x21 0x7a 0x21 0x7b 0x21 0x7c 0x21 0x7d 0x21 0x7f 0x21 =
0x80 0x21 0x81 0x21 0x88 0x21 0x8f 0x21 0x90 0x21 0x91 0x21 0x92 0x21 =
0x93 0x21 0x94 0x21 0x95 0x21 0x98 0x21 0x9c 0x21 0xa1 0x21 0xa2 0x21 =
0xa6 0x21 0xa7 0x21 0xa8 0x21 0xab 0x21 0xad 0x21 0xb1 0x21 0xb2 0x21 =
0xb5 0x21 0xb6 0x21 0xb7 0x21 0xb8 0x21 0xb9 0x21 0xbb 0x21 0xbd 0x21 =
0xc1 0x21 0xc2 0x21 0xc3 0x21 0xc5 0x21 0xc6 0x21 0xc7 0x21 0xc8 0x21 =
0xc9 0x21 0xca 0x21 0xce 0x21 0xcf 0x21 0xd0 0x21 0xd1 0x21 0xd2 0x21 =
0xd3 0x21 0xd4 0x21 0xda 0x21 0xdb 0x21 0xdc 0x21 0xdd 0x21 0xde 0x21 =
0xdf 0x21 0x7 0x21 0xe1 0x21 0xe2 0x21 0xe3 0x21 0xe5 0x21 0xe6 0x21 =
0xe7 0x21 0xe8 0x21 0xe9 0x21 0xea 0x21 0xeb 0x21 0xec 0x21 0xed 0x21 =
0xee 0x21 0xef 0x21 0xf0 0x21 0xf1 0x21 0xf2 0x21 0xf3 0x21 0xf4 0x21 =
0xf5 0x21 0xf6 0x21 0xf7 0x21 0xf8 0x21 0xf9 0x21 0xfa 0x21 0xfb 0x21 =
0xfc 0x21 0xfd 0x21 0xfe 0x21 0xff 0x21 0x100 0x21 0x101 0x21 0x103 0x21 =
0x104 0x21 0x105 0x21 0x106 0x21 0x107 0x21 0x108 0x21 0x109 0x21 0x10a =
0x21 0x10b 0x21 0x10c 0x21 0x10d 0x21 0x10e 0x21 0x10f 0x21 0x110 0x21 =
0x111 0x21 0x112 0x21 0x113 0x21 0x114 0x21 0x115 0x21 0x116 0x21 0x117 =
0x21 0x118 0x21 0x119 0x21 0x11c 0x21 0x11d 0x21 0x11e 0x21 0x11f 0x21 =
0x120 0x21 0x5f 0x21 0x122 0x21 0x123 0x21 0x124 0x21 0x125 0x21 0x126 =
0x21 0x127 0x21 0x128 0x21 0x129 0x21 0x12a 0x21 0x12b 0x21 0x12c 0x21 =
0x12d 0x21 0x12e 0x21 0x12f 0x21 0x130 0x21 0x131 0x21 0x132 0x21 0x133 =
0x21 0x134 0x21 0x135 0x21 0x136 0x21 0x137 0x21 0x138 0x21 0x139 0x21 =
0x13a 0x21 0x13b 0x21 0x13c 0x21 0x13d 0x21 0x13e 0x21 0x13f 0x21 0x140 =
0x21 0x141 0x21 0x142 0x21 0x143 0x21 0x144 0x21 0x15e 0x21 0x15f 0x21 =
0x160 0x21 0x161 0x21 0x162 0x21 0x163 0x21 0x164 0x21 0x165 0x21 0x166 =
0x21 0x167 0x21 0x168 0x21 0x169 0x21 0x16a 0x21 0x16b 0x21 0x16c 0x21 =
0x16d 0x21 0x16e 0x21 0x16f 0x21 0x170 0x21 0x171 0x21 0x172 0x21 0x173 =
0x21 0x174 0x21 0x175 0x21 0x176 0x21 0x177 0x21 0x178 0x21 0x179 0x21 =
0x17a 0x21 0x17b 0x21 0x17c 0x21 0x17d 0x21 0x17e 0x21 0x17f 0x21 0x180 =
0x21 0x181 0x21 0x182 0x21 0x183 0x21 0x184 0x21 0x185 0x21 0x186 0x21 =
0x187 0x21 0x188 0x21 0x189 0x21 0x18a 0x21 0x191 0x21 0x192 0x21 0x193 =
0x21 0x194 0x21 0x195 0x21 0x196 0x21 0x197 0x21 0x198 0x21 0x199 0x21 =
0x19a 0x21 0x19b 0x21 0x19c 0x21 0x19d 0x21 0x19e 0x21 0x19f 0x21 0x1a0 =
0x21 0x1a1 0x21 0x1a2 0x21 0x1a3 0x21 0x1a4 0x21 0x1a5 0x21 0x1a6 0x21 =
0x1a7 0x21 0x1a8 0x21 0x1a9 0x21 0x1aa 0x21 0x1ab 0x21 0x1ac 0x21 0x1ad =
0x21 0x1ae 0x21 0x1af 0x21 0x1b0 0x21 0x1b1 0x21 0x1b2 0x21 0x1b3 0x21 =
0x1b4 0x21 0x1b5 0x21 0x1b6 0x21 0x1b7 0x21 0x1b8 0x21 0x1b9 0x21 0x1ba =
0x21 0x1bb 0x21 0x1bc 0x21 0x1bd 0x21 0x1be 0x21 0x1bf 0x21 0x1c0 0x21 =
0x1c1 0x21 0x1c2 0x21 0x1c3 0x21 0x1c4 0x21 0x1c5 0x21 0x1c6 0x21 0x1c7 =
0x21 0x1c8 0x21 0x1c9 0x21 0x1ca 0x21 0x1cb 0x21 0x1cc 0x21 0x1cd 0x21 =
0x1ce 0x21 0x1cf 0x21 0x1d0 0x21 0x1d1 0x21 0x1d2 0x21 0x1d3 0x21 0x1d4 =
0x21 0x1d5 0x21 0x1d6 0x21 0x1d7 0x21 0x1d8 0x21 0x1d9 0x21 0x1da 0x21 =
0x1db 0x21 0x1dc 0x21 0x1dd 0x21 0x1de 0x21 0x1df 0x21 0x1e0 0x21 0x1e1 =
0x21 0x1e2 0x21 0x1e3 0x21 0x1e4 0x21 0x1e5 0x21 0x1e6 0x21 0x1e7 0x21 =
0x1e8 0x21 0x1e9 0x21 0x1ea 0x21 0x1eb 0x21 0x1ec 0x21 0x1ed 0x21 0x1ee =
0x21 0x1ef 0x21 0x1f0 0x21 0x1f1 0x21 0x1f2 0x21 0x1f3 0x21 0x1f4 0x21 =
0x1f5 0x21 0x1f6 0x21 0x1f7 0x21 0x1f8 0x21 0x1f9 0x21 0x1fa 0x21 0x1fb =
0x21 0x1fc 0x21 0x1fd 0x21 0x1fe 0x21 0x1ff 0x21 0x200 0x21 0x201 0x21 =
0x202 0x21 0x203 0x21 0x204 0x21 0x205 0x21 0x206 0x21 0x207 0x21 0x208 =
0x21 0x209 0x21 0x20a 0x21 0x20b 0x21 0x20c 0x21 0x20d 0x21 0x20e 0x21 =
0x20f>;=0A=
			reset-names =3D "ispb", "rtc", "timer", "uarta", "gpio", "sdmmc2", =
"i2s1", "i2c1", "sdmmc1", "sdmmc4", "pwm", "i2s2", "vi", "usbd", "ispa", =
"disp2", "disp1", "host1x", "i2s0", "mc", "ahbdma", "apbdma", "pmc", =
"kfuse", "sbc1", "sbc2", "sbc3", "i2c5", "dsia", "csi", "i2c2", "uartc", =
"mipi_cal", "emc", "usb2", "bsev", "uartd", "i2c3", "sbc4", "sdmmc3", =
"pcie", "owr", "afi", "csite", "la", "soc_therm", "dtv", "i2cslow", =
"dsib", "tsec", "xusb_host", "csus", "mselect", "tsensor", "i2s3", =
"i2s4", "i2c4", "d_audio", "apb2ape", "hda2codec_2x", "spdif_2x", =
"actmon", "extern1", "extern2", "extern3", "sata_oob", "sata", "hda", =
"se", "hda2hdmi", "sata_cold", "cec", "xusb_gate", "cilab", "cilcd", =
"cile", "dsialp", "dsiblp", "entropy", "dp2", "xusb_ss", "dmic1", =
"dmic2", "i2c6", "mc_capa", "mc_cbpa", "vim2_clk", "mipibif", =
"clk72mhz", "vic03", "dpaux", "sor0", "sor1", "gpu", "dbgapb", =
"pll_p_out_adsp", "pll_g_ref", "sdmmc_legacy", "nvdec", "nvjpg", =
"dmic3", "ape", "adsp", "mc_cdpa", "mc_ccpa", "maud", "tsecb", "dpaux1", =
"vi_i2c", "hsic_trk", "usb2_trk", "qspi", "uartape", "adsp_neon", =
"nvenc", "iqc2", "iqc1", "sor_safe", "pll_p_out_cpu", "uartb", "vfir", =
"spdif_in", "spdif_out", "vi_sensor", "fuse", "fuse_burn", "clk_32k", =
"clk_m", "clk_m_div2", "clk_m_div4", "pll_ref", "pll_c", "pll_c_out1", =
"pll_c2", "pll_c3", "pll_m", "pll_m_out1", "pll_p", "pll_p_out1", =
"pll_p_out2", "pll_p_out3", "pll_p_out4", "pll_a", "pll_a_out0", =
"pll_d", "pll_d_out0", "pll_d2", "pll_d2_out0", "pll_u", "pll_u_480m", =
"pll_u_60m", "pll_u_48m", "pll_x", "pll_x_out0", "pll_re_vco", =
"pll_re_out", "pll_e", "spdif_in_sync", "i2s0_sync", "i2s1_sync", =
"i2s2_sync", "i2s3_sync", "i2s4_sync", "vimclk_sync", "audio0", =
"audio1", "audio2", "audio3", "audio4", "spdif", "clk_out_1", =
"clk_out_2", "clk_out_3", "blink", "qspi_out", "xusb_host_src", =
"xusb_falcon_src", "xusb_fs_src", "xusb_ss_src", "xusb_dev_src", =
"xusb_dev", "xusb_hs_src", "sclk", "hclk", "pclk", "cclk_g", "cclk_lp", =
"dfll_ref", "dfll_soc", "vi_sensor2", "pll_p_out5", "cml0", "cml1", =
"pll_c4", "pll_dp", "pll_e_mux", "pll_mb", "pll_a1", "pll_d_dsi_out", =
"pll_c4_out0", "pll_c4_out1", "pll_c4_out2", "pll_c4_out3", "pll_u_out", =
"pll_u_out1", "pll_u_out2", "usb2_hsic_trk", "pll_p_out_hsio", =
"pll_p_out_xusb", "xusb_ssp_src", "pll_re_out1", "pll_p_ud", "isp", =
"pll_a_out_adsp", "pll_a_out0_out_adsp", "audio0_mux", "audio1_mux", =
"audio2_mux", "audio3_mux", "audio4_mux", "spdif_mux", "clk_out_1_mux", =
"clk_out_2_mux", "clk_out_3_mux", "dsia_mux", "dsib_mux", "sor0_lvds", =
"xusb_ss_div2", "pll_m_ud", "pll_c_ud", "sclk_mux", "sor1_brick", =
"sor1_mux", "pd2vi", "vi_output", "aclk", "sclk_skipper", =
"disp1_slcg_ovr", "disp2_slcg_ovr", "vi_slcg_ovr", "ispa_slcg_ovr", =
"ispb_slcg_ovr", "nvdec_slcg_ovr", "nvenc_slcg_ovr", "nvjpg_slcg_ovr", =
"vic03_slcg_ovr", "xusb_dev_slcg_ovr", "xusb_host_slcg_ovr", =
"d_audio_slcg_ovr", "ape_slcg_ovr", "sata_slcg_ovr", =
"sata_slcg_ovr_ipfs", "sata_slcg_ovr_fpci", "dmic1_sync_clk", =
"dmic1_sync_clk_mux", "dmic2_sync_clk", "dmic2_sync_clk_mux", =
"dmic3_sync_clk", "dmic3_sync_clk_mux", "aclk_slcg_ovr", "c2bus", =
"c3bus", "vic03_cbus", "nvjpg_cbus", "se_cbus", "tsecb_cbus", =
"cap_c2bus", "cap_vcore_c2bus", "cap_throttle_c2bus", "floor_c2bus", =
"override_c2bus", "edp_c2bus", "nvenc_cbus", "nvdec_cbus", =
"vic_floor_cbus", "cap_c3bus", "cap_vcore_c3bus", "cap_throttle_c3bus", =
"floor_c3bus", "override_c3bus", "vi_cbus", "isp_cbus", "override_cbus", =
"cap_vcore_cbus", "via_vi_cbus", "vib_vi_cbus", "ispa_isp_cbus", =
"ispb_isp_cbus", "sbus", "avp_sclk", "bsea_sclk", "usbd_sclk", =
"usb1_sclk", "usb2_sclk", "usb3_sclk", "wake_sclk", "camera_sclk", =
"mon_avp", "cap_sclk", "cap_vcore_sclk", "cap_throttle_sclk", =
"floor_sclk", "override_sclk", "sbc1_sclk", "sbc2_sclk", "sbc3_sclk", =
"sbc4_sclk", "qspi_sclk", "boot_apb_sclk", "emc_master", "avp_emc", =
"cpu_emc", "disp1_emc", "disp2_emc", "disp1_la_emc", "disp2_la_emc", =
"usbd_emc", "usb1_emc", "usb2_emc", "usb3_emc", "sdmmc3_emc", =
"sdmmc4_emc", "mon_emc", "cap_emc", "cap_vcore_emc", "cap_throttle_emc", =
"gr3d_emc", "nvenc_emc", "nvjpg_emc", "nvdec_emc", "tsec_emc", =
"tsecb_emc", "camera_emc", "via_emc", "vib_emc", "ispa_emc", "ispb_emc", =
"iso_emc", "floor_emc", "override_emc", "edp_emc", "vic_emc", =
"vic_shared_emc", "ape_emc", "pcie_emc", "xusb_emc", "gbus", =
"gm20b_gbus", "cap_gbus", "edp_gbus", "cap_vgpu_gbus", =
"cap_throttle_gbus", "cap_profile_gbus", "override_gbus", "floor_gbus", =
"floor_profile_gbus", "host1x_master", "nv_host1x", "vi_host1x", =
"vii2c_host1x", "cap_host1x", "cap_vcore_host1x", "floor_host1x", =
"override_host1x", "mselect_master", "cpu_mselect", "pcie_mselect", =
"cap_vcore_mselect", "override_mselect", "ape_master", "adma_ape", =
"adsp_ape", "xbar_ape", "cap_vcore_ape", "override_ape", "abus", =
"adsp_cpu_abus", "cap_vcore_abus", "override_abus", "vcm_sclk", =
"vcm_ahb_sclk", "vcm_apb_sclk", "ahb_sclk", "apb_sclk", =
"sdmmc4_ahb_sclk", "battery_emc", "cbus";=0A=
		};=0A=
	};=0A=
=0A=
	gps_wake {=0A=
		compatible =3D "gps-wake";=0A=
		gps-enable-gpio =3D <0xd6 0x8 0x0>;=0A=
		gps-wakeup-gpio =3D <0x56 0x26 0x0>;=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0x128>;=0A=
		phandle =3D <0x128>;=0A=
	};=0A=
=0A=
	chosen {=0A=
		nvidia,tegra-porg-sku;=0A=
		stdout-path =3D "/serial@70006000";=0A=
		nvidia,tegra-always-on-personality;=0A=
		no-tnid-sn;=0A=
		bootargs =3D "earlycon=3Duart8250,mmio32,0x70006000";=0A=
		nvidia,bootloader-xusb-enable;=0A=
		nvidia,bootloader-vbus-enable =3D <0x1>;=0A=
		nvidia,fastboot_without_usb;=0A=
		nvidia,gpu-disable-power-saving;=0A=
		board-has-eeprom;=0A=
		firmware-blob-partition =3D "RP4";=0A=
=0A=
		verified-boot {=0A=
			poweroff-on-red-state;=0A=
		};=0A=
	};=0A=
=0A=
	gpu-dvfs-rework {=0A=
		status =3D "okay";=0A=
	};=0A=
=0A=
	pwm_regulators {=0A=
		compatible =3D "simple-bus";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x0>;=0A=
=0A=
		pwm-regulator@0 {=0A=
			status =3D "okay";=0A=
			reg =3D <0x0>;=0A=
			compatible =3D "pwm-regulator";=0A=
			pwms =3D <0xde 0x0 0x9c4>;=0A=
			regulator-name =3D "vdd-cpu";=0A=
			regulator-min-microvolt =3D <0xacda0>;=0A=
			regulator-max-microvolt =3D <0x143188>;=0A=
			regulator-always-on;=0A=
			regulator-boot-on;=0A=
			voltage-table =3D <0xacda0 0x0 0xb18a0 0x1 0xb63a0 0x2 0xbaea0 0x3 =
0xbf9a0 0x4 0xc44a0 0x5 0xc8fa0 0x6 0xcdaa0 0x7 0xd25a0 0x8 0xd70a0 0x9 =
0xdbba0 0xa 0xe06a0 0xb 0xe51a0 0xc 0xe9ca0 0xd 0xee7a0 0xe 0xf32a0 0xf =
0xf7da0 0x10 0xfc8a0 0x11 0x1013a0 0x12 0x105ea0 0x13 0x10a9a0 0x14 =
0x10f4a0 0x15 0x113fa0 0x16 0x118aa0 0x17 0x11d5a0 0x18 0x1220a0 0x19 =
0x126ba0 0x1a 0x12b6a0 0x1b 0x1301a0 0x1c 0x134ca0 0x1d 0x1397a0 0x1e =
0x13e2a0 0x1f 0x142da0 0x20>;=0A=
			linux,phandle =3D <0x9d>;=0A=
			phandle =3D <0x9d>;=0A=
		};=0A=
=0A=
		pwm-regulator@1 {=0A=
			status =3D "okay";=0A=
			reg =3D <0x1>;=0A=
			compatible =3D "pwm-regulator";=0A=
			pwms =3D <0xa5 0x1 0x1f40>;=0A=
			regulator-name =3D "vdd-gpu";=0A=
			regulator-min-microvolt =3D <0xacda0>;=0A=
			regulator-max-microvolt =3D <0x143188>;=0A=
			regulator-init-microvolt =3D <0xf4240>;=0A=
			regulator-n-voltages =3D <0x3e>;=0A=
			regulator-enable-ramp-delay =3D <0x7d0>;=0A=
			enable-gpio =3D <0x1e 0x6 0x0>;=0A=
			regulator-settling-time-us =3D <0xa0>;=0A=
		};=0A=
	};=0A=
=0A=
	dfll-max77621@70110000 {=0A=
=0A=
		dfll-max77621-integration {=0A=
			i2c-fs-rate =3D <0xf4240>;=0A=
			pmic-i2c-address =3D <0x36>;=0A=
			pmic-i2c-voltage-register =3D <0x1>;=0A=
			sel-conversion-slope =3D <0x1>;=0A=
			linux,phandle =3D <0x129>;=0A=
			phandle =3D <0x129>;=0A=
		};=0A=
=0A=
		dfll-max77621-board-params {=0A=
			sample-rate =3D <0x30d4>;=0A=
			fixed-output-forcing;=0A=
			cf =3D <0xa>;=0A=
			ci =3D <0x0>;=0A=
			cg =3D <0x2>;=0A=
			droop-cut-value =3D <0xf>;=0A=
			droop-restore-ramp =3D <0x0>;=0A=
			scale-out-ramp =3D <0x0>;=0A=
			linux,phandle =3D <0x12a>;=0A=
			phandle =3D <0x12a>;=0A=
		};=0A=
	};=0A=
=0A=
	dfll-cdev-cap {=0A=
		compatible =3D "nvidia,tegra-dfll-cdev-action";=0A=
		act-dev =3D <0x26>;=0A=
		cdev-type =3D "DFLL-cap";=0A=
		#cooling-cells =3D <0x2>;=0A=
		linux,phandle =3D <0x17>;=0A=
		phandle =3D <0x17>;=0A=
	};=0A=
=0A=
	dfll-cdev-floor {=0A=
		compatible =3D "nvidia,tegra-dfll-cdev-action";=0A=
		act-dev =3D <0x26>;=0A=
		cdev-type =3D "DFLL-floor";=0A=
		#cooling-cells =3D <0x2>;=0A=
		linux,phandle =3D <0x10>;=0A=
		phandle =3D <0x10>;=0A=
	};=0A=
=0A=
	dvfs {=0A=
		compatible =3D "nvidia,tegra210-dvfs";=0A=
		vdd-cpu-supply =3D <0x9d>;=0A=
		nvidia,gpu-max-freq-khz =3D <0xe1000>;=0A=
	};=0A=
=0A=
	r8168 {=0A=
		isolate-gpio =3D <0x56 0xbb 0x0>;=0A=
	};=0A=
=0A=
	tegra_udrm {=0A=
		compatible =3D "nvidia,tegra-udrm";=0A=
		linux,phandle =3D <0x12b>;=0A=
		phandle =3D <0x12b>;=0A=
	};=0A=
=0A=
	soft_watchdog {=0A=
		status =3D "okay";=0A=
		linux,phandle =3D <0xb7>;=0A=
		phandle =3D <0xb7>;=0A=
	};=0A=
=0A=
	leds {=0A=
		compatible =3D "gpio-leds";=0A=
		status =3D "disabled";=0A=
		linux,phandle =3D <0xc8>;=0A=
		phandle =3D <0xc8>;=0A=
=0A=
		pwr {=0A=
			gpios =3D <0x56 0x41 0x0>;=0A=
			default-state =3D "on";=0A=
			linux,default-trigger =3D "system-throttle";=0A=
		};=0A=
	};=0A=
=0A=
	memory@80000000 {=0A=
		device_type =3D "memory";=0A=
		reg =3D <0x0 0x80000000 0x0 0x80000000>;=0A=
	};=0A=
=0A=
	cpu_edp {=0A=
		status =3D "okay";=0A=
		nvidia,edp_limit =3D <0x61a8>;=0A=
	};=0A=
=0A=
	gpu_edp {=0A=
		status =3D "okay";=0A=
		nvidia,edp_limit =3D <0x4e20>;=0A=
	};=0A=
=0A=
	__symbols__ {=0A=
		gpu_scaling0 =3D "/thermal-zones/AO-therm/trips/gpu-scaling0";=0A=
		gpu_scaling1 =3D "/thermal-zones/AO-therm/trips/gpu-scaling1";=0A=
		gpu_scaling2 =3D "/thermal-zones/AO-therm/trips/gpu-scaling2";=0A=
		gpu_scaling3 =3D "/thermal-zones/AO-therm/trips/gpu-scaling3";=0A=
		gpu_scaling4 =3D "/thermal-zones/AO-therm/trips/gpu-scaling4";=0A=
		gpu_scaling5 =3D "/thermal-zones/AO-therm/trips/gpu-scaling5";=0A=
		gpu_vmax1 =3D "/thermal-zones/AO-therm/trips/gpu-vmax1";=0A=
		core_dvfs_floor_trip0 =3D =
"/thermal-zones/AO-therm/trips/core_dvfs_floor_trip0";=0A=
		core_dvfs_cap_trip0 =3D =
"/thermal-zones/AO-therm/trips/core_dvfs_cap_trip0";=0A=
		dfll_floor_trip0 =3D "/thermal-zones/AO-therm/trips/dfll-floor-trip0";=0A=
		dfll_cap_trip0 =3D "/thermal-zones/CPU-therm/trips/dfll-cap-trip0";=0A=
		dfll_cap_trip1 =3D "/thermal-zones/CPU-therm/trips/dfll-cap-trip1";=0A=
		pll_dram_throttle =3D "/thermal-zones/PLL-therm/trips/dram-throttle";=0A=
		die_temp_thresh =3D "/thermal-zones/PMIC-Die/trips/hot-die";=0A=
		core_dvfs_floor =3D "/core_dvfs_cdev_floor";=0A=
		core_dvfs_cap =3D "/core_dvfs_cdev_cap";=0A=
		host1x_pd =3D "/power-domain/host1x-pd";=0A=
		pd_audio =3D "/power-domain/ape-pd";=0A=
		adsp_pd =3D "/power-domain/adsp-pd";=0A=
		tsec_pd =3D "/power-domain/tsec-pd";=0A=
		pd_nvdec =3D "/power-domain/nvdec-pd";=0A=
		pd_ve2 =3D "/power-domain/ve2-pd";=0A=
		pd_vic =3D "/power-domain/vic03-pd";=0A=
		pd_nvenc =3D "/power-domain/msenc-pd";=0A=
		pd_nvjpg =3D "/power-domain/nvjpg-pd";=0A=
		pd_pcie =3D "/power-domain/pcie-pd";=0A=
		ve_pd =3D "/power-domain/ve-pd";=0A=
		sata_pd =3D "/power-domain/sata-pd";=0A=
		sor_pd =3D "/power-domain/sor-pd";=0A=
		disa_pd =3D "/power-domain/disa-pd";=0A=
		disb_pd =3D "/power-domain/disb-pd";=0A=
		xusba_pd =3D "/power-domain/xusba-pd";=0A=
		xusbb_pd =3D "/power-domain/xusbb-pd";=0A=
		xusbc_pd =3D "/power-domain/xusbc-pd";=0A=
		C7 =3D "/cpus/idle-states/c7";=0A=
		CC6 =3D "/cpus/idle-states/cc6";=0A=
		L2 =3D "/cpus/l2-cache";=0A=
		tegra_car =3D "/clock";=0A=
		iram =3D "/reserved-memory/iram-carveout";=0A=
		ramoops_reserved =3D "/reserved-memory/ramoops_carveout";=0A=
		vpr =3D "/reserved-memory/vpr-carveout";=0A=
		fb0_reserved =3D "/reserved-memory/fb0_carveout";=0A=
		fb1_reserved =3D "/reserved-memory/fb1_carveout";=0A=
		smmu =3D "/iommu";=0A=
		common_as =3D "/iommu/address-space-prop/common";=0A=
		ppcs_as =3D "/iommu/address-space-prop/ppcs";=0A=
		dc_as =3D "/iommu/address-space-prop/dc";=0A=
		gpu_as =3D "/iommu/address-space-prop/gpu";=0A=
		ape_as =3D "/iommu/address-space-prop/ape";=0A=
		smmu_test =3D "/smmu_test";=0A=
		dma_test =3D "/dma_test";=0A=
		intc =3D "/interrupt-controller";=0A=
		lic =3D "/interrupt-controller@60004000";=0A=
		ahb =3D "/ahb@6000c000";=0A=
		tegra_agic =3D "/aconnect@702c0000/agic@702f9000";=0A=
		adma =3D "/aconnect@702c0000/adma@702e2000";=0A=
		tegra_axbar =3D "/aconnect@702c0000/ahub";=0A=
		tegra_admaif =3D "/aconnect@702c0000/ahub/admaif@0x702d0000";=0A=
		tegra_sfc1 =3D "/aconnect@702c0000/ahub/sfc@702d2000";=0A=
		tegra_sfc2 =3D "/aconnect@702c0000/ahub/sfc@702d2200";=0A=
		tegra_sfc3 =3D "/aconnect@702c0000/ahub/sfc@702d2400";=0A=
		tegra_sfc4 =3D "/aconnect@702c0000/ahub/sfc@702d2600";=0A=
		tegra_amixer =3D "/aconnect@702c0000/ahub/amixer@702dbb00";=0A=
		tegra_i2s1 =3D "/aconnect@702c0000/ahub/i2s@702d1000";=0A=
		tegra_i2s2 =3D "/aconnect@702c0000/ahub/i2s@702d1100";=0A=
		tegra_i2s3 =3D "/aconnect@702c0000/ahub/i2s@702d1200";=0A=
		tegra_i2s4 =3D "/aconnect@702c0000/ahub/i2s@702d1300";=0A=
		tegra_i2s5 =3D "/aconnect@702c0000/ahub/i2s@702d1400";=0A=
		tegra_amx1 =3D "/aconnect@702c0000/ahub/amx@702d3000";=0A=
		tegra_amx2 =3D "/aconnect@702c0000/ahub/amx@702d3100";=0A=
		tegra_adx1 =3D "/aconnect@702c0000/ahub/adx@702d3800";=0A=
		tegra_adx2 =3D "/aconnect@702c0000/ahub/adx@702d3900";=0A=
		tegra_dmic1 =3D "/aconnect@702c0000/ahub/dmic@702d4000";=0A=
		tegra_dmic2 =3D "/aconnect@702c0000/ahub/dmic@702d4100";=0A=
		tegra_dmic3 =3D "/aconnect@702c0000/ahub/dmic@702d4200";=0A=
		tegra_afc1 =3D "/aconnect@702c0000/ahub/afc@702d7000";=0A=
		tegra_afc2 =3D "/aconnect@702c0000/ahub/afc@702d7100";=0A=
		tegra_afc3 =3D "/aconnect@702c0000/ahub/afc@702d7200";=0A=
		tegra_afc4 =3D "/aconnect@702c0000/ahub/afc@702d7300";=0A=
		tegra_afc5 =3D "/aconnect@702c0000/ahub/afc@702d7400";=0A=
		tegra_afc6 =3D "/aconnect@702c0000/ahub/afc@702d7500";=0A=
		tegra_mvc1 =3D "/aconnect@702c0000/ahub/mvc@702da000";=0A=
		tegra_mvc2 =3D "/aconnect@702c0000/ahub/mvc@702da200";=0A=
		tegra_iqc1 =3D "/aconnect@702c0000/ahub/iqc@702de000";=0A=
		tegra_iqc2 =3D "/aconnect@702c0000/ahub/iqc@702de200";=0A=
		tegra_ope1 =3D "/aconnect@702c0000/ahub/ope@702d8000";=0A=
		tegra_ope2 =3D "/aconnect@702c0000/ahub/ope@702d8400";=0A=
		tegra_adsp_audio =3D "/aconnect@702c0000/adsp_audio";=0A=
		apbdma =3D "/dma@60020000";=0A=
		pinmux =3D "/pinmux@700008d4";=0A=
		clkreq_0_bi_dir_state =3D "/pinmux@700008d4/clkreq_0_bi_dir";=0A=
		clkreq_1_bi_dir_state =3D "/pinmux@700008d4/clkreq_1_bi_dir";=0A=
		clkreq_0_in_dir_state =3D "/pinmux@700008d4/clkreq_0_in_dir";=0A=
		clkreq_1_in_dir_state =3D "/pinmux@700008d4/clkreq_1_in_dir";=0A=
		sdmmc1_schmitt_enable_state =3D =
"/pinmux@700008d4/sdmmc1_schmitt_enable";=0A=
		sdmmc1_schmitt_disable_state =3D =
"/pinmux@700008d4/sdmmc1_schmitt_disable";=0A=
		sdmmc1_clk_schmitt_enable_state =3D =
"/pinmux@700008d4/sdmmc1_clk_schmitt_enable";=0A=
		sdmmc1_clk_schmitt_disable_state =3D =
"/pinmux@700008d4/sdmmc1_clk_schmitt_disable";=0A=
		sdmmc1_drv_code_1_8V =3D "/pinmux@700008d4/sdmmc1_drv_code";=0A=
		sdmmc1_default_drv_code_3_3V =3D =
"/pinmux@700008d4/sdmmc1_default_drv_code";=0A=
		sdmmc3_schmitt_enable_state =3D =
"/pinmux@700008d4/sdmmc3_schmitt_enable";=0A=
		sdmmc3_schmitt_disable_state =3D =
"/pinmux@700008d4/sdmmc3_schmitt_disable";=0A=
		sdmmc3_clk_schmitt_enable_state =3D =
"/pinmux@700008d4/sdmmc3_clk_schmitt_enable";=0A=
		sdmmc3_clk_schmitt_disable_state =3D =
"/pinmux@700008d4/sdmmc3_clk_schmitt_disable";=0A=
		sdmmc3_drv_code_1_8V =3D "/pinmux@700008d4/sdmmc3_drv_code";=0A=
		sdmmc3_default_drv_code_3_3V =3D =
"/pinmux@700008d4/sdmmc3_default_drv_code";=0A=
		dvfs_pwm_active_state =3D "/pinmux@700008d4/dvfs_pwm_active";=0A=
		dvfs_pwm_inactive_state =3D "/pinmux@700008d4/dvfs_pwm_inactive";=0A=
		pinmux_default =3D "/pinmux@700008d4/common";=0A=
		pinmux_unused_lowpower =3D "/pinmux@700008d4/unused_lowpower";=0A=
		drive_default =3D "/pinmux@700008d4/drive";=0A=
		gpio =3D "/gpio@6000d000";=0A=
		e2614_audio_pins =3D "/gpio@6000d000/e2614-rt5658-audio";=0A=
		suspend_gpio =3D "/gpio@6000d000/system-suspend-gpio";=0A=
		gpio_default =3D "/gpio@6000d000/default";=0A=
		xusb_mbox =3D "/mailbox@70098000";=0A=
		xusb_padctl =3D "/xusb_padctl@7009f000";=0A=
		tegra_usb_cd =3D "/usb_cd";=0A=
		tegra_padctl_uphy =3D "/pinctrl@7009f000";=0A=
		tegra_ext_cdp =3D "/max16984-cdp";=0A=
		uarta =3D "/serial@70006000";=0A=
		uartb =3D "/serial@70006040";=0A=
		uartc =3D "/serial@70006200";=0A=
		uartd =3D "/serial@70006300";=0A=
		tegra_sound =3D "/sound";=0A=
		hdr40_snd_link_i2s =3D "/sound/nvidia,dai-link-1";=0A=
		i2s_dai_link1 =3D "/sound/nvidia,dai-link-1";=0A=
		tegra_pwm =3D "/pwm@7000a000";=0A=
		spi0 =3D "/spi@7000d400";=0A=
		spi1 =3D "/spi@7000d600";=0A=
		spi2 =3D "/spi@7000d800";=0A=
		spi3 =3D "/spi@7000da00";=0A=
		qspi6 =3D "/spi@70410000";=0A=
		host1x =3D "/host1x";=0A=
		vi_base =3D "/host1x/vi";=0A=
		vi_port0 =3D "/host1x/vi/ports/port@0";=0A=
		rbpcv2_imx219_vi_in0 =3D "/host1x/vi/ports/port@0/endpoint";=0A=
		vi_port1 =3D "/host1x/vi/ports/port@1";=0A=
		rbpcv2_imx219_vi_in1 =3D "/host1x/vi/ports/port@1/endpoint";=0A=
		head0 =3D "/host1x/dc@54200000";=0A=
		head1 =3D "/host1x/dc@54240000";=0A=
		dsi =3D "/host1x/dsi";=0A=
		sor0 =3D "/host1x/sor";=0A=
		sor0_hdmi_display =3D "/host1x/sor/hdmi-display";=0A=
		sor0_dp_display =3D "/host1x/sor/dp-display";=0A=
		sor1 =3D "/host1x/sor1";=0A=
		sor1_hdmi_display =3D "/host1x/sor1/hdmi-display";=0A=
		sor1_dp_display =3D "/host1x/sor1/dp-display";=0A=
		dpaux0 =3D "/host1x/dpaux";=0A=
		dpaux1 =3D "/host1x/dpaux1";=0A=
		i2c7 =3D "/host1x/i2c@546c0000";=0A=
		imx219_single_cam0 =3D "/host1x/i2c@546c0000/rbpcv2_imx219_a@10";=0A=
		rbpcv2_imx219_out0 =3D =
"/host1x/i2c@546c0000/rbpcv2_imx219_a@10/ports/port@0/endpoint";=0A=
		ina3221x =3D "/host1x/i2c@546c0000/ina3221x@40";=0A=
		csi_base =3D "/host1x/nvcsi";=0A=
		csi_chan0 =3D "/host1x/nvcsi/channel@0";=0A=
		csi_chan0_port0 =3D "/host1x/nvcsi/channel@0/ports/port@0";=0A=
		rbpcv2_imx219_csi_in0 =3D =
"/host1x/nvcsi/channel@0/ports/port@0/endpoint@0";=0A=
		csi_chan0_port1 =3D "/host1x/nvcsi/channel@0/ports/port@1";=0A=
		rbpcv2_imx219_csi_out0 =3D =
"/host1x/nvcsi/channel@0/ports/port@1/endpoint@1";=0A=
		csi_chan1 =3D "/host1x/nvcsi/channel@1";=0A=
		csi_chan1_port0 =3D "/host1x/nvcsi/channel@1/ports/port@2";=0A=
		rbpcv2_imx219_csi_in1 =3D =
"/host1x/nvcsi/channel@1/ports/port@2/endpoint@2";=0A=
		csi_chan1_port1 =3D "/host1x/nvcsi/channel@1/ports/port@3";=0A=
		rbpcv2_imx219_csi_out1 =3D =
"/host1x/nvcsi/channel@1/ports/port@3/endpoint@3";=0A=
		tegra_pmc =3D "/pmc@7000e400";=0A=
		pex_io_dpd_disable_state =3D "/pmc@7000e400/pex_en";=0A=
		pex_io_dpd_enable_state =3D "/pmc@7000e400/pex_dis";=0A=
		hdmi_dpd_enable =3D "/pmc@7000e400/hdmi-dpd-enable";=0A=
		hdmi_dpd_disable =3D "/pmc@7000e400/hdmi-dpd-disable";=0A=
		dsi_dpd_enable =3D "/pmc@7000e400/dsi-dpd-enable";=0A=
		dsi_dpd_disable =3D "/pmc@7000e400/dsi-dpd-disable";=0A=
		dsib_dpd_enable =3D "/pmc@7000e400/dsib-dpd-enable";=0A=
		dsib_dpd_disable =3D "/pmc@7000e400/dsib-dpd-disable";=0A=
		pinctrl_iopad_default =3D "/pmc@7000e400/iopad-defaults";=0A=
		sdmmc1_e_33V_enable =3D "/pmc@7000e400/sdmmc1_e_33V_enable";=0A=
		sdmmc1_e_33V_disable =3D "/pmc@7000e400/sdmmc1_e_33V_disable";=0A=
		sdmmc3_e_33V_enable =3D "/pmc@7000e400/sdmmc3_e_33V_enable";=0A=
		sdmmc3_e_33V_disable =3D "/pmc@7000e400/sdmmc3_e_33V_disable";=0A=
		se =3D "/se@70012000";=0A=
		hdr40_i2c0 =3D "/i2c@7000c000";=0A=
		i2c1 =3D "/i2c@7000c000";=0A=
		tegra_nct72 =3D "/i2c@7000c000/temp-sensor@4c";=0A=
		hdr40_i2c1 =3D "/i2c@7000c400";=0A=
		i2c2 =3D "/i2c@7000c400";=0A=
		e2614_i2c_mux =3D "/i2c@7000c400/i2cmux@70";=0A=
		e2614_rt5658_b00 =3D "/i2c@7000c400/i2cmux@70/i2c@3/rt5659.12-001a@1a";=0A=
		e2614_gpio_i2c_1_20 =3D "/i2c@7000c400/gpio@20";=0A=
		e2614_icm20628 =3D "/i2c@7000c400/icm20628@68";=0A=
		e2614_ak8963 =3D "/i2c@7000c400/ak8963@0d";=0A=
		e2614_cm32180 =3D "/i2c@7000c400/cm32180@48";=0A=
		e2614_iqs263 =3D "/i2c@7000c400/iqs263@44";=0A=
		e2614_rt5658_a00 =3D "/i2c@7000c400/rt5659.1-001a@1a";=0A=
		i2c3 =3D "/i2c@7000c500";=0A=
		hdmi_ddc =3D "/i2c@7000c700";=0A=
		i2c4 =3D "/i2c@7000c700";=0A=
		i2c5 =3D "/i2c@7000d000";=0A=
		max77620 =3D "/i2c@7000d000/max77620@3c";=0A=
		max77620_default =3D "/i2c@7000d000/max77620@3c/pinmux@0";=0A=
		spmic_wdt =3D "/i2c@7000d000/max77620@3c/watchdog";=0A=
		max77620_sd0 =3D "/i2c@7000d000/max77620@3c/regulators/sd0";=0A=
		max77620_sd1 =3D "/i2c@7000d000/max77620@3c/regulators/sd1";=0A=
		max77620_sd2 =3D "/i2c@7000d000/max77620@3c/regulators/sd2";=0A=
		max77620_sd3 =3D "/i2c@7000d000/max77620@3c/regulators/sd3";=0A=
		max77620_ldo0 =3D "/i2c@7000d000/max77620@3c/regulators/ldo0";=0A=
		max77620_ldo1 =3D "/i2c@7000d000/max77620@3c/regulators/ldo1";=0A=
		max77620_ldo2 =3D "/i2c@7000d000/max77620@3c/regulators/ldo2";=0A=
		max77620_ldo3 =3D "/i2c@7000d000/max77620@3c/regulators/ldo3";=0A=
		max77620_ldo4 =3D "/i2c@7000d000/max77620@3c/regulators/ldo4";=0A=
		max77620_ldo5 =3D "/i2c@7000d000/max77620@3c/regulators/ldo5";=0A=
		max77620_ldo6 =3D "/i2c@7000d000/max77620@3c/regulators/ldo6";=0A=
		max77620_ldo7 =3D "/i2c@7000d000/max77620@3c/regulators/ldo7";=0A=
		max77620_ldo8 =3D "/i2c@7000d000/max77620@3c/regulators/ldo8";=0A=
		i2c6 =3D "/i2c@7000d100";=0A=
		sdmmc4 =3D "/sdhci@700b0600";=0A=
		sdhci3 =3D "/sdhci@700b0600";=0A=
		sdmmc3 =3D "/sdhci@700b0400";=0A=
		sdhci2 =3D "/sdhci@700b0400";=0A=
		sdmmc2 =3D "/sdhci@700b0200";=0A=
		sdhci1 =3D "/sdhci@700b0200";=0A=
		sdmmc1 =3D "/sdhci@700b0000";=0A=
		sdhci0 =3D "/sdhci@700b0000";=0A=
		tegra_mc =3D "/memory-controller@70019000";=0A=
		tegra_pwm_dfll =3D "/pwm@70110000";=0A=
		tegra_clk_dfll =3D "/clock@70110000";=0A=
		soctherm =3D "/soctherm@0x700E2000";=0A=
		throttle_heavy =3D "/soctherm@0x700E2000/throttle-cfgs/heavy";=0A=
		throttle_oc1 =3D "/soctherm@0x700E2000/throttle-cfgs/oc1";=0A=
		throttle_oc3 =3D "/soctherm@0x700E2000/throttle-cfgs/oc3";=0A=
		tegra_wdt =3D "/watchdog@60005100";=0A=
		tegra_watchdog =3D "/watchdog@60005100";=0A=
		id_gpio_extcon =3D "/extcon/extcon@0";=0A=
		vbus_id_gpio_extcon =3D "/extcon/extcon@1";=0A=
		IPI =3D "/smp-custom-ipi";=0A=
		tegra210_emc_dram_cdev =3D "/external-memory-controller@7001b000";=0A=
		dummy_cool_dev =3D "/dummy-cool-dev";=0A=
		battery_reg =3D "/regulators/regulator@0";=0A=
		hdr40_vdd_5v0 =3D "/regulators/regulator@1";=0A=
		p3449_vdd_5v0_sys =3D "/regulators/regulator@1";=0A=
		hdr40_vdd_3v3 =3D "/regulators/regulator@2";=0A=
		p3448_vdd_3v3_sys =3D "/regulators/regulator@2";=0A=
		p3448_vdd_3v3_sd =3D "/regulators/regulator@3";=0A=
		p3448_avdd_io_edp =3D "/regulators/regulator@4";=0A=
		p3449_vdd_hdmi =3D "/regulators/regulator@5";=0A=
		p3449_vdd_1v8 =3D "/regulators/regulator@6";=0A=
		p3449_vdd_fan =3D "/regulators/regulator@7";=0A=
		p3449_vdd_usb_vbus =3D "/regulators/regulator@8";=0A=
		p3449_vdd_usb_hub_en =3D "/regulators/regulator@9";=0A=
		p3449_vdd_usb_vbus2 =3D "/regulators/regulator@10";=0A=
		gpu_scaling_cdev =3D "/dvfs_rails/vdd-gpu-scaling-cdev@7";=0A=
		gpu_vmax_cdev =3D "/dvfs_rails/vdd-gpu-vmax-cdev@9";=0A=
		pwm_fan_shared_data =3D "/pfsd";=0A=
		tcp =3D "/tegra-camera-platform";=0A=
		cam_module0 =3D "/tegra-camera-platform/modules/module0";=0A=
		cam_module0_drivernode0 =3D =
"/tegra-camera-platform/modules/module0/drivernode0";=0A=
		cam_module0_drivernode1 =3D =
"/tegra-camera-platform/modules/module0/drivernode1";=0A=
		cam_module1 =3D "/tegra-camera-platform/modules/module1";=0A=
		cam_module1_drivernode0 =3D =
"/tegra-camera-platform/modules/module1/drivernode0";=0A=
		cam_module1_drivernode1 =3D =
"/tegra-camera-platform/modules/module1/drivernode1";=0A=
		i2c_0 =3D "/cam_i2cmux/i2c@0";=0A=
		imx219_cam0 =3D "/cam_i2cmux/i2c@0/rbpcv2_imx219_a@10";=0A=
		rbpcv2_imx219_dual_out0 =3D =
"/cam_i2cmux/i2c@0/rbpcv2_imx219_a@10/ports/port@0/endpoint";=0A=
		i2c_1 =3D "/cam_i2cmux/i2c@1";=0A=
		imx219_cam1 =3D "/cam_i2cmux/i2c@1/rbpcv2_imx219_e@10";=0A=
		rbpcv2_imx219_out1 =3D =
"/cam_i2cmux/i2c@1/rbpcv2_imx219_e@10/ports/port@0/endpoint";=0A=
		thermal_fan_est_shared_data =3D "/tfesd";=0A=
		spdif_dit0 =3D "/spdif-dit.0@0";=0A=
		spdif_dit1 =3D "/spdif-dit.1@1";=0A=
		spdif_dit2 =3D "/spdif-dit.2@2";=0A=
		spdif_dit3 =3D "/spdif-dit.3@3";=0A=
		spdif_dit4 =3D "/spdif-dit.4@4";=0A=
		spdif_dit5 =3D "/spdif-dit.5@5";=0A=
		spdif_dit6 =3D "/spdif-dit.6@6";=0A=
		spdif_dit7 =3D "/spdif-dit.7@7";=0A=
		e2614_gps_wake =3D "/gps_wake";=0A=
		cpu_ovr_reg =3D "/pwm_regulators/pwm-regulator@0";=0A=
		i2c_dfll =3D "/dfll-max77621@70110000/dfll-max77621-integration";=0A=
		dfll_max77621_parms =3D =
"/dfll-max77621@70110000/dfll-max77621-board-params";=0A=
		dfll_cap =3D "/dfll-cdev-cap";=0A=
		dfll_floor =3D "/dfll-cdev-floor";=0A=
		tegra_udrm =3D "/tegra_udrm";=0A=
		soft_wdt =3D "/soft_watchdog";=0A=
	};=0A=
};=0A=

------=_NextPart_000_0001_01D66190.996FE380--


