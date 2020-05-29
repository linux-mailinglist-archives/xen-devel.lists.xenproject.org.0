Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953C1E8C59
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2020 01:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeomy-0000tq-59; Fri, 29 May 2020 23:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L269=7L=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jeomw-0000tl-7h
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 23:51:46 +0000
X-Inumbo-ID: 59d58588-a207-11ea-8993-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59d58588-a207-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 23:51:44 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0DEB1A1D1B;
 Sat, 30 May 2020 01:51:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 065F4A1D1A;
 Sat, 30 May 2020 01:51:43 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NZNHhCzZDS_a; Sat, 30 May 2020 01:51:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 33996A1D1B;
 Sat, 30 May 2020 01:51:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2MOl8DibFNKn; Sat, 30 May 2020 01:51:42 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1415DA1D1A;
 Sat, 30 May 2020 01:51:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 061CF22315;
 Sat, 30 May 2020 01:51:12 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id t6XSdRV7beLe; Sat, 30 May 2020 01:51:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 40D6222317;
 Sat, 30 May 2020 01:51:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6QJvHqLHUnxU; Sat, 30 May 2020 01:51:06 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0F54122315;
 Sat, 30 May 2020 01:51:06 +0200 (CEST)
Date: Sat, 30 May 2020 01:51:05 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Message-ID: <1227421304.59835733.1590796265807.JavaMail.zimbra@cert.pl>
In-Reply-To: <CABfawhmUbowsMS6dS8SCcgMGe9GY8HenHG7LEyZcqh39DwiXMQ@mail.gmail.com>
References: <1317891616.59673956.1590755403816.JavaMail.zimbra@cert.pl>
 <57d213df-9edb-8f31-59e4-13f5cc07b543@suse.com>
 <1150720994.59695220.1590756705329.JavaMail.zimbra@cert.pl>
 <1f68a02a-3472-1bb0-90b9-6f3ccefca0b3@suse.com>
 <1623831291.59734817.1590760249321.JavaMail.zimbra@cert.pl>
 <CABfawhmjeoVpRgAbDAA_T6rMiqPjQUvLPEn5t1-1JwZFJicNKQ@mail.gmail.com>
 <CABfawhmUbowsMS6dS8SCcgMGe9GY8HenHG7LEyZcqh39DwiXMQ@mail.gmail.com>
Subject: Re: [BUG] Core scheduling patches causing deadlock in some situations
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Core scheduling patches causing deadlock in some situations
Thread-Index: /ogUKyFrbbu2LuoRmFbM/mOB5O9qPA==
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
Cc: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, chivay@cert.pl, bonus@cert.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 29 maj 2020 o 18:12, Tamas K Lengyel tamas.k.lengyel@gmail.com napisa=
=C5=82(a):

> On Fri, May 29, 2020 at 8:48 AM Tamas K Lengyel
> <tamas.k.lengyel@gmail.com> wrote:
>>
>> On Fri, May 29, 2020 at 7:51 AM Micha=C5=82 Leszczy=C5=84ski
>> <michal.leszczynski@cert.pl> wrote:
>> >
>> > ----- 29 maj 2020 o 15:15, J=C3=BCrgen Gro=C3=9F jgross@suse.com napis=
a=C5=82(a):
>> >
>> > > On 29.05.20 14:51, Micha=C5=82 Leszczy=C5=84ski wrote:
>> > >> ----- 29 maj 2020 o 14:44, J=C3=BCrgen Gro=C3=9F jgross@suse.com na=
pisa=C5=82(a):
>> > >>
>> > >>> On 29.05.20 14:30, Micha=C5=82 Leszczy=C5=84ski wrote:
>> > >>>> Hello,
>> > >>>>
>> > >>>> I'm running DRAKVUF on Dell Inc. PowerEdge R640/08HT8T server wit=
h Intel(R)
>> > >>>> Xeon(R) Gold 6132 CPU @ 2.60GHz CPU.
>> > >>>> When upgrading from Xen RELEASE 4.12 to 4.13, we have noticed som=
e stability
>> > >>>> problems concerning freezes of Dom0 (Debian Buster):
>> > >>>>
>> > >>>> ---
>> > >>>>
>> > >>>> maj 27 23:17:02 debian kernel: rcu: INFO: rcu_sched self-detected=
 stall on CPU
>> > >>>> maj 27 23:17:02 debian kernel: rcu: 0-....: (5250 ticks this GP)
>> > >>>> idle=3Dcee/1/0x4000000000000002 softirq=3D11964/11964 fqs=3D2515
>> > >>>> maj 27 23:17:02 debian kernel: rcu: (t=3D5251 jiffies g=3D27237 q=
=3D799)
>> > >>>> maj 27 23:17:02 debian kernel: NMI backtrace for cpu 0
>> > >>>> maj 27 23:17:02 debian kernel: CPU: 0 PID: 643 Comm: z_rd_int_1 T=
ainted: P OE
>> > >>>> 4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u2
>> > >>>> maj 27 23:17:02 debian kernel: Hardware name: Dell Inc. PowerEdge=
 R640/08HT8T,
