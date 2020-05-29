Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE81E7DA8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:53:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeeUs-0005Dd-CO; Fri, 29 May 2020 12:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L269=7L=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jeeUq-0005DY-W3
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:52:25 +0000
X-Inumbo-ID: 3da9c984-a1ab-11ea-9947-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3da9c984-a1ab-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 12:52:24 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id F30AEA2570;
 Fri, 29 May 2020 14:52:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EF3D8A2547;
 Fri, 29 May 2020 14:52:21 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vRZyfN0mawu3; Fri, 29 May 2020 14:52:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 557EDA2570;
 Fri, 29 May 2020 14:52:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id o8WDoAEVcNJS; Fri, 29 May 2020 14:52:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3614DA2547;
 Fri, 29 May 2020 14:52:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2B08E222AA;
 Fri, 29 May 2020 14:51:51 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vV0-pD2cC7HA; Fri, 29 May 2020 14:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 90857222E0;
 Fri, 29 May 2020 14:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id En165QHYGHzw; Fri, 29 May 2020 14:51:45 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 67B692226D;
 Fri, 29 May 2020 14:51:45 +0200 (CEST)
Date: Fri, 29 May 2020 14:51:45 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Message-ID: <1150720994.59695220.1590756705329.JavaMail.zimbra@cert.pl>
In-Reply-To: <57d213df-9edb-8f31-59e4-13f5cc07b543@suse.com>
References: <1317891616.59673956.1590755403816.JavaMail.zimbra@cert.pl>
 <57d213df-9edb-8f31-59e4-13f5cc07b543@suse.com>
Subject: Re: [BUG] Core scheduling patches causing deadlock in some situations
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Core scheduling patches causing deadlock in some situations
Thread-Index: Ip8pjHOe2SXZ63rsxdtycq26oWTKvw==
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

----- 29 maj 2020 o 14:44, J=C3=BCrgen Gro=C3=9F jgross@suse.com napisa=C5=
=82(a):

> On 29.05.20 14:30, Micha=C5=82 Leszczy=C5=84ski wrote:
>> Hello,
>>=20
>> I'm running DRAKVUF on Dell Inc. PowerEdge R640/08HT8T server with Intel=
(R)
>> Xeon(R) Gold 6132 CPU @ 2.60GHz CPU.
>> When upgrading from Xen RELEASE 4.12 to 4.13, we have noticed some stabi=
lity
>> problems concerning freezes of Dom0 (Debian Buster):
>>=20
>> ---
>>=20
>> maj 27 23:17:02 debian kernel: rcu: INFO: rcu_sched self-detected stall =
on CPU
>> maj 27 23:17:02 debian kernel: rcu: 0-....: (5250 ticks this GP)
>> idle=3Dcee/1/0x4000000000000002 softirq=3D11964/11964 fqs=3D2515
>> maj 27 23:17:02 debian kernel: rcu: (t=3D5251 jiffies g=3D27237 q=3D799)
>> maj 27 23:17:02 debian kernel: NMI backtrace for cpu 0
>> maj 27 23:17:02 debian kernel: CPU: 0 PID: 643 Comm: z_rd_int_1 Tainted:=
 P OE
>> 4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u2
>> maj 27 23:17:02 debian kernel: Hardware name: Dell Inc. PowerEdge R640/0=
8HT8T,
>> BIOS 2.1.8 04/30/2019
>> maj 27 23:17:02 debian kernel: Call Trace:
>> maj 27 23:17:02 debian kernel: <IRQ>
>> maj 27 23:17:02 debian kernel: dump_stack+0x5c/0x80
>> maj 27 23:17:02 debian kernel: nmi_cpu_backtrace.cold.4+0x13/0x50
>> maj 27 23:17:02 debian kernel: ? lapic_can_unplug_cpu.cold.29+0x3b/0x3b
>> maj 27 23:17:02 debian kernel: nmi_trigger_cpumask_backtrace+0xf9/0xfb
>> maj 27 23:17:02 debian kernel: rcu_dump_cpu_stacks+0x9b/0xcb
>> maj 27 23:17:02 debian kernel: rcu_check_callbacks.cold.81+0x1db/0x335
>> maj 27 23:17:02 debian kernel: ? tick_sched_do_timer+0x60/0x60
>> maj 27 23:17:02 debian kernel: update_process_times+0x28/0x60
>> maj 27 23:17:02 debian kernel: tick_sched_handle+0x22/0x60
>>=20
>> ---
>>=20
>> This usually results in machine being completely unresponsive and perfor=
ming an
>> automated reboot after some time.
>>=20
>> I've bisected commits between 4.12 and 4.13 and it seems like this is th=
e patch
>> which introduced a bug:
>> https://github.com/xen-project/xen/commit/7c7b407e77724f37c4b448930777a5=
9a479feb21
>>=20
>> Enclosed you can find the `xl dmesg` log (attachment: dmesg.txt) from th=
e fresh
>> boot of the machine on which the bug was reproduced.
>>=20
>> I'm also attaching the `xl info` output from this machine:
>>=20
>> ---
>>=20
>> release : 4.19.0-6-amd64
>> version : #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
>> machine : x86_64
>> nr_cpus : 14
>> max_cpu_id : 223
>> nr_nodes : 1
>> cores_per_socket : 14
>> threads_per_core : 1
>> cpu_mhz : 2593.930
>> hw_caps :
>> bfebfbff:77fef3ff:2c100800:00000121:0000000f:d19ffffb:00000008:00000100
>> virt_caps : pv hvm hvm_directio pv_directio hap shadow
>> total_memory : 130541
>> free_memory : 63591
>> sharing_freed_memory : 0
>> sharing_used_memory : 0
>> outstanding_claims : 0
>> free_cpus : 0
>> xen_major : 4
>> xen_minor : 13
>> xen_extra : -unstable
>> xen_version : 4.13-unstable
>> xen_caps : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p
>> hvm-3.0-x86_64
>> xen_scheduler : credit2
>> xen_pagesize : 4096
>> platform_params : virt_start=3D0xffff800000000000
>> xen_changeset : Wed Oct 2 09:27:27 2019 +0200 git:7c7b407e77-dirty
>=20
> Which is your original Xen base? This output is clearly obtained at the
> end of the bisect process.
>=20
> There have been quite some corrections since the release of Xen 4.13, so
> please make sure you are running the most actual version (4.13.1).
>=20
>=20
> Juergen

Sure, we have tested both RELEASE 4.13 and RELEASE 4.13.1. Unfortunately th=
ese corrections didn't help and the bug is still reproducible.

From our testing it turns out that:

Known working revision: 997d6248a9ae932d0dbaac8d8755c2b15fec25dc
Broken revision: 6278553325a9f76d37811923221b21db3882e017
First bad commit: 7c7b407e77724f37c4b448930777a59a479feb21


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

