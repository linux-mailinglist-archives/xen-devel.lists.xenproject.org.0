Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ACE2B6A74
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 17:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29144.58392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf42E-0006r7-A1; Tue, 17 Nov 2020 16:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29144.58392; Tue, 17 Nov 2020 16:40:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf42E-0006qi-6w; Tue, 17 Nov 2020 16:40:50 +0000
Received: by outflank-mailman (input) for mailman id 29144;
 Tue, 17 Nov 2020 16:40:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kf42D-0006qd-0R
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:40:49 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27a0a535-718d-40c1-9619-f7d1d6bd8b7b;
 Tue, 17 Nov 2020 16:40:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AHGec6a017766
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 17:40:39 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id BC2D12E9CA8; Tue, 17 Nov 2020 17:40:33 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kf42D-0006qd-0R
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:40:49 +0000
X-Inumbo-ID: 27a0a535-718d-40c1-9619-f7d1d6bd8b7b
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27a0a535-718d-40c1-9619-f7d1d6bd8b7b;
	Tue, 17 Nov 2020 16:40:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AHGec6a017766
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2020 17:40:39 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id BC2D12E9CA8; Tue, 17 Nov 2020 17:40:33 +0100 (MET)
Date: Tue, 17 Nov 2020 17:40:33 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201117164033.GB3093@antioche.eu.org>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 17 Nov 2020 17:40:40 +0100 (MET)


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> [...]
> 
> I have attached a patch below that will dump the vIO-APIC info as part
> of the 'i' debug key output, can you paste the whole output of the 'i'
> debug key when the system stalls?

see attached file. Note that the kernel did unstall while 'i' output was
being printed, so it is mixed with some NetBSD kernel output.
The idt entry of the 'ioapic2 pin2' interrupt is 103 on CPU 0.

I also put the whole sequence at
http://www-soc.lip6.fr/~bouyer/xen-log3.txt

You'll see that I did hit 'i' 2 times to get the NetBSD kernel to boot
multiuser.

> 
> Can you assert that you properly EOI the vectors on the local APIC? (I
> don't have a patch to dump the emulated lapic ISR right now, but could
> provide one if needed).

Reading the code, I think it's OK (assuming I properly understood what
you mean too). Wouldn't it cause problems on real hardware too
if the vectors were not EOI'd ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="i.txt"

(XEN) IRQ information:
(XEN)    IRQ:   0 vec:f0 IO-APIC-edge    status=000 aff:{0}/{0} arch/x86/time.c#timer_interrupt()
(XEN)    IRQ:   1 vec:70 IO-APIC-edge    status=006 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:   3 vec:f1 IO-APIC-edge    status=000 aff:{0-15}/{0-15} drivers/char/ns16550.c#ns16550_interrupt()
(XEN)    IRQ:   4 vec:78 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:   5 vec:88 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:   6 vec:90 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:   7 vec:98 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:   8 vec:a0 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:   9 vec:a8 IO-APIC-level   status=010 aff:{0}/{0} in-flight=0 d0:  9(-M-)
(XEN)    IRQ:  10 vec:b0 IO-APIC-edge    status=006 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:  11 vec:b8 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:  12 vec:c0 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:  13 vec:c8 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:  14 vec:d0 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:  15 vec:d8 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
(XEN)    IRQ:  16 vec:49 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=0 d0: 16(-M-)
(XEN)    IRQ:  34 vec:51 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
(XEN)    IRQ: 104 vec:30 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 105 vec:38 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 106 vec:40 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 107 vec:48 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 108 vec:50 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 109 vec:58 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 110 vec:60 DMA_MSI         status=000 aff:{0-223}/{0} drivers/passthrough/vtd/iommu.c#iommu_page_fault()
(XEN)    IRQ: 111 vec:68 DMA_MSI         status=000 aff:{0-223}/{0} [drivers/passthrough/vtd/iommu.c#iommu_page_fault()
 (XEN)    IRQ: 112 vec:e0 PCI-MSI         status=030 aff:{0}/{0-7}  in-flight=0 5d0:1143(-M-)
0(XEN)    IRQ: 113 vec:e8 PCI-MSI         status=010 aff:{0}/{0-7} .in-flight=0 3d0:1142(-M-)
5(XEN)    IRQ: 114 vec:31 PCI-MSI         status=030 aff:{0}/{0-7} 7in-flight=0 6d0:1141(-M-)
0(XEN)    IRQ: 115 vec:39 PCI-MSI/-X      status=030 aff:{0}/{0-7} 3in-flight=0 8d0:1140(-M-)
](XEN)    IRQ: 116 vec:41 PCI-MSI/-X      status=030 aff:{0}/{0-7}  in-flight=0 md0:1139(-M-)
f(XEN)    IRQ: 117 vec:8e PCI-MSI/-X      status=030 aff:{0}/{0-7} iin-flight=0 id0:1138(-M-)
0(XEN)    IRQ: 118 vec:96 PCI-MSI/-X      status=030 aff:{0}/{0-7} :in-flight=0  d0:1137(-M-)
c(XEN)    IRQ: 119 vec:9e PCI-MSI/-X      status=030 aff:{0}/{0-7} min-flight=0 dd0:1136(-M-)
 (XEN)    IRQ: 120 vec:a6 PCI-MSI/-X      status=030 aff:{0}/{0-7} ain-flight=0 bd0:1135(-M-)
