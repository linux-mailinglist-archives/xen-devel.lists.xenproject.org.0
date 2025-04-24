Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD61BA9BA9D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 00:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967003.1357013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u84uf-0005SS-NT; Thu, 24 Apr 2025 22:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967003.1357013; Thu, 24 Apr 2025 22:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u84uf-0005PY-Jm; Thu, 24 Apr 2025 22:19:21 +0000
Received: by outflank-mailman (input) for mailman id 967003;
 Thu, 24 Apr 2025 22:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zow=XK=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u84ud-0005PS-Cq
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 22:19:20 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 277a2435-215a-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 00:19:14 +0200 (CEST)
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
X-Inumbo-ID: 277a2435-215a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=tgxenni7sbfc7edc44othvna24.protonmail; t=1745533153; x=1745792353;
	bh=xvkh/QbKbXPuXjrXcMxKVt5mJzD8Kz3rDbKHC0eq594=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=F87oYK4hFC8WAyHjei14PBZTYJVQ6bf1ysYIzFn916+k0XWJoO4k62PLdOtoTCKQA
	 3S8qaQxUiWbJhxi0ejdM4JvMiKEjhqTFFdUhPo0+qoRZqzJUfI8qGBRmiQ2biktaKj
	 2LvRKpEJmibvZsuIqgUnccssta8OV6PeSQqfbhBTYOgn53Yf3vlOI/oF/BpT0ZwNZx
	 637wfgQOutxyJ5J9dSVBHCwLoZedEWLgNU1OAObER8ZEK254Cw3mtm8lLhPPOfCM2I
	 blUwPtijrOarGKxl2qd8poj34oaQYGgMwOLJTPOPtbnMYQQIqSVBT52rCjQlCaU/+f
	 /S2rhtSrO+D1w==
Date: Thu, 24 Apr 2025 22:19:06 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v5 00/12] Hyperlaunch device tree for dom0
Message-ID: <aAq41+qsbuJP2JOj@kraken>
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b08883e76e4372e0aab45615f902c743348a1411
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 05:10:10PM +0100, Alejandro Vallejo wrote:
> Hi,
>=20
> v4: https://lore.kernel.org/xen-devel/20250417124844.11143-1-agarciav@amd=
.com/
> v3: https://lore.kernel.org/xen-devel/20250408160802.49870-1-agarciav@amd=
.com/
> v2: https://lore.kernel.org/xen-devel/20241226165740.29812-1-dpsmith@aper=
tussolutions.com/
> v1: https://lore.kernel.org/xen-devel/20241123182044.30687-1-dpsmith@aper=
tussolutions.com/
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D Original cover letter:
>=20
> The Hyperlaunch device tree for dom0 series is the second split out for t=
he
> introduction of the Hyperlaunch domain builder logic. These changes focus=
 on
> introducing the ability to express a domain configuration that is then us=
ed to
> populate the struct boot_domain structure for dom0. This ability to expre=
ss a
> domain configuration provides the next step towards a general domain buil=
der.
>=20
> The splitting of Hyperlaunch into a set of series are twofold, to reduce =
the
> effort in reviewing a much larger series, and to reduce the effort in han=
dling
> the knock-on effects to the construction logic from requested review chan=
ges.
>=20
>=20
>=20
> Alejandro Vallejo (1):
>   x86/hyperlaunch: Add helpers to locate multiboot modules
>=20
> Daniel P. Smith (11):
>   kconfig: introduce domain builder config options
>   common/hyperlaunch: introduce the domain builder
>   x86/hyperlaunch: initial support for hyperlaunch device tree
>   x86/hyperlaunch: locate dom0 kernel with hyperlaunch
>   x86/hyperlaunch: obtain cmdline from device tree
>   x86/hyperlaunch: locate dom0 initrd with hyperlaunch
>   x86/hyperlaunch: add domain id parsing to domain config
>   x86/hyperlaunch: specify dom0 mode with device tree
>   x86/hyperlaunch: add memory parsing to domain config
>   x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
>   x86/hyperlaunch: add capabilities to boot domain

One general comment w.r.t. naming notation in:

    xen/common/domain-builder/fdt.c
    xen/common/domain-builder/fdt.h

Sorry, overlooked that earlier.

What do you think about using fdt_<something> notation for all functions in
fdt.{c,h}?

For example:

    s/detect_fdt_kind/fdt_detect_hyperlauch_node/

    s/find_hyperlaunch_node/fdt_find_hyperlauch_node/

    s/walk_hyperlaunch_fdt/fdt_walk_hyperlauch_node/

    s/process_domain_node/fdt_process_hyperlauch_node/

Other than that:

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

for the series.

>=20
>  xen/arch/x86/dom0_build.c              |  11 +
>  xen/arch/x86/include/asm/boot-domain.h |  14 +
>  xen/arch/x86/include/asm/bootinfo.h    |  10 +-
>  xen/arch/x86/setup.c                   |  64 +++-
>  xen/common/Kconfig                     |   2 +
>  xen/common/Makefile                    |   1 +
>  xen/common/domain-builder/Kconfig      |  15 +
>  xen/common/domain-builder/Makefile     |   2 +
>  xen/common/domain-builder/core.c       |  86 +++++
>  xen/common/domain-builder/fdt.c        | 512 +++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.h        |  40 ++
>  xen/include/xen/domain-builder.h       |  37 ++
>  xen/include/xen/libfdt/libfdt-xen.h    |  23 ++
>  13 files changed, 800 insertions(+), 17 deletions(-)
>  create mode 100644 xen/common/domain-builder/Kconfig
>  create mode 100644 xen/common/domain-builder/Makefile
>  create mode 100644 xen/common/domain-builder/core.c
>  create mode 100644 xen/common/domain-builder/fdt.c
>  create mode 100644 xen/common/domain-builder/fdt.h
>  create mode 100644 xen/include/xen/domain-builder.h
>=20
> --
> 2.43.0
>=20
>=20


