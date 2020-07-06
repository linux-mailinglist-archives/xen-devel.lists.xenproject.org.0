Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31160215546
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsO8U-00032x-Ft; Mon, 06 Jul 2020 10:14:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YXjd=AR=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jsO8T-00032s-5U
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:14:05 +0000
X-Inumbo-ID: 6adeea18-bf71-11ea-8c58-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6adeea18-bf71-11ea-8c58-12813bfff9fa;
 Mon, 06 Jul 2020 10:14:04 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0522DA1A26;
 Mon,  6 Jul 2020 12:14:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E6CB3A1B27;
 Mon,  6 Jul 2020 12:14:01 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KcEDN4c_ZRPT; Mon,  6 Jul 2020 12:14:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 32959A1B28;
 Mon,  6 Jul 2020 12:14:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NEeJNtNS_Ked; Mon,  6 Jul 2020 12:14:01 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 05487A1A26;
 Mon,  6 Jul 2020 12:14:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 49E65214C4;
 Mon,  6 Jul 2020 12:13:27 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0mCTzcvk2y-m; Mon,  6 Jul 2020 12:13:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C6AC8218F8;
 Mon,  6 Jul 2020 12:13:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bKsfJBvLaDHp; Mon,  6 Jul 2020 12:13:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9A1A3215FB;
 Mon,  6 Jul 2020 12:13:21 +0200 (CEST)
Date: Mon, 6 Jul 2020 12:13:21 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <2097446473.20028399.1594030401534.JavaMail.zimbra@cert.pl>
In-Reply-To: <5d52b37e391a4165dc3775f77a621d34a33d22c2.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <5d52b37e391a4165dc3775f77a621d34a33d22c2.1593974333.git.michal.leszczynski@cert.pl>
Subject: Re: [PATCH v5 04/11] common: add vmtrace_pt_size domain parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF78 (Linux)/8.6.0_GA_1194)
Thread-Topic: common: add vmtrace_pt_size domain parameter
Thread-Index: X8jw5uxalIiqVyGnDoKGxt48USyScg==
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
 tamas lengyel <tamas.lengyel@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 5 lip 2020 o 20:54, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>=20
> Add vmtrace_pt_size domain parameter in live domain and
> vmtrace_pt_order parameter in xen_domctl_createdomain.
>=20
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
> xen/common/domain.c         | 12 ++++++++++++
> xen/include/public/domctl.h |  1 +
> xen/include/xen/sched.h     |  4 ++++
> 3 files changed, 17 insertions(+)
>=20
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index a45cf023f7..25d3359c5b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -338,6 +338,12 @@ static int sanitise_domain_config(struct
> xen_domctl_createdomain *config)
>         return -EINVAL;
>     }
>=20
> +    if ( config->vmtrace_pt_order && !vmtrace_supported )
> +    {
> +        dprintk(XENLOG_INFO, "Processor tracing is not supported\n");
> +        return -EINVAL;
> +    }
> +
>     return arch_sanitise_domain_config(config);
> }
>=20
> @@ -443,6 +449,12 @@ struct domain *domain_create(domid_t domid,
>         d->nr_pirqs =3D min(d->nr_pirqs, nr_irqs);
>=20
>         radix_tree_init(&d->pirq_tree);
> +
> +        if ( config->vmtrace_pt_order )
> +        {
> +            uint32_t shift_val =3D config->vmtrace_pt_order + PAGE_SHIFT=
;
> +            d->vmtrace_pt_size =3D (1ULL << shift_val);
> +        }
>     }
>=20
>     if ( (err =3D arch_domain_create(d, config)) !=3D 0 )
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 59bdc28c89..7b8289d436 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>     uint32_t max_evtchn_port;
>     int32_t max_grant_frames;
>     int32_t max_maptrack_frames;
> +    uint8_t vmtrace_pt_order;
>=20
>     struct xen_arch_domainconfig arch;
> };
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ac53519d7f..48f0a61bbd 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,10 @@ struct domain
>     unsigned    pbuf_idx;
>     spinlock_t  pbuf_lock;
>=20
> +    /* Used by vmtrace features */
> +    spinlock_t  vmtrace_lock;
> +    uint64_t    vmtrace_pt_size;
> +
>     /* OProfile support. */
>     struct xenoprof *xenoprof;
>=20
> --
> 2.17.1


Just a note to myself: in v4 it was suggested by Jan that we should
go with "number of kB" instead of "number of bytes" and the type
could be uint32_t.

I will modify it in such way within the next version.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

