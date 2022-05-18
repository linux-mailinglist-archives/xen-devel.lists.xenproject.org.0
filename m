Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6152B848
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 13:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332007.555650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHVE-00019N-5T; Wed, 18 May 2022 11:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332007.555650; Wed, 18 May 2022 11:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHVE-00016D-1C; Wed, 18 May 2022 11:06:04 +0000
Received: by outflank-mailman (input) for mailman id 332007;
 Wed, 18 May 2022 11:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTh1=V2=citrix.com=prvs=130776dd6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrHVC-000165-Kk
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 11:06:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f9267f7-d69a-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 13:06:01 +0200 (CEST)
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
X-Inumbo-ID: 7f9267f7-d69a-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652871961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iaY1WR4metXJyWPNHIiVGadin5NrWxhl8OS+cf7J8LI=;
  b=WXvTpMC3xm3/Bl1UxMrgUwoes6PxkhKUDxsHQMlaivOaZfTDsd1kA6DI
   JqTezVencMJs5OI6MvwTJ7LiYMI6+G7fWOFUZ2yGnjYjdScteV3h7bAPF
   aTbIFOH0hiNYiayoylrFNhf99ZHhSPmbKjCgowaCTqGrvmuwCFYxh/rR3
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70956835
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RRpeoKCpTWngtBVW/7bjw5YqxClBgxIJ4kV8jS/XYbTApDtw1GEHy
 mBJXWvTPf/YMzT9KNx0aoyyoU4HvJHSn9Q2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhRy
 dNtmqK8ZD0lFfzCt8oMEAECOiBXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8WTKuAN
 5FEAdZpRDHQYBpRE2gcMrAnvbqwxXPOeTdnmnvA8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3vRnmkGJz2ofThgfT0KmoOKRg1S7HdlYL
 iQ8/S4jrrM78kCxecXsRB2zoHOCvRk0VsJZFqsx7wTl4pTT5wGVF20VVAlrYdYttNI1bTEy3
 1rPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bphXLQ9V4DL+ujvX6HDjxx
 3aBqy1Wr7cOic8G0eO051nDhxqlvJ2PRQkwji3VUXii9RhRf5O+asqj7l2zxelEBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqX5uGbkOyTiAwXKILI5/ziA9PB1AM+9RLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquKN4QTO/CdYCfCpXgzPhDIgwgBhWB2yckC1
 YGnndFA5JrwIYBu13KISugUytfHLQhulDqIFfgXI/lKuIdyhUJ5q59YaTNijchjtctoRTk5F
 P4GbqO3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaKLkep7J9E8wf8N/gstw
 p1achYIoGcTeFWdcVnaApydQO2HsWlDQYITYnV3YAfAN4kLaoez9qYPH6bbjpF8nNGPOcVcF
 qFfE+3ZW6wnYm2ep1w1MMmsxKQ/JU/DrV/fYEKYjM0XIscIq/rhoYS/IGMCNUAmU0KKiCfJi
 +b+ilKDHMBSHl0K4QS/QKvH8m5ddEM1wIpaN3Yk6PEJEKkw2OCG8xDMs8I=
IronPort-HdrOrdr: A9a23:pt6kRqpWYsqiL2cHgvT7oikaV5opeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc6QxhPE3I9urtBEDtexzhHNtOkO8s1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaTN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="70956835"
Date: Wed, 18 May 2022 12:05:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>,
	"Wei Liu" <wl@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V8 2/2] libxl: Introduce basic virtio-mmio support on Arm
Message-ID: <YoTTEBSlz0t8LslO@perard.uk.xensource.com>
References: <1651598763-12162-1-git-send-email-olekstysh@gmail.com>
 <1651598763-12162-3-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1651598763-12162-3-git-send-email-olekstysh@gmail.com>

