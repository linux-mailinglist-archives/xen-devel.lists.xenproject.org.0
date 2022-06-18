Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1667550462
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 14:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351815.578567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2XKm-0007Od-Ak; Sat, 18 Jun 2022 12:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351815.578567; Sat, 18 Jun 2022 12:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2XKm-0007Lg-7V; Sat, 18 Jun 2022 12:13:48 +0000
Received: by outflank-mailman (input) for mailman id 351815;
 Sat, 18 Jun 2022 12:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCNw=WZ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o2XKk-0006z2-EE
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 12:13:46 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19b8cc89-ef00-11ec-bd2d-47488cf2e6aa;
 Sat, 18 Jun 2022 14:13:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 1FE0D20157;
 Sat, 18 Jun 2022 14:13:45 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yy_byW0nzfZw; Sat, 18 Jun 2022 14:13:45 +0200 (CEST)
Received: from begin (cerbere11.aquilenet.fr [185.233.102.190])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 039CC20154;
 Sat, 18 Jun 2022 14:13:45 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o2XKi-00BaWW-97;
 Sat, 18 Jun 2022 14:13:44 +0200
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
X-Inumbo-ID: 19b8cc89-ef00-11ec-bd2d-47488cf2e6aa
Date: Sat, 18 Jun 2022 14:13:44 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/3] mini-os: take newest version of
 arch-x86/hvm/start_info.h
Message-ID: <20220618121344.3nsrtgwvmdhnfvlq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220618104816.11527-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le sam. 18 juin 2022 12:48:14 +0200, a ecrit:
> Update include/xen/arch-x86/hvm/start_info.h to the newest version
> from the Xen tree.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/xen/arch-x86/hvm/start_info.h | 63 ++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/include/xen/arch-x86/hvm/start_info.h b/include/xen/arch-x86/hvm/start_info.h
> index 64841597..50af9ea2 100644
> --- a/include/xen/arch-x86/hvm/start_info.h
> +++ b/include/xen/arch-x86/hvm/start_info.h
> @@ -33,7 +33,7 @@
>   *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_VALUE
>   *    |                | ("xEn3" with the 0x80 bit of the "E" set).
>   *  4 +----------------+
> - *    | version        | Version of this structure. Current version is 0. New
> + *    | version        | Version of this structure. Current version is 1. New
>   *    |                | versions are guaranteed to be backwards-compatible.
>   *  8 +----------------+
>   *    | flags          | SIF_xxx flags.
> @@ -48,6 +48,15 @@
>   * 32 +----------------+
>   *    | rsdp_paddr     | Physical address of the RSDP ACPI data structure.
>   * 40 +----------------+
> + *    | memmap_paddr   | Physical address of the (optional) memory map. Only
> + *    |                | present in version 1 and newer of the structure.
> + * 48 +----------------+
> + *    | memmap_entries | Number of entries in the memory map table. Zero
> + *    |                | if there is no memory map being provided. Only
> + *    |                | present in version 1 and newer of the structure.
> + * 52 +----------------+
> + *    | reserved       | Version 1 and newer only.
> + * 56 +----------------+
>   *
>   * The layout of each entry in the module structure is the following:
>   *
> @@ -62,13 +71,51 @@
>   *    | reserved       |
>   * 32 +----------------+
>   *
> + * The layout of each entry in the memory map table is as follows:
> + *
> + *  0 +----------------+
> + *    | addr           | Base address
> + *  8 +----------------+
> + *    | size           | Size of mapping in bytes
> + * 16 +----------------+
> + *    | type           | Type of mapping as defined between the hypervisor
> + *    |                | and guest. See XEN_HVM_MEMMAP_TYPE_* values below.
> + * 20 +----------------|
> + *    | reserved       |
> + * 24 +----------------+
> + *
>   * The address and sizes are always a 64bit little endian unsigned integer.
>   *
>   * NB: Xen on x86 will always try to place all the data below the 4GiB
>   * boundary.
> + *
> + * Version numbers of the hvm_start_info structure have evolved like this:
> + *
> + * Version 0:  Initial implementation.
> + *
> + * Version 1:  Added the memmap_paddr/memmap_entries fields (plus 4 bytes of
> + *             padding) to the end of the hvm_start_info struct. These new
> + *             fields can be used to pass a memory map to the guest. The
> + *             memory map is optional and so guests that understand version 1
> + *             of the structure must check that memmap_entries is non-zero
> + *             before trying to read the memory map.
>   */
>  #define XEN_HVM_START_MAGIC_VALUE 0x336ec578
>  
> +/*
> + * The values used in the type field of the memory map table entries are
> + * defined below and match the Address Range Types as defined in the "System
> + * Address Map Interfaces" section of the ACPI Specification. Please refer to
> + * section 15 in version 6.2 of the ACPI spec: http://uefi.org/specifications
> + */
> +#define XEN_HVM_MEMMAP_TYPE_RAM       1
> +#define XEN_HVM_MEMMAP_TYPE_RESERVED  2
> +#define XEN_HVM_MEMMAP_TYPE_ACPI      3
> +#define XEN_HVM_MEMMAP_TYPE_NVS       4
> +#define XEN_HVM_MEMMAP_TYPE_UNUSABLE  5
> +#define XEN_HVM_MEMMAP_TYPE_DISABLED  6
> +#define XEN_HVM_MEMMAP_TYPE_PMEM      7
> +
>  /*
>   * C representation of the x86/HVM start info layout.
>   *
> @@ -86,6 +133,13 @@ struct hvm_start_info {
>      uint64_t cmdline_paddr;     /* Physical address of the command line.     */
>      uint64_t rsdp_paddr;        /* Physical address of the RSDP ACPI data    */
>                                  /* structure.                                */
> +    /* All following fields only present in version 1 and newer */
> +    uint64_t memmap_paddr;      /* Physical address of an array of           */
> +                                /* hvm_memmap_table_entry.                   */
> +    uint32_t memmap_entries;    /* Number of entries in the memmap table.    */
> +                                /* Value will be zero if there is no memory  */
> +                                /* map being provided.                       */
> +    uint32_t reserved;          /* Must be zero.                             */
>  };
>  
>  struct hvm_modlist_entry {
> @@ -95,4 +149,11 @@ struct hvm_modlist_entry {
>      uint64_t reserved;
>  };
>  
> +struct hvm_memmap_table_entry {
> +    uint64_t addr;              /* Base address of the memory region         */
> +    uint64_t size;              /* Size of the memory region in bytes        */
> +    uint32_t type;              /* Mapping type                              */
> +    uint32_t reserved;          /* Must be zero for Version 1.               */
> +};
> +
>  #endif /* __XEN_PUBLIC_ARCH_X86_HVM_START_INFO_H__ */
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

