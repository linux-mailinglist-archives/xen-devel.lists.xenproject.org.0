Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F941CA82
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 18:43:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199264.353209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcfS-0005Q8-5o; Wed, 29 Sep 2021 16:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199264.353209; Wed, 29 Sep 2021 16:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcfS-0005OL-1n; Wed, 29 Sep 2021 16:42:50 +0000
Received: by outflank-mailman (input) for mailman id 199264;
 Wed, 29 Sep 2021 16:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVcfQ-0005OA-Vw
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 16:42:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47101cac-2144-11ec-bd13-12813bfff9fa;
 Wed, 29 Sep 2021 16:42:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AA9161262;
 Wed, 29 Sep 2021 16:42:47 +0000 (UTC)
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
X-Inumbo-ID: 47101cac-2144-11ec-bd13-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632933767;
	bh=Ls0HHz7ufDWk8S7FpflBhQt8FKDysLwB294j6ZcCKvc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kkvO2JXodbreZ7ggI82UmVodYchQYAQ8VY46AI+BrAqy5LTmq4HNLAa1N9CfhrVMf
	 xCG9xzn4vX67PqBI6V2ZBi4ewmOmSL2fQGdHYm3gVCX3t+4vKcshCi0rSZQKNQHz7F
	 vzI8t4GGTYXWAX//CYXPyAkzGqt5pCcSSYciiHjTsAX3tqZEPopXAmAa5AxsrkvcBf
	 ti/HsS83+RwoswneR4Pn9ShXcNaIr0D2JGNDiu0HbVumiwg0JLwt80MiH28BCC0EQL
	 aebgs0KxhoN6Khxlz3WPQwNJTZ9QlHw83wq19gBg/Yp/MUMr4eO8f/MohWBtOMPeap
	 m8DF+T6r71CtQ==
Date: Wed, 29 Sep 2021 09:42:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 13/17] xen/arm: Implement pci access functions
In-Reply-To: <33cc6b7a133787700ea8ba4e54a03141d3aca1ea.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281642360.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <33cc6b7a133787700ea8ba4e54a03141d3aca1ea.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> Implement generic pci access functions to read/write the configuration
> space.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Remove PRI_pci as not used.
> - Replace uint32_t sbdf to pci_sbdf_t sbdf to avoid typecast
> Change in v2: Fixed comments
> ---
>  xen/arch/arm/pci/pci-access.c      | 57 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
>  xen/include/asm-arm/pci.h          |  1 +
>  3 files changed, 77 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index 3cd14a4b87..9f9aac43d7 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -16,6 +16,7 @@
>  #include <asm/io.h>
>  
>  #define INVALID_VALUE (~0U)
> +#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>  
>  int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value)
> @@ -72,6 +73,62 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>      return 0;
>  }
>  
> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> +                                unsigned int len)
> +{
> +    uint32_t val = PCI_ERR_VALUE(len);
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +        return val;
> +
> +    if ( unlikely(!bridge->ops->read) )
> +        return val;
> +
> +    bridge->ops->read(bridge, sbdf, reg, len, &val);
> +
> +    return val;
> +}
> +
> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
> +                             unsigned int len, uint32_t val)
> +{
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +        return;
> +
> +    if ( unlikely(!bridge->ops->write) )
> +        return;
> +
> +    bridge->ops->write(bridge, sbdf, reg, len, val);
> +}
> +
> +/*
> + * Wrappers for all PCI configuration access functions.
> + */
> +
> +#define PCI_OP_WRITE(size, type)                            \
> +    void pci_conf_write##size(pci_sbdf_t sbdf,              \
> +                              unsigned int reg, type val)   \
> +{                                                           \
> +    pci_config_write(sbdf, reg, size / 8, val);             \
> +}
> +
> +#define PCI_OP_READ(size, type)                             \
> +    type pci_conf_read##size(pci_sbdf_t sbdf,               \
> +                              unsigned int reg)             \
> +{                                                           \
> +    return pci_config_read(sbdf, reg, size / 8);            \
> +}
> +
> +PCI_OP_READ(8, uint8_t)
> +PCI_OP_READ(16, uint16_t)
> +PCI_OP_READ(32, uint32_t)
> +PCI_OP_WRITE(8, uint8_t)
> +PCI_OP_WRITE(16, uint16_t)
> +PCI_OP_WRITE(32, uint32_t)
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index a08e06cea1..c5941b10e9 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -236,6 +236,25 @@ err_exit:
>      return err;
>  }
>  
> +/*
> + * This function will lookup an hostbridge based on the segment and bus
> + * number.
> + */
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->segment != segment )
> +            continue;
> +        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_end) )
> +            continue;
> +        return bridge;
> +    }
> +
> +    return NULL;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index bb7eda6705..49c9622902 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -81,6 +81,7 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                               uint32_t reg, uint32_t len, uint32_t value);
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 pci_sbdf_t sbdf, uint32_t where);
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
>  
>  static always_inline bool is_pci_passthrough_enabled(void)
>  {
> -- 
> 2.17.1
> 

