Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A52039A2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 16:36:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnNYS-0006Eo-HR; Mon, 22 Jun 2020 14:36:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnNYR-0006Ei-Cz
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 14:36:11 +0000
X-Inumbo-ID: b67a2d8e-b495-11ea-be9b-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b67a2d8e-b495-11ea-be9b-12813bfff9fa;
 Mon, 22 Jun 2020 14:36:10 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D16A8A2800;
 Mon, 22 Jun 2020 16:36:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9AE62A27F7;
 Mon, 22 Jun 2020 16:36:07 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qYy-84ZuC1iK; Mon, 22 Jun 2020 16:36:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C2A61A2800;
 Mon, 22 Jun 2020 16:36:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DZEZsAODQqT8; Mon, 22 Jun 2020 16:36:06 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 947E6A27F7;
 Mon, 22 Jun 2020 16:36:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7DF262168B;
 Mon, 22 Jun 2020 16:35:36 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id L0re4ANfyr_d; Mon, 22 Jun 2020 16:35:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E63B421C2D;
 Mon, 22 Jun 2020 16:35:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8hth-wQ9UJ3a; Mon, 22 Jun 2020 16:35:30 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id C0D5621BF6;
 Mon, 22 Jun 2020 16:35:30 +0200 (CEST)
Date: Mon, 22 Jun 2020 16:35:30 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
In-Reply-To: <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: RlrguZCOMbAulIfOOXv3zf4lULTvtQ==
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

----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 19.06.2020 01:41, Micha=C5=82 Leszczy=C5=84ski wrote:
>> +
>> +    domain_pause(d);
>=20
> Who's the intended caller of this interface? You making it a hvm-op
> suggests the guest may itself call this. But of course a guest
> can't pause itself. If this is supposed to be a tools-only interface,
> then you should frame it suitably in the public header and of course
> you need to enforce this here (which would e.g. mean you shouldn't
> use rcu_lock_domain_by_any_id()).
>=20

What should I use instead of rcu_lock_domain_by_and_id()?

> Also please take a look at hvm/ioreq.c, which makes quite a bit of
> use of domain_pause(). In particular I think you want to acquire
> the lock only after having paused the domain.
>=20

This domain_pause() will be changed to vcpu_pause().

> Shouldn't you rather remove the MSR from the load list here?
>=20

This will be fixed.

> Is any of what you do in this switch() actually legitimate without
> hvm_set_vmtrace_pt_size() having got called for the guest? From
> remarks elsewhere I imply you expect the param that you currently
> use to be set upon domain creation time, but at the very least the
> potentially big buffer should imo not get allocated up front, but
> only when tracing is to actually be enabled.

Wait... so you want to allocate these buffers in runtime?
Previously we were talking that there is too much runtime logic
and these enable/disable hypercalls should be stripped to absolute
minimum.


>> --- a/xen/include/public/hvm/hvm_op.h
>> +++ b/xen/include/public/hvm/hvm_op.h
>> @@ -382,6 +382,29 @@ struct xen_hvm_altp2m_op {
>>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
>> =20
>> +/* HVMOP_vmtrace: Perform VM tracing related operation */
>> +#define HVMOP_vmtrace 26
>> +
>> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
>=20
> I'm unconvinced we want to introduce yet another versioned interface.
> In any event, as hinted at earlier, this suggests it wants to be a
> tools-only interface instead (which, at least for the time being, is
> not required to be a stable interface then, but that's also something
> we apparently want to move away from, and hence you may better not
> try to rely on it not needing to be stable).

Ok. I will remove the interface version.

>=20
>> +struct xen_hvm_vmtrace_op {
>> +    /* IN variable */
>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>> +    uint32_t cmd;
>> +/* Enable/disable external vmtrace for given domain */
>> +#define HVMOP_vmtrace_ipt_enable      1
>> +#define HVMOP_vmtrace_ipt_disable     2
>> +#define HVMOP_vmtrace_ipt_get_offset  3
>> +    domid_t domain;
>> +    uint32_t vcpu;
>> +    uint64_t size;
>> +
>> +    /* OUT variable */
>> +    uint64_t offset;
>=20
> If this is to be a tools-only interface, please use uint64_aligned_t.
>=20

This type is not defined within hvm_op.h header. What should I do about it?

> You also want to add an entry to xen/include/xlat.lst and use the
> resulting macro to prove that the struct layout is the same for
> native and compat callers.

Could you tell a little bit more about this? What are "native" and
"compat" callers and what is the purpose of this file?


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