o(XEN)    IRQ: 121 vec:ae PCI-MSI/-X      status=030 aff:{0}/{0-7} rin-flight=0 td0:1134(-M-)
e(XEN)    IRQ: 122 vec:b6 PCI-MSI/-X      status=030 aff:{0}/{0-7} din-flight=0  d0:1133(-M-)
c(XEN)    IRQ: 123 vec:be PCI-MSI/-X      status=030 aff:{0}/{0-7} cin-flight=0 bd0:1132(-M-)
 (XEN)    IRQ: 124 vec:c6 PCI-MSI/-X      status=030 aff:{0}/{0-7} 0in-flight=0 xd0:1131(-M-)
f(XEN)    IRQ: 125 vec:ce PCI-MSI/-X      status=030 aff:{0}/{0-7} fin-flight=0 fd0:1130(-M-)
f(XEN)    IRQ: 126 vec:d6 PCI-MSI/-X      status=030 aff:{0}/{0-7} 8in-flight=0 cd0:1129(-M-)
8(XEN)    IRQ: 127 vec:de PCI-MSI/-X      status=030 aff:{0}/{0-7} 0in-flight=0 0d0:1128(-M-)
2(XEN)    IRQ: 128 vec:e6 PCI-MSI/-X      status=030 aff:{0}/{0-7} 7in-flight=0 bd0:1127(-M-)
7(XEN)    IRQ: 129 vec:ee PCI-MSI/-X      status=030 aff:{0}/{0-7} din-flight=0 6d0:1126(-M-)
0(XEN)    IRQ: 130 vec:37 PCI-MSI/-X      status=030 aff:{0}/{0-7} in-flight=0 
d0:1125(-M-)
[(XEN)    IRQ: 131 vec:3f PCI-MSI/-X      status=030 aff:{0}/{0-7}  in-flight=0  d0:1124(-M-)
5(XEN)    IRQ: 132 vec:47 PCI-MSI/-X      status=030 aff:{0}/{0-7} 0in-flight=0 .d0:1123(-M-)
6(XEN)    IRQ: 133 vec:4f PCI-MSI/-X      status=030 aff:{0}/{0-7} 8in-flight=0 9d0:1122(-M-)
2(XEN)    IRQ: 134 vec:76 PCI-MSI/-X      status=030 aff:{0}/{0-7} 7in-flight=0 2d0:1121(-M-)
3(XEN)    IRQ: 135 vec:7e PCI-MSI/-X      status=030 aff:{0}/{0-7} ]in-flight=0  d0:1120(-M-)
m(XEN)    IRQ: 136 vec:86 PCI-MSI/-X      status=030 aff:{0}/{0-7} fin-flight=0 id0:1119(-M-)
i(XEN)    IRQ: 137 vec:57 PCI-MSI/-X      status=030 aff:{0}/{0-7} 0in-flight=0 :d0:1118(-M-)
 (XEN)    IRQ: 138 vec:5f PCI-MSI/-X      status=030 aff:{0}/{0-7} nin-flight=0 od0:1117(-M-)
