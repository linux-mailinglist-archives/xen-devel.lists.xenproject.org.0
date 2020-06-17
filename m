Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA51FD4FD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 20:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jldFj-0000Tv-8S; Wed, 17 Jun 2020 18:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1O8=76=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jldFi-0000Tq-Jo
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 18:57:38 +0000
X-Inumbo-ID: 6879686a-b0cc-11ea-8496-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6879686a-b0cc-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 18:57:36 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9EB83A3248;
 Wed, 17 Jun 2020 20:57:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 91040A322D;
 Wed, 17 Jun 2020 20:57:34 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WTOIieWGefUJ; Wed, 17 Jun 2020 20:57:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C3E2EA3248;
 Wed, 17 Jun 2020 20:57:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8PJVWMppmpYi; Wed, 17 Jun 2020 20:57:33 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9ED81A322D;
 Wed, 17 Jun 2020 20:57:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 898F0214EE;
 Wed, 17 Jun 2020 20:57:03 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Rt1YQxcsVDD6; Wed, 17 Jun 2020 20:56:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 080E820C14;
 Wed, 17 Jun 2020 20:56:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r8Oo0DNfTFnP; Wed, 17 Jun 2020 20:56:57 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id DC8692097A;
 Wed, 17 Jun 2020 20:56:57 +0200 (CEST)
Date: Wed, 17 Jun 2020 20:56:57 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <219980918.9257247.1592420217746.JavaMail.zimbra@cert.pl>
In-Reply-To: <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
 <20200617125146.GA735@Air-de-Roger>
 <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Index: 8Ar+YGljiiLZAD48QNHpW98pP1stQw==
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
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 17 cze 2020 o 17:14, Andrew Cooper andrew.cooper3@citrix.com napisa=
=C5=82(a):

> On 17/06/2020 13:51, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Jun 17, 2020 at 01:54:45PM +0200, Micha=C5=82 Leszczy=C5=84ski w=
rote:
>>> ----- 17 cze 2020 o 11:09, Roger Pau Monn=C3=A9 roger.pau@citrix.com na=
pisa=C5=82(a):
>>>
>>>> 24 Virtual Machine Control Structures -> 24.8 VM-entry Control Fields =
-> 24.8.1
>>>> VM-Entry Controls
>>>> Software should consult the VMX capability MSRs IA32_VMX_ENTRY_CTLS to=
 determine
>>>> how it should set the reserved bits.
>>> Please look at bit position 18 "Load IA32_RTIT_CTL".
>> I think this is something different from what I was referring to.
>> Those options you refer to (load/clear IA32_RTIT_CTL) deal with
>> loading/storing a specific field on the vmcs that maps to the guest
>> IA32_RTIT_CTL.
>>
>> OTOH MSR load lists can be used to load and store any arbitrary MSR on
>> vmentry/vmexit, see section 26.4 LOADING MSRS on the SDM. There's
>> already infrastructure on Xen to do so, see vmx_{add/del/find}_msr.
>=20
> If I remember the historic roadmaps correctly, there are 3 cases.
>=20
> The first hardware to support PT (Broadwell?) prohibited its use
> completely in VMX operations.=C2=A0 In this case, we can use it to trace =
PV
> guests iff we don't enable VMX in hardware to begin with.
>=20
> This was relaxed in later hardware (Skylake?) to permit use within VMX
> operations, but without any help in the VMCS.=C2=A0 (i.e. manual context
> switching per this patch, or MSR load lists as noted in the SDM.)
>=20
> Subsequent support for "virtualised PT" was added (IceLake?) which adds
> the load/save controls, and the ability to translate the output buffer
> under EPT.
>=20
>=20
> All of this is from memory so I'm quite possibly wrong with details, but
> I believe this is why the current complexity exists.
>=20
> ~Andrew


I've managed to toggle MSR_IA32_RTIT_CTL values using MSR load lists, as in=
:

> 35.5.2.2 Guest-Only Tracing
> "For this usage, VM-entry is programmed to enable trace packet generation=
, while VM-exit is programmed to clear MSR_IA32_RTIT_CTL.TraceEn so as to d=
isable trace-packet generation in the host."

it actually helped a bit. With patch v1 there were parts of hypervisor reco=
rded in the trace (i.e. the moment between TRACE_EN being set and actual vm=
enter, and the moment between vmexit and TRACE_EN being unset). Using MSR l=
oad list this was eliminated. This change will be reflected in patch v2.


I can't however implement any working scenario in which all these MSRs are =
managed using MSR load lists. As in "35.3.3 Flushing Trace Output": packets=
 are buffered internally and are flushed only when TRACE_EN bit in MSR_IA32=
_RTIT_CTL is set to 0. The values of remaining registers will be stable aft=
er everything is serialized. I think this is too complex for the load lists=
 alone. I belive that currently SDM instructs to use load lists only for to=
ggling this single bit on-or-off.


Thus, for now I propose to stay with MSR_IA32_RTIT_CTL being managed by MSR=
 load lists and the rest of related MSRs being managed manually.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

