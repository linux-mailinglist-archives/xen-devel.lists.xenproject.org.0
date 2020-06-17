Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B920A1FD5F3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 22:22:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jleYU-000833-0k; Wed, 17 Jun 2020 20:21:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1O8=76=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jleYS-00082y-SE
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 20:21:04 +0000
X-Inumbo-ID: 0e81573b-b0d8-11ea-ba1b-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e81573b-b0d8-11ea-ba1b-12813bfff9fa;
 Wed, 17 Jun 2020 20:21:00 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 32E92A31B0;
 Wed, 17 Jun 2020 22:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1D8C9A257E;
 Wed, 17 Jun 2020 22:20:58 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5rrtAS5nqkY2; Wed, 17 Jun 2020 22:20:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 59215A31B0;
 Wed, 17 Jun 2020 22:20:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3t6qgpzmNbCy; Wed, 17 Jun 2020 22:20:57 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2A431A257E;
 Wed, 17 Jun 2020 22:20:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 11752211CB;
 Wed, 17 Jun 2020 22:20:27 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KpI_fyfxAuPZ; Wed, 17 Jun 2020 22:20:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 36E11216F3;
 Wed, 17 Jun 2020 22:20:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p9VkY0aLObAe; Wed, 17 Jun 2020 22:20:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 10586211CB;
 Wed, 17 Jun 2020 22:20:21 +0200 (CEST)
Date: Wed, 17 Jun 2020 22:20:20 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1348695738.9265003.1592425220928.JavaMail.zimbra@cert.pl>
In-Reply-To: <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
 <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: bh8O+ZWqTow4BMcaNcDUXif7NpLI+w==
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
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 17 cze 2020 o 18:19, Andrew Cooper andrew.cooper3@citrix.com napisa=
=C5=82(a):

> On 17/06/2020 04:02, Tamas K Lengyel wrote:
>> On Tue, Jun 16, 2020 at 2:17 PM Andrew Cooper <andrew.cooper3@citrix.com=
> wrote:
>>> On 16/06/2020 19:47, Micha=C5=82 Leszczy=C5=84ski wrote:
>>>> ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com nap=
isa=C5=82(a):
>>>>
>>>>> Are there any restrictions on EPT being enabled in the first place?  =
I'm
>>>>> not aware of any, and in principle we could use this functionality fo=
r
>>>>> PV guests as well (using the CPL filter).  Therefore, I think it woul=
d
>>>>> be helpful to not tie the functionality to HVM guests, even if that i=
s
>>>>> the only option enabled to start with.
>>>> I think at the moment it's not required to have EPT. This patch series=
 doesn't
>>>> use any translation feature flags, so the output address is always a m=
achine
>>>> physical address, regardless of context. I will check if it could be e=
asily
>>>> used with PV.
>>> If its trivial to add PV support then please do.  If its not, then don'=
t
>>> feel obliged, but please do at least consider how PV support might look
>>> in the eventual feature.
>>>
>>> (Generally speaking, considering "how would I make this work in other
>>> modes where it is possible" leads to a better design.)
>>>
>>>>> The buffer mapping and creation logic is fairly problematic.  Instead=
 of
>>>>> fighting with another opencoded example, take a look at the IOREQ
>>>>> server's use of "acquire resource" which is a mapping interface which
>>>>> supports allocating memory on behalf of the guest, outside of the gue=
st
>>>>> memory, for use by control tools.
>>>>>


One thing that remains unclear to me is the "acquire resource" part. Could =
you give some more details on that?

Assuming that buffers are allocated right from the domain creation, what me=
chanism (instead of xc_map_foreign_range) should I use to map the IPT buffe=
rs into Dom0?


>>>>> I think what this wants is a bit somewhere in domain_create to indica=
te
>>>>> that external tracing is used for this domain (and allocate whatever
>>>>> structures/buffers are necessary), acquire resource to map the buffer=
s
>>>>> themselves, and a domctl for any necessary runtime controls.
>>>>>
>>>> I will check this out, this sounds like a good option as it would remo=
ve lots of
>>>> complexity from the existing ipt_enable domctl.
>>> Xen has traditionally opted for a "and turn this extra thing on
>>> dynamically" model, but this has caused no end of security issues and
>>> broken corner cases.
>>>
>>> You can see this still existing in the difference between
>>> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
>>> required to chose the number of vcpus for the domain) and we're making
>>> good progress undoing this particular wart (before 4.13, it was
>>> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
>>> issuing other hypercalls between these two).
>>>
>>> There is a lot of settings which should be immutable for the lifetime o=
f
>>> the domain, and external monitoring looks like another one of these.
>>> Specifying it at createdomain time allows for far better runtime
>>> behaviour (you are no longer in a situation where the first time you tr=
y
>>> to turn tracing on, you end up with -ENOMEM because another VM booted i=
n
>>> the meantime and used the remaining memory), and it makes for rather
>>> more simple code in Xen itself (at runtime, you can rely on it having
>>> been set up properly, because a failure setting up will have killed the
>>> domain already).
>> I'm not in favor of this being a flag that gets set during domain
>> creation time. It could certainly be the case that some users would
>> want this being on from the start till the end but in other cases you
>> may want to enable it intermittently only for some time in-between
>> particular events. If it's an on/off flag during domain creation you
>> pretty much force that choice on the users and while the overhead of
>> PT is better than say MTF it's certainly not nothing. In case there is
>> an OOM situation enabling IPT dynamically the user can always just
>> pause the VM and wait till memory becomes available.
>=20
> There is nothing wrong with having "turn tracing on/off at runtime"
> hypercalls.=C2=A0 It is specifically what I suggested two posts up in thi=
s
> thread, but it should be limited to the TraceEn bit in RTIT_CTL.
>=20
> What isn't ok is trying to allocate the buffers, write the TOPA, etc on
> first-enable or first-map, because the runtime complexity of logic like
> this large, and far too easy to get wrong in security relevant ways.
>=20
> The domain create flag would mean "I wish to use tracing with this
> domain", and not "I want tracing enabled from the getgo".
>=20
>>>>> What semantics do you want for the buffer becoming full?  Given that
>>>>> debugging/tracing is the goal, I presume "pause vcpu on full" is the
>>>>> preferred behaviour, rather than drop packets on full?
>>>>>
>>>> Right now this is a ring-style buffer and when it would become full it=
 would
>>>> simply wrap and override the old data.
>>> How does the consumer spot that the data has wrapped?  What happens if
>>> data starts getting logged, but noone is listening?  What happens if th=
e
>>> consumer exits/crashes/etc and stops listening as a consequence?
>>>
>>> It's fine to simply state what will happen, and possibly even "don't do
>>> that then", but the corner cases do at least need thinking about.
>> AFAIU the current use-case is predominantly to be used in conjunction
>> with VMI events where you want to be able to see the trace leading up
>> to a particular vmexit. So in the case when the buffer is wrapped
>> in-between events and data is lost that's not really of concern.
>=20
> That's all fine.=C2=A0 I imagine the output here is voluminous, and needs
> help being cut down as much as possible.
>=20
> On a tangent, I presume you'd like to include VM-fork eventually, which
> ought to include copying the trace buffer on fork?
>=20
> ~Andrew