r(XEN)    IRQ: 139 vec:67 PCI-MSI/-X      status=030 aff:{0}/{0-7} min-flight=0 ad0:1116(-M-)
l(XEN)    IRQ: 140 vec:6f PCI-MSI/-X      status=030 aff:{0}/{0-7}  in-flight=0 sd0:1115(-M-)
t(XEN)    IRQ: 141 vec:77 PCI-MSI/-X      status=030 aff:{0}/{0-7} ain-flight=0 td0:1114(-M-)
e(XEN)    IRQ: 142 vec:7f PCI-MSI/-X      status=030 aff:{0}/{0-7}  in-flight=0 od0:1113(-M-)
n(XEN)    IRQ: 143 vec:87 PCI-MSI/-X      status=030 aff:{0}/{0-7}  in-flight=0 'd0:1112(-M-)
m(XEN)    IRQ: 144 vec:8f PCI-MSI/-X      status=030 aff:{0}/{0-7} fin-flight=0 id0:1111(-M-)
i(XEN)    IRQ: 145 vec:97 PCI-MSI/-X      status=030 aff:{0}/{0-7} 0in-flight=0 :d0:1110(-M-)
0(XEN)    IRQ: 146 vec:9f PCI-MSI/-X      status=030 aff:{0}/{0-7} 'in-flight=0  d0:1109(-M-)
((XEN)    IRQ: 147 vec:a7 PCI-MSI/-X      status=030 aff:{0}/{0-7} oin-flight=0 nd0:1108(-M-)
l(XEN)    IRQ: 148 vec:af PCI-MSI/-X      status=030 aff:{0}/{0-7} iin-flight=0 nd0:1107(-M-)
e(XEN)    IRQ: 149 vec:b7 PCI-MSI/-X      status=030 aff:{0}/{0-7} )in-flight=0 d0:1106(-M-)

(XEN)    IRQ: 150 vec:bf PCI-MSI/-X      status=030 aff:{0}/{0-7} [in-flight=0  d0:1105(-M-)
 (XEN) Direct vector information:
5(XEN)    0x22 -> irq_move_cleanup_interrupt()
0(XEN)    0xf2 -> arch/x86/cpu/mcheck/mce_intel.c#cmci_interrupt()
.(XEN)    0xf3 -> arch/x86/cpu/mcheck/mce_intel.c#intel_thermal_interrupt()
7(XEN)    0xf4 -> arch/x86/hvm/vmx/vmx.c#pi_notification_interrupt()
1(XEN)    0xf9 -> pmu_apic_interrupt()
3(XEN)    0xfa -> apic_timer_interrupt()
8(XEN)    0xfb -> call_function_interrupt()
3(XEN)    0xfc -> event_check_interrupt()
7(XEN)    0xfd -> invalidate_interrupt()
3(XEN)    0xfe -> error_interrupt()
](XEN)    0xff -> spurious_interrupt()
 (XEN) IO-APIC interrupt information:
s(XEN)     IRQ  0 Vec240:
d(XEN)       Apic 0x00, Pin  2: 0vec=f0 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
:(XEN)     IRQ  1 Vec112:
 (XEN)       Apic 0x00, Pin  1: fvec=70 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
