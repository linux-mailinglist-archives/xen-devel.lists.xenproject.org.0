Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17155ADB5D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 00:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399217.640314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKSP-0000a8-Uc; Mon, 05 Sep 2022 22:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399217.640314; Mon, 05 Sep 2022 22:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKSP-0000Xl-Rp; Mon, 05 Sep 2022 22:20:41 +0000
Received: by outflank-mailman (input) for mailman id 399217;
 Mon, 05 Sep 2022 22:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0v=ZI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVKSO-0000MS-Ab
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 22:20:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7905c31-2d68-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 00:20:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E7B1B81113;
 Mon,  5 Sep 2022 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B93C433D7;
 Mon,  5 Sep 2022 22:20:34 +0000 (UTC)
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
X-Inumbo-ID: f7905c31-2d68-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662416435;
	bh=0uQIVkwIBZXhGWZ96FuaXOVEFL507x5ie/HJSeTbYaA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kz4Z3+s9oyvYrQDPz3RrVGr6r6OsSIW+azFWGqBgjkn2EsfQPeC9/Zun4VibfGPYn
	 0jUCozvlqDI0gWjYF1Oygpduh9a8Nh+A0Xzro8vdxnZF1A/WfUBt6rUCEdsRV62P7S
	 kMeB/mrIaF7dXHh+eGqXV9bZ8fyXzOJEKshZAY//S5+PY5wZw3ML7XbqmKZVc6iggm
	 wEhZYb3mhhVjRWFlFITUwSASoazCMhY2yJ5Wk0HPczQ3K+4UGQgvyFiEnDk4f55TTF
	 nHAdWWJc/MssE9vG+Sm08p9nKOPyxagrpUeENbx/18AlZQFkNmHnqWxfFcqUoAuYQG
	 MA8LSGlzWm4sw==
