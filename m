Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJOxBuQNcmksawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:45:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82466309
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210856.1522451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vit7B-00017f-He; Thu, 22 Jan 2026 11:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210856.1522451; Thu, 22 Jan 2026 11:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vit7B-00015A-Ef; Thu, 22 Jan 2026 11:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1210856;
 Thu, 22 Jan 2026 11:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ayx=73=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vit7A-000151-C1
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 11:44:40 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bad5e380-f787-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 12:44:37 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6E13440E02E6; 
 Thu, 22 Jan 2026 11:44:35 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c9X8eFFdOq-3; Thu, 22 Jan 2026 11:44:31 +0000 (UTC)
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 1169040E00DE; Thu, 22 Jan 2026 11:44:15 +0000 (UTC)
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
X-Inumbo-ID: bad5e380-f787-11f0-b15e-2bf370ae4941
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769082270; bh=rZtylzp0qFkAcv+z+2JtsaoyVGWifq81W5X/Ip6miJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UybqXXvpCysjUW5YuOLTI9itbPaqwV+kzNUhng7iNTwX6hDULT5M9y7IbtcWXh7b0
	 MH9XvNYf1FZEvPZwBrMsVSGmYAbPbW1H0LGjtKdROfqad4cVS8TS5rsT47T9pD6f/W
	 dlZUlfpcQs5LonbzMfu+k1JSNgE9V9tXIcdgZLOfz3JHuz2k5wkrAPmWxCpcI/PdxH
	 ZWNOH54TdhGWa4c/PcPeKI0cxszFx6GGiCph2WJALcCt+g0abq/1kRDoMK64tLtl6S
	 xvVqpWdBnrL6YUT0xcbehVj4Zdgt048du/Q9Q6oPaFoIsLB/BArthY1VUUOBBwnONn
	 9MShccXfa0NTt7y3PxyR9H3NswWF0ewXzCgt930ZneBbWc4hGQeojtrsQFwcguUi6I
	 SLW9D/LgMdI7/DNmsT6rQg2yQOjqz92GdiMmX2J+nR6MI/7/rzcuIJv3ZhMx8qxawS
	 C2r6nZ8cx3FTD1ayfABapmh9Jh1ur4L2OPn4Zw4aWgbhzAOS6Z9IY4GThc952vM2Vf
	 M6MrCLec8fKnPvVfx+R0zXZTpgmeKVIwgVFHvtBMyDhUQ5lhRz2FTzwKDOW+NgVKZn
	 4ibSeuFziIXsvkDmZCZcOT2YtD/oKCqR+vAisRULjy0C3wmaY/33wFDLNOB/WVtcbo
	 NQHYImsorZNzYeivc+9HTOzw=
Date: Thu, 22 Jan 2026 12:44:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>, Thomas Huth <thuth@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Uros Bizjak <ubizjak@gmail.com>,
	Brian Gerst <brgerst@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/xen: Build identity mapping page tables dynamically
 for XENPV
