Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED62204686
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 03:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnXN4-0000iE-Go; Tue, 23 Jun 2020 01:05:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6H1f=AE=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnXN3-0000i9-HW
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 01:05:05 +0000
X-Inumbo-ID: 9190af40-b4ed-11ea-bef2-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9190af40-b4ed-11ea-bef2-12813bfff9fa;
 Tue, 23 Jun 2020 01:05:03 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 963B5A234A;
 Tue, 23 Jun 2020 03:05:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 69E61A22B6;
 Tue, 23 Jun 2020 03:05:01 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bitQuvZ7NmEI; Tue, 23 Jun 2020 03:05:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A833BA234A;
 Tue, 23 Jun 2020 03:05:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JNHeiI_Wmx6L; Tue, 23 Jun 2020 03:05:00 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 76CE4A22B6;
 Tue, 23 Jun 2020 03:05:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 51BEC20D97;
 Tue, 23 Jun 2020 03:04:30 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id o_KNW34omj-b; Tue, 23 Jun 2020 03:04:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id AAE8F216C8;
 Tue, 23 Jun 2020 03:04:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id q3ukrnuaByvJ; Tue, 23 Jun 2020 03:04:24 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8244C20D97;
 Tue, 23 Jun 2020 03:04:24 +0200 (CEST)
Date: Tue, 23 Jun 2020 03:04:24 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <901046162.11470361.1592874264410.JavaMail.zimbra@cert.pl>
In-Reply-To: <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: skHlUZZiKLRaZ/TNKOwd8rxjdwwr3g==
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 22 cze 2020 o 18:16, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 22.06.2020 18:02, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisa=C5=82(a)=
:
>>> On 22.06.2020 16:35, Micha=C5=82 Leszczy=C5=84ski wrote:
>>>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisa=C5=82(=
a):
>>>>> Is any of what you do in this switch() actually legitimate without
>>>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>>>>> remarks elsewhere I imply you expect the param that you currently
>>>>> use to be set upon domain creation time, but at the very least the
>>>>> potentially big buffer should imo not get allocated up front, but
>>>>> only when tracing is to actually be enabled.
>>>>
>>>> Wait... so you want to allocate these buffers in runtime?
>>>> Previously we were talking that there is too much runtime logic
>>>> and these enable/disable hypercalls should be stripped to absolute
>>>> minimum.
>>>
>>> Basic arrangements can be made at domain creation time. I don't
>>> think though that it would be a good use of memory if you
>>> allocated perhaps many gigabytes of memory just for possibly
>>> wanting to enable tracing on a guest.
>>>
>>=20
>> From our previous conversations I thought that you want to have
>> as much logic moved to the domain creation as possible.
>>=20
>> Thus, a parameter "vmtrace_pt_size" was introduced. By default it's
>> zero (=3D disabled), if you set it to a non-zero value, then trace buffe=
rs
>> of given size will be allocated for the domain and you have possibility
>> to use ipt_enable/ipt_disable at any moment.
>>=20
>> This way the runtime logic is as thin as possible. I assume user knows
>> in advance whether he/she would want to use external monitoring with IPT
>> or not.
>=20
> Andrew - I think you requested movement to domain_create(). Could
> you clarify if indeed you mean to also allocate the big buffers
> this early?

I would like to recall what Andrew wrote few days ago:

----- 16 cze 2020 o 22:16, Andrew Cooper andrew.cooper3@citrix.com wrote:
> Xen has traditionally opted for a "and turn this extra thing on
> dynamically" model, but this has caused no end of security issues and
> broken corner cases.
>=20
> You can see this still existing in the difference between
> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
> required to chose the number of vcpus for the domain) and we're making
> good progress undoing this particular wart (before 4.13, it was
> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
> issuing other hypercalls between these two).
>=20
> There is a lot of settings which should be immutable for the lifetime of
> the domain, and external monitoring looks like another one of these.
> Specifying it at createdomain time allows for far better runtime
> behaviour (you are no longer in a situation where the first time you try
> to turn tracing on, you end up with -ENOMEM because another VM booted in
> the meantime and used the remaining memory), and it makes for rather
> more simple code in Xen itself (at runtime, you can rely on it having
> been set up properly, because a failure setting up will have killed the
> domain already).
>=20
> ...
>=20
> ~Andrew

according to this quote I've moved buffer allocation to the create_domain,
the updated version was already sent to the list as patch v3.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

