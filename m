Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020F5F0FE8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 18:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414314.658528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIq7-0001pN-5B; Fri, 30 Sep 2022 16:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414314.658528; Fri, 30 Sep 2022 16:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIq7-0001lz-06; Fri, 30 Sep 2022 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 414314;
 Fri, 30 Sep 2022 16:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VUOy=2B=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeIq5-0001lt-9x
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 16:26:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964a3532-40dc-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 18:26:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C4126235A
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 16:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E37FC433D6
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 16:26:06 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id a14so5331367ljj.8
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 09:26:06 -0700 (PDT)
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
X-Inumbo-ID: 964a3532-40dc-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664555166;
	bh=oqLfbEYe4oKYjxRzZLjsJo81ZyVL6bMsqLMXt0kKL6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mvZZtkBFmQi2x7GpRI8lcYjKOiCtRcni2tTvr/2Gci5jhQMmE2AuH9RBHqqD/N4xY
	 DFfBNLSu3bR3hzPaU8LR+H+WA2hS/wi7NFe3qS4JrM3OEVkWYietrU1eNf84V89n+z
	 C162Ou3Uy7FvA0Pxzr2OfbKiNwbHiDIWzmR+77c4zXVOXp6EyeaZaqpjYowx+TWLfa
	 P1/5W6TTZsvX2HH6fN9SsGnFCxAjT1ZQbcmaGwINTkbw2tKvwFJppaLE8MI3EiSM72
	 K+Mg8KrB6iYjxiYISadp+yWX6SO4Nnv7Ad9ddEMCtT8nkcSsSgXNLc7EprHbS7ouW0
	 QN02UEV9iB+5g==
X-Gm-Message-State: ACrzQf1sTNE5ZrBSx4E5ZgI9wbORQnBMG1eBPIyk/LooGrUTNq3mVmx2
	1IaFl4wbZQ6Hpyy8XdbNUpgGoZLLSoOsA4B1yGY=
X-Google-Smtp-Source: AMsMyM6CuK5x63b6fiVGIdEPxEPIkgUe0csGlqkji9OKq4ixVNWcF+qZD6wm6VZbn3AEbq4Pb+HCOlGex3PeGRJSdRE=
X-Received: by 2002:a05:651c:239c:b0:26d:94b8:781d with SMTP id
 bk28-20020a05651c239c00b0026d94b8781dmr2937124ljb.189.1664555164446; Fri, 30
 Sep 2022 09:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com> <f3b624e99adfdbbfc1976a60a73a6b5950e1840d.1664298147.git.demi@invisiblethingslab.com>
In-Reply-To: <f3b624e99adfdbbfc1976a60a73a6b5950e1840d.1664298147.git.demi@invisiblethingslab.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Sep 2022 18:25:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH5tos5XVDUCcuEJG+fSNZBnY-xA1nb+Juu3H7AsM0DiQ@mail.gmail.com>
Message-ID: <CAMj1kXH5tos5XVDUCcuEJG+fSNZBnY-xA1nb+Juu3H7AsM0DiQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Sept 2022 at 01:02, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> Memory of type EFI_CONVENTIONAL_MEMORY, EFI_LOADER_CODE, EFI_LOADER_DATA,
> EFI_BOOT_SERVICES_CODE, and EFI_BOOT_SERVICES_DATA may be clobbered by
> Xen before Linux gets to start using it.  Therefore, Linux under Xen
> must not use EFI tables from such memory.  Most of the remaining EFI
> memory types are not suitable for EFI tables, leaving only
> EFI_ACPI_RECLAIM_MEMORY, EFI_RUNTIME_SERVICES_DATA, and
> EFI_RUNTIME_SERVICES_CODE.  When running under Xen, Linux should only
> use tables that are located in one of these types of memory.
>
> This patch ensures this, and also adds a function
> (xen_config_table_memory_region_max()) that will be used later to
> replace the usage of the EFI memory map in esrt.c when running under
> Xen.  This function can also be used in mokvar-table.c and efi-bgrt.c,
> but I have not implemented this.
>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  drivers/firmware/efi/efi.c |  8 +++++---
>  drivers/xen/efi.c          | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/efi.h        |  9 +++++++++
>  3 files changed, 49 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index e4080ad96089abd7f84745dd8461c548bcbb7685..d344f3ff73d1c5ed0c67e3251a9502e66719741d 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -574,7 +574,6 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
>         unsigned long table;
>         int i;
>
> -       pr_info("");

Why are you removing these prints?

