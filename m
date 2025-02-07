Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714CBA2D17E
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 00:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884142.1293940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXnd-00053F-P9; Fri, 07 Feb 2025 23:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884142.1293940; Fri, 07 Feb 2025 23:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXnd-00050q-MM; Fri, 07 Feb 2025 23:30:17 +0000
Received: by outflank-mailman (input) for mailman id 884142;
 Fri, 07 Feb 2025 23:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vKp5=U6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tgXnc-00050k-BM
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 23:30:16 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a969175-e5ab-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 00:30:13 +0100 (CET)
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
X-Inumbo-ID: 7a969175-e5ab-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=csjdd2qndrb6plvum4cttupo5i.protonmail; t=1738971012; x=1739230212;
	bh=EOPU3rGK8DuPD8zZq2b8ijByikELSBuu7ZvvjhWFNao=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=i7qbOZo0YEw1bYqZ1sZfopGd4KhVusRmgDPu8gAvbif+MIXC8RkrGg1c1oDmFTH3d
	 F9S+s6RY3X+J63IvR/gg153MkywqNNv2nisCwiMnI7hw6bZEmkg5l/9GrdBTD6maC+
	 VmNqdLrFyjGKw8kUjhpOYt6Q+qOvWTnV+3rqOe80BIWitfH5EZCKsYUQMhJhuVubiT
	 jc513/GKGDgAg+kr4YY7jEVYQ4XydN0Lq4nw1ge/Nj7gVxWLs5ef9nPkynGO4Mds4F
	 sDRufvINBX7Ri2grXClh/l2Iya5XN5S+QR432+ZfueKR6h0TW42/sEyKIke7IORf/b
	 Z7mFNMjczgCkQ==
Date: Fri, 07 Feb 2025 23:30:05 +0000
To: dmukhin@ford.com
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 18/24] xen/include: introduce resource.h
Message-ID: <gFP8o-VPzObum0VRe8WZ-RuDs_A8_UYXPDx5ybgbsVJTKpauPNJpW0f7gvsqQfqWkUTD0rQh7d1e5FoBc9oRQ-P4pFKkZPl1jJWpnY7i73w=@proton.me>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-18-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-18-c5d36b31d66c@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9302fab0ae065caebfc6cf83d969f7feb9da732f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, January 3rd, 2025 at 5:58 PM, Denis Mukhin via B4 Relay <devnull=
+dmukhin.ford.com@kernel.org> wrote:

>=20
>=20
> From: Denis Mukhin dmukhin@ford.com
>=20
>=20
> Move common resource definitions to a new architecture-agnostic shared he=
ader
> file.

Moved to:
  https://lore.kernel.org/xen-devel/20250207231814.3863449-1-dmukhin@ford.c=
om/

