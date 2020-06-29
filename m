Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08220CDB3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 11:53:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpqTb-0004Zu-UW; Mon, 29 Jun 2020 09:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xbIG=AK=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jpqTa-0004Zp-Sj
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:53:22 +0000
X-Inumbo-ID: 5b1f4fce-b9ee-11ea-854b-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b1f4fce-b9ee-11ea-854b-12813bfff9fa;
 Mon, 29 Jun 2020 09:53:17 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6A2DAA32E7;
 Mon, 29 Jun 2020 11:53:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 54AB9A32ED;
 Mon, 29 Jun 2020 11:53:15 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CDJxFrooTXtx; Mon, 29 Jun 2020 11:53:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C950CA331E;
 Mon, 29 Jun 2020 11:53:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OvJY6IZn5EmD; Mon, 29 Jun 2020 11:53:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9CC2DA32F7;
 Mon, 29 Jun 2020 11:53:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 86A1B217A8;
 Mon, 29 Jun 2020 11:52:44 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VgWou8LoNQDX; Mon, 29 Jun 2020 11:52:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1192C22384;
 Mon, 29 Jun 2020 11:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YAP54UhC_FmH; Mon, 29 Jun 2020 11:52:38 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id DE19322200;
 Mon, 29 Jun 2020 11:52:38 +0200 (CEST)
Date: Mon, 29 Jun 2020 11:52:38 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1499783228.15242029.1593424358779.JavaMail.zimbra@cert.pl>
In-Reply-To: <250cd39e-aa51-5397-93f9-b863e4f51269@citrix.com>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <97440747.11443782.1592849498089.JavaMail.zimbra@cert.pl>
 <250cd39e-aa51-5397-93f9-b863e4f51269@citrix.com>
Subject: Re: [PATCH v3 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: AjJbiO0gwAzlAbg4i2xQMtSXSUVSjA==
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
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 23 cze 2020 o 13:54, Andrew Cooper andrew.cooper3@citrix.com napisa=
=C5=82(a):
> Overall, the moving parts of this series needs to split out into rather
> more patches.
>=20
> First, in patch 3, the hvm_funcs.pt_supported isn't the place for that
> to live.=C2=A0 You want a global "bool vmtrace_supported" in common/domai=
n.c
> which vmx_init_vmcs_config() sets, and the ARM code can set in the
> future when CoreSight is added.
>=20
> Next, you want a patch in isolation which adds vmtrace_pt_size (or
> whatever it ends up being) to createdomain, where all
> allocation/deallocation logic lives in common/domain.c.=C2=A0 The spinloc=
k
> (if its needed, but I don't think it is) wants initialising early in
> domain_create(), alongside d->pbuf_lock, and you also need an extra
> clause in sanitise_domain_config() which rejects a vmtrace setting if
> vmtrace isn't supported.=C2=A0 You'll need to put the struct page_info *
> pointer to the memory allocation in struct vcpu, and adjust the vcpu
> create/destroy logic appropriately.
>=20
> Next, you want a patch doing the acquire resource logic for userspace to
> map the buffers.
>=20
> Next, you want a patch to introduce a domctl with the various runtime
> enable/disable settings which were in an hvmop here.
>=20
> Next, you want a patch to do the VMX plumbing, both at create, and runtim=
e.
>=20
> This ought to lay the logic out in a way which is extendable to x86 PV
> guests and ARM CoreSight, and oughtn't to explode when creating guests
> on non-Intel hardware.
>=20
> Thanks,
>=20
> ~Andrew


Thanks for your review, I'm almost done addressing all these remarks.
I've converted HVMOP to DOMCTL and splitted patches to smaller pieces.

I will send v4 soon.


Best regards,
Micha=C5=82 Leszczy=C5=84ski