>         for (i = 0; i < count; i++) {
>                 if (!IS_ENABLED(CONFIG_X86)) {
>                         guid = &config_tables[i].guid;
> @@ -585,7 +584,6 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
>
>                         if (IS_ENABLED(CONFIG_X86_32) &&
>                             tbl64[i].table > U32_MAX) {
> -                               pr_cont("\n");
>                                 pr_err("Table located above 4GB, disabling EFI.\n");
>                                 return -EINVAL;
>                         }
> @@ -594,10 +592,14 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
>                         table = tbl32[i].table;
>                 }
>
> +#ifdef CONFIG_XEN_EFI

We tend to prefer IS_ENABLED() for cases such as this one. That way,
the compiler always gets to see the code inside the conditional block,
which gives better build test coverage (even if CONFIG_XEN_EFI is
disabled).

> +               if (efi_enabled(EFI_PARAVIRT) && !xen_config_table_memory_region_max(table))

So the question here is whether Xen thinks the table should be
disregarded or not. So let's define a prototype that reflects that
purpose, and let the implementation reason about how this should be
achieved.

So

if (IS_ENABLED(CONFIG_XEN_EFI) &&
    efi_enabled(EFI_PARAVIRT) &&
    xen_efi_config_table_valid(guid, table)
        continue

I should note here, though, that EFI_PARAViRT is only set on x86 not
on other architectures that enable CONFIG_XEN_EFI so this will not
work anywhere else.


> +                       continue;
> +#endif
> +
>                 if (!match_config_table(guid, table, common_tables) && arch_tables)
>                         match_config_table(guid, table, arch_tables);
>         }
> -       pr_cont("\n");
>         set_bit(EFI_CONFIG_TABLES, &efi.flags);
>
>         if (efi_rng_seed != EFI_INVALID_TABLE_ADDR) {
> diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> index d1ff2186ebb48a7c0981ecb6d4afcbbb25ffcea0..c2274ddfcc63304008ef0fd78fd9fa416f75d073 100644
> --- a/drivers/xen/efi.c
> +++ b/drivers/xen/efi.c
> @@ -28,6 +28,7 @@
>  #include <xen/interface/platform.h>
>  #include <xen/xen.h>
>  #include <xen/xen-ops.h>
> +#include <xen/page.h>
>
>  #include <asm/page.h>
>
> @@ -271,6 +272,40 @@ static void xen_efi_reset_system(int reset_type, efi_status_t status,
>         }
>  }
>
> +__init u64 xen_config_table_memory_region_max(u64 addr)

It is more idiomatic for Linux to put __init after the return type.
And if we adopt my suggestion above, this becomes

bool __init xen_efi_config_table_valid(const efi_guid_t *guid, u64 table)

Alternatively, you could pass the string identifier of the table
instead of the guid (or both) to print in the diagnostic message.


> +{
> +       static_assert(XEN_PAGE_SHIFT == EFI_PAGE_SHIFT,
> +                     "Mismatch between EFI_PAGE_SHIFT and XEN_PAGE_SHIFT");

Is this the only place where this matters? And this never happens on x86, right?

> +       struct xen_platform_op op = {
> +               .cmd = XENPF_firmware_info,
> +               .u.firmware_info = {
> +                       .type = XEN_FW_EFI_INFO,
> +                       .index = XEN_FW_EFI_MEM_INFO,
> +                       .u.efi_info.mem.addr = addr,
> +                       .u.efi_info.mem.size = U64_MAX - addr,
> +               }
> +       };
> +       union xenpf_efi_info *info = &op.u.firmware_info.u.efi_info;
> +       int rc = HYPERVISOR_platform_op(&op);
> +
> +       if (rc) {
> +               pr_warn("Failed to lookup header %llu in Xen memory map: error %d\n",
> +                       (unsigned long long)addr, rc);
> +               return 0;
> +       }
> +
> +       switch (info->mem.type) {
> +       case EFI_RUNTIME_SERVICES_CODE:
> +       case EFI_RUNTIME_SERVICES_DATA:
> +       case EFI_ACPI_RECLAIM_MEMORY:

If we are listing all memory types that Xen preserves, you might add
EFI_RESERVED_MEMORY here. Otherwise, please only list the ones that
you need to permit explicitly.

> +               return info->mem.addr + info->mem.size;
> +       default:
> +               pr_warn("Table %llu is in memory of type %d, ignoring it\n",
> +                       (unsigned long long)addr, info->mem.type);
> +               return 0;
> +       }
> +}
> +
>  /*
>   * Set XEN EFI runtime services function pointers. Other fields of struct efi,
>   * e.g. efi.systab, will be set like normal EFI.
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index d2b84c2fec39f0268324d1a38a73ed67786973c9..fc81e4b984398cdb399e7886b2cae7f33bf91613 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -1324,4 +1324,13 @@ struct linux_efi_coco_secret_area {
>  /* Header of a populated EFI secret area */
>  #define EFI_SECRET_TABLE_HEADER_GUID   EFI_GUID(0x1e74f542, 0x71dd, 0x4d66,  0x96, 0x3e, 0xef, 0x42, 0x87, 0xff, 0x17, 0x3b)
>
> +#ifdef CONFIG_XEN_EFI

Please drop this #ifdef

> +/*
> + * Returns the end of the memory region containing the given config table,
> + * or 0 if the given address does not reside in memory that can validly
> + * contain EFI configuration tables.
> + */
> +__init u64 xen_config_table_memory_region_max(u64 addr);

You can drop the __init here

> +#endif
> +
>  #endif /* _LINUX_EFI_H */
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
>