On Tue, May 03, 2022 at 08:26:03PM +0300, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> This patch introduces helpers to allocate Virtio MMIO params
> (IRQ and memory region) and create specific device node in
> the Guest device-tree with allocated params. In order to deal
> with multiple Virtio devices, reserve corresponding ranges.
> For now, we reserve 1MB for memory regions and 10 SPIs.
> 
> As these helpers should be used for every Virtio device attached
> to the Guest, call them for Virtio disk(s).
> 
> Please note, with statically allocated Virtio IRQs there is
> a risk of a clash with a physical IRQs of passthrough devices.
> For the first version, it's fine, but we should consider allocating
> the Virtio IRQs automatically. Thankfully, we know in advance which
> IRQs will be used for passthrough to be able to choose non-clashed
> ones.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0..37403a2 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -8,6 +8,46 @@
>  #include <assert.h>
>  #include <xen/device_tree_defs.h>
>  
> +/*
> + * There is no clear requirements for the total size of Virtio MMIO region.
> + * The size of control registers is 0x100 and device-specific configuration
> + * registers starts at the offset 0x100, however it's size depends on the device
> + * and the driver. Pick the biggest known size at the moment to cover most
> + * of the devices (also consider allowing the user to configure the size via
> + * config file for the one not conforming with the proposed value).
> + */
> +#define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)
> +
> +static uint64_t alloc_virtio_mmio_base(libxl__gc *gc, uint64_t *virtio_mmio_base)
> +{
> +    uint64_t base = *virtio_mmio_base;
> +
> +    /* Make sure we have enough reserved resources */
> +    if ((base + VIRTIO_MMIO_DEV_SIZE >
> +        GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMIO_SIZE)) {

Could you remove the second set of parentheses? I'd like the compiler to
warn us if there's an assignment.

> @@ -26,8 +66,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      uint32_t nr_spis = 0;
>      unsigned int i;
> -    uint32_t vuart_irq;
> -    bool vuart_enabled = false;
> +    uint32_t vuart_irq, virtio_irq = 0;
> +    bool vuart_enabled = false, virtio_enabled = false;
> +    uint64_t virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
> +    uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
>  
>      /*
>       * If pl011 vuart is enabled then increment the nr_spis to allow allocation
> @@ -39,6 +81,30 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          vuart_enabled = true;
>      }
>  
> +    for (i = 0; i < d_config->num_disks; i++) {
> +        libxl_device_disk *disk = &d_config->disks[i];
> +
> +        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
> +            if (!disk->base)
> +                return ERROR_FAIL;
> +
> +            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
> +            if (!disk->irq)
> +                return ERROR_FAIL;
> +
> +            if (virtio_irq < disk->irq)
> +                virtio_irq = disk->irq;
> +            virtio_enabled = true;
> +
> +            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
> +                disk->vdev, disk->irq, disk->base);
> +        }
> +    }
> +
> +    if (virtio_enabled)
> +        nr_spis += (virtio_irq - 32) + 1;

Is it possible to update "nr_spis" inside the loop? The added value
seems to be "number of virtio device + 1", so updating "nr_spis" and
adding +1 after the loop could work, right?

Also, what is "32"? Is it "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" ?

> +
>      for (i = 0; i < d_config->b_info.num_irqs; i++) {
>          uint32_t irq = d_config->b_info.irqs[i];
>          uint32_t spi;
> @@ -787,6 +860,39 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +
> +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> +                                 uint64_t base, uint32_t irq)
> +{
> +    int res;
> +    gic_interrupt intr;
> +    /* Placeholder for virtio@ + a 64-bit number + \0 */
> +    char buf[24];
> +
> +    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);

Could you use GCSPRINTF() here instead of using a buffer of a static
size calculated by hand which is potentially wrong? Also, the return
value of snprintf isn't checked so the string could be truncated without
warning. So I think GCSPRINTF is better than a static buffer.



The rest of the patch looks fine.

Thanks,

-- 
Anthony PERARD