Message-ID: <20260122114409.GBaXINiSQrMS994TkE@fat_crate.local>
References: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:houwenlong.hwl@antgroup.com,m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:thuth@redhat.com,m:kas@kernel.org,m:ubizjak@gmail.com,m:brgerst@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,oracle.com,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:email,alien8.de:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,fat_crate.local:mid,antgroup.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alien8.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6D82466309
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 06:06:14PM +0800, Hou Wenlong wrote:
> After commit 47ffe0578aee ("x86/pvh: Add 64bit relocation page tables"),
> the PVH entry uses a new set of page tables instead of the
> preconstructed page tables in head64.S. Since those preconstructed page
> tables are only used in XENPV now and XENPV does not actually need the
> preconstructed identity page tables directly, they can be filled in
> xen_setup_kernel_pagetable(). Therefore, build the identity mapping page
> table dynamically to remove the preconstructed page tables and make the
> code cleaner.
> 
> Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> ---
>  arch/x86/include/asm/pgtable_64.h |  2 --
>  arch/x86/kernel/head_64.S         | 28 ----------------------------
>  arch/x86/xen/mmu_pv.c             |  9 +++++++++
>  3 files changed, 9 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
> index f06e5d6a2747..ce45882ccd07 100644
> --- a/arch/x86/include/asm/pgtable_64.h
> +++ b/arch/x86/include/asm/pgtable_64.h
> @@ -19,10 +19,8 @@
>  extern p4d_t level4_kernel_pgt[512];
>  extern p4d_t level4_ident_pgt[512];
>  extern pud_t level3_kernel_pgt[512];
> -extern pud_t level3_ident_pgt[512];
>  extern pmd_t level2_kernel_pgt[512];
>  extern pmd_t level2_fixmap_pgt[512];
> -extern pmd_t level2_ident_pgt[512];
>  extern pte_t level1_fixmap_pgt[512 * FIXMAP_PMD_NUM];
>  extern pgd_t init_top_pgt[];
>  
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index 21816b48537c..85d4a5094f6b 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -616,38 +616,10 @@ SYM_DATA(early_recursion_flag, .long 0)
>  
>  	.data
>  
> -#if defined(CONFIG_XEN_PV) || defined(CONFIG_PVH)
> -SYM_DATA_START_PTI_ALIGNED(init_top_pgt)
> -	.quad   level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
> -	.org    init_top_pgt + L4_PAGE_OFFSET*8, 0
> -	.quad   level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
> -	.org    init_top_pgt + L4_START_KERNEL*8, 0
> -	/* (2^48-(2*1024*1024*1024))/(2^39) = 511 */
> -	.quad   level3_kernel_pgt - __START_KERNEL_map + _PAGE_TABLE_NOENC
> -	.fill	PTI_USER_PGD_FILL,8,0
> -SYM_DATA_END(init_top_pgt)
> -
> -SYM_DATA_START_PAGE_ALIGNED(level3_ident_pgt)
> -	.quad	level2_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
> -	.fill	511, 8, 0
> -SYM_DATA_END(level3_ident_pgt)
> -SYM_DATA_START_PAGE_ALIGNED(level2_ident_pgt)
> -	/*
> -	 * Since I easily can, map the first 1G.
> -	 * Don't set NX because code runs from these pages.
> -	 *
> -	 * Note: This sets _PAGE_GLOBAL despite whether
> -	 * the CPU supports it or it is enabled.  But,
> -	 * the CPU should ignore the bit.
> -	 */
> -	PMDS(0, __PAGE_KERNEL_IDENT_LARGE_EXEC, PTRS_PER_PMD)
> -SYM_DATA_END(level2_ident_pgt)
> -#else
>  SYM_DATA_START_PTI_ALIGNED(init_top_pgt)
>  	.fill	512,8,0
>  	.fill	PTI_USER_PGD_FILL,8,0
>  SYM_DATA_END(init_top_pgt)
> -#endif
>  
>  SYM_DATA_START_PAGE_ALIGNED(level4_kernel_pgt)
>  	.fill	511,8,0
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 9fa00c4a8858..7d77c233002b 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -105,6 +105,9 @@ pte_t xen_make_pte_init(pteval_t pte);
>  static pud_t level3_user_vsyscall[PTRS_PER_PUD] __page_aligned_bss;
>  #endif
>  
> +static pud_t level3_ident_pgt[PTRS_PER_PUD] __page_aligned_bss;
> +static pmd_t level2_ident_pgt[PTRS_PER_PMD] __page_aligned_bss;
> +
>  /*
>   * Protects atomic reservation decrease/increase against concurrent increases.
>   * Also protects non-atomic updates of current_pages and balloon lists.
> @@ -1773,6 +1776,12 @@ void __init xen_setup_kernel_pagetable(pgd_t *pgd, unsigned long max_pfn)
>  	/* Zap identity mapping */
>  	init_top_pgt[0] = __pgd(0);
>  
> +	init_top_pgt[pgd_index(__PAGE_OFFSET_BASE_L4)].pgd =
> +		__pa_symbol(level3_ident_pgt) + _KERNPG_TABLE_NOENC;
> +	init_top_pgt[pgd_index(__START_KERNEL_map)].pgd =
> +		__pa_symbol(level3_kernel_pgt) + _PAGE_TABLE_NOENC;
> +	level3_ident_pgt[0].pud = __pa_symbol(level2_ident_pgt) + _KERNPG_TABLE_NOENC;
> +
>  	/* Pre-constructed entries are in pfn, so convert to mfn */
>  	/* L4[273] -> level3_ident_pgt  */
>  	/* L4[511] -> level3_kernel_pgt */


I obviously am very much in agreement with the arch/x86/kernel/head_64.S hunk,
removing all that gunk.

Provided there's no some gotcha in that change which Xen people would
hopefully point out and the pagetables look the same:

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

If people want me to take it through tip, just holler.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

