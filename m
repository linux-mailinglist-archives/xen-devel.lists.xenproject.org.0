Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5F200B51
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 16:23:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmHvB-0006S6-Kq; Fri, 19 Jun 2020 14:23:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=318C=AA=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jmHvA-0006S1-LA
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 14:23:08 +0000
X-Inumbo-ID: 64c99a9c-b238-11ea-bb8d-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64c99a9c-b238-11ea-bb8d-12813bfff9fa;
 Fri, 19 Jun 2020 14:23:07 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 60B9DA34AB;
 Fri, 19 Jun 2020 16:23:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 51A41A34A9;
 Fri, 19 Jun 2020 16:23:05 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GIPNdGmJpqXx; Fri, 19 Jun 2020 16:23:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AD72EA34AB;
 Fri, 19 Jun 2020 16:23:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2hoFb0Vus2Zp; Fri, 19 Jun 2020 16:23:04 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7ACEAA34A9;
 Fri, 19 Jun 2020 16:23:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 630E222545;
 Fri, 19 Jun 2020 16:22:34 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IMX6U4J8ygIo; Fri, 19 Jun 2020 16:22:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D5D8C225BE;
 Fri, 19 Jun 2020 16:22:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TClQRQzEUa34; Fri, 19 Jun 2020 16:22:28 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id B288E2252E;
 Fri, 19 Jun 2020 16:22:28 +0200 (CEST)
Date: Fri, 19 Jun 2020 16:22:28 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <445735893.10257958.1592576548575.JavaMail.zimbra@cert.pl>
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
Thread-Index: 1g23H8hkLlU0wPEd8HWtNPXINDQbVQ==
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

There is a change list in the cover letter. Should I also add changelog for
each individual patch?


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


I will fix this.


>=20
> Thanks, Roger.