Date: Mon, 5 Sep 2022 15:20:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Jean-Philippe Brucker <jean-philippe@linaro.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Eric Auger <eric.auger@redhat.com>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 04/10] xen/arm: smmuv3: Move definitions to a header
In-Reply-To: <9d2a455ecb4e5bc8c846127e9df3080553c84888.1662394710.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209051520250.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662394710.git.rahul.singh@arm.com> <9d2a455ecb4e5bc8c846127e9df3080553c84888.1662394710.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Sep 2022, Rahul Singh wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Backport Linux commit e881e7839fba. Also, move Xen related struct
> definition to header to get it compiled.
> 
> Allow sharing structure definitions with the upcoming SVA support for
> Arm SMMUv3, by moving them to a separate header. We could surgically
> extract only what is needed but keeping all definitions in one place
> looks nicer.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Link: https://lore.kernel.org/r/20200918101852.582559-8-jean-philippe@linaro.org
> Signed-off-by: Will Deacon <will@kernel.org>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e881e7839fba
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - remove clean backport msg in commit msg
> Changes in v2:
>  - fix commit msg
>  - also move struct definition to header file to sync with Linux patch
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 665 +------------------------
>  xen/drivers/passthrough/arm/smmu-v3.h | 674 ++++++++++++++++++++++++++
>  2 files changed, 675 insertions(+), 664 deletions(-)
>  create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index e632c75b21..e65b226b85 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -90,6 +90,7 @@
>  #include <asm/iommu_fwspec.h>
>  #include <asm/platform.h>
>  
> +#include "smmu-v3.h"
>  
>  #define ARM_SMMU_VTCR_SH_IS		3
>  #define ARM_SMMU_VTCR_RGN_WBWA		1
> @@ -103,22 +104,12 @@
>  #define ARM_SMMU_VTCR_PS_52_BIT		0x6ULL
>  
>  /* Linux compatibility functions. */
> -typedef paddr_t		dma_addr_t;
> -typedef paddr_t		phys_addr_t;
> -typedef unsigned int		gfp_t;
> -
>  #define iomb()		dmb(osh)
>  
>  #define platform_device		device
>  
>  #define GFP_KERNEL		0
>  
> -/* Alias to Xen lock functions */
> -#define mutex spinlock
> -#define mutex_init spin_lock_init
> -#define mutex_lock spin_lock
> -#define mutex_unlock spin_unlock
> -
>  /* Device logger functions */
>  #define dev_name(dev)	dt_node_full_name(dev->of_node)
>  #define dev_dbg(dev, fmt, ...)			\
> @@ -159,12 +150,6 @@ typedef unsigned int		gfp_t;
>  #define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_us)	\
>  	readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_us)
>  
> -#define FIELD_PREP(_mask, _val)			\
> -	(((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> -
> -#define FIELD_GET(_mask, _reg)			\
> -	((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> -
>  /*
>   * Helpers for DMA allocation. Just the function name is reused for
>   * porting code, these allocation are not managed allocations
> @@ -197,27 +182,6 @@ static void *dmam_alloc_coherent(struct device *dev, size_t size,
>  	return vaddr;
>  }
>  
> -
> -/* Xen specific code. */
> -struct iommu_domain {
> -	/* Runtime SMMU configuration for this iommu_domain */
> -	atomic_t		ref;
> -	/*
> -	 * Used to link iommu_domain contexts for a same domain.
> -	 * There is at least one per-SMMU to used by the domain.
> -	 */
> -	struct list_head		list;
> -};
> -
> -/* Describes information required for a Xen domain */
> -struct arm_smmu_xen_domain {
> -	spinlock_t		lock;
> -
> -	/* List of iommu domains associated to this domain */
> -	struct list_head	contexts;
> -};
> -
> -
>  /* Keep a list of devices associated with this driver */
>  static DEFINE_SPINLOCK(arm_smmu_devices_lock);
>  static LIST_HEAD(arm_smmu_devices);
> @@ -261,635 +225,8 @@ static int platform_get_irq_byname_optional(struct device *dev,
>  }
>  
>  /* Start of Linux SMMUv3 code */
> -/* MMIO registers */
> -#define ARM_SMMU_IDR0			0x0
> -#define IDR0_ST_LVL			GENMASK(28, 27)
> -#define IDR0_ST_LVL_2LVL		1
> -#define IDR0_STALL_MODEL		GENMASK(25, 24)
> -#define IDR0_STALL_MODEL_STALL		0
> -#define IDR0_STALL_MODEL_FORCE		2
> -#define IDR0_TTENDIAN			GENMASK(22, 21)
> -#define IDR0_TTENDIAN_MIXED		0
> -#define IDR0_TTENDIAN_LE		2
> -#define IDR0_TTENDIAN_BE		3
> -#define IDR0_CD2L			(1 << 19)
> -#define IDR0_VMID16			(1 << 18)
> -#define IDR0_PRI			(1 << 16)
> -#define IDR0_SEV			(1 << 14)
> -#define IDR0_MSI			(1 << 13)
> -#define IDR0_ASID16			(1 << 12)
> -#define IDR0_ATS			(1 << 10)
> -#define IDR0_HYP			(1 << 9)
> -#define IDR0_COHACC			(1 << 4)
> -#define IDR0_TTF			GENMASK(3, 2)
> -#define IDR0_TTF_AARCH64		2
> -#define IDR0_TTF_AARCH32_64		3
> -#define IDR0_S1P			(1 << 1)
> -#define IDR0_S2P			(1 << 0)
> -
> -#define ARM_SMMU_IDR1			0x4
> -#define IDR1_TABLES_PRESET		(1 << 30)
> -#define IDR1_QUEUES_PRESET		(1 << 29)
> -#define IDR1_REL			(1 << 28)
> -#define IDR1_CMDQS			GENMASK(25, 21)
> -#define IDR1_EVTQS			GENMASK(20, 16)
> -#define IDR1_PRIQS			GENMASK(15, 11)
> -#define IDR1_SSIDSIZE			GENMASK(10, 6)
> -#define IDR1_SIDSIZE			GENMASK(5, 0)
> -
> -#define ARM_SMMU_IDR5			0x14
> -#define IDR5_STALL_MAX			GENMASK(31, 16)
> -#define IDR5_GRAN64K			(1 << 6)
> -#define IDR5_GRAN16K			(1 << 5)
> -#define IDR5_GRAN4K			(1 << 4)
> -#define IDR5_OAS			GENMASK(2, 0)
> -#define IDR5_OAS_32_BIT			0
> -#define IDR5_OAS_36_BIT			1
> -#define IDR5_OAS_40_BIT			2
> -#define IDR5_OAS_42_BIT			3
> -#define IDR5_OAS_44_BIT			4
> -#define IDR5_OAS_48_BIT			5
> -#define IDR5_OAS_52_BIT			6
> -#define IDR5_VAX			GENMASK(11, 10)
> -#define IDR5_VAX_52_BIT			1
> -
> -#define ARM_SMMU_CR0			0x20
> -#define CR0_ATSCHK			(1 << 4)
> -#define CR0_CMDQEN			(1 << 3)
> -#define CR0_EVTQEN			(1 << 2)
> -#define CR0_PRIQEN			(1 << 1)
> -#define CR0_SMMUEN			(1 << 0)
> -
> -#define ARM_SMMU_CR0ACK			0x24
> -
> -#define ARM_SMMU_CR1			0x28
> -#define CR1_TABLE_SH			GENMASK(11, 10)
> -#define CR1_TABLE_OC			GENMASK(9, 8)
> -#define CR1_TABLE_IC			GENMASK(7, 6)
> -#define CR1_QUEUE_SH			GENMASK(5, 4)
> -#define CR1_QUEUE_OC			GENMASK(3, 2)
> -#define CR1_QUEUE_IC			GENMASK(1, 0)
> -/* CR1 cacheability fields don't quite follow the usual TCR-style encoding */
> -#define CR1_CACHE_NC			0
> -#define CR1_CACHE_WB			1
> -#define CR1_CACHE_WT			2
> -
> -#define ARM_SMMU_CR2			0x2c
> -#define CR2_PTM				(1 << 2)
> -#define CR2_RECINVSID			(1 << 1)
> -#define CR2_E2H				(1 << 0)
> -
> -#define ARM_SMMU_GBPA			0x44
> -#define GBPA_UPDATE			(1U << 31)
> -#define GBPA_ABORT			(1 << 20)
> -
> -#define ARM_SMMU_IRQ_CTRL		0x50
> -#define IRQ_CTRL_EVTQ_IRQEN		(1 << 2)
> -#define IRQ_CTRL_PRIQ_IRQEN		(1 << 1)
> -#define IRQ_CTRL_GERROR_IRQEN		(1 << 0)
> -
> -#define ARM_SMMU_IRQ_CTRLACK		0x54
> -
> -#define ARM_SMMU_GERROR			0x60
> -#define GERROR_SFM_ERR			(1 << 8)
> -#define GERROR_MSI_GERROR_ABT_ERR	(1 << 7)
> -#define GERROR_MSI_PRIQ_ABT_ERR		(1 << 6)
> -#define GERROR_MSI_EVTQ_ABT_ERR		(1 << 5)
> -#define GERROR_MSI_CMDQ_ABT_ERR		(1 << 4)
> -#define GERROR_PRIQ_ABT_ERR		(1 << 3)
> -#define GERROR_EVTQ_ABT_ERR		(1 << 2)
> -#define GERROR_CMDQ_ERR			(1 << 0)
> -#define GERROR_ERR_MASK			0xfd
> -
> -#define ARM_SMMU_GERRORN		0x64
> -
> -#define ARM_SMMU_GERROR_IRQ_CFG0	0x68
> -#define ARM_SMMU_GERROR_IRQ_CFG1	0x70
> -#define ARM_SMMU_GERROR_IRQ_CFG2	0x74
> -
> -#define ARM_SMMU_STRTAB_BASE		0x80
> -#define STRTAB_BASE_RA			(1UL << 62)
> -#define STRTAB_BASE_ADDR_MASK		GENMASK_ULL(51, 6)
> -
> -#define ARM_SMMU_STRTAB_BASE_CFG	0x88
> -#define STRTAB_BASE_CFG_FMT		GENMASK(17, 16)
> -#define STRTAB_BASE_CFG_FMT_LINEAR	0
> -#define STRTAB_BASE_CFG_FMT_2LVL	1
> -#define STRTAB_BASE_CFG_SPLIT		GENMASK(10, 6)
> -#define STRTAB_BASE_CFG_LOG2SIZE	GENMASK(5, 0)
> -
> -#define ARM_SMMU_CMDQ_BASE		0x90
> -#define ARM_SMMU_CMDQ_PROD		0x98
> -#define ARM_SMMU_CMDQ_CONS		0x9c
> -
> -#define ARM_SMMU_EVTQ_BASE		0xa0
> -#define ARM_SMMU_EVTQ_PROD		0x100a8
> -#define ARM_SMMU_EVTQ_CONS		0x100ac
> -#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
> -#define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
> -#define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
> -
> -#define ARM_SMMU_PRIQ_BASE		0xc0
> -#define ARM_SMMU_PRIQ_PROD		0x100c8
> -#define ARM_SMMU_PRIQ_CONS		0x100cc
> -#define ARM_SMMU_PRIQ_IRQ_CFG0		0xd0
> -#define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
> -#define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
> -
> -#define ARM_SMMU_REG_SZ			0xe00
> -
> -/* Common MSI config fields */
> -#define MSI_CFG0_ADDR_MASK		GENMASK_ULL(51, 2)
> -#define MSI_CFG2_SH			GENMASK(5, 4)
> -#define MSI_CFG2_MEMATTR		GENMASK(3, 0)
> -
> -/* Common memory attribute values */
> -#define ARM_SMMU_SH_NSH			0
> -#define ARM_SMMU_SH_OSH			2
> -#define ARM_SMMU_SH_ISH			3
> -#define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
> -#define ARM_SMMU_MEMATTR_OIWB		0xf
> -
> -#define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
> -#define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
> -#define Q_OVERFLOW_FLAG			(1U << 31)
> -#define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
> -#define Q_ENT(q, p)			((q)->base +			\
> -					 Q_IDX(&((q)->llq), p) *	\
> -					 (q)->ent_dwords)
> -
> -#define Q_BASE_RWA			(1UL << 62)
> -#define Q_BASE_ADDR_MASK		GENMASK_ULL(51, 5)
> -#define Q_BASE_LOG2SIZE			GENMASK(4, 0)
> -
> -/* Ensure DMA allocations are naturally aligned */
> -#ifdef CONFIG_CMA_ALIGNMENT
> -#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
> -#else
> -#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + MAX_ORDER - 1)
> -#endif
> -
> -/*
> - * Stream table.
> - *
> - * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
> - * 2lvl: 128k L1 entries,
> - *       256 lazy entries per table (each table covers a PCI bus)
> - */
> -#define STRTAB_L1_SZ_SHIFT		20
> -#define STRTAB_SPLIT			8
> -
> -#define STRTAB_L1_DESC_DWORDS		1
> -#define STRTAB_L1_DESC_SPAN		GENMASK_ULL(4, 0)
> -#define STRTAB_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 6)
> -
> -#define STRTAB_STE_DWORDS		8
> -#define STRTAB_STE_0_V			(1UL << 0)
> -#define STRTAB_STE_0_CFG		GENMASK_ULL(3, 1)
> -#define STRTAB_STE_0_CFG_ABORT		0
> -#define STRTAB_STE_0_CFG_BYPASS		4
> -#define STRTAB_STE_0_CFG_S1_TRANS	5
> -#define STRTAB_STE_0_CFG_S2_TRANS	6
> -
> -#define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
> -#define STRTAB_STE_0_S1FMT_LINEAR	0
> -#define STRTAB_STE_0_S1FMT_64K_L2	2
> -#define STRTAB_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
> -#define STRTAB_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
> -
> -#define STRTAB_STE_1_S1DSS		GENMASK_ULL(1, 0)
> -#define STRTAB_STE_1_S1DSS_TERMINATE	0x0
> -#define STRTAB_STE_1_S1DSS_BYPASS	0x1
> -#define STRTAB_STE_1_S1DSS_SSID0	0x2
> -
> -#define STRTAB_STE_1_S1C_CACHE_NC	0UL
> -#define STRTAB_STE_1_S1C_CACHE_WBRA	1UL
> -#define STRTAB_STE_1_S1C_CACHE_WT	2UL
> -#define STRTAB_STE_1_S1C_CACHE_WB	3UL
> -#define STRTAB_STE_1_S1CIR		GENMASK_ULL(3, 2)
> -#define STRTAB_STE_1_S1COR		GENMASK_ULL(5, 4)
> -#define STRTAB_STE_1_S1CSH		GENMASK_ULL(7, 6)
> -
> -#define STRTAB_STE_1_S1STALLD		(1UL << 27)
> -
> -#define STRTAB_STE_1_EATS		GENMASK_ULL(29, 28)
> -#define STRTAB_STE_1_EATS_ABT		0UL
> -#define STRTAB_STE_1_EATS_TRANS		1UL
> -#define STRTAB_STE_1_EATS_S1CHK		2UL
> -
> -#define STRTAB_STE_1_STRW		GENMASK_ULL(31, 30)
> -#define STRTAB_STE_1_STRW_NSEL1		0UL
> -#define STRTAB_STE_1_STRW_EL2		2UL
> -
> -#define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
> -#define STRTAB_STE_1_SHCFG_INCOMING	1UL
> -
> -#define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
> -#define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
> -#define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
> -#define STRTAB_STE_2_VTCR_S2SL0		GENMASK_ULL(7, 6)
> -#define STRTAB_STE_2_VTCR_S2IR0		GENMASK_ULL(9, 8)
> -#define STRTAB_STE_2_VTCR_S2OR0		GENMASK_ULL(11, 10)
> -#define STRTAB_STE_2_VTCR_S2SH0		GENMASK_ULL(13, 12)
> -#define STRTAB_STE_2_VTCR_S2TG		GENMASK_ULL(15, 14)
> -#define STRTAB_STE_2_VTCR_S2PS		GENMASK_ULL(18, 16)
> -#define STRTAB_STE_2_S2AA64		(1UL << 51)
> -#define STRTAB_STE_2_S2ENDI		(1UL << 52)
> -#define STRTAB_STE_2_S2PTW		(1UL << 54)
> -#define STRTAB_STE_2_S2R		(1UL << 58)
> -
> -#define STRTAB_STE_3_S2TTB_MASK		GENMASK_ULL(51, 4)
> -
> -/*
> - * Context descriptors.
> - *
> - * Linear: when less than 1024 SSIDs are supported
> - * 2lvl: at most 1024 L1 entries,
> - *       1024 lazy entries per table.
> - */
> -#define CTXDESC_SPLIT			10
> -#define CTXDESC_L2_ENTRIES		(1 << CTXDESC_SPLIT)
> -
> -#define CTXDESC_L1_DESC_DWORDS		1
> -#define CTXDESC_L1_DESC_V		(1UL << 0)
> -#define CTXDESC_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 12)
> -
> -#define CTXDESC_CD_DWORDS		8
> -#define CTXDESC_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
> -#define CTXDESC_CD_0_TCR_TG0		GENMASK_ULL(7, 6)
> -#define CTXDESC_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
> -#define CTXDESC_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
> -#define CTXDESC_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
> -#define CTXDESC_CD_0_TCR_EPD0		(1ULL << 14)
> -#define CTXDESC_CD_0_TCR_EPD1		(1ULL << 30)
> -
> -#define CTXDESC_CD_0_ENDI		(1UL << 15)
> -#define CTXDESC_CD_0_V			(1UL << 31)
> -
> -#define CTXDESC_CD_0_TCR_IPS		GENMASK_ULL(34, 32)
> -#define CTXDESC_CD_0_TCR_TBI0		(1ULL << 38)
> -
> -#define CTXDESC_CD_0_AA64		(1UL << 41)
> -#define CTXDESC_CD_0_S			(1UL << 44)
> -#define CTXDESC_CD_0_R			(1UL << 45)
> -#define CTXDESC_CD_0_A			(1UL << 46)
> -#define CTXDESC_CD_0_ASET		(1UL << 47)
> -#define CTXDESC_CD_0_ASID		GENMASK_ULL(63, 48)
> -
> -#define CTXDESC_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
> -
> -/*
> - * When the SMMU only supports linear context descriptor tables, pick a
> - * reasonable size limit (64kB).
> - */
> -#define CTXDESC_LINEAR_CDMAX		ilog2(SZ_64K / (CTXDESC_CD_DWORDS << 3))
> -
> -/* Command queue */
> -#define CMDQ_ENT_SZ_SHIFT		4
> -#define CMDQ_ENT_DWORDS			((1 << CMDQ_ENT_SZ_SHIFT) >> 3)
> -#define CMDQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
> -
> -#define CMDQ_CONS_ERR			GENMASK(30, 24)
> -#define CMDQ_ERR_CERROR_NONE_IDX	0
> -#define CMDQ_ERR_CERROR_ILL_IDX		1
> -#define CMDQ_ERR_CERROR_ABT_IDX		2
> -#define CMDQ_ERR_CERROR_ATC_INV_IDX	3
> -
> -#define CMDQ_0_OP			GENMASK_ULL(7, 0)
> -#define CMDQ_0_SSV			(1UL << 11)
> -
> -#define CMDQ_PREFETCH_0_SID		GENMASK_ULL(63, 32)
> -#define CMDQ_PREFETCH_1_SIZE		GENMASK_ULL(4, 0)
> -#define CMDQ_PREFETCH_1_ADDR_MASK	GENMASK_ULL(63, 12)
> -
> -#define CMDQ_CFGI_0_SSID		GENMASK_ULL(31, 12)
> -#define CMDQ_CFGI_0_SID			GENMASK_ULL(63, 32)
> -#define CMDQ_CFGI_1_LEAF		(1UL << 0)
> -#define CMDQ_CFGI_1_RANGE		GENMASK_ULL(4, 0)
> -
> -#define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
> -#define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
> -#define CMDQ_TLBI_1_LEAF		(1UL << 0)
> -#define CMDQ_TLBI_1_VA_MASK		GENMASK_ULL(63, 12)
> -#define CMDQ_TLBI_1_IPA_MASK		GENMASK_ULL(51, 12)
> -
> -#define CMDQ_ATC_0_SSID			GENMASK_ULL(31, 12)
> -#define CMDQ_ATC_0_SID			GENMASK_ULL(63, 32)
> -#define CMDQ_ATC_0_GLOBAL		(1UL << 9)
> -#define CMDQ_ATC_1_SIZE			GENMASK_ULL(5, 0)
> -#define CMDQ_ATC_1_ADDR_MASK		GENMASK_ULL(63, 12)
> -
> -#define CMDQ_PRI_0_SSID			GENMASK_ULL(31, 12)
> -#define CMDQ_PRI_0_SID			GENMASK_ULL(63, 32)
> -#define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
> -#define CMDQ_PRI_1_RESP			GENMASK_ULL(13, 12)
> -
> -#define CMDQ_SYNC_0_CS			GENMASK_ULL(13, 12)
> -#define CMDQ_SYNC_0_CS_NONE		0
> -#define CMDQ_SYNC_0_CS_IRQ		1
> -#define CMDQ_SYNC_0_CS_SEV		2
> -#define CMDQ_SYNC_0_MSH			GENMASK_ULL(23, 22)
> -#define CMDQ_SYNC_0_MSIATTR		GENMASK_ULL(27, 24)
> -#define CMDQ_SYNC_0_MSIDATA		GENMASK_ULL(63, 32)
> -#define CMDQ_SYNC_1_MSIADDR_MASK	GENMASK_ULL(51, 2)
> -
> -/* Event queue */
> -#define EVTQ_ENT_SZ_SHIFT		5
> -#define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> -#define EVTQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - EVTQ_ENT_SZ_SHIFT)
> -
> -#define EVTQ_0_ID			GENMASK_ULL(7, 0)
> -
> -/* PRI queue */
> -#define PRIQ_ENT_SZ_SHIFT		4
> -#define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
> -#define PRIQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - PRIQ_ENT_SZ_SHIFT)
> -
> -#define PRIQ_0_SID			GENMASK_ULL(31, 0)
> -#define PRIQ_0_SSID			GENMASK_ULL(51, 32)
> -#define PRIQ_0_PERM_PRIV		(1UL << 58)
> -#define PRIQ_0_PERM_EXEC		(1UL << 59)
> -#define PRIQ_0_PERM_READ		(1UL << 60)
> -#define PRIQ_0_PERM_WRITE		(1UL << 61)
> -#define PRIQ_0_PRG_LAST			(1UL << 62)
> -#define PRIQ_0_SSID_V			(1UL << 63)
> -
> -#define PRIQ_1_PRG_IDX			GENMASK_ULL(8, 0)
> -#define PRIQ_1_ADDR_MASK		GENMASK_ULL(63, 12)
> -
> -/* High-level queue structures */
> -#define ARM_SMMU_POLL_TIMEOUT_US	100
> -#define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
> -#define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
> -
>  static bool disable_bypass = 1;
>  
> -enum pri_resp {
> -	PRI_RESP_DENY = 0,
> -	PRI_RESP_FAIL = 1,
> -	PRI_RESP_SUCC = 2,
> -};
> -
> -#ifdef CONFIG_MSI
> -enum arm_smmu_msi_index {
> -	EVTQ_MSI_INDEX,
> -	GERROR_MSI_INDEX,
> -	PRIQ_MSI_INDEX,
> -	ARM_SMMU_MAX_MSIS,
> -};
> -
> -static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
> -	[EVTQ_MSI_INDEX] = {
> -		ARM_SMMU_EVTQ_IRQ_CFG0,
> -		ARM_SMMU_EVTQ_IRQ_CFG1,
> -		ARM_SMMU_EVTQ_IRQ_CFG2,
> -	},
> -	[GERROR_MSI_INDEX] = {
> -		ARM_SMMU_GERROR_IRQ_CFG0,
> -		ARM_SMMU_GERROR_IRQ_CFG1,
> -		ARM_SMMU_GERROR_IRQ_CFG2,
> -	},
> -	[PRIQ_MSI_INDEX] = {
> -		ARM_SMMU_PRIQ_IRQ_CFG0,
> -		ARM_SMMU_PRIQ_IRQ_CFG1,
> -		ARM_SMMU_PRIQ_IRQ_CFG2,
> -	},
> -};
> -#endif /* CONFIG_MSI */
> -
> -struct arm_smmu_cmdq_ent {
> -	/* Common fields */
> -	u8				opcode;
> -	bool				substream_valid;
> -
> -	/* Command-specific fields */
> -	union {
> -		#define CMDQ_OP_PREFETCH_CFG	0x1
> -		struct {
> -			u32			sid;
> -			u8			size;
> -			u64			addr;
> -		} prefetch;
> -
> -		#define CMDQ_OP_CFGI_STE	0x3
> -		#define CMDQ_OP_CFGI_ALL	0x4
> -		struct {
> -			u32			sid;
> -			union {
> -				bool		leaf;
> -				u8		span;
> -			};
> -		} cfgi;
> -
> -		#define CMDQ_OP_TLBI_EL2_ALL	0x20
> -		#define CMDQ_OP_TLBI_S12_VMALL	0x28
> -		#define CMDQ_OP_TLBI_S2_IPA	0x2a
> -		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
> -		struct {
> -			u16			asid;
> -			u16			vmid;
> -			bool			leaf;
> -			u64			addr;
> -		} tlbi;
> -
> -		#define CMDQ_OP_ATC_INV		0x40
> -		#define ATC_INV_SIZE_ALL	52
> -		struct {
> -			u32			sid;
> -			u32			ssid;
> -			u64			addr;
> -			u8			size;
> -			bool			global;
> -		} atc;
> -
> -		#define CMDQ_OP_PRI_RESP	0x41
> -		struct {
> -			u32			sid;
> -			u32			ssid;
> -			u16			grpid;
> -			enum pri_resp		resp;
> -		} pri;
> -
> -		#define CMDQ_OP_CMD_SYNC	0x46
> -		struct {
> -			u32			msidata;
> -			u64			msiaddr;
> -		} sync;
> -	};
> -};
> -
> -struct arm_smmu_ll_queue {
> -	u32				prod;
> -	u32				cons;
> -	u32				max_n_shift;
> -};
> -
> -struct arm_smmu_queue {
> -	struct arm_smmu_ll_queue	llq;
> -	int				irq; /* Wired interrupt */
> -
> -	__le64				*base;
> -	dma_addr_t			base_dma;
> -	u64				q_base;
> -
> -	size_t				ent_dwords;
> -
> -	u32 __iomem			*prod_reg;
> -	u32 __iomem			*cons_reg;
> -};
> -
> -struct arm_smmu_cmdq {
> -	struct arm_smmu_queue		q;
> -	spinlock_t			lock;
> -};
> -
> -struct arm_smmu_evtq {
> -	struct arm_smmu_queue		q;
> -	u32				max_stalls;
> -};
> -
> -struct arm_smmu_priq {
> -	struct arm_smmu_queue		q;
> -};
> -
> -/* High-level stream table and context descriptor structures */
> -struct arm_smmu_strtab_l1_desc {
> -	u8				span;
> -
> -	__le64				*l2ptr;
> -	dma_addr_t			l2ptr_dma;
> -};
> -
> -struct arm_smmu_s2_cfg {
> -	u16				vmid;
> -	u64				vttbr;
> -	u64				vtcr;
> -};
> -
> -struct arm_smmu_strtab_cfg {
> -	__le64				*strtab;
> -	dma_addr_t			strtab_dma;
> -	struct arm_smmu_strtab_l1_desc	*l1_desc;
> -	unsigned int			num_l1_ents;
> -
> -	u64				strtab_base;
> -	u32				strtab_base_cfg;
> -};
> -
> -struct arm_lpae_s2_cfg {
> -	u64			vttbr;
> -	struct {
> -		u32			ps:3;
> -		u32			tg:2;
> -		u32			sh:2;
> -		u32			orgn:2;
> -		u32			irgn:2;
> -		u32			sl:2;
> -		u32			tsz:6;
> -	} vtcr;
> -};
> -
> -/* An SMMUv3 instance */
> -struct arm_smmu_device {
> -	struct device			*dev;
> -	void __iomem			*base;
> -	void __iomem			*page1;
> -
> -#define ARM_SMMU_FEAT_2_LVL_STRTAB	(1 << 0)
> -#define ARM_SMMU_FEAT_2_LVL_CDTAB	(1 << 1)
> -#define ARM_SMMU_FEAT_TT_LE		(1 << 2)
> -#define ARM_SMMU_FEAT_TT_BE		(1 << 3)
> -#define ARM_SMMU_FEAT_PRI		(1 << 4)
> -#define ARM_SMMU_FEAT_ATS		(1 << 5)
> -#define ARM_SMMU_FEAT_SEV		(1 << 6)
> -#define ARM_SMMU_FEAT_MSI		(1 << 7)
> -#define ARM_SMMU_FEAT_COHERENCY		(1 << 8)
> -#define ARM_SMMU_FEAT_TRANS_S1		(1 << 9)
> -#define ARM_SMMU_FEAT_TRANS_S2		(1 << 10)
> -#define ARM_SMMU_FEAT_STALLS		(1 << 11)
> -#define ARM_SMMU_FEAT_HYP		(1 << 12)
> -#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
> -#define ARM_SMMU_FEAT_VAX		(1 << 14)
> -	u32				features;
> -
> -#define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> -#define ARM_SMMU_OPT_PAGE0_REGS_ONLY	(1 << 1)
> -	u32				options;
> -
> -	struct arm_smmu_cmdq		cmdq;
> -	struct arm_smmu_evtq		evtq;
> -	struct arm_smmu_priq		priq;
> -
> -	int				gerr_irq;
> -	int				combined_irq;
> -	u32				sync_nr;
> -	u8				prev_cmd_opcode;
> -
> -	unsigned long			ias; /* IPA */
> -	unsigned long			oas; /* PA */
> -	unsigned long			pgsize_bitmap;
> -
> -#define ARM_SMMU_MAX_VMIDS		(1 << 16)
> -	unsigned int			vmid_bits;
> -	DECLARE_BITMAP(vmid_map, ARM_SMMU_MAX_VMIDS);
> -
> -	unsigned int			sid_bits;
> -
> -	struct arm_smmu_strtab_cfg	strtab_cfg;
> -
> -	/* Hi16xx adds an extra 32 bits of goodness to its MSI payload */
> -	union {
> -		u32			sync_count;
> -		u64			padding;
> -	};
> -
> -	/* Need to keep a list of SMMU devices */
> -	struct list_head		devices;
> -
> -	/* Tasklets for handling evts/faults and pci page request IRQs*/
> -	struct tasklet		evtq_irq_tasklet;
> -	struct tasklet		priq_irq_tasklet;
> -	struct tasklet		combined_irq_tasklet;
> -};
> -
> -/* SMMU private data for each master */
> -struct arm_smmu_master {
> -	struct arm_smmu_device		*smmu;
> -	struct device			*dev;
> -	struct arm_smmu_domain		*domain;
> -	struct list_head		domain_head;
> -	u32				*sids;
> -	unsigned int			num_sids;
> -	bool				ats_enabled;
> -};
> -
> -/* SMMU private data for an IOMMU domain */
> -enum arm_smmu_domain_stage {
> -	ARM_SMMU_DOMAIN_S1 = 0,
> -	ARM_SMMU_DOMAIN_S2,
> -	ARM_SMMU_DOMAIN_NESTED,
> -	ARM_SMMU_DOMAIN_BYPASS,
> -};
> -
> -struct arm_smmu_domain {
> -	struct arm_smmu_device		*smmu;
> -	struct mutex			init_mutex; /* Protects smmu pointer */
> -
> -	bool				non_strict;
> -	atomic_t			nr_ats_masters;
> -
> -	enum arm_smmu_domain_stage	stage;
> -	struct arm_smmu_s2_cfg	s2_cfg;
> -
> -	/* Xen domain associated with this SMMU domain */
> -	struct domain		*d;
> -
> -	struct iommu_domain		domain;
> -
> -	struct list_head		devices;
> -	spinlock_t			devices_lock;
> -};
> -
>  struct arm_smmu_option_prop {
>  	u32 opt;
>  	const char *prop;
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> new file mode 100644
> index 0000000000..c45d2f16c4
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -0,0 +1,674 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * IOMMU API for ARM architected SMMUv3 implementations.
> + *
> + * Copyright (C) 2022 ARM Limited
> + */
> +
> +#ifndef _ARM_SMMU_V3_H
> +#define _ARM_SMMU_V3_H
> +
> +/* MMIO registers */
> +#define ARM_SMMU_IDR0			0x0
> +#define IDR0_ST_LVL			GENMASK(28, 27)
> +#define IDR0_ST_LVL_2LVL		1
> +#define IDR0_STALL_MODEL		GENMASK(25, 24)
> +#define IDR0_STALL_MODEL_STALL		0
> +#define IDR0_STALL_MODEL_FORCE		2
> +#define IDR0_TTENDIAN			GENMASK(22, 21)
> +#define IDR0_TTENDIAN_MIXED		0
> +#define IDR0_TTENDIAN_LE		2
> +#define IDR0_TTENDIAN_BE		3
> +#define IDR0_CD2L			(1 << 19)
> +#define IDR0_VMID16			(1 << 18)
> +#define IDR0_PRI			(1 << 16)
> +#define IDR0_SEV			(1 << 14)
> +#define IDR0_MSI			(1 << 13)
> +#define IDR0_ASID16			(1 << 12)
> +#define IDR0_ATS			(1 << 10)
> +#define IDR0_HYP			(1 << 9)
> +#define IDR0_COHACC			(1 << 4)
> +#define IDR0_TTF			GENMASK(3, 2)
> +#define IDR0_TTF_AARCH64		2
> +#define IDR0_TTF_AARCH32_64		3
> +#define IDR0_S1P			(1 << 1)
> +#define IDR0_S2P			(1 << 0)
> +
> +#define ARM_SMMU_IDR1			0x4
> +#define IDR1_TABLES_PRESET		(1 << 30)
> +#define IDR1_QUEUES_PRESET		(1 << 29)
> +#define IDR1_REL			(1 << 28)
> +#define IDR1_CMDQS			GENMASK(25, 21)
> +#define IDR1_EVTQS			GENMASK(20, 16)
> +#define IDR1_PRIQS			GENMASK(15, 11)
> +#define IDR1_SSIDSIZE			GENMASK(10, 6)
> +#define IDR1_SIDSIZE			GENMASK(5, 0)
> +
> +#define ARM_SMMU_IDR5			0x14
> +#define IDR5_STALL_MAX			GENMASK(31, 16)
> +#define IDR5_GRAN64K			(1 << 6)
> +#define IDR5_GRAN16K			(1 << 5)
> +#define IDR5_GRAN4K			(1 << 4)
> +#define IDR5_OAS			GENMASK(2, 0)
> +#define IDR5_OAS_32_BIT			0
> +#define IDR5_OAS_36_BIT			1
> +#define IDR5_OAS_40_BIT			2
> +#define IDR5_OAS_42_BIT			3
> +#define IDR5_OAS_44_BIT			4
> +#define IDR5_OAS_48_BIT			5
> +#define IDR5_OAS_52_BIT			6
> +#define IDR5_VAX			GENMASK(11, 10)
> +#define IDR5_VAX_52_BIT			1
> +
> +#define ARM_SMMU_CR0			0x20
> +#define CR0_ATSCHK			(1 << 4)
> +#define CR0_CMDQEN			(1 << 3)
> +#define CR0_EVTQEN			(1 << 2)
> +#define CR0_PRIQEN			(1 << 1)
> +#define CR0_SMMUEN			(1 << 0)
> +
> +#define ARM_SMMU_CR0ACK			0x24
> +
> +#define ARM_SMMU_CR1			0x28
> +#define CR1_TABLE_SH			GENMASK(11, 10)
> +#define CR1_TABLE_OC			GENMASK(9, 8)
> +#define CR1_TABLE_IC			GENMASK(7, 6)
> +#define CR1_QUEUE_SH			GENMASK(5, 4)
> +#define CR1_QUEUE_OC			GENMASK(3, 2)
> +#define CR1_QUEUE_IC			GENMASK(1, 0)
> +/* CR1 cacheability fields don't quite follow the usual TCR-style encoding */
> +#define CR1_CACHE_NC			0
> +#define CR1_CACHE_WB			1
> +#define CR1_CACHE_WT			2
> +
> +#define ARM_SMMU_CR2			0x2c
> +#define CR2_PTM				(1 << 2)
> +#define CR2_RECINVSID			(1 << 1)
> +#define CR2_E2H				(1 << 0)
> +
> +#define ARM_SMMU_GBPA			0x44
> +#define GBPA_UPDATE			(1 << 31)
> +#define GBPA_ABORT			(1 << 20)
> +
> +#define ARM_SMMU_IRQ_CTRL		0x50
> +#define IRQ_CTRL_EVTQ_IRQEN		(1 << 2)
> +#define IRQ_CTRL_PRIQ_IRQEN		(1 << 1)
> +#define IRQ_CTRL_GERROR_IRQEN		(1 << 0)
> +
> +#define ARM_SMMU_IRQ_CTRLACK		0x54
> +
> +#define ARM_SMMU_GERROR			0x60
> +#define GERROR_SFM_ERR			(1 << 8)
> +#define GERROR_MSI_GERROR_ABT_ERR	(1 << 7)
> +#define GERROR_MSI_PRIQ_ABT_ERR		(1 << 6)
> +#define GERROR_MSI_EVTQ_ABT_ERR		(1 << 5)
> +#define GERROR_MSI_CMDQ_ABT_ERR		(1 << 4)
> +#define GERROR_PRIQ_ABT_ERR		(1 << 3)
> +#define GERROR_EVTQ_ABT_ERR		(1 << 2)
> +#define GERROR_CMDQ_ERR			(1 << 0)
> +#define GERROR_ERR_MASK			0xfd
> +
> +#define ARM_SMMU_GERRORN		0x64
> +
> +#define ARM_SMMU_GERROR_IRQ_CFG0	0x68
> +#define ARM_SMMU_GERROR_IRQ_CFG1	0x70
> +#define ARM_SMMU_GERROR_IRQ_CFG2	0x74
> +
> +#define ARM_SMMU_STRTAB_BASE		0x80
> +#define STRTAB_BASE_RA			(1UL << 62)
> +#define STRTAB_BASE_ADDR_MASK		GENMASK_ULL(51, 6)
> +
> +#define ARM_SMMU_STRTAB_BASE_CFG	0x88
> +#define STRTAB_BASE_CFG_FMT		GENMASK(17, 16)
> +#define STRTAB_BASE_CFG_FMT_LINEAR	0
> +#define STRTAB_BASE_CFG_FMT_2LVL	1
> +#define STRTAB_BASE_CFG_SPLIT		GENMASK(10, 6)
> +#define STRTAB_BASE_CFG_LOG2SIZE	GENMASK(5, 0)
> +
> +#define ARM_SMMU_CMDQ_BASE		0x90
> +#define ARM_SMMU_CMDQ_PROD		0x98
> +#define ARM_SMMU_CMDQ_CONS		0x9c
> +
> +#define ARM_SMMU_EVTQ_BASE		0xa0
> +#define ARM_SMMU_EVTQ_PROD		0x100a8
> +#define ARM_SMMU_EVTQ_CONS		0x100ac
> +#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
> +#define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
> +#define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
> +
> +#define ARM_SMMU_PRIQ_BASE		0xc0
> +#define ARM_SMMU_PRIQ_PROD		0x100c8
> +#define ARM_SMMU_PRIQ_CONS		0x100cc
> +#define ARM_SMMU_PRIQ_IRQ_CFG0		0xd0
> +#define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
> +#define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
> +
> +#define ARM_SMMU_REG_SZ			0xe00
> +
> +/* Common MSI config fields */
> +#define MSI_CFG0_ADDR_MASK		GENMASK_ULL(51, 2)
> +#define MSI_CFG2_SH			GENMASK(5, 4)
> +#define MSI_CFG2_MEMATTR		GENMASK(3, 0)
> +
> +/* Common memory attribute values */
> +#define ARM_SMMU_SH_NSH			0
> +#define ARM_SMMU_SH_OSH			2
> +#define ARM_SMMU_SH_ISH			3
> +#define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
> +#define ARM_SMMU_MEMATTR_OIWB		0xf
> +
> +#define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
> +#define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
> +#define Q_OVERFLOW_FLAG			(1 << 31)
> +#define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
> +#define Q_ENT(q, p)			((q)->base +			\
> +					 Q_IDX(&((q)->llq), p) *	\
> +					 (q)->ent_dwords)
> +
> +#define Q_BASE_RWA			(1UL << 62)
> +#define Q_BASE_ADDR_MASK		GENMASK_ULL(51, 5)
> +#define Q_BASE_LOG2SIZE			GENMASK(4, 0)
> +
> +/* Ensure DMA allocations are naturally aligned */
> +#ifdef CONFIG_CMA_ALIGNMENT
> +#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
> +#else
> +#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + MAX_ORDER - 1)
> +#endif
> +
> +/*
> + * Stream table.
> + *
> + * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
> + * 2lvl: 128k L1 entries,
> + *       256 lazy entries per table (each table covers a PCI bus)
> + */
> +#define STRTAB_L1_SZ_SHIFT		20
> +#define STRTAB_SPLIT			8
> +
> +#define STRTAB_L1_DESC_DWORDS		1
> +#define STRTAB_L1_DESC_SPAN		GENMASK_ULL(4, 0)
> +#define STRTAB_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 6)
> +
> +#define STRTAB_STE_DWORDS		8
> +#define STRTAB_STE_0_V			(1UL << 0)
> +#define STRTAB_STE_0_CFG		GENMASK_ULL(3, 1)
> +#define STRTAB_STE_0_CFG_ABORT		0
> +#define STRTAB_STE_0_CFG_BYPASS		4
> +#define STRTAB_STE_0_CFG_S1_TRANS	5
> +#define STRTAB_STE_0_CFG_S2_TRANS	6
> +
> +#define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
> +#define STRTAB_STE_0_S1FMT_LINEAR	0
> +#define STRTAB_STE_0_S1FMT_64K_L2	2
> +#define STRTAB_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
> +#define STRTAB_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
> +
> +#define STRTAB_STE_1_S1DSS		GENMASK_ULL(1, 0)
> +#define STRTAB_STE_1_S1DSS_TERMINATE	0x0
> +#define STRTAB_STE_1_S1DSS_BYPASS	0x1
> +#define STRTAB_STE_1_S1DSS_SSID0	0x2
> +
> +#define STRTAB_STE_1_S1C_CACHE_NC	0UL
> +#define STRTAB_STE_1_S1C_CACHE_WBRA	1UL
> +#define STRTAB_STE_1_S1C_CACHE_WT	2UL
> +#define STRTAB_STE_1_S1C_CACHE_WB	3UL
> +#define STRTAB_STE_1_S1CIR		GENMASK_ULL(3, 2)
> +#define STRTAB_STE_1_S1COR		GENMASK_ULL(5, 4)
> +#define STRTAB_STE_1_S1CSH		GENMASK_ULL(7, 6)
> +
> +#define STRTAB_STE_1_S1STALLD		(1UL << 27)
> +
> +#define STRTAB_STE_1_EATS		GENMASK_ULL(29, 28)
> +#define STRTAB_STE_1_EATS_ABT		0UL
> +#define STRTAB_STE_1_EATS_TRANS		1UL
> +#define STRTAB_STE_1_EATS_S1CHK		2UL
> +
> +#define STRTAB_STE_1_STRW		GENMASK_ULL(31, 30)
> +#define STRTAB_STE_1_STRW_NSEL1		0UL
> +#define STRTAB_STE_1_STRW_EL2		2UL
> +
> +#define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
> +#define STRTAB_STE_1_SHCFG_INCOMING	1UL
> +
> +#define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
> +#define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
> +#define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
> +#define STRTAB_STE_2_VTCR_S2SL0		GENMASK_ULL(7, 6)
> +#define STRTAB_STE_2_VTCR_S2IR0		GENMASK_ULL(9, 8)
> +#define STRTAB_STE_2_VTCR_S2OR0		GENMASK_ULL(11, 10)
> +#define STRTAB_STE_2_VTCR_S2SH0		GENMASK_ULL(13, 12)
> +#define STRTAB_STE_2_VTCR_S2TG		GENMASK_ULL(15, 14)
> +#define STRTAB_STE_2_VTCR_S2PS		GENMASK_ULL(18, 16)
> +#define STRTAB_STE_2_S2AA64		(1UL << 51)
> +#define STRTAB_STE_2_S2ENDI		(1UL << 52)
> +#define STRTAB_STE_2_S2PTW		(1UL << 54)
> +#define STRTAB_STE_2_S2R		(1UL << 58)
> +
> +#define STRTAB_STE_3_S2TTB_MASK		GENMASK_ULL(51, 4)
> +
> +/*
> + * Context descriptors.
> + *
> + * Linear: when less than 1024 SSIDs are supported
> + * 2lvl: at most 1024 L1 entries,
> + *       1024 lazy entries per table.
> + */
> +#define CTXDESC_SPLIT			10
> +#define CTXDESC_L2_ENTRIES		(1 << CTXDESC_SPLIT)
> +
> +#define CTXDESC_L1_DESC_DWORDS		1
> +#define CTXDESC_L1_DESC_V		(1UL << 0)
> +#define CTXDESC_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 12)
> +
> +#define CTXDESC_CD_DWORDS		8
> +#define CTXDESC_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
> +#define CTXDESC_CD_0_TCR_TG0		GENMASK_ULL(7, 6)
> +#define CTXDESC_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
> +#define CTXDESC_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
> +#define CTXDESC_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
> +#define CTXDESC_CD_0_TCR_EPD0		(1ULL << 14)
> +#define CTXDESC_CD_0_TCR_EPD1		(1ULL << 30)
> +
> +#define CTXDESC_CD_0_ENDI		(1UL << 15)
> +#define CTXDESC_CD_0_V			(1UL << 31)
> +
> +#define CTXDESC_CD_0_TCR_IPS		GENMASK_ULL(34, 32)
> +#define CTXDESC_CD_0_TCR_TBI0		(1ULL << 38)
> +
> +#define CTXDESC_CD_0_AA64		(1UL << 41)
> +#define CTXDESC_CD_0_S			(1UL << 44)
> +#define CTXDESC_CD_0_R			(1UL << 45)
> +#define CTXDESC_CD_0_A			(1UL << 46)
> +#define CTXDESC_CD_0_ASET		(1UL << 47)
> +#define CTXDESC_CD_0_ASID		GENMASK_ULL(63, 48)
> +
> +#define CTXDESC_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
> +
> +/*
> + * When the SMMU only supports linear context descriptor tables, pick a
> + * reasonable size limit (64kB).
> + */
> +#define CTXDESC_LINEAR_CDMAX		ilog2(SZ_64K / (CTXDESC_CD_DWORDS << 3))
> +
> +/* Command queue */
> +#define CMDQ_ENT_SZ_SHIFT		4
> +#define CMDQ_ENT_DWORDS			((1 << CMDQ_ENT_SZ_SHIFT) >> 3)
> +#define CMDQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
> +
> +#define CMDQ_CONS_ERR			GENMASK(30, 24)
> +#define CMDQ_ERR_CERROR_NONE_IDX	0
> +#define CMDQ_ERR_CERROR_ILL_IDX		1
> +#define CMDQ_ERR_CERROR_ABT_IDX		2
> +#define CMDQ_ERR_CERROR_ATC_INV_IDX	3
> +
> +#define CMDQ_0_OP			GENMASK_ULL(7, 0)
> +#define CMDQ_0_SSV			(1UL << 11)
> +
> +#define CMDQ_PREFETCH_0_SID		GENMASK_ULL(63, 32)
> +#define CMDQ_PREFETCH_1_SIZE		GENMASK_ULL(4, 0)
> +#define CMDQ_PREFETCH_1_ADDR_MASK	GENMASK_ULL(63, 12)
> +
> +#define CMDQ_CFGI_0_SSID		GENMASK_ULL(31, 12)
> +#define CMDQ_CFGI_0_SID			GENMASK_ULL(63, 32)
> +#define CMDQ_CFGI_1_LEAF		(1UL << 0)
> +#define CMDQ_CFGI_1_RANGE		GENMASK_ULL(4, 0)
> +
> +#define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
> +#define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
> +#define CMDQ_TLBI_1_LEAF		(1UL << 0)
> +#define CMDQ_TLBI_1_VA_MASK		GENMASK_ULL(63, 12)
> +#define CMDQ_TLBI_1_IPA_MASK		GENMASK_ULL(51, 12)
> +
> +#define CMDQ_ATC_0_SSID			GENMASK_ULL(31, 12)
> +#define CMDQ_ATC_0_SID			GENMASK_ULL(63, 32)
> +#define CMDQ_ATC_0_GLOBAL		(1UL << 9)
> +#define CMDQ_ATC_1_SIZE			GENMASK_ULL(5, 0)
> +#define CMDQ_ATC_1_ADDR_MASK		GENMASK_ULL(63, 12)
> +
> +#define CMDQ_PRI_0_SSID			GENMASK_ULL(31, 12)
> +#define CMDQ_PRI_0_SID			GENMASK_ULL(63, 32)
> +#define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
> +#define CMDQ_PRI_1_RESP			GENMASK_ULL(13, 12)
> +
> +#define CMDQ_SYNC_0_CS			GENMASK_ULL(13, 12)
> +#define CMDQ_SYNC_0_CS_NONE		0
> +#define CMDQ_SYNC_0_CS_IRQ		1
> +#define CMDQ_SYNC_0_CS_SEV		2
> +#define CMDQ_SYNC_0_MSH			GENMASK_ULL(23, 22)
> +#define CMDQ_SYNC_0_MSIATTR		GENMASK_ULL(27, 24)
> +#define CMDQ_SYNC_0_MSIDATA		GENMASK_ULL(63, 32)
> +#define CMDQ_SYNC_1_MSIADDR_MASK	GENMASK_ULL(51, 2)
> +
> +/* Event queue */
> +#define EVTQ_ENT_SZ_SHIFT		5
> +#define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> +#define EVTQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - EVTQ_ENT_SZ_SHIFT)
> +
> +#define EVTQ_0_ID			GENMASK_ULL(7, 0)
> +
> +/* PRI queue */
> +#define PRIQ_ENT_SZ_SHIFT		4
> +#define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
> +#define PRIQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - PRIQ_ENT_SZ_SHIFT)
> +
> +#define PRIQ_0_SID			GENMASK_ULL(31, 0)
> +#define PRIQ_0_SSID			GENMASK_ULL(51, 32)
> +#define PRIQ_0_PERM_PRIV		(1UL << 58)
> +#define PRIQ_0_PERM_EXEC		(1UL << 59)
> +#define PRIQ_0_PERM_READ		(1UL << 60)
> +#define PRIQ_0_PERM_WRITE		(1UL << 61)
> +#define PRIQ_0_PRG_LAST			(1UL << 62)
> +#define PRIQ_0_SSID_V			(1UL << 63)
> +
> +#define PRIQ_1_PRG_IDX			GENMASK_ULL(8, 0)
> +#define PRIQ_1_ADDR_MASK		GENMASK_ULL(63, 12)
> +
> +/* High-level queue structures */
> +#define ARM_SMMU_POLL_TIMEOUT_US	100
> +#define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
> +#define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
> +
> +#define FIELD_PREP(_mask, _val)			\
> +	(((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> +
> +#define FIELD_GET(_mask, _reg)			\
> +	((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> +
> +/* Linux compatibility functions. */
> +typedef paddr_t		dma_addr_t;
> +typedef paddr_t		phys_addr_t;
> +typedef unsigned int		gfp_t;
> +
> +/* Alias to Xen lock functions */
> +#define mutex spinlock
> +#define mutex_init spin_lock_init
> +#define mutex_lock spin_lock
> +#define mutex_unlock spin_unlock
> +
> +/* SMMU private data for an IOMMU domain */
> +enum arm_smmu_domain_stage {
> +	ARM_SMMU_DOMAIN_S1 = 0,
> +	ARM_SMMU_DOMAIN_S2,
> +	ARM_SMMU_DOMAIN_NESTED,
> +	ARM_SMMU_DOMAIN_BYPASS,
> +};
> +
> +/* Xen specific code. */
> +struct iommu_domain {
> +	/* Runtime SMMU configuration for this iommu_domain */
> +	atomic_t		ref;
> +	/*
> +	 * Used to link iommu_domain contexts for a same domain.
> +	 * There is at least one per-SMMU to used by the domain.
> +	 */
> +	struct list_head		list;
> +};
> +
> +/* Describes information required for a Xen domain */
> +struct arm_smmu_xen_domain {
> +	spinlock_t		lock;
> +
> +	/* List of iommu domains associated to this domain */
> +	struct list_head	contexts;
> +};
> +
> +enum pri_resp {
> +	PRI_RESP_DENY = 0,
> +	PRI_RESP_FAIL = 1,
> +	PRI_RESP_SUCC = 2,
> +};
> +
> +#ifdef CONFIG_MSI
> +enum arm_smmu_msi_index {
> +	EVTQ_MSI_INDEX,
> +	GERROR_MSI_INDEX,
> +	PRIQ_MSI_INDEX,
> +	ARM_SMMU_MAX_MSIS,
> +};
> +
> +static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
> +	[EVTQ_MSI_INDEX] = {
> +		ARM_SMMU_EVTQ_IRQ_CFG0,
> +		ARM_SMMU_EVTQ_IRQ_CFG1,
> +		ARM_SMMU_EVTQ_IRQ_CFG2,
> +	},
> +	[GERROR_MSI_INDEX] = {
> +		ARM_SMMU_GERROR_IRQ_CFG0,
> +		ARM_SMMU_GERROR_IRQ_CFG1,
> +		ARM_SMMU_GERROR_IRQ_CFG2,
> +	},
> +	[PRIQ_MSI_INDEX] = {
> +		ARM_SMMU_PRIQ_IRQ_CFG0,
> +		ARM_SMMU_PRIQ_IRQ_CFG1,
> +		ARM_SMMU_PRIQ_IRQ_CFG2,
> +	},
> +};
> +#endif /* CONFIG_MSI */
> +
> +struct arm_smmu_cmdq_ent {
> +	/* Common fields */
> +	u8				opcode;
> +	bool				substream_valid;
> +
> +	/* Command-specific fields */
> +	union {
> +		#define CMDQ_OP_PREFETCH_CFG	0x1
> +		struct {
> +			u32			sid;
> +			u8			size;
> +			u64			addr;
> +		} prefetch;
> +
> +		#define CMDQ_OP_CFGI_STE	0x3
> +		#define CMDQ_OP_CFGI_ALL	0x4
> +		struct {
> +			u32			sid;
> +			union {
> +				bool		leaf;
> +				u8		span;
> +			};
> +		} cfgi;
> +
> +		#define CMDQ_OP_TLBI_EL2_ALL	0x20
> +		#define CMDQ_OP_TLBI_S12_VMALL	0x28
> +		#define CMDQ_OP_TLBI_S2_IPA	0x2a
> +		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
> +		struct {
> +			u16			asid;
> +			u16			vmid;
> +			bool			leaf;
> +			u64			addr;
> +		} tlbi;
> +
> +		#define CMDQ_OP_ATC_INV		0x40
> +		#define ATC_INV_SIZE_ALL	52
> +		struct {
> +			u32			sid;
> +			u32			ssid;
> +			u64			addr;
> +			u8			size;
> +			bool			global;
> +		} atc;
> +
> +		#define CMDQ_OP_PRI_RESP	0x41
> +		struct {
> +			u32			sid;
> +			u32			ssid;
> +			u16			grpid;
> +			enum pri_resp		resp;
> +		} pri;
> +
> +		#define CMDQ_OP_CMD_SYNC	0x46
> +		struct {
> +			u32			msidata;
> +			u64			msiaddr;
> +		} sync;
> +	};
> +};
> +
> +struct arm_smmu_ll_queue {
> +	u32				prod;
> +	u32				cons;
> +	u32				max_n_shift;
> +};
> +
> +struct arm_smmu_queue {
> +	struct arm_smmu_ll_queue	llq;
> +	int				irq; /* Wired interrupt */
> +
> +	__le64				*base;
> +	dma_addr_t			base_dma;
> +	u64				q_base;
> +
> +	size_t				ent_dwords;
> +
> +	u32 __iomem			*prod_reg;
> +	u32 __iomem			*cons_reg;
> +};
> +
> +struct arm_smmu_cmdq {
> +	struct arm_smmu_queue		q;
> +	spinlock_t			lock;
> +};
> +
> +struct arm_smmu_evtq {
> +	struct arm_smmu_queue		q;
> +	u32				max_stalls;
> +};
> +
> +struct arm_smmu_priq {
> +	struct arm_smmu_queue		q;
> +};
> +
> +/* High-level stream table and context descriptor structures */
> +struct arm_smmu_strtab_l1_desc {
> +	u8				span;
> +
> +	__le64				*l2ptr;
> +	dma_addr_t			l2ptr_dma;
> +};
> +
> +struct arm_smmu_s2_cfg {
> +	u16				vmid;
> +	u64				vttbr;
> +	u64				vtcr;
> +};
> +
> +struct arm_smmu_strtab_cfg {
> +	__le64				*strtab;
> +	dma_addr_t			strtab_dma;
> +	struct arm_smmu_strtab_l1_desc	*l1_desc;
> +	unsigned int			num_l1_ents;
> +
> +	u64				strtab_base;
> +	u32				strtab_base_cfg;
> +};
> +
> +struct arm_lpae_s2_cfg {
> +	u64			vttbr;
> +	struct {
> +		u32			ps:3;
> +		u32			tg:2;
> +		u32			sh:2;
> +		u32			orgn:2;
> +		u32			irgn:2;
> +		u32			sl:2;
> +		u32			tsz:6;
> +	} vtcr;
> +};
> +
> +/* An SMMUv3 instance */
> +struct arm_smmu_device {
> +	struct device			*dev;
> +	void __iomem			*base;
> +	void __iomem			*page1;
> +
> +#define ARM_SMMU_FEAT_2_LVL_STRTAB	(1 << 0)
> +#define ARM_SMMU_FEAT_2_LVL_CDTAB	(1 << 1)
> +#define ARM_SMMU_FEAT_TT_LE		(1 << 2)
> +#define ARM_SMMU_FEAT_TT_BE		(1 << 3)
> +#define ARM_SMMU_FEAT_PRI		(1 << 4)
> +#define ARM_SMMU_FEAT_ATS		(1 << 5)
> +#define ARM_SMMU_FEAT_SEV		(1 << 6)
> +#define ARM_SMMU_FEAT_MSI		(1 << 7)
> +#define ARM_SMMU_FEAT_COHERENCY		(1 << 8)
> +#define ARM_SMMU_FEAT_TRANS_S1		(1 << 9)
> +#define ARM_SMMU_FEAT_TRANS_S2		(1 << 10)
> +#define ARM_SMMU_FEAT_STALLS		(1 << 11)
> +#define ARM_SMMU_FEAT_HYP		(1 << 12)
> +#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
> +#define ARM_SMMU_FEAT_VAX		(1 << 14)
> +	u32				features;
> +
> +#define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> +#define ARM_SMMU_OPT_PAGE0_REGS_ONLY	(1 << 1)
> +	u32				options;
> +
> +	struct arm_smmu_cmdq		cmdq;
> +	struct arm_smmu_evtq		evtq;
> +	struct arm_smmu_priq		priq;
> +
> +	int				gerr_irq;
> +	int				combined_irq;
> +	u32				sync_nr;
> +	u8				prev_cmd_opcode;
> +
> +	unsigned long			ias; /* IPA */
> +	unsigned long			oas; /* PA */
> +	unsigned long			pgsize_bitmap;
> +
> +#define ARM_SMMU_MAX_VMIDS		(1 << 16)
> +	unsigned int			vmid_bits;
> +	DECLARE_BITMAP(vmid_map, ARM_SMMU_MAX_VMIDS);
> +
> +	unsigned int			sid_bits;
> +
> +	struct arm_smmu_strtab_cfg	strtab_cfg;
> +
> +	/* Hi16xx adds an extra 32 bits of goodness to its MSI payload */
> +	union {
> +		u32			sync_count;
> +		u64			padding;
> +	};
> +
> +	/* Need to keep a list of SMMU devices */
> +	struct list_head		devices;
> +
> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
> +	struct tasklet		evtq_irq_tasklet;
> +	struct tasklet		priq_irq_tasklet;
> +	struct tasklet		combined_irq_tasklet;
> +};
> +
> +/* SMMU private data for each master */
> +struct arm_smmu_master {
> +	struct arm_smmu_device		*smmu;
> +	struct device			*dev;
> +	struct arm_smmu_domain		*domain;
> +	struct list_head		domain_head;
> +	u32				*sids;
> +	unsigned int			num_sids;
> +	bool				ats_enabled;
> +};
> +
> +struct arm_smmu_domain {
> +	struct arm_smmu_device		*smmu;
> +	struct mutex			init_mutex; /* Protects smmu pointer */
> +
> +	bool				non_strict;
> +	atomic_t			nr_ats_masters;
> +
> +	enum arm_smmu_domain_stage	stage;
> +	struct arm_smmu_s2_cfg	s2_cfg;
> +
> +	/* Xen domain associated with this SMMU domain */
> +	struct domain		*d;
> +
> +	struct iommu_domain		domain;
> +
> +	struct list_head		devices;
> +	spinlock_t			devices_lock;
> +};
> +
> +#endif /* _ARM_SMMU_V3_H */
> -- 
> 2.25.1
> 

