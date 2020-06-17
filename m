Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948671FD576
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 21:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jldmY-0003s7-Oi; Wed, 17 Jun 2020 19:31:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1O8=76=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jldmX-0003s2-R7
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 19:31:33 +0000
X-Inumbo-ID: 25d5654a-b0d1-11ea-ba16-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25d5654a-b0d1-11ea-ba16-12813bfff9fa;
 Wed, 17 Jun 2020 19:31:32 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 36515A30FF;
 Wed, 17 Jun 2020 21:31:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 249BDA30C3;
 Wed, 17 Jun 2020 21:31:30 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xTqd_m2GGSEs; Wed, 17 Jun 2020 21:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 43DCAA30FF;
 Wed, 17 Jun 2020 21:31:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Kt6pWg2oZCBv; Wed, 17 Jun 2020 21:31:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1D878A30C3;
 Wed, 17 Jun 2020 21:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 00065204FF;
 Wed, 17 Jun 2020 21:30:58 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oAHJYeVF9JNv; Wed, 17 Jun 2020 21:30:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D698A209D5;
 Wed, 17 Jun 2020 21:30:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yqmWjACCgADV; Wed, 17 Jun 2020 21:30:52 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id ABCFE204FF;
 Wed, 17 Jun 2020 21:30:52 +0200 (CEST)
Date: Wed, 17 Jun 2020 21:30:52 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Message-ID: <11233541.9260387.1592422252636.JavaMail.zimbra@cert.pl>
In-Reply-To: <CABfawhn3UsLo_Ffe4C47Po+gCCChGXnH6ghENSNTY3OwqnBjUg@mail.gmail.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
 <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
 <CABfawhn3UsLo_Ffe4C47Po+gCCChGXnH6ghENSNTY3OwqnBjUg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: BsYEZrJ7asFdwFXtpYfFwvq1Ux0v0g==
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 17 cze 2020 o 18:27, Tamas K Lengyel tamas.k.lengyel@gmail.com napisa=
=C5=82(a):

> On Wed, Jun 17, 2020 at 10:19 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>>
>> On 17/06/2020 04:02, Tamas K Lengyel wrote:
>> > On Tue, Jun 16, 2020 at 2:17 PM Andrew Cooper <andrew.cooper3@citrix.c=
om> wrote:
>> >> On 16/06/2020 19:47, Micha=C5=82 Leszczy=C5=84ski wrote:
>> >>> ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com n=
apisa=C5=82(a):
>> >>>
>> >>>> Are there any restrictions on EPT being enabled in the first place?=
  I'm
>> >>>> not aware of any, and in principle we could use this functionality =
for
>> >>>> PV guests as well (using the CPL filter).  Therefore, I think it wo=
uld
>> >>>> be helpful to not tie the functionality to HVM guests, even if that=
 is
>> >>>> the only option enabled to start with.
>> >>> I think at the moment it's not required to have EPT. This patch seri=
es doesn't
>> >>> use any translation feature flags, so the output address is always a=
 machine
>> >>> physical address, regardless of context. I will check if it could be=
 easily
>> >>> used with PV.
>> >> If its trivial to add PV support then please do.  If its not, then do=
n't
>> >> feel obliged, but please do at least consider how PV support might lo=
ok
>> >> in the eventual feature.
>> >>
>> >> (Generally speaking, considering "how would I make this work in other
>> >> modes where it is possible" leads to a better design.)
>> >>
>> >>>> The buffer mapping and creation logic is fairly problematic.  Inste=
ad of
>> >>>> fighting with another opencoded example, take a look at the IOREQ
>> >>>> server's use of "acquire resource" which is a mapping interface whi=
ch
>> >>>> supports allocating memory on behalf of the guest, outside of the g=
uest
>> >>>> memory, for use by control tools.
>> >>>>
>> >>>> I think what this wants is a bit somewhere in domain_create to indi=
cate
>> >>>> that external tracing is used for this domain (and allocate whateve=
r
>> >>>> structures/buffers are necessary), acquire resource to map the buff=
ers
>> >>>> themselves, and a domctl for any necessary runtime controls.
>> >>>>
>> >>> I will check this out, this sounds like a good option as it would re=
move lots of
>> >>> complexity from the existing ipt_enable domctl.
>> >> Xen has traditionally opted for a "and turn this extra thing on
>> >> dynamically" model, but this has caused no end of security issues and
>> >> broken corner cases.
>> >>
>> >> You can see this still existing in the difference between
>> >> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
>> >> required to chose the number of vcpus for the domain) and we're makin=
g
>> >> good progress undoing this particular wart (before 4.13, it was
>> >> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
>> >> issuing other hypercalls between these two).
>> >>
>> >> There is a lot of settings which should be immutable for the lifetime=
 of
