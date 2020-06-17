Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618031FCCD4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 13:56:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlWf8-0004GZ-0U; Wed, 17 Jun 2020 11:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1O8=76=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlWf6-0004GU-Sc
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 11:55:24 +0000
X-Inumbo-ID: 6d0557d0-b091-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d0557d0-b091-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 11:55:24 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E3A0EA3227;
 Wed, 17 Jun 2020 13:55:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D5CEFA3221;
 Wed, 17 Jun 2020 13:55:21 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id C1Bl_heD8IBc; Wed, 17 Jun 2020 13:55:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3337EA3226;
 Wed, 17 Jun 2020 13:55:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m_D4QzqUynqh; Wed, 17 Jun 2020 13:55:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 09244A3221;
 Wed, 17 Jun 2020 13:55:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id F0535215FA;
 Wed, 17 Jun 2020 13:54:50 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id h6igKZ9eMG5q; Wed, 17 Jun 2020 13:54:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 87B6E2244D;
 Wed, 17 Jun 2020 13:54:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QBZoRIukessH; Wed, 17 Jun 2020 13:54:45 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6AD932182D;
 Wed, 17 Jun 2020 13:54:45 +0200 (CEST)
Date: Wed, 17 Jun 2020 13:54:45 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200617090942.GY735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Index: Fne+GBNZEUczmf1siwoEM5lna0gtRA==
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 17 cze 2020 o 11:09, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Tue, Jun 16, 2020 at 07:47:07PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> ----- 16 cze 2020 o 19:38, Roger Pau Monn=C3=A9 roger.pau@citrix.com nap=
isa=C5=82(a):
>>=20
>> > On Tue, Jun 16, 2020 at 05:24:11PM +0200, Micha=C5=82 Leszczy=C5=84ski=
 wrote:
>> >> Enable IPT when entering the VM and disable it on vmexit.
>> >> Register state is persisted using vCPU ipt_state structure.
>> >=20
>> > Shouldn't this be better done using Intel MSR load lists?
>> >=20
>> > That seems to be what the SDM recommends for tracing VM events.
>> >=20
>> > Thanks, Roger.
>>=20
>>=20
>> This is intentional, additionally described by the comment:
>>=20
>> // MSR_IA32_RTIT_CTL is context-switched manually instead of being
>> // stored inside VMCS, as of Q2'20 only the most recent processors
>> // support such field in VMCS
>>=20
>>=20
>> There is a special feature flag which indicates whether MSR_IA32_RTIT_CT=
L can be
>> loaded using MR load lists.
>=20
> I've been looking at the Intel SDM and I'm not able to find which bit
> signals whether MSR_IA32_RTIT_CTL can be loaded using MSR load lists.
> Sorry to ask, but can you elaborate on where is this signaled?
>=20
> Thanks, Roger.


According to SDM:

> 24 Virtual Machine Control Structures -> 24.4 Guest-state Area -> 24.4.1 =
Guest Register State

> IA32_RTIT_CTL (64 bits). This field is supported only on processors that =
support either the 1-setting of the "load IA32_RTIT_CTL" VM-entry control o=
r that of the "clear IA32_RTIT_CTL" VM-exit control.


> 24 Virtual Machine Control Structures -> 24.8 VM-entry Control Fields -> =
24.8.1 VM-Entry Controls

> Software should consult the VMX capability MSRs IA32_VMX_ENTRY_CTLS to de=
termine how it should set the reserved bits.

Please look at bit position 18 "Load IA32_RTIT_CTL".



Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

