Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3118A9CC08
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968222.1357890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KMH-00075n-IF; Fri, 25 Apr 2025 14:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968222.1357890; Fri, 25 Apr 2025 14:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KMH-00073j-FZ; Fri, 25 Apr 2025 14:48:53 +0000
Received: by outflank-mailman (input) for mailman id 968222;
 Fri, 25 Apr 2025 14:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3Op=XL=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8KMF-00073d-DB
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:48:52 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60cd0186-21e4-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 16:48:40 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 60cd0186-21e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745592519; x=1745851719;
	bh=TKYBxeWi+/1GqXurbs+QgV6+7XatARiJqrZ0rIWIkEA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iLwpBM4moipspVjUIedNhpUPNWr2rm9+qPxl5Lasb76U5npe8UCh7naoa3iJ64aDD
	 XDEEWQ0P1ZqOfYcw/YofCmuCK4qcSdXxEZ5Qgaw2ZH6y3ry7ao/YEQ3vz8E0U69prL
	 1Q8dRAqPr+UafND5f1NJug6iXcMlrOIUKIiQikSfBneOgv5e9M9NKShVhR5HHhDTjC
	 Lag9EWJUiB+3tMWdtI7U69I/embcl6817PFWFNMQY3I9VtmvZwKOQ+cuPTiwls/4nN
	 VhgnlV2OIwHxuo/6uqiJmTkZijRHB3MVXg4+wyZozeV4thkgdXOoDC1DNUzec9Y0io
	 wfRPkDQ61i3ww==
Date: Fri, 25 Apr 2025 14:48:34 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v5 00/12] Hyperlaunch device tree for dom0
Message-ID: <aAugvlVL4iqPAL1h@starscream>
In-Reply-To: <D9FP9XTIH5FT.2SYZUNG1UO138@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com> <aAq41+qsbuJP2JOj@kraken> <D9FP9XTIH5FT.2SYZUNG1UO138@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: aa55d2d5061e0bbc2595bcd80027e452225e304a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:58:01PM +0100, Alejandro Vallejo wrote:
> On Thu Apr 24, 2025 at 11:19 PM BST, dmkhn wrote:
> > On Thu, Apr 24, 2025 at 05:10:10PM +0100, Alejandro Vallejo wrote:
> >> Hi,
> >>
> >> v4: https://lore.kernel.org/xen-devel/20250417124844.11143-1-agarciav@=
amd.com/
> >> v3: https://lore.kernel.org/xen-devel/20250408160802.49870-1-agarciav@=
amd.com/
> >> v2: https://lore.kernel.org/xen-devel/20241226165740.29812-1-dpsmith@a=
pertussolutions.com/
> >> v1: https://lore.kernel.org/xen-devel/20241123182044.30687-1-dpsmith@a=
pertussolutions.com/
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D Original cover letter:
> >>
> >> The Hyperlaunch device tree for dom0 series is the second split out fo=
r the
> >> introduction of the Hyperlaunch domain builder logic. These changes fo=
cus on
> >> introducing the ability to express a domain configuration that is then=
 used to
> >> populate the struct boot_domain structure for dom0. This ability to ex=
press a
> >> domain configuration provides the next step towards a general domain b=
uilder.
> >>
> >> The splitting of Hyperlaunch into a set of series are twofold, to redu=
ce the
> >> effort in reviewing a much larger series, and to reduce the effort in =
handling
> >> the knock-on effects to the construction logic from requested review c=
hanges.
> >>
> >>
> >>
> >> Alejandro Vallejo (1):
> >>   x86/hyperlaunch: Add helpers to locate multiboot modules
> >>
> >> Daniel P. Smith (11):
> >>   kconfig: introduce domain builder config options
> >>   common/hyperlaunch: introduce the domain builder
> >>   x86/hyperlaunch: initial support for hyperlaunch device tree
> >>   x86/hyperlaunch: locate dom0 kernel with hyperlaunch
> >>   x86/hyperlaunch: obtain cmdline from device tree
> >>   x86/hyperlaunch: locate dom0 initrd with hyperlaunch
> >>   x86/hyperlaunch: add domain id parsing to domain config
> >>   x86/hyperlaunch: specify dom0 mode with device tree
> >>   x86/hyperlaunch: add memory parsing to domain config
> >>   x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
> >>   x86/hyperlaunch: add capabilities to boot domain
> >
> > One general comment w.r.t. naming notation in:
> >
> >     xen/common/domain-builder/fdt.c
> >     xen/common/domain-builder/fdt.h
> >
> > Sorry, overlooked that earlier.
> >
> > What do you think about using fdt_<something> notation for all function=
s in
> > fdt.{c,h}?
> >
> > For example:
> >
> >     s/detect_fdt_kind/fdt_detect_hyperlauch_node/
>                                          ^
> =09=09=09=09=09 kind?
> >
> >     s/find_hyperlaunch_node/fdt_find_hyperlauch_node/
> >
> >     s/walk_hyperlaunch_fdt/fdt_walk_hyperlauch_node/
> >
> >     s/process_domain_node/fdt_process_hyperlauch_node/
>                                          ^
> =09=09=09=09=09 domain?
>=20
> Assuming the two nits above are mistakes on copy-paste, it sounds
> reasonable. I'll wait for some acks on the rest and resend with those
> adjustments if needed.

Sounds good!
Yep, my point is let's use prefix for consistency.

>=20
> >
> > Other than that:
> >
> > Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> >
> > for the series.
>=20
> Thanks a lot!
>=20
> Cheers,
> Alejandro


