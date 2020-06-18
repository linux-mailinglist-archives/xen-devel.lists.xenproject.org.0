Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482511FF03A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlsPK-0007h9-31; Thu, 18 Jun 2020 11:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlsPJ-0007h4-3j
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:08:33 +0000
X-Inumbo-ID: 0b56d0f4-b154-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b56d0f4-b154-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 11:08:31 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1723BA300C;
 Thu, 18 Jun 2020 13:08:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 092B0A30DE;
 Thu, 18 Jun 2020 13:08:30 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3__vHQuyugF1; Thu, 18 Jun 2020 13:08:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5C582A300C;
 Thu, 18 Jun 2020 13:08:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wIQpAnQ0iAXn; Thu, 18 Jun 2020 13:08:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3566CA2FC6;
 Thu, 18 Jun 2020 13:08:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 03144210CE;
 Thu, 18 Jun 2020 13:07:39 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KiyBjdnCDhwb; Thu, 18 Jun 2020 13:07:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 59A3A21D50;
 Thu, 18 Jun 2020 13:07:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GqEiuDfdbvzR; Thu, 18 Jun 2020 13:07:33 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1CAA8217E7;
 Thu, 18 Jun 2020 13:07:33 +0200 (CEST)
Date: Thu, 18 Jun 2020 13:07:33 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <633218159.9539851.1592478453009.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200618085208.GG735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
 <20200617125146.GA735@Air-de-Roger>
 <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
 <219980918.9257247.1592420217746.JavaMail.zimbra@cert.pl>
 <20200618085208.GG735@Air-de-Roger>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Index: zYISPLsv9GXpxcikHHHR7TvTXvoztA==
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
Cc: Kevin Tian <kevin.tian@intel.com>, luwei kang <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 18 cze 2020 o 10:52, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Wed, Jun 17, 2020 at 08:56:57PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> ----- 17 cze 2020 o 17:14, Andrew Cooper andrew.cooper3@citrix.com napis=
a=C5=82(a):
>>=20
>> > On 17/06/2020 13:51, Roger Pau Monn=C3=A9 wrote:
>> >> On Wed, Jun 17, 2020 at 01:54:45PM +0200, Micha=C5=82 Leszczy=C5=84sk=
i wrote:
>> >>> ----- 17 cze 2020 o 11:09, Roger Pau Monn=C3=A9 roger.pau@citrix.com=
 napisa=C5=82(a):
>> >>>
>> >>>> 24 Virtual Machine Control Structures -> 24.8 VM-entry Control Fiel=
ds -> 24.8.1
>> >>>> VM-Entry Controls
>> >>>> Software should consult the VMX capability MSRs IA32_VMX_ENTRY_CTLS=
 to determine
>> >>>> how it should set the reserved bits.
>> >>> Please look at bit position 18 "Load IA32_RTIT_CTL".
>> >> I think this is something different from what I was referring to.
>> >> Those options you refer to (load/clear IA32_RTIT_CTL) deal with
>> >> loading/storing a specific field on the vmcs that maps to the guest
>> >> IA32_RTIT_CTL.
>> >>
>> >> OTOH MSR load lists can be used to load and store any arbitrary MSR o=
n
>> >> vmentry/vmexit, see section 26.4 LOADING MSRS on the SDM. There's
>> >> already infrastructure on Xen to do so, see vmx_{add/del/find}_msr.
>> >=20
>> > If I remember the historic roadmaps correctly, there are 3 cases.
>> >=20
>> > The first hardware to support PT (Broadwell?) prohibited its use
>> > completely in VMX operations.=C2=A0 In this case, we can use it to tra=
ce PV
>> > guests iff we don't enable VMX in hardware to begin with.
>> >=20
>> > This was relaxed in later hardware (Skylake?) to permit use within VMX
>> > operations, but without any help in the VMCS.=C2=A0 (i.e. manual conte=
xt
>> > switching per this patch, or MSR load lists as noted in the SDM.)
>> >=20
>> > Subsequent support for "virtualised PT" was added (IceLake?) which add=
s
>> > the load/save controls, and the ability to translate the output buffer
>> > under EPT.
>> >=20
>> >=20
>> > All of this is from memory so I'm quite possibly wrong with details, b=
ut
>> > I believe this is why the current complexity exists.
>> >=20
>> > ~Andrew
>>=20
>>=20
>> I've managed to toggle MSR_IA32_RTIT_CTL values using MSR load lists, as=
 in:
>>=20
>> > 35.5.2.2 Guest-Only Tracing
>> > "For this usage, VM-entry is programmed to enable trace packet generat=
ion, while
>> > VM-exit is programmed to clear MSR_IA32_RTIT_CTL.TraceEn so as to disa=
ble
>> > trace-packet generation in the host."
>>=20
>> it actually helped a bit. With patch v1 there were parts of hypervisor r=
ecorded
>> in the trace (i.e. the moment between TRACE_EN being set and actual vmen=
ter,
>> and the moment between vmexit and TRACE_EN being unset). Using MSR load =
list
>> this was eliminated. This change will be reflected in patch v2.
>>=20
>>=20
>> I can't however implement any working scenario in which all these MSRs a=
re
>> managed using MSR load lists. As in "35.3.3 Flushing Trace Output": pack=
ets are
>> buffered internally and are flushed only when TRACE_EN bit in MSR_IA32_R=
TIT_CTL
>> is set to 0. The values of remaining registers will be stable after ever=
ything
>> is serialized. I think this is too complex for the load lists alone. I b=
elive
>> that currently SDM instructs to use load lists only for toggling this si=
ngle
>> bit on-or-off.
>=20
> I think that's exactly what we want: handling TraceEn at
> vmentry/vmexit, so that no hypervisor packets are recorded. The rest
> of the MSRs can be handled in VMM mode without issues. Switching those
> on every vmentry/vmexit would also add more overhead that needed,
> since I assume they don't need to be modified on every entry/exit?


Assuming that there is a single DomU per pcpu and they are never migrated b=
etween pcpus then you never need to modify the remaining MSRs.

In case DomUs are floating or there are multiple DomUs per pcpu, we need to=
 read out a few MSRs on vm-exit and restore them on vm-entry. Right now I'm=
 always using this approach as I'm pretty not sure how to optimize it witho=
ut introducing additional bugs. I will show the implementation in patch v2.


>=20
>>=20
>> Thus, for now I propose to stay with MSR_IA32_RTIT_CTL being managed by =
MSR load
>> lists and the rest of related MSRs being managed manually.
>=20
> Yes, that' seems like a good approach.
>=20
> Roger.

