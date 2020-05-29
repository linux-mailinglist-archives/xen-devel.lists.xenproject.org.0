Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F311E7F38
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:51:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefQ3-0003QB-1x; Fri, 29 May 2020 13:51:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L269=7L=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jefQ1-0003Q6-8U
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:51:29 +0000
X-Inumbo-ID: 7e1d2c4c-a1b3-11ea-81bc-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e1d2c4c-a1b3-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 13:51:28 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 335D0A2775;
 Fri, 29 May 2020 15:51:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2C15DA277D;
 Fri, 29 May 2020 15:51:26 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3uw1pO5uso_W; Fri, 29 May 2020 15:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 70C5CA277A;
 Fri, 29 May 2020 15:51:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WVC7vMyh_we3; Fri, 29 May 2020 15:51:25 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 4CFD2A2775;
 Fri, 29 May 2020 15:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 41C2522330;
 Fri, 29 May 2020 15:50:55 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id S0oPN9scV3LA; Fri, 29 May 2020 15:50:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 909C32234C;
 Fri, 29 May 2020 15:50:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JHyWT0tei2K5; Fri, 29 May 2020 15:50:49 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 67B7022090;
 Fri, 29 May 2020 15:50:49 +0200 (CEST)
Date: Fri, 29 May 2020 15:50:49 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Message-ID: <1623831291.59734817.1590760249321.JavaMail.zimbra@cert.pl>
In-Reply-To: <1f68a02a-3472-1bb0-90b9-6f3ccefca0b3@suse.com>
References: <1317891616.59673956.1590755403816.JavaMail.zimbra@cert.pl>
 <57d213df-9edb-8f31-59e4-13f5cc07b543@suse.com>
 <1150720994.59695220.1590756705329.JavaMail.zimbra@cert.pl>
 <1f68a02a-3472-1bb0-90b9-6f3ccefca0b3@suse.com>
Subject: Re: [BUG] Core scheduling patches causing deadlock in some situations
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Core scheduling patches causing deadlock in some situations
Thread-Index: MiQjRIgSyAs1U7BGHrKsgOhfnCVHNw==
X-Zimbra-DL: chivay@cert.pl, bonus@cert.pl
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
Cc: chivay@cert.pl, xen-devel@lists.xenproject.org, bonus@cert.pl,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 29 maj 2020 o 15:15, J=C3=BCrgen Gro=C3=9F jgross@suse.com napisa=C5=
=82(a):

