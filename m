Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC12C203C17
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:04:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnOur-00072a-D4; Mon, 22 Jun 2020 16:03:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnOup-00072V-UO
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:03:23 +0000
X-Inumbo-ID: e55bc25a-b4a1-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e55bc25a-b4a1-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 16:03:22 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7987AA27EB;
 Mon, 22 Jun 2020 18:03:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6351DA27C8;
 Mon, 22 Jun 2020 18:03:20 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kj1vaCdaXmpD; Mon, 22 Jun 2020 18:03:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AD82AA27EB;
 Mon, 22 Jun 2020 18:03:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZkLwt0f8AdBS; Mon, 22 Jun 2020 18:03:19 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7E891A27C8;
 Mon, 22 Jun 2020 18:03:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 656E121B03;
 Mon, 22 Jun 2020 18:02:49 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PeRZeNtTH-X1; Mon, 22 Jun 2020 18:02:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9B70F219DB;
 Mon, 22 Jun 2020 18:02:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hpgL1geaYLMQ; Mon, 22 Jun 2020 18:02:43 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7129C21999;
 Mon, 22 Jun 2020 18:02:43 +0200 (CEST)
Date: Mon, 22 Jun 2020 18:02:43 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
In-Reply-To: <87576264-e7df-2590-f141-351d76baac7a@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: hAM9A3NcvqmPiUmz43AEWAK5kVI4oQ==
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

----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 22.06.2020 16:35, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisa=C5=82(a)=
:
>>> On 19.06.2020 01:41, Micha=C5=82 Leszczy=C5=84ski wrote:
>>>> +
>>>> +    domain_pause(d);
>>>
>>> Who's the intended caller of this interface? You making it a hvm-op
>>> suggests the guest may itself call this. But of course a guest
>>> can't pause itself. If this is supposed to be a tools-only interface,
>>> then you should frame it suitably in the public header and of course
>>> you need to enforce this here (which would e.g. mean you shouldn't
>>> use rcu_lock_domain_by_any_id()).
>>>
>>=20
>> What should I use instead of rcu_lock_domain_by_and_id()?
>=20
> Please take a look at the header where its declaration lives. It's
> admittedly not the usual thing in Xen, but there are even comments
> describing the differences between the four related by-id functions.
> I guess rcu_lock_live_remote_domain_by_id() is the one you want to
> use, despite being puzzled by there being surprisingly little uses
> elsewhere.
>=20

Ok, I will correct this.

>>> Also please take a look at hvm/ioreq.c, which makes quite a bit of
>>> use of domain_pause(). In particular I think you want to acquire
>>> the lock only after having paused the domain.
>>=20
>> This domain_pause() will be changed to vcpu_pause().
>=20
> And you understand that my comment then still applies?

If you mean that we should first call vcpu_pause()
and then acquire spinlock, then yes, this will be corrected in v3.

>>> Is any of what you do in this switch() actually legitimate without
>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>>> remarks elsewhere I imply you expect the param that you currently
>>> use to be set upon domain creation time, but at the very least the
>>> potentially big buffer should imo not get allocated up front, but
>>> only when tracing is to actually be enabled.
>>=20
>> Wait... so you want to allocate these buffers in runtime?
>> Previously we were talking that there is too much runtime logic
>> and these enable/disable hypercalls should be stripped to absolute
>> minimum.
>=20
> Basic arrangements can be made at domain creation time. I don't
> think though that it would be a good use of memory if you
> allocated perhaps many gigabytes of memory just for possibly
> wanting to enable tracing on a guest.
>=20

From our previous conversations I thought that you want to have
as much logic moved to the domain creation as possible.

Thus, a parameter "vmtrace_pt_size" was introduced. By default it's
zero (=3D disabled), if you set it to a non-zero value, then trace buffers
of given size will be allocated for the domain and you have possibility
to use ipt_enable/ipt_disable at any moment.

This way the runtime logic is as thin as possible. I assume user knows
in advance whether he/she would want to use external monitoring with IPT
or not.

It's also not "many gigabytes". In most use cases a buffer of 16/32/64 MB
would suffice, I think.

If we want to fall back to the scenario where the trace buffer is
allocated dynamically, then we basically get back to patch v1
implementation.

>>>> +struct xen_hvm_vmtrace_op {
>>>> +    /* IN variable */
>>>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>>>> +    uint32_t cmd;
>>>> +/* Enable/disable external vmtrace for given domain */
>>>> +#define HVMOP_vmtrace_ipt_enable      1
>>>> +#define HVMOP_vmtrace_ipt_disable     2
>>>> +#define HVMOP_vmtrace_ipt_get_offset  3
>>>> +    domid_t domain;
>>>> +    uint32_t vcpu;
>>>> +    uint64_t size;
>>>> +
>>>> +    /* OUT variable */
>>>> +    uint64_t offset;
>>>
>>> If this is to be a tools-only interface, please use uint64_aligned_t.
>>>
>>=20
>> This type is not defined within hvm_op.h header. What should I do about =
it?
>=20
> It gets defined by xen.h, so should be available here. Its
> definitions live in a
>=20
> #if defined(__XEN__) || defined(__XEN_TOOLS__)
>=20
> section, which is what I did recommend to put your interface in
> as well. Unless you want this to be exposed to the guest itself,
> at which point further constraints would arise.
>=20
>>> You also want to add an entry to xen/include/xlat.lst and use the
>>> resulting macro to prove that the struct layout is the same for
>>> native and compat callers.
>>=20
>> Could you tell a little bit more about this? What are "native" and
>> "compat" callers and what is the purpose of this file?
>=20
> A native caller is one whose bitness matches Xen's, i.e. for x86
> a guest running in 64-bit mode. A compat guest is one running in
> 32-bit mode. Interface structure layout, at least for historical
> reasons, can differ between the two. If it does, these
> structures need translation. In the case here the layouts look
> to match, which we still want to be verified at build time. If
> you add a suitable line to xlat.lst starting with a ?, a macro
> will be generated that you can then invoke somewhere near the
> code that actually handles this sub-hypercall. See e.g. the top
> of xen/common/hypfs.c for a relatively recent addition of such.
>=20

Thanks for this explanation, I will try to address this.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

