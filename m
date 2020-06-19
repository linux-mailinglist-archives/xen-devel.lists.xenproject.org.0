Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA471FFF6B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 02:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm5BU-0007Y4-8M; Fri, 19 Jun 2020 00:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=318C=AA=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm5BS-0007Xz-NM
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 00:47:06 +0000
X-Inumbo-ID: 6535c072-b1c6-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6535c072-b1c6-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 00:47:05 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 192CFA317E;
 Fri, 19 Jun 2020 02:47:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0213FA3013;
 Fri, 19 Jun 2020 02:47:03 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WUzRUmcp1MrN; Fri, 19 Jun 2020 02:47:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7A087A317E;
 Fri, 19 Jun 2020 02:47:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XPbQq1Wdyg6o; Fri, 19 Jun 2020 02:47:02 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 42CCEA3013;
 Fri, 19 Jun 2020 02:47:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2967021000;
 Fri, 19 Jun 2020 02:46:32 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0UrZxVoLe2hT; Fri, 19 Jun 2020 02:46:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B317921128;
 Fri, 19 Jun 2020 02:46:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rUoXKgizFVyL; Fri, 19 Jun 2020 02:46:26 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 90B3E21000;
 Fri, 19 Jun 2020 02:46:26 +0200 (CEST)
Date: Fri, 19 Jun 2020 02:46:26 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1171450280.9822275.1592527586479.JavaMail.zimbra@cert.pl>
In-Reply-To: <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyEuhVFaU7P5v8mM=
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
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 1:41, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> Provide an interface for privileged domains to manage
> external IPT monitoring. Guest IPT state will be preserved
> across vmentry/vmexit using ipt_state structure.
>=20
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---

...

> +struct xen_hvm_vmtrace_op {
> +    /* IN variable */
> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define HVMOP_vmtrace_ipt_enable      1
> +#define HVMOP_vmtrace_ipt_disable     2
> +#define HVMOP_vmtrace_ipt_get_offset  3
> +    domid_t domain;
> +    uint32_t vcpu;
> +    uint64_t size;
> +
> +    /* OUT variable */
> +    uint64_t offset;
> +};
> +typedef struct xen_hvm_vmtrace_op xen_hvm_vmtrace_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_hvm_vmtrace_op_t);
> +

I've forgotten about the padding thing here. This will be fixed in the next=
 patch version, sorry.

ml

