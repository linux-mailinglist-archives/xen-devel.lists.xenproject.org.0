Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5541CA8E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 18:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199277.353232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcir-0006kO-13; Wed, 29 Sep 2021 16:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199277.353232; Wed, 29 Sep 2021 16:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVciq-0006hI-SN; Wed, 29 Sep 2021 16:46:20 +0000
Received: by outflank-mailman (input) for mailman id 199277;
 Wed, 29 Sep 2021 16:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVcip-0006fu-5A
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 16:46:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4a5e4d0-fe18-43fa-ada7-7f6233ae9aa6;
 Wed, 29 Sep 2021 16:46:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C550161262;
 Wed, 29 Sep 2021 16:46:17 +0000 (UTC)
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
X-Inumbo-ID: e4a5e4d0-fe18-43fa-ada7-7f6233ae9aa6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632933977;
	bh=0C5ebCP15EqzFvJnPAZfSX9Cho3Km9f0yDxkWA9Uxyw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TsaFJ6mJfp1vkC/LhIUZbuPItMgGyok1beGvqrrTn94cs1lBnIv3vg/7G6qFFqkSF
	 e+uQTp9se1lSJe6BGQd9mTgf5x495/tORdW1ZiWUKB+jpYbRtnjm2SGfuz1W88tgOm
	 520ZEGh1NPTw/YHd5mBMhnulVWvvl5hDVHa52a3FIH5CUcxlYX6ku/hPAuuNCDJCDh
	 j1GFT7505dyA0uuwexsNJZigjM4U4y1F6uC7MqpZp+DtC2TK235v7Z30iYHJE0REJs
	 gjHNTp6xNnD0cjXhpgyImujsm1NRpu/d/KkYleeb4JGQGm1dT7W001bbZ+zzrrLST1
	 QNDypwS4+lERQ==
Date: Wed, 29 Sep 2021 09:46:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 15/17] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
In-Reply-To: <adabef3cd1774ca51f1b409bd97a2ae353eaac2b.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281645490.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <adabef3cd1774ca51f1b409bd97a2ae353eaac2b.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> This patch will be reverted once we add support for VPCI MSI/MSIX
> support on ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3: none
> Change in v2: Patch introduced in v2
> ---
>  xen/drivers/vpci/Makefile | 3 ++-
>  xen/drivers/vpci/header.c | 2 ++
>  xen/include/asm-arm/pci.h | 8 ++++++++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 55d1bdfda0..1a1413b93e 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1 +1,2 @@
> -obj-y += vpci.o header.o msi.o msix.o
> +obj-y += vpci.o header.o
> +obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba9a036202..f8cd55e7c0 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>       * FIXME: punching holes after the p2m has been set up might be racy for
>       * DomU usage, needs to be revisited.
>       */
> +#ifdef CONFIG_HAS_PCI_MSI
>      if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>          return;
> +#endif
>  
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 49c9622902..5532ce3977 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,14 @@ struct arch_pci_dev {
>      struct device dev;
>  };
>  
> +/* Arch-specific MSI data for vPCI. */
> +struct vpci_arch_msi {
> +};
> +
> +/* Arch-specific MSI-X entry data for vPCI. */
> +struct vpci_arch_msix_entry {
> +};
> +
>  /*
>   * struct to hold the mappings of a config space window. This
>   * is expected to be used as sysdata for PCI controllers that
> -- 
> 2.17.1
> 

