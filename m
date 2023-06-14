Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46252730BBE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 01:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549288.857739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aCB-00036Y-42; Wed, 14 Jun 2023 23:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549288.857739; Wed, 14 Jun 2023 23:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aCB-00033p-19; Wed, 14 Jun 2023 23:46:35 +0000
Received: by outflank-mailman (input) for mailman id 549288;
 Wed, 14 Jun 2023 23:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9aC9-00033j-W5
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 23:46:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b080dd42-0b0d-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 01:46:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94AB7615A3;
 Wed, 14 Jun 2023 23:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0DDC433C8;
 Wed, 14 Jun 2023 23:46:30 +0000 (UTC)
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
X-Inumbo-ID: b080dd42-0b0d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686786391;
	bh=HpKLqdnjWDm302nVPGFAlDgx3gn4KUxpuiUVYrMLD7c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NltPxSMBr0h/nOl6+KtMjWmUzDURXFNe6YP/rZ4qrmee9GTIQSqW9d8q/CF22sgPm
	 zsGTwME7euloDK1L4iYbpVPHh/U2VGz+1sbgjO0Ca+Nl48xA9kCuFLfkBnHBrVWwGV
	 PW5sNTJ6CYrgOQECf4G34IbFI5l4BaOpdxpYIpddIpDD/PupO+0X0DZqxWW8sF8utw
	 vlE5B731q/QSKwTEfnTfwYSH6NzD1rWkl4z2WfuOvihsIptjn31czXdKhogRQIddQw
	 BtV6fCRiG0BMEIVMG3v6OtdbJ/ytNXwpGcTqhB+ErgjfzWNhxjFWc85WeNgBt46vza
	 z2YsdyGbC6unw==
Date: Wed, 14 Jun 2023 16:46:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Remove stray semicolon at VREG_REG_HELPERS/TLB_HELPER*
 callers
In-Reply-To: <20230614094144.9533-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306141645190.897208@ubuntu-linux-20-04-desktop>
References: <20230614094144.9533-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jun 2023, Michal Orzel wrote:
> This is inconsistent with the rest of the code where macros are used
> to define functions, as it results in an empty declaration (i.e.
> semicolon with nothing before it) after function definition. This is also
> not allowed by C99.
> 
> Take the opportunity to undefine TLB_HELPER* macros after last use.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Discussion:
> https://lore.kernel.org/xen-devel/17C59D5C-795E-4591-A7C9-A4C5179BF373@arm.com/
> 
> Other empty declarations appear at callers of TYPE_SAFE and Linux module
> macros like EXPORT_SYMBOL for which we need some sort of agreement.
> ---
>  xen/arch/arm/include/asm/arm32/flushtlb.h | 12 +++++++-----
>  xen/arch/arm/include/asm/arm64/flushtlb.h | 17 ++++++++++-------
>  xen/arch/arm/include/asm/vreg.h           |  4 ++--
>  3 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
> index 7ae6a12f8155..22ee3b317b4d 100644
> --- a/xen/arch/arm/include/asm/arm32/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
> @@ -29,19 +29,21 @@ static inline void name(void)       \
>  }
>  
>  /* Flush local TLBs, current VMID only */
> -TLB_HELPER(flush_guest_tlb_local, TLBIALL, nsh);
> +TLB_HELPER(flush_guest_tlb_local, TLBIALL, nsh)
>  
>  /* Flush inner shareable TLBs, current VMID only */
> -TLB_HELPER(flush_guest_tlb, TLBIALLIS, ish);
> +TLB_HELPER(flush_guest_tlb, TLBIALLIS, ish)
>  
>  /* Flush local TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb_local, TLBIALLNSNH, nsh);
> +TLB_HELPER(flush_all_guests_tlb_local, TLBIALLNSNH, nsh)
>  
>  /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb, TLBIALLNSNHIS, ish);
> +TLB_HELPER(flush_all_guests_tlb, TLBIALLNSNHIS, ish)
>  
>  /* Flush all hypervisor mappings from the TLB of the local processor. */
> -TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh);
> +TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
> +
> +#undef TLB_HELPER
>  
>  /* Flush TLB of local processor for address va. */
>  static inline void __flush_xen_tlb_one_local(vaddr_t va)
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
> index 3a9092b814a9..56c6fc763b56 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -67,25 +67,28 @@ static inline void name(vaddr_t va)              \
>  }
>  
>  /* Flush local TLBs, current VMID only. */
> -TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh);
> +TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
>  
>  /* Flush innershareable TLBs, current VMID only */
> -TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish);
> +TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
>  
>  /* Flush local TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh);
> +TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
>  
>  /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb, alle1is, ish);
> +TLB_HELPER(flush_all_guests_tlb, alle1is, ish)
>  
>  /* Flush all hypervisor mappings from the TLB of the local processor. */
> -TLB_HELPER(flush_xen_tlb_local, alle2, nsh);
> +TLB_HELPER(flush_xen_tlb_local, alle2, nsh)
>  
>  /* Flush TLB of local processor for address va. */
> -TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2);
> +TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
>  
>  /* Flush TLB of all processors in the inner-shareable domain for address va. */
> -TLB_HELPER_VA(__flush_xen_tlb_one, vae2is);
> +TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
> +
> +#undef TLB_HELPER
> +#undef TLB_HELPER_VA
>  
>  #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
>  /*
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index d92450017bc4..bf945eebbde4 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -140,8 +140,8 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>      *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
>  }
>  
> -VREG_REG_HELPERS(64, 0x7);
> -VREG_REG_HELPERS(32, 0x3);
> +VREG_REG_HELPERS(64, 0x7)
> +VREG_REG_HELPERS(32, 0x3)
>  
>  #undef VREG_REG_HELPERS
>  
> 
> base-commit: 2f69ef96801f0d2b9646abf6396e60f99c56e3a0
> -- 
> 2.25.1
> 