>> >> the domain, and external monitoring looks like another one of these.
>> >> Specifying it at createdomain time allows for far better runtime
>> >> behaviour (you are no longer in a situation where the first time you =
try
>> >> to turn tracing on, you end up with -ENOMEM because another VM booted=
 in
>> >> the meantime and used the remaining memory), and it makes for rather
>> >> more simple code in Xen itself (at runtime, you can rely on it having
>> >> been set up properly, because a failure setting up will have killed t=
he
>> >> domain already).
>> > I'm not in favor of this being a flag that gets set during domain
>> > creation time. It could certainly be the case that some users would
>> > want this being on from the start till the end but in other cases you
>> > may want to enable it intermittently only for some time in-between
>> > particular events. If it's an on/off flag during domain creation you
>> > pretty much force that choice on the users and while the overhead of
>> > PT is better than say MTF it's certainly not nothing. In case there is
>> > an OOM situation enabling IPT dynamically the user can always just
>> > pause the VM and wait till memory becomes available.
>>
>> There is nothing wrong with having "turn tracing on/off at runtime"
>> hypercalls.  It is specifically what I suggested two posts up in this
>> thread, but it should be limited to the TraceEn bit in RTIT_CTL.
>>
>> What isn't ok is trying to allocate the buffers, write the TOPA, etc on
>> first-enable or first-map, because the runtime complexity of logic like
>> this large, and far too easy to get wrong in security relevant ways.
>>
>> The domain create flag would mean "I wish to use tracing with this
>> domain", and not "I want tracing enabled from the getgo".
>=20
> Gotcha, that's reasonable.
>=20


I think I also agree with this, i.e. to alloc buffers on domain creation an=
d just enable/disable the feature in runtime. This would remove some comple=
xity from runtime. I think it's usually (always?) known in advance whether =
we would like to use external monitoring on a domain or not.

I will try to adapt this approach in patch v2.


>>
>> >>>> What semantics do you want for the buffer becoming full?  Given tha=
t
>> >>>> debugging/tracing is the goal, I presume "pause vcpu on full" is th=
e
>> >>>> preferred behaviour, rather than drop packets on full?
>> >>>>
>> >>> Right now this is a ring-style buffer and when it would become full =
it would
>> >>> simply wrap and override the old data.
>> >> How does the consumer spot that the data has wrapped?  What happens i=
f
>> >> data starts getting logged, but noone is listening?  What happens if =
the
>> >> consumer exits/crashes/etc and stops listening as a consequence?
>> >>
>> >> It's fine to simply state what will happen, and possibly even "don't =
do
>> >> that then", but the corner cases do at least need thinking about.
>> > AFAIU the current use-case is predominantly to be used in conjunction
>> > with VMI events where you want to be able to see the trace leading up
>> > to a particular vmexit. So in the case when the buffer is wrapped
>> > in-between events and data is lost that's not really of concern.
>>
>> That's all fine.  I imagine the output here is voluminous, and needs
>> help being cut down as much as possible.
>>
>> On a tangent, I presume you'd like to include VM-fork eventually, which
>> ought to include copying the trace buffer on fork?
>=20
> I would eventually like to use it to reconstruct the branch history so
> we can update AFL's coverage map with that instead of having to do the
> current breakpoint-singlestep dance. But for that I would only care
> about the trace starting after the fork, so copying the parent's PT
> buffer is not needed. We'll also probably only use PT if the branch
> history is larger than what LBR can hold. I asked Michal to name the
> hypercall interface "vmtrace" for this reason so we can add other
> stuff like LBR later using the same interface (which I already
> implemented in https://github.com/tklengyel/xen/commits/lbr).
>=20
> Tamas

