Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC5E215595
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsOQ2-0004wB-1G; Mon, 06 Jul 2020 10:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YXjd=AR=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jsOQ0-0004vu-Hs
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:32:12 +0000
X-Inumbo-ID: f3354a68-bf73-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3354a68-bf73-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 10:32:11 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B9A5EA1B37;
 Mon,  6 Jul 2020 12:32:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 77916A1B18;
 Mon,  6 Jul 2020 12:32:09 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Bm39aKqkoNb4; Mon,  6 Jul 2020 12:32:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0C75FA1B37;
 Mon,  6 Jul 2020 12:32:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gXmw1oTsNEUM; Mon,  6 Jul 2020 12:32:08 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D4834A1B18;
 Mon,  6 Jul 2020 12:32:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id BCDD920D7F;
 Mon,  6 Jul 2020 12:31:38 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id x-pioaoD2w5G; Mon,  6 Jul 2020 12:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 558FF21FBD;
 Mon,  6 Jul 2020 12:31:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ELyjZpak_Gd0; Mon,  6 Jul 2020 12:31:33 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3443921EA4;
 Mon,  6 Jul 2020 12:31:33 +0200 (CEST)
Date: Mon, 6 Jul 2020 12:31:33 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1352820634.20043216.1594031493113.JavaMail.zimbra@cert.pl>
In-Reply-To: <8685426c-0b79-e967-dfce-e9d2e7d21401@suse.com>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
 <762195600.19745364.1593976285067.JavaMail.zimbra@cert.pl>
 <8685426c-0b79-e967-dfce-e9d2e7d21401@suse.com>
Subject: Re: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF78 (Linux)/8.6.0_GA_1194)
Thread-Topic: x86/hvm: processor trace interface in HVM
Thread-Index: R4+dZII/UrtZVSJLA93ofFwNlCxYxQ==
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 6 lip 2020 o 10:31, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 05.07.2020 21:11, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 5 lip 2020 o 20:54, Micha=C5=82 Leszczy=C5=84ski michal.leszczynsk=
i@cert.pl
>> napisa=C5=82(a):
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d=
)
>>>                 altp2m_vcpu_disable_ve(v);
>>>         }
>>>
>>> +        for_each_vcpu ( d, v )
>>> +        {
>>> +            unsigned int i;
>>> +
>>> +            if ( !v->vmtrace.pt_buf )
>>> +                continue;
>>> +
>>> +            for ( i =3D 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHI=
FT); i++ )
>>> +            {
>>> +                struct page_info *pg =3D mfn_to_page(
>>> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
>>> +                if ( (pg->count_info & PGC_count_mask) !=3D 1 )
>>> +                    return -EBUSY;
>>> +            }
>>> +
>>> +            free_domheap_pages(v->vmtrace.pt_buf,
>>> +                get_order_from_bytes(v->domain->vmtrace_pt_size));
>>=20
>>=20
>> While this works, I don't feel that this is a good solution with this lo=
op
>> returning -EBUSY here. I would like to kindly ask for suggestions regard=
ing
>> this topic.
>=20
> I'm sorry to ask, but with the previously give suggestions to mirror
> existing code, why do you still need to play with this function? You
> really shouldn't have a need to, just like e.g. the ioreq server page
> handling code didn't.
>=20
> Jan


Ok, sorry. I think I've finally got it after latest Roger's suggestions :P

This will be fixed in the next version.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