> On 29.05.20 14:51, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 29 maj 2020 o 14:44, J=C3=BCrgen Gro=C3=9F jgross@suse.com napisa=
=C5=82(a):
>>=20
>>> On 29.05.20 14:30, Micha=C5=82 Leszczy=C5=84ski wrote:
>>>> Hello,
>>>>
>>>> I'm running DRAKVUF on Dell Inc. PowerEdge R640/08HT8T server with Int=
el(R)
>>>> Xeon(R) Gold 6132 CPU @ 2.60GHz CPU.
>>>> When upgrading from Xen RELEASE 4.12 to 4.13, we have noticed some sta=
bility
>>>> problems concerning freezes of Dom0 (Debian Buster):
>>>>
>>>> ---
>>>>
>>>> maj 27 23:17:02 debian kernel: rcu: INFO: rcu_sched self-detected stal=
l on CPU
>>>> maj 27 23:17:02 debian kernel: rcu: 0-....: (5250 ticks this GP)
>>>> idle=3Dcee/1/0x4000000000000002 softirq=3D11964/11964 fqs=3D2515
>>>> maj 27 23:17:02 debian kernel: rcu: (t=3D5251 jiffies g=3D27237 q=3D79=
9)
>>>> maj 27 23:17:02 debian kernel: NMI backtrace for cpu 0
>>>> maj 27 23:17:02 debian kernel: CPU: 0 PID: 643 Comm: z_rd_int_1 Tainte=
d: P OE
>>>> 4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u2
>>>> maj 27 23:17:02 debian kernel: Hardware name: Dell Inc. PowerEdge R640=
/08HT8T,
>>>> BIOS 2.1.8 04/30/2019
>>>> maj 27 23:17:02 debian kernel: Call Trace:
>>>> maj 27 23:17:02 debian kernel: <IRQ>
>>>> maj 27 23:17:02 debian kernel: dump_stack+0x5c/0x80
>>>> maj 27 23:17:02 debian kernel: nmi_cpu_backtrace.cold.4+0x13/0x50
>>>> maj 27 23:17:02 debian kernel: ? lapic_can_unplug_cpu.cold.29+0x3b/0x3=
b
>>>> maj 27 23:17:02 debian kernel: nmi_trigger_cpumask_backtrace+0xf9/0xfb
>>>> maj 27 23:17:02 debian kernel: rcu_dump_cpu_stacks+0x9b/0xcb
>>>> maj 27 23:17:02 debian kernel: rcu_check_callbacks.cold.81+0x1db/0x335
>>>> maj 27 23:17:02 debian kernel: ? tick_sched_do_timer+0x60/0x60
>>>> maj 27 23:17:02 debian kernel: update_process_times+0x28/0x60
>>>> maj 27 23:17:02 debian kernel: tick_sched_handle+0x22/0x60
>>>>
>>>> ---
>>>>
>>>> This usually results in machine being completely unresponsive and perf=
orming an
>>>> automated reboot after some time.
>>>>
>>>> I've bisected commits between 4.12 and 4.13 and it seems like this is =
the patch
>>>> which introduced a bug:
>>>> https://github.com/xen-project/xen/commit/7c7b407e77724f37c4b448930777=
a59a479feb21
>>>>
>>>> Enclosed you can find the `xl dmesg` log (attachment: dmesg.txt) from =
the fresh
>>>> boot of the machine on which the bug was reproduced.
>>>>
>>>> I'm also attaching the `xl info` output from this machine:
>>>>
>>>> ---
>>>>
>>>> release : 4.19.0-6-amd64
>>>> version : #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
>>>> machine : x86_64
>>>> nr_cpus : 14
>>>> max_cpu_id : 223
>>>> nr_nodes : 1
>>>> cores_per_socket : 14
>>>> threads_per_core : 1
>>>> cpu_mhz : 2593.930
>>>> hw_caps :
>>>> bfebfbff:77fef3ff:2c100800:00000121:0000000f:d19ffffb:00000008:0000010=
0
>>>> virt_caps : pv hvm hvm_directio pv_directio hap shadow
>>>> total_memory : 130541
>>>> free_memory : 63591
>>>> sharing_freed_memory : 0
>>>> sharing_used_memory : 0
>>>> outstanding_claims : 0
>>>> free_cpus : 0
>>>> xen_major : 4
>>>> xen_minor : 13
>>>> xen_extra : -unstable
>>>> xen_version : 4.13-unstable
>>>> xen_caps : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_3=
2p
>>>> hvm-3.0-x86_64
>>>> xen_scheduler : credit2
>>>> xen_pagesize : 4096
>>>> platform_params : virt_start=3D0xffff800000000000
>>>> xen_changeset : Wed Oct 2 09:27:27 2019 +0200 git:7c7b407e77-dirty
>>>
>>> Which is your original Xen base? This output is clearly obtained at the
>>> end of the bisect process.
>>>
>>> There have been quite some corrections since the release of Xen 4.13, s=
o
>>> please make sure you are running the most actual version (4.13.1).
>>>
>>>
>>> Juergen
>>=20
>> Sure, we have tested both RELEASE 4.13 and RELEASE 4.13.1. Unfortunately=
 these
>> corrections didn't help and the bug is still reproducible.
>>=20
>>  From our testing it turns out that:
>>=20
>> Known working revision: 997d6248a9ae932d0dbaac8d8755c2b15fec25dc
>> Broken revision: 6278553325a9f76d37811923221b21db3882e017
>> First bad commit: 7c7b407e77724f37c4b448930777a59a479feb21
>=20
> Would it be possible to test xen unstable, too?
>=20
> I could imagine e.g. commit b492c65da5ec5ed or 99266e31832fb4a4 to have
> an impact here.
>=20
>=20
> Juergen


I've tried b492c65da5ec5ed revision but it seems that there is some problem=
 with ALTP2M support, so I can't launch anything at all.

maj 29 15:45:32 debian drakrun[1223]: Failed to set HVM_PARAM_ALTP2M, RC: -=
1
maj 29 15:45:32 debian drakrun[1223]: VMI_ERROR: xc_altp2m_switch_to_view r=
eturned rc: -1


xl info:

---

release                : 4.19.0-6-amd64
version                : #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
machine                : x86_64
nr_cpus                : 14
max_cpu_id             : 223
nr_nodes               : 1
cores_per_socket       : 14
threads_per_core       : 1
cpu_mhz                : 2593.977
hw_caps                : bfebfbff:77fef3ff:2c100800:00000121:0000000f:d19ff=
ffb:00000008:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap shadow iommu_h=
ap_pt_share
total_memory           : 130541
free_memory            : 63591
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 14
xen_extra              : -unstable
xen_version            : 4.14-unstable
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-=
3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          : Thu May 14 17:36:13 2020 +0200 git:b492c65da5-dirt=
y
xen_commandline        : placeholder dom0_mem=3D65270M,max:65270M dom0_max_=
vcpus=3D6 dom0_vcpus_pin=3D1 force-ept=3D1 ept=3Dpml=3D0 hap_1gb=3D0 hap_2m=
b=3D0 altp2m=3D1 smt=3D0 no-real-mode edd=3Doff
cc_compiler            : gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
cc_compile_by          : root
cc_compile_domain      :
cc_compile_date        : Fri May 29 13:18:41 UTC 2020
build_id               : cd3948792d88ec0bc45e03b227f6cbab9572b76b
xend_config_format     : 4

---

Best regards,
Micha=C5=82 Leszczy=C5=84ski