a(XEN)     IRQ  3 Vec241:
b(XEN)       Apic 0x00, Pin  3: rvec=f1 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00015555
i(XEN)     IRQ  4 Vec120:
c(XEN)       Apic 0x00, Pin  4: avec=78 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
t(XEN)     IRQ  5 Vec136:
i(XEN)       Apic 0x00, Pin  5: nvec=88 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
g(XEN)     IRQ  6 Vec144:
 (XEN)       Apic 0x00, Pin  6: avec=90 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
 (XEN)     IRQ  7 Vec152:
g(XEN)       Apic 0x00, Pin  7: evec=98 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
o(XEN)     IRQ  8 Vec160:
m(XEN)       Apic 0x00, Pin  8: evec=a0 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
t(XEN)     IRQ  9 Vec168:
r(XEN)       Apic 0x00, Pin  9: yvec=a8 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=L mask=0 dest_id:00000001
(XEN)     IRQ 10 Vec176:
(XEN)       Apic 0x00, Pin 10: 
vec=b0 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=1 dest_id:00000001
(XEN)     IRQ 11 Vec184:
(XEN)       Apic 0x00, Pin 11: vec=b8 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
[(XEN)     IRQ 12 Vec192:
 (XEN)       Apic 0x00, Pin 12:  vec=c0 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
5(XEN)     IRQ 13 Vec200:
1(XEN)       Apic 0x00, Pin 13: .vec=c8 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
3(XEN)     IRQ 14 Vec208:
9(XEN)       Apic 0x00, Pin 14: 3vec=d0 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
9(XEN)     IRQ 15 Vec216:
1(XEN)       Apic 0x00, Pin 15: 0vec=d8 delivery=LoPri dest=L status=0 polarity=0 irr=0 trig=E mask=0 dest_id:00000001
2(XEN)     IRQ 16 Vec 73:
](XEN)       Apic 0x00, Pin 16:  vec=49 delivery=LoPri dest=L status=0 polarity=1 irr=0 trig=L mask=0 dest_id:00000001
s(XEN)     IRQ 34 Vec 81:
d(XEN)       Apic 0x02, Pin  2: 0vec=51 delivery=LoPri dest=L status=0 polarity=1 irr=0 trig=L mask=0 dest_id:00000001
:(XEN) vIO-APIC dom0 state:
 (XEN) ioapic 0 pin 0 gsi 0 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
G(XEN) ioapic 0 pin 1 gsi 1 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
P(XEN) ioapic 0 pin 2 gsi 2 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
T(XEN) ioapic 0 pin 3 gsi 3 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 0 pin 4 gsi 4 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
G(XEN) ioapic 0 pin 5 gsi 5 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
U(XEN) ioapic 0 pin 6 gsi 6 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
I(XEN) ioapic 0 pin 7 gsi 7 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
D(XEN) ioapic 0 pin 8 gsi 8 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
:(XEN) ioapic 0 pin 9 gsi 9 vector 0x60
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 1 mask 0 dest id 0
 (XEN) ioapic 0 pin 10 gsi 10 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
