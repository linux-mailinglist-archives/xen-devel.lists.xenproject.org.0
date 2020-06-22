Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB4A202E7F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 04:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnCWy-0007IT-El; Mon, 22 Jun 2020 02:49:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnCWx-0007IO-5A
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 02:49:55 +0000
X-Inumbo-ID: 0cc22164-b433-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc22164-b433-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 02:49:54 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8A7F0A272E;
 Mon, 22 Jun 2020 04:49:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7E760A25C8;
 Mon, 22 Jun 2020 04:49:52 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 16lp179SGDVI; Mon, 22 Jun 2020 04:49:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0AD30A272E;
 Mon, 22 Jun 2020 04:49:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YnUmZR3bpQ4A; Mon, 22 Jun 2020 04:49:51 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D8CE9A25C8;
 Mon, 22 Jun 2020 04:49:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C66F821B84;
 Mon, 22 Jun 2020 04:49:21 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id EsH0JemhSKHn; Mon, 22 Jun 2020 04:49:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 528F621BA4;
 Mon, 22 Jun 2020 04:49:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XifsTh83YZI6; Mon, 22 Jun 2020 04:49:16 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 34AAA21B84;
 Mon, 22 Jun 2020 04:49:16 +0200 (CEST)
Date: Mon, 22 Jun 2020 04:49:16 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <222341136.10901881.1592794156165.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200619134452.GA735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
 <20200619134452.GA735@Air-de-Roger>
Subject: Re: [PATCH v2 3/7] x86/vmx: add IPT cpu feature
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add IPT cpu feature
Thread-Index: m8aeRlqjhgkyDEuDglIEjaGJfTeSrw==
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
Cc: Kevin Tian <kevin.tian@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 15:44, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Fri, Jun 19, 2020 at 01:40:21AM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> Check if Intel Processor Trace feature is supported by current
>> processor. Define hvm_ipt_supported function.
>>=20
>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>> ---
>=20
> We usually keep a shirt list of the changes between versions, so it's
> easier for the reviewers to know what changed. As an example:
>=20
> https://lore.kernel.org/xen-devel/20200613184132.11880-1-julien@xen.org/
>=20
>>  xen/arch/x86/hvm/vmx/vmcs.c                 | 4 ++++
>>  xen/include/asm-x86/cpufeature.h            | 1 +
>>  xen/include/asm-x86/hvm/hvm.h               | 9 +++++++++
>>  xen/include/asm-x86/hvm/vmx/vmcs.h          | 1 +
>>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>>  5 files changed, 16 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>> index ca94c2bedc..8466ccb912 100644
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -315,6 +315,10 @@ static int vmx_init_vmcs_config(void)
>>          if ( opt_ept_pml )
>>              opt |=3D SECONDARY_EXEC_ENABLE_PML;
>> =20
>> +        /* Check whether IPT is supported in VMX operation */
>> +        hvm_funcs.pt_supported =3D cpu_has_ipt &&
>> +            ( _vmx_misc_cap & VMX_MISC_PT_SUPPORTED );
>=20
> By the placement of this chunk you are tying IPT support to the
> secondary exec availability, but I don't think that's required?
>=20
> Ie: You should move the read of misc_cap to the top-level of the
> function and perform the VMX_MISC_PT_SUPPORTED check there also.
>=20
> Note that space inside parentheses is only required for conditions of
> 'if', 'for' and those kind of statements, here it's not required, so
> this should be:
>=20
>    hvm_funcs.pt_supported =3D cpu_has_ipt &&
>                             (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>=20
> I also think this should look like:
>=20
>    if ( !smp_processor_id() )
>    =09hvm_funcs.pt_supported =3D cpu_has_ipt &&
>                                 (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>    else if ( hvm_funcs.pt_supported &&
>              !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
>    {
>        printk("VMX: IPT capabilities fatally differ between CPU%u and CPU=
0\n",
>               smp_processor_id());
>        return -EINVAL;
>    }
>=20
>=20
> So that you can detect mismatches between CPUs.


I'm afraid this snippet doesn't work. All CPUs read hvm_funcs.pt_supported =
as 0 even when it was set to 1 for CPU=3D0. I'm not sure if this is some mu=
ltithreading issue or there is a separate hvm_funcs for each CPU?

ml


>=20
> Thanks, Roger.

