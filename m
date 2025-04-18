Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD7A93FB8
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 00:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959493.1351832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5tvt-000103-8Z; Fri, 18 Apr 2025 22:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959493.1351832; Fri, 18 Apr 2025 22:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5tvt-0000yV-55; Fri, 18 Apr 2025 22:11:37 +0000
Received: by outflank-mailman (input) for mailman id 959493;
 Fri, 18 Apr 2025 22:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5tvs-0000yL-0O
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 22:11:36 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1b7b4a-1ca2-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 00:11:21 +0200 (CEST)
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
X-Inumbo-ID: 0f1b7b4a-1ca2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745014279; x=1745273479;
	bh=UzduznCgt0YnDMXSkAmeG5qYCV27giTohdJwNzVw3QQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=h5Z66SK18gnRYfc9nUTED9ddNiuNtck5YcH2mlcCJq4fLRXDApG5vMJq+xS1qZlNs
	 zn12qR+crHBIwBwEHGUEJG3exe+1cSW8xKeeccPnNSEe/nc66Ffrn6cG6/iov12vJ5
	 iUjLzQ8+hMMJZis9dzezgQsY8EMbouP+yIGnX3CrgDaaSzmWNgAMKegLI+cavex3IN
	 yorj/V4OD17TVSC3qo9SNqiTiO/P2z6Tfi2L1BhNgdFlTSuYQ0gX1gudVqlrBk9FYv
	 mA8Cb7UscEe20anPgXjDzpZESKUcSW3n2lz5yP00u8w3LXYjxzxN5R9tEeFi1YItg6
	 lQohEIw1wGjSw==
Date: Fri, 18 Apr 2025 22:11:15 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 04/13] x86/hyperlaunch: initial support for hyperlaunch device tree
Message-ID: <aALN/46JGBJTBCMm@kraken>
In-Reply-To: <20250417124844.11143-5-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-5-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d7daae00b9856b855276a0b5e6d1c167a9aea42c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:26PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Add the ability to detect both a formal hyperlaunch device tree or a dom0=
less
> device tree. If the hyperlaunch device tree is found, then count the numb=
er of
> domain entries, reporting an error if more than one is found.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Panic if we're booting on hyperlaunch, but walking the DTB fails.
>   * Remove inconsequential "else" clause in fdt.c
>   * Remove stub, as it's not required due to DCE
>   * Use min() rather than open-code it
> ---
>  xen/arch/x86/include/asm/bootinfo.h |  1 +
>  xen/common/domain-builder/core.c    | 11 +++++
>  xen/common/domain-builder/fdt.c     | 63 +++++++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.h     |  1 +
>  4 files changed, 76 insertions(+)
>=20
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/a=
sm/bootinfo.h
> index 82c2650fcf..1e3d582e45 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -84,6 +84,7 @@ struct boot_info {
>      bool hyperlaunch_enabled;
>=20
>      unsigned int nr_modules;
> +    unsigned int nr_domains;
>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
>      struct boot_domain domains[MAX_NR_BOOTDOMS];
>  };
> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder=
/core.c
> index a5b21fc179..3b062e85ec 100644
> --- a/xen/common/domain-builder/core.c
> +++ b/xen/common/domain-builder/core.c
> @@ -43,6 +43,17 @@ void __init builder_init(struct boot_info *bi)
>              break;
>          }
>      }
> +
> +    if ( bi->hyperlaunch_enabled )
> +    {
> +        int ret;
> +
> +        printk(XENLOG_INFO "Hyperlaunch configuration:\n");
> +        if ( (ret =3D walk_hyperlaunch_fdt(bi)) < 0 )
> +            panic("Walk of device tree failed (%d)\n", ret);
> +
> +        printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains);
> +    }
>  }
>=20
>  /*
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index aaf8c1cc16..b5ff8220da 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -13,6 +13,36 @@
>=20
>  #include "fdt.h"
>=20
> +static int __init find_hyperlaunch_node(const void *fdt)
> +{
> +    int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
> +
> +    if ( hv_node >=3D 0 )
> +    {
> +        /* Anything other than zero indicates no match */
> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
> +            return -ENODATA;
> +
> +        return hv_node;
> +    }
> +    else
> +    {
> +        /* Look for dom0less config */
> +        int node, chosen_node =3D fdt_path_offset(fdt, "/chosen");
> +
> +        if ( chosen_node < 0 )
> +            return -ENOENT;
> +
> +        fdt_for_each_subnode(node, fdt, chosen_node)
> +        {
> +            if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> +                return chosen_node;
> +        }
> +    }
> +
> +    return -ENODATA;
> +}
> +
>  int __init has_hyperlaunch_fdt(const struct boot_info *bi)
>  {
>      int ret =3D 0;
> @@ -20,7 +50,40 @@ int __init has_hyperlaunch_fdt(const struct boot_info =
*bi)
>=20
>      if ( !fdt || fdt_check_header(fdt) < 0 )
>          ret =3D -EINVAL;
> +    else
> +        ret =3D find_hyperlaunch_node(fdt);
> +
> +    bootstrap_unmap();
> +
> +    return min(0, ret);
> +}
> +
> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
> +{
> +    int ret =3D 0, hv_node, node;
> +    const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_ID=
X]);
> +
> +    if ( unlikely(!fdt) )
> +        return -EINVAL;

I think this check can be converted to ASSERT() since walk_hyperlaunch_fdt(=
)
will be called after has_hyperlaunch_fdt() where condition is checked.

> +
> +    hv_node =3D find_hyperlaunch_node(fdt);
> +    if ( hv_node < 0 )
> +    {
> +        ret =3D hv_node;
> +        goto err_out;
> +    }
> +
> +    fdt_for_each_subnode(node, fdt, hv_node)
> +    {
> +        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> +            bi->nr_domains++;
> +    }
> +
> +    /* Until multi-domain construction is added, throw an error */
> +    if ( bi->nr_domains !=3D 1 )
> +        printk(XENLOG_ERR "hyperlaunch only supports dom0 construction\n=
");
>=20
> + err_out:
>      bootstrap_unmap();
>=20
>      return ret;
> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/=
fdt.h
> index 97a45a6ec4..955aead497 100644
> --- a/xen/common/domain-builder/fdt.h
> +++ b/xen/common/domain-builder/fdt.h
> @@ -8,5 +8,6 @@ struct boot_info;
>  #define HYPERLAUNCH_MODULE_IDX 0
>=20
>  int has_hyperlaunch_fdt(const struct boot_info *bi);
> +int walk_hyperlaunch_fdt(struct boot_info *bi);
>=20
>  #endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
> --
> 2.43.0
>=20
>=20


