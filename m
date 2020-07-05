Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0F214ED7
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 21:12:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsA3b-0008Rx-JZ; Sun, 05 Jul 2020 19:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgbI=AQ=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jsA3a-0008Rr-5d
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 19:12:06 +0000
X-Inumbo-ID: 68bce16e-bef3-11ea-8c07-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68bce16e-bef3-11ea-8c07-12813bfff9fa;
 Sun, 05 Jul 2020 19:12:03 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B4FC7A20D0;
 Sun,  5 Jul 2020 21:12:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AFB94A1F5F;
 Sun,  5 Jul 2020 21:12:01 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9YjeorauOy19; Sun,  5 Jul 2020 21:12:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2E434A20D0;
 Sun,  5 Jul 2020 21:12:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9Sb-ECyKpntJ; Sun,  5 Jul 2020 21:12:01 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0649FA1F5F;
 Sun,  5 Jul 2020 21:12:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id DF00D22B81;
 Sun,  5 Jul 2020 21:11:30 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qsaOUekXGdrE; Sun,  5 Jul 2020 21:11:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 52C44226F9;
 Sun,  5 Jul 2020 21:11:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id O5e_p3PByzIt; Sun,  5 Jul 2020 21:11:25 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 31019225FD;
 Sun,  5 Jul 2020 21:11:25 +0200 (CEST)
Date: Sun, 5 Jul 2020 21:11:25 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <762195600.19745364.1593976285067.JavaMail.zimbra@cert.pl>
In-Reply-To: <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
Subject: Re: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/hvm: processor trace interface in HVM
Thread-Index: mWFwsvM7AQVGQ/Hxmuqg6b8gSpO+Mg==
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
 luwei kang <luwei.kang@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas lengyel <tamas.lengyel@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 5 lip 2020 o 20:54, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>=20
> Implement necessary changes in common code/HVM to support
> processor trace features. Define vmtrace_pt_* API and
> implement trace buffer allocation/deallocation in common
> code.
>=20
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
> xen/arch/x86/domain.c         | 19 +++++++++++++++++++
> xen/common/domain.c           | 19 +++++++++++++++++++
> xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
> xen/include/xen/sched.h       |  4 ++++
> 4 files changed, 62 insertions(+)
>=20
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index fee6c3931a..79c9794408 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d)
>                 altp2m_vcpu_disable_ve(v);
>         }
>=20
> +        for_each_vcpu ( d, v )
> +        {
> +            unsigned int i;
> +
> +            if ( !v->vmtrace.pt_buf )
> +                continue;
> +
> +            for ( i =3D 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHIFT=
); i++ )
> +            {
> +                struct page_info *pg =3D mfn_to_page(
> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
> +                if ( (pg->count_info & PGC_count_mask) !=3D 1 )
> +                    return -EBUSY;
> +            }
> +
> +            free_domheap_pages(v->vmtrace.pt_buf,
> +                get_order_from_bytes(v->domain->vmtrace_pt_size));


While this works, I don't feel that this is a good solution with this loop
returning -EBUSY here. I would like to kindly ask for suggestions regarding
this topic.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