>> > >>>> BIOS 2.1.8 04/30/2019
>> > >>>> maj 27 23:17:02 debian kernel: Call Trace:
>> > >>>> maj 27 23:17:02 debian kernel: <IRQ>
>> > >>>> maj 27 23:17:02 debian kernel: dump_stack+0x5c/0x80
>> > >>>> maj 27 23:17:02 debian kernel: nmi_cpu_backtrace.cold.4+0x13/0x50
>> > >>>> maj 27 23:17:02 debian kernel: ? lapic_can_unplug_cpu.cold.29+0x3=
b/0x3b
>> > >>>> maj 27 23:17:02 debian kernel: nmi_trigger_cpumask_backtrace+0xf9=
/0xfb
>> > >>>> maj 27 23:17:02 debian kernel: rcu_dump_cpu_stacks+0x9b/0xcb
>> > >>>> maj 27 23:17:02 debian kernel: rcu_check_callbacks.cold.81+0x1db/=
0x335
>> > >>>> maj 27 23:17:02 debian kernel: ? tick_sched_do_timer+0x60/0x60
>> > >>>> maj 27 23:17:02 debian kernel: update_process_times+0x28/0x60
>> > >>>> maj 27 23:17:02 debian kernel: tick_sched_handle+0x22/0x60
>> > >>>>
>> > >>>> ---
>> > >>>>
>> > >>>> This usually results in machine being completely unresponsive and=
 performing an
>> > >>>> automated reboot after some time.
>> > >>>>
>> > >>>> I've bisected commits between 4.12 and 4.13 and it seems like thi=
s is the patch
>> > >>>> which introduced a bug:
>> > >>>> https://github.com/xen-project/xen/commit/7c7b407e77724f37c4b4489=
30777a59a479feb21
>> > >>>>
>> > >>>> Enclosed you can find the `xl dmesg` log (attachment: dmesg.txt) =
from the fresh
>> > >>>> boot of the machine on which the bug was reproduced.
>> > >>>>
>> > >>>> I'm also attaching the `xl info` output from this machine:
>> > >>>>
>> > >>>> ---
>> > >>>>
>> > >>>> release : 4.19.0-6-amd64
>> > >>>> version : #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
>> > >>>> machine : x86_64
>> > >>>> nr_cpus : 14
>> > >>>> max_cpu_id : 223
>> > >>>> nr_nodes : 1
>> > >>>> cores_per_socket : 14
>> > >>>> threads_per_core : 1
>> > >>>> cpu_mhz : 2593.930
>> > >>>> hw_caps :
>> > >>>> bfebfbff:77fef3ff:2c100800:00000121:0000000f:d19ffffb:00000008:00=
000100
>> > >>>> virt_caps : pv hvm hvm_directio pv_directio hap shadow
>> > >>>> total_memory : 130541
>> > >>>> free_memory : 63591
>> > >>>> sharing_freed_memory : 0
>> > >>>> sharing_used_memory : 0
>> > >>>> outstanding_claims : 0
>> > >>>> free_cpus : 0
>> > >>>> xen_major : 4
>> > >>>> xen_minor : 13
>> > >>>> xen_extra : -unstable
>> > >>>> xen_version : 4.13-unstable
>> > >>>> xen_caps : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-=
x86_32p
>> > >>>> hvm-3.0-x86_64
>> > >>>> xen_scheduler : credit2
>> > >>>> xen_pagesize : 4096
>> > >>>> platform_params : virt_start=3D0xffff800000000000
>> > >>>> xen_changeset : Wed Oct 2 09:27:27 2019 +0200 git:7c7b407e77-dirt=
y
>> > >>>
>> > >>> Which is your original Xen base? This output is clearly obtained a=
t the
>> > >>> end of the bisect process.
>> > >>>
>> > >>> There have been quite some corrections since the release of Xen 4.=
13, so
>> > >>> please make sure you are running the most actual version (4.13.1).
>> > >>>
>> > >>>
>> > >>> Juergen
>> > >>
>> > >> Sure, we have tested both RELEASE 4.13 and RELEASE 4.13.1. Unfortun=
ately these
>> > >> corrections didn't help and the bug is still reproducible.
>> > >>
>> > >>  From our testing it turns out that:
>> > >>
>> > >> Known working revision: 997d6248a9ae932d0dbaac8d8755c2b15fec25dc
>> > >> Broken revision: 6278553325a9f76d37811923221b21db3882e017
>> > >> First bad commit: 7c7b407e77724f37c4b448930777a59a479feb21
>> > >
>> > > Would it be possible to test xen unstable, too?
>> > >
>> > > I could imagine e.g. commit b492c65da5ec5ed or 99266e31832fb4a4 to h=
ave
>> > > an impact here.
>> > >
>> > >
>> > > Juergen
>> >
>> >
>> > I've tried b492c65da5ec5ed revision but it seems that there is some pr=
oblem with
>> > ALTP2M support, so I can't launch anything at all.
>> >
>> > maj 29 15:45:32 debian drakrun[1223]: Failed to set HVM_PARAM_ALTP2M, =
RC: -1
>> > maj 29 15:45:32 debian drakrun[1223]: VMI_ERROR: xc_altp2m_switch_to_v=
iew
>> > returned rc: -1
>>
>> Ough, great, that's another regression in 4.14-unstable. I ran into it
>> myself but couldn't spend time to figure out whether its just
>> something in my configuration or not so I reverted to 4.13.1. Now we
>> know it's a real bug.
>=20
> This was a bug in libxl, I've sent a patch in that fixes it but you
> can grab it from https://github.com/tklengyel/xen/tree/libxl_fix.
> There is also an update to DRAKVUF that will need to be applied due to
> the recent altp2m visibility option having to be specified, you can
> grab that from https://github.com/tklengyel/drakvuf/tree/4.14.
>=20
> Tamas


After checking out 99266e31832fb4a4 and applying a patch from https://githu=
b.com/tklengyel/xen/tree/libxl_fix it's again possible to succesfully launc=
h DRAKVUF but the deadlock caused by the scheduler is still reproducible an=
d the whole machine freezes just after a few seconds after starting the ana=
lysis.

So I would suppose that since 7c7b407e77724f37c4b448930777a59a479feb21 thro=
ugh 99266e31832fb4a4 there is still a bug in scheduler which causes freeze =
when using DRAKVUF on some machines or at least some default behavior of Xe=
n hypervisor has changed in some improper way.


Best regards
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