>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
> ---
> It will be used in follow on NS8250 emulator code to describe legacy
> PC COM resources.
> ---
> ---
> xen/common/device-tree/device-tree.c | 21 +--------------------
> xen/drivers/passthrough/arm/smmu.c | 15 +--------------
> xen/include/xen/resource.h | 34 ++++++++++++++++++++++++++++++++++
> 3 files changed, 36 insertions(+), 34 deletions(-)
>=20
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tre=
e/device-tree.c
> index d0528c5825651f7cc9ebca0c949229c9083063c6..e8f810b2fe10890c033ed3a9d=
4ca627010ad019b 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -24,6 +24,7 @@
> #include <xen/ctype.h>
>=20
> #include <asm/setup.h>
>=20
> #include <xen/err.h>
>=20
> +#include <xen/resource.h>
>=20
>=20
> const void *device_tree_flattened;
> dt_irq_xlate_func dt_irq_xlate;
> @@ -535,26 +536,6 @@ int dt_child_n_size_cells(const struct dt_device_nod=
e parent)
> return __dt_n_size_cells(parent, true);
> }
>=20
> -/
> - * These are defined in Linux where much of this code comes from, but
> - * are currently unused outside this file in the context of Xen.
> - /
> -#define IORESOURCE_BITS 0x000000ff / Bus-specific bits /
> -
> -#define IORESOURCE_TYPE_BITS 0x00001f00 / Resource type /
> -#define IORESOURCE_IO 0x00000100 / PCI/ISA I/O ports /
> -#define IORESOURCE_MEM 0x00000200
> -#define IORESOURCE_REG 0x00000300 / Register offsets /
> -#define IORESOURCE_IRQ 0x00000400
> -#define IORESOURCE_DMA 0x00000800
> -#define IORESOURCE_BUS 0x00001000
> -
> -#define IORESOURCE_PREFETCH 0x00002000 / No side effects /
> -#define IORESOURCE_READONLY 0x00004000
> -#define IORESOURCE_CACHEABLE 0x00008000
> -#define IORESOURCE_RANGELENGTH 0x00010000
> -#define IORESOURCE_SHADOWABLE 0x00020000
> -
> /
> * Default translator (generic bus)
> */
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index 03d22bce1e497e41834c273f9048b98dcbd48a54..aa6a968b574dce7cc753e8070=
fad3a6e585cd9e7 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -50,6 +50,7 @@
> #include <xen/rbtree.h>
>=20
> #include <xen/sched.h>
>=20
> #include <xen/sizes.h>
>=20
> +#include <xen/resource.h>
>=20
> #include <asm/atomic.h>
>=20
> #include <asm/device.h>
>=20
> #include <asm/io.h>
>=20
> @@ -70,22 +71,8 @@
> #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, p=
name, out))
> #define of_property_read_bool dt_property_read_bool
> #define of_parse_phandle_with_args dt_parse_phandle_with_args
> -
> -/* Xen: Helpers to get device MMIO and IRQs */
> -struct resource
> -{
> - paddr_t addr;
> - paddr_t size;
> - unsigned int type;
> -};
> -
> -#define resource_size(res) (res)->size;
>=20
> -
> #define platform_device dt_device_node
>=20
> -#define IORESOURCE_MEM 0
> -#define IORESOURCE_IRQ 1
> -
> static struct resource *platform_get_resource(struct platform_device pdev=
,
> unsigned int type,
> unsigned int num)
> diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4512658133defe8dc62d87192=
ffd19ad94b63c3b
> --- /dev/null
> +++ b/xen/include/xen/resource.h
> @@ -0,0 +1,34 @@
> +/ SPDX-License-Identifier: GPL-2.0-only /
> +/
> + * System resource description.
> + /
> +#ifndef XEN__RESOURCE_H
> +#define XEN__RESOURCE_H
> +
> +#define IORESOURCE_BITS 0x000000FFU / Bus-specific bits /
> +
> +#define IORESOURCE_TYPE_BITS 0x00001F00U / Resource type /
> +#define IORESOURCE_IO 0x00000100U / PCI/ISA I/O ports /
> +#define IORESOURCE_MEM 0x00000200U
> +#define IORESOURCE_REG 0x00000300U / Register offsets /
> +#define IORESOURCE_IRQ 0x00000400U
> +#define IORESOURCE_DMA 0x00000800U
> +#define IORESOURCE_BUS 0x00001000U
> +
> +#define IORESOURCE_PREFETCH 0x00002000U / No side effects */
> +#define IORESOURCE_READONLY 0x00004000U
> +#define IORESOURCE_CACHEABLE 0x00008000U
> +#define IORESOURCE_RANGELENGTH 0x00010000U
> +#define IORESOURCE_SHADOWABLE 0x00020000U
> +
> +#define IORESOURCE_UNKNOWN ( ~0U )
> +
> +struct resource {
> + paddr_t addr;
> + paddr_t size;
> + unsigned int type;
> +};
> +
> +#define resource_size(res) ( (res)->size )
>=20
> +
> +#endif /* XEN__RESOURCE_H */
>=20
> --
> 2.34.1
>=20



