Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011D202E7C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 04:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnCT8-00075e-UO; Mon, 22 Jun 2020 02:45:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnCT7-00075Z-VE
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 02:45:57 +0000
X-Inumbo-ID: 7ef41d42-b432-11ea-be2b-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ef41d42-b432-11ea-be2b-12813bfff9fa;
 Mon, 22 Jun 2020 02:45:56 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 51E38A2735;
 Mon, 22 Jun 2020 04:45:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3E874A272E;
 Mon, 22 Jun 2020 04:45:54 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id a7WyR7uYazyS; Mon, 22 Jun 2020 04:45:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A0090A2735;
 Mon, 22 Jun 2020 04:45:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3dDfVGCViHz3; Mon, 22 Jun 2020 04:45:53 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6C0E5A272E;
 Mon, 22 Jun 2020 04:45:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 54BBF21B70;
 Mon, 22 Jun 2020 04:45:23 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zq17v4hpkMiR; Mon, 22 Jun 2020 04:45:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D504121B84;
 Mon, 22 Jun 2020 04:45:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FJuc2iGxDVV5; Mon, 22 Jun 2020 04:45:17 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id A697221B70;
 Mon, 22 Jun 2020 04:45:17 +0200 (CEST)
Date: Mon, 22 Jun 2020 04:45:17 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <922166039.10901755.1592793917485.JavaMail.zimbra@cert.pl>
In-Reply-To: <bd788041-f2cd-c5fc-cfb8-df89816cb27c@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <20200619153003.GB735@Air-de-Roger>
 <bd788041-f2cd-c5fc-cfb8-df89816cb27c@suse.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: Jqc1uJ7WJHJxmr7vi9qQTOYlMrKEPA==
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

----- 19 cze 2020 o 17:50, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 19.06.2020 17:30, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Jun 19, 2020 at 01:41:03AM +0200, Micha=C5=82 Leszczy=C5=84ski w=
rote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -1612,6 +1612,24 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>>      return rc;
>>>  }
>>> =20
>>> +void hvm_vmtrace_destroy(struct vcpu *v)
>>> +{
>>> +    unsigned int i;
>>> +    struct page_info *pg;
>>> +    struct ipt_state *ipt =3D v->arch.hvm.vmx.ipt_state;
>>> +    mfn_t buf_mfn =3D ipt->output_base >> PAGE_SHIFT;
>>=20
>> Does this build? I think you are missing a _mfn(...) here?
>=20
> This as well as ...
>=20
>>> +    size_t buf_size =3D ipt->output_mask.size + 1;
>>> +
>>> +    xfree(ipt);
>>> +    v->arch.hvm.vmx.ipt_state =3D NULL;
>>> +
>>> +    for ( i =3D 0; i < (buf_size >> PAGE_SHIFT); i++ )
>>> +    {
>>> +        pg =3D mfn_to_page(_mfn(mfn_add(buf_mfn, i)));
>=20
> ... the extra _mfn() here suggest the code was only ever built in
> release mode so far.
>=20
> Jan


Ah, I forgot to enable developer checks. This will be corrected in v3.

ml

