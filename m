Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C5215529
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsO4K-0002GJ-TS; Mon, 06 Jul 2020 10:09:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YXjd=AR=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jsO4J-0002GE-KD
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:09:47 +0000
X-Inumbo-ID: ceb9525e-bf70-11ea-8c57-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceb9525e-bf70-11ea-8c57-12813bfff9fa;
 Mon, 06 Jul 2020 10:09:42 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A5DA3A1B9C;
 Mon,  6 Jul 2020 12:09:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 93F56A1BD5;
 Mon,  6 Jul 2020 12:09:39 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oYHSO-5wdzop; Mon,  6 Jul 2020 12:09:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 062E1A1D68;
 Mon,  6 Jul 2020 12:09:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 82akefxhuzMI; Mon,  6 Jul 2020 12:09:38 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CE771A1BD5;
 Mon,  6 Jul 2020 12:09:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B572A20213;
 Mon,  6 Jul 2020 12:09:08 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7Hbydrl07Y6H; Mon,  6 Jul 2020 12:09:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2ACD82225B;
 Mon,  6 Jul 2020 12:09:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kZUPg1xi0CTH; Mon,  6 Jul 2020 12:09:03 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0779E22000;
 Mon,  6 Jul 2020 12:09:03 +0200 (CEST)
Date: Mon, 6 Jul 2020 12:09:02 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <212702848.20024300.1594030142855.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200706084234.GB735@Air-de-Roger>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
 <20200706084234.GB735@Air-de-Roger>
Subject: Re: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF78 (Linux)/8.6.0_GA_1194)
Thread-Topic: x86/hvm: processor trace interface in HVM
Thread-Index: kKPsq4Ntrkk4nefrR9JmowrKpzS5XQ==
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
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 6 lip 2020 o 10:42, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Sun, Jul 05, 2020 at 08:54:59PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>>=20
>> Implement necessary changes in common code/HVM to support
>> processor trace features. Define vmtrace_pt_* API and
>> implement trace buffer allocation/deallocation in common
>> code.
>>=20
>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>> ---
>>  xen/arch/x86/domain.c         | 19 +++++++++++++++++++
>>  xen/common/domain.c           | 19 +++++++++++++++++++
>>  xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
>>  xen/include/xen/sched.h       |  4 ++++
>>  4 files changed, 62 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index fee6c3931a..79c9794408 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d)
>>                  altp2m_vcpu_disable_ve(v);
>>          }
>> =20
>> +        for_each_vcpu ( d, v )
>> +        {
>> +            unsigned int i;
>> +
>> +            if ( !v->vmtrace.pt_buf )
>> +                continue;
>> +
>> +            for ( i =3D 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHIF=
T); i++ )
>> +            {
>> +                struct page_info *pg =3D mfn_to_page(
>> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
>> +                if ( (pg->count_info & PGC_count_mask) !=3D 1 )
>> +                    return -EBUSY;
>> +            }
>> +
>> +            free_domheap_pages(v->vmtrace.pt_buf,
>> +                get_order_from_bytes(v->domain->vmtrace_pt_size));
>=20
> This is racy as a control domain could take a reference between the
> check and the freeing.
>=20
>> +        }
>> +
>>          if ( is_pv_domain(d) )
>>          {
>>              for_each_vcpu ( d, v )
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 25d3359c5b..f480c4e033 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -137,6 +137,21 @@ static void vcpu_destroy(struct vcpu *v)
>>      free_vcpu_struct(v);
>>  }
>> =20
>> +static int vmtrace_alloc_buffers(struct vcpu *v)
>> +{
>> +    struct page_info *pg;
>> +    uint64_t size =3D v->domain->vmtrace_pt_size;
>> +
>> +    pg =3D alloc_domheap_pages(v->domain, get_order_from_bytes(size),
>> +                             MEMF_no_refcount);
>> +
>> +    if ( !pg )
>> +        return -ENOMEM;
>> +
>> +    v->vmtrace.pt_buf =3D pg;
>> +    return 0;
>> +}
>=20
> I think we already agreed that you would use the same model as ioreq
> servers, where a reference is taken on allocation and then the pages
> are not explicitly freed on domain destruction and put_page_and_type
> is used. Is there some reason why that model doesn't work in this
> case?
>=20
> If not, please see hvm_alloc_ioreq_mfn and hvm_free_ioreq_mfn.
>=20
> Roger.


Ok, I've got it, will do. Thanks for pointing out the examples.


One thing that is confusing to me is that I don't get what is
the meaning of MEMF_no_refcount flag.

In the hvm_{alloc,free}_ioreq_mfn the memory is allocated
explicitly but freed just by putting out the reference, so
I guess it's automatically detected that the refcount dropped to 0
and the page should be freed? If so, why the flag is named "no refcount"?


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

