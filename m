Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976C7FAAF1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642517.1002054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hrZ-00060t-LO; Mon, 27 Nov 2023 20:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642517.1002054; Mon, 27 Nov 2023 20:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hrZ-0005xo-I5; Mon, 27 Nov 2023 20:05:49 +0000
Received: by outflank-mailman (input) for mailman id 642517;
 Mon, 27 Nov 2023 20:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hlB-0006PP-SN
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:59:13 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f191a2e-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 20:59:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id EAA7320103;
 Mon, 27 Nov 2023 20:59:11 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeLgJbsOi0kf; Mon, 27 Nov 2023 20:59:11 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id D4C4220101;
 Mon, 27 Nov 2023 20:59:11 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hl9-00000005cjx-2Xrj; Mon, 27 Nov 2023 20:59:11 +0100
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
X-Inumbo-ID: 6f191a2e-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 20:59:11 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 06/32] Mini-OS: add EXPORT_SYMBOL() instances to mm.c
Message-ID: <20231127195911.b34wjlq3hv5er76r@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:24:57 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to mm.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  arch/arm/mm.c | 2 ++
>  arch/x86/mm.c | 5 +++++
>  mm.c          | 4 ++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm/mm.c b/arch/arm/mm.c
> index 11962f8b..c269ab14 100644
> --- a/arch/arm/mm.c
> +++ b/arch/arm/mm.c
> @@ -85,6 +85,7 @@ int do_map_frames(unsigned long addr,
>  {
>      return -ENOSYS;
>  }
> +EXPORT_SYMBOL(do_map_frames);
>  
>  /* Get Xen's suggested physical page assignments for the grant table. */
>  static paddr_t get_gnttab_base(void)
> @@ -149,3 +150,4 @@ unsigned long map_frame_virt(unsigned long mfn)
>  {
>      return mfn_to_virt(mfn);
>  }
> +EXPORT_SYMBOL(map_frame_virt);
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index cfc978f6..767a5f07 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -493,6 +493,7 @@ pgentry_t *need_pgt(unsigned long va)
>      offset = l1_table_offset(va);
>      return &tab[offset];
>  }
> +EXPORT_SYMBOL(need_pgt);
>  
>  /*
>   * Reserve an area of virtual address space for mappings and Heap
> @@ -634,6 +635,7 @@ int do_map_frames(unsigned long va,
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(do_map_frames);
>  
>  /*
>   * Map an array of MFNs contiguous into virtual address space. Virtual
> @@ -654,6 +656,7 @@ void *map_frames_ex(const unsigned long *mfns, unsigned long n,
>  
>      return (void *)va;
>  }
> +EXPORT_SYMBOL(map_frames_ex);
>  
>  /*
>   * Unmap nun_frames frames mapped at virtual address va.
> @@ -724,6 +727,7 @@ int unmap_frames(unsigned long va, unsigned long num_frames)
>      }
>      return 0;
>  }
> +EXPORT_SYMBOL(unmap_frames);
>  
>  /*
>   * Clear some of the bootstrap memory
> @@ -859,3 +863,4 @@ unsigned long map_frame_virt(unsigned long mfn)
>  
>      return addr;
>  }
> +EXPORT_SYMBOL(map_frame_virt);
> diff --git a/mm.c b/mm.c
> index 6493bdd4..eb0e34de 100644
> --- a/mm.c
> +++ b/mm.c
> @@ -280,6 +280,7 @@ unsigned long alloc_pages(int order)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(alloc_pages);
>  
>  void free_pages(void *pointer, int order)
>  {
> @@ -336,6 +337,7 @@ void free_pages(void *pointer, int order)
>      free_head[order] = freed_ch;   
>     
>  }
> +EXPORT_SYMBOL(free_pages);
>  
>  int free_physical_pages(xen_pfn_t *mfns, int n)
>  {
> @@ -352,6 +354,7 @@ int map_frame_rw(unsigned long addr, unsigned long mfn)
>  {
>      return do_map_frames(addr, &mfn, 1, 1, 1, DOMID_SELF, NULL, L1_PROT);
>  }
> +EXPORT_SYMBOL(map_frame_rw);
>  
>  #ifdef HAVE_LIBC
>  void *sbrk(ptrdiff_t increment)
> @@ -385,6 +388,7 @@ void *sbrk(ptrdiff_t increment)
>  
>      return (void *) old_brk;
>  }
> +EXPORT_SYMBOL(sbrk);
>  #endif
>  
>  
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

