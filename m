Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F330E36B726
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 18:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117819.223735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb4LF-0007Xi-Uk; Mon, 26 Apr 2021 16:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117819.223735; Mon, 26 Apr 2021 16:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb4LF-0007XL-RH; Mon, 26 Apr 2021 16:44:13 +0000
Received: by outflank-mailman (input) for mailman id 117819;
 Mon, 26 Apr 2021 16:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWrc=JX=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lb4LE-0007XG-75
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 16:44:12 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30cdc03d-9319-40ec-b94b-52b9603b2123;
 Mon, 26 Apr 2021 16:44:11 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id q136so36163968qka.7
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 09:44:11 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170])
 by smtp.gmail.com with ESMTPSA id q14sm11517428qtp.26.2021.04.26.09.44.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:44:10 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id a18so18280254qtj.10
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 09:44:10 -0700 (PDT)
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
X-Inumbo-ID: 30cdc03d-9319-40ec-b94b-52b9603b2123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KlgosoMJOAaR/ET01AhknsNf3mj6gtcliiDg0dLL1e0=;
        b=FfxC6YTfTyKRjULzScvZeh080rowzObsgfkNkB6PbFU85WK18TorFZb3nTplFpotQN
         FCzKzeHFiWHC6SAAz0H1ZvobWir4E6RenbNbEqtrFbyTUyimRczwWol0BDixJHUTha+x
         eXWW6lC9g26ZhTBX/V5pk140gf+3zGj/JaWxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KlgosoMJOAaR/ET01AhknsNf3mj6gtcliiDg0dLL1e0=;
        b=Fm+Tg2T0DdYUSXpOmBsmVad6lYlGt+j59pppbltRbTOEc/izHqBjYhF+s8djs3ZaNa
         Go/l7v9+l2bQlucseUuwWf3rKcsN1MBBTf9Qs7p5w4MvIWoBNn8r2ucA2sNRnw7i6JEL
         WGlLbf0UBpiz7Z2Tn2fPt/mkEBixDllXWZrgFkX24cvLqN4WzyKrOeqi/qTwJaz/uGnv
         Dkk/r0xv/tg2xBDjHrlZnUOJWVCVPBq5YqUTY1v5EOO0s3Czdu7jH5UjrDt/pdH2c8A2
         G/SPU/1oxXuIuB7x2fC4c3oDzlF3rOjbuCYOwR5EaoQSGcgKfAIE0r4ZOV3OTRnovIrY
         zOdw==
X-Gm-Message-State: AOAM530pEtXMG3OT0nCYt91yAzONJJRPfCESy4fZxhXAswV452oQEVuE
	K33XWcC3D5p1OM9tCg2HHLd2wOgCibHJYw==
X-Google-Smtp-Source: ABdhPJzVHTsXveYJFHdWmdSUKcEcmkDKH3h5f0wbWlnCWvL/pDj5HU/C3eGpJDiRJraor3HO5NMcJA==
X-Received: by 2002:a37:a68a:: with SMTP id p132mr18679664qke.413.1619455450619;
        Mon, 26 Apr 2021 09:44:10 -0700 (PDT)
X-Received: by 2002:a05:6638:68b:: with SMTP id i11mr17242768jab.90.1619455099476;
 Mon, 26 Apr 2021 09:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org> <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
In-Reply-To: <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:38:08 +0800
X-Gmail-Original-Message-ID: <CALiNf28ExE8OLsuDaN9nC=eAi-iG0rct_TJCCxAcWW4+_pdj2g@mail.gmail.com>
Message-ID: <CALiNf28ExE8OLsuDaN9nC=eAi-iG0rct_TJCCxAcWW4+_pdj2g@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	grant.likely@arm.com, xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, 
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 9:35 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > If a device is not behind an IOMMU, we look up the device node and set
> > up the restricted DMA when the restricted-dma-pool is presented.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   drivers/of/address.c    | 25 +++++++++++++++++++++++++
> >   drivers/of/device.c     |  3 +++
> >   drivers/of/of_private.h |  5 +++++
> >   3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 54f221dde267..fff3adfe4986 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -8,6 +8,7 @@
> >   #include <linux/logic_pio.h>
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/pci.h>
> >   #include <linux/pci_regs.h>
> >   #include <linux/sizes.h>
> > @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
> >   }
> >   EXPORT_SYMBOL_GPL(of_dma_is_coherent);
> >
> > +int of_dma_set_restricted_buffer(struct device *dev)
> > +{
> > +     struct device_node *node;
> > +     int count, i;
> > +
> > +     if (!dev->of_node)
> > +             return 0;
> > +
> > +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> > +                                             sizeof(phandle));
> > +     for (i = 0; i < count; i++) {
> > +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> > +             /* There might be multiple memory regions, but only one
> > +              * restriced-dma-pool region is allowed.
> > +              */
>
> What's the use-case for having multiple regions if the restricted pool
> is by definition the only one accessible?

There might be a device coherent pool (shared-dma-pool) and
dma_alloc_attrs might allocate memory from that pool [1].
I'm not sure if it makes sense to have another device coherent pool
while using restricted DMA pool though.

[1] https://elixir.bootlin.com/linux/v5.12/source/kernel/dma/mapping.c#L435


>
> Robin.
>
> > +             if (of_device_is_compatible(node, "restricted-dma-pool") &&
> > +                 of_device_is_available(node))
> > +                     return of_reserved_mem_device_init_by_idx(
> > +                             dev, dev->of_node, i);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   /**
> >    * of_mmio_is_nonposted - Check if device uses non-posted MMIO
> >    * @np:     device node
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index c5a9473a5fb1..d8d865223e51 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >
> >       arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >
> > +     if (!iommu)
> > +             return of_dma_set_restricted_buffer(dev);
> > +
> >       return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> > index d717efbd637d..e9237f5eff48 100644
> > --- a/drivers/of/of_private.h
> > +++ b/drivers/of/of_private.h
> > @@ -163,12 +163,17 @@ struct bus_dma_region;
> >   #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
> >   int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map);
> > +int of_dma_set_restricted_buffer(struct device *dev);
> >   #else
> >   static inline int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map)
> >   {
> >       return -ENODEV;
> >   }
> > +static inline int of_dma_get_restricted_buffer(struct device *dev)
> > +{
> > +     return -ENODEV;
> > +}
> >   #endif
> >
> >   #endif /* _LINUX_OF_PRIVATE_H */
> >