4(XEN) ioapic 0 pin 11 gsi 11 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
c(XEN) ioapic 0 pin 12 gsi 12 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
d(XEN) ioapic 0 pin 13 gsi 13 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 0 pin 14 gsi 14 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
a(XEN) ioapic 0 pin 15 gsi 15 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
8(XEN) ioapic 0 pin 16 gsi 16 vector 0x66
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 0 dest id 0
9(XEN) ioapic 0 pin 17 gsi 17 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
7(XEN) ioapic 0 pin 18 gsi 18 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
-(XEN) ioapic 0 pin 19 gsi 19 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
b(XEN) ioapic 0 pin 20 gsi 20 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
5(XEN) ioapic 0 pin 21 gsi 21 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
9(XEN) ioapic 0 pin 22 gsi 22 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
1(XEN) ioapic 0 pin 23 gsi 23 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
-(XEN) ioapic 1 pin 0 gsi 24 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
4(XEN) ioapic 1 pin 1 gsi 25 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
5(XEN) ioapic 1 pin 2 gsi 26 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
c(XEN) ioapic 1 pin 3 gsi 27 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
5(XEN) ioapic 1 pin 4 gsi 28 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
-(XEN) ioapic 1 pin 5 gsi 29 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
8(XEN) ioapic 1 pin 6 gsi 30 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
6(XEN) ioapic 1 pin 7 gsi 31 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
7(XEN) ioapic 2 pin 0 gsi 32 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
9(XEN) ioapic 2 pin 1 gsi 33 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
-(XEN) ioapic 2 pin 2 gsi 34 vector 0x67
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 0 dest id 0
f(XEN) ioapic 2 pin 3 gsi 35 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
2(XEN) ioapic 2 pin 4 gsi 36 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
d(XEN) ioapic 2 pin 5 gsi 37 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
4(XEN) ioapic 2 pin 6 gsi 38 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
b(XEN) ioapic 2 pin 7 gsi 39 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
c(XEN) ioapic 3 pin 0 gsi 40 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 3 pin 1 gsi 41 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
d(XEN) ioapic 3 pin 2 gsi 42 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
8(XEN) ioapic 3 pin 3 gsi 43 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
3(XEN) ioapic 3 pin 4 gsi 44 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
c(XEN) ioapic 3 pin 5 gsi 45 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
8(XEN) ioapic 3 pin 6 gsi 46 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
(XEN) ioapic 3 pin 7 gsi 47 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0

(XEN) ioapic 4 pin 0 gsi 48 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
[(XEN) ioapic 4 pin 1 gsi 49 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 4 pin 2 gsi 50 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 4 pin 3 gsi 51 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
5(XEN) ioapic 4 pin 4 gsi 52 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
1(XEN) ioapic 4 pin 5 gsi 53 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
.(XEN) ioapic 4 pin 6 gsi 54 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
8(XEN) ioapic 4 pin 7 gsi 55 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
1(XEN) ioapic 5 pin 0 gsi 72 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 5 pin 1 gsi 73 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
3(XEN) ioapic 5 pin 2 gsi 74 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 5 pin 3 gsi 75 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
7(XEN) ioapic 5 pin 4 gsi 76 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
4(XEN) ioapic 5 pin 5 gsi 77 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
](XEN) ioapic 5 pin 6 gsi 78 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 5 pin 7 gsi 79 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
d(XEN) ioapic 6 pin 0 gsi 80 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
k(XEN) ioapic 6 pin 1 gsi 81 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 6 pin 2 gsi 82 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 6 pin 3 gsi 83 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
a(XEN) ioapic 6 pin 4 gsi 84 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
t(XEN) ioapic 6 pin 5 gsi 85 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 6 pin 6 gsi 86 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
s(XEN) ioapic 6 pin 7 gsi 87 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
d(XEN) ioapic 7 pin 0 gsi 88 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 7 pin 1 gsi 89 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
:(XEN) ioapic 7 pin 2 gsi 90 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 7 pin 3 gsi 91 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
"(XEN) ioapic 7 pin 4 gsi 92 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
r(XEN) ioapic 7 pin 5 gsi 93 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
o(XEN) ioapic 7 pin 6 gsi 94 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
o(XEN) ioapic 7 pin 7 gsi 95 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
t(XEN) ioapic 8 pin 0 gsi 96 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
"(XEN) ioapic 8 pin 1 gsi 97 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
,(XEN) ioapic 8 pin 2 gsi 98 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
 (XEN) ioapic 8 pin 3 gsi 99 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
1(XEN) ioapic 8 pin 4 gsi 100 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
0(XEN) ioapic 8 pin 5 gsi 101 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
2(XEN) ioapic 8 pin 6 gsi 102 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0
4(XEN) ioapic 8 pin 7 gsi 103 vector 0
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 0 IRR 0 trig mode 0 mask 1 dest id 0

--OXfL5xGRrasGEqWY--

