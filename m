Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B03F94B6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 08:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173420.316435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJVpX-0004l4-Iv; Fri, 27 Aug 2021 06:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173420.316435; Fri, 27 Aug 2021 06:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJVpX-0004jH-Eq; Fri, 27 Aug 2021 06:59:11 +0000
Received: by outflank-mailman (input) for mailman id 173420;
 Fri, 27 Aug 2021 06:59:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XGXj=NS=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1mJVpW-0004jB-B6
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 06:59:10 +0000
Received: from mail-pl1-x630.google.com (unknown [2607:f8b0:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67b75533-d9b3-456b-bd26-4782028bb4b4;
 Fri, 27 Aug 2021 06:59:09 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id j2so3372332pll.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 23:59:09 -0700 (PDT)
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
X-Inumbo-ID: 67b75533-d9b3-456b-bd26-4782028bb4b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rqn+GrCddwb17438Eb7/acjTBeKWly1ebyK4GCadnFc=;
        b=Ahob/aCaoxGGmBX3uT/2Oo+coR/T1tys8xgPUYlJZHQ+79x1W7tMhNYHihEb3g00Pw
         m+dgL0BLb9DG6XuqQrGIlpqK11vUr+Y2ytYHZ7LdTBFa1tFBJE3STgSjF41FypNGQroh
         EB33JFOQSvpQcvOA/KVG6FqtXl7O0+BT+q4qQg5vtIojCX29E2kJoRY1MRvb3ovAgDbp
         aFXAm0ssP0g7n3TLr2XOHHUaLQbsPjFKeMCjJaff6OnyliY0dDUUm9ACwqxN5BizOny5
         6o6R1k1p3THp4VGKPD1gPgbF9N5SJmHFccehHvyHptaqGZoYeq1bOsTJYfzYeYbXFcTi
         n8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rqn+GrCddwb17438Eb7/acjTBeKWly1ebyK4GCadnFc=;
        b=hYQwIjIptUTJCothOTZnQSjlW3yZQN+sO4ErY9wkwBTrWFZkFwB819E1QsSIdUSIco
         b7oTM84TLzZ77jM0nJKhxEfPURkqVTY+MpzPV8GaDlMuOVo0qdRnvyIzAA8dP8ttHCHU
         +x8gqpZumGZD3nxbN7gBPZ2iP+uQt/QnOyE/uvpvd+E9bTTCUmYgnYuKer/1oYCPAgaJ
         zxyoWXvyjGYYrowfyPi5pZZPn6ueUloRdFm7mMtq8CBLBd+oh2FbhJAAtCT9nOaApTZd
         wYePulw9zONMJLAyO6SW1KKKnYdR1LLNoAu4Ay7fJPtgK1iRJdqMSVDkrityxwY86W+5
         CdnQ==
X-Gm-Message-State: AOAM533aeeXn0wY2EireELSG2Jk4WhbCBPhrRVoJWE5sTqNXZ+rnnd/u
	EYw92fHkpOk6lcyoBMBjkvPp5KMyzKqTYrvzUTw=
X-Google-Smtp-Source: ABdhPJzbMPfKsiNwRsmJ6wf35o+bM3Vsllxj/xaKs1Zg3gEKi2+LtrBilr6TwQqyx2Jk+YbMtx83ULLwDM5rxvcqh8o=
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr7349833pls.17.1630047548297; Thu, 26 Aug
 2021 23:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org> <20210624155526.2775863-11-tientzu@chromium.org>
In-Reply-To: <20210624155526.2775863-11-tientzu@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Aug 2021 09:58:32 +0300
Message-ID: <CAHp75VfVhVGFEQGeUKajrUKmkx_et_KakDDgroC2BrMMhd62yg@mail.gmail.com>
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org, 
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk, 
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	jxgao@google.com, joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
	thomas.lendacky@amd.com, quic_qiancai@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 6:59 PM Claire Chang <tientzu@chromium.org> wrote:
>
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.
>
> Regardless of swiotlb setting, the restricted DMA pool is preferred if
> available.
>
> The restricted DMA pools provide a basic level of protection against the
> DMA overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system
> needs to provide a way to lock down the memory access, e.g., MPU.





> +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> +                                   struct device *dev)
> +{
> +       struct io_tlb_mem *mem =3D rmem->priv;
> +       unsigned long nslabs =3D rmem->size >> IO_TLB_SHIFT;
> +
> +       /*
> +        * Since multiple devices can share the same pool, the private da=
ta,
> +        * io_tlb_mem struct, will be initialized by the first device att=
ached
> +        * to it.
> +        */

> +       if (!mem) {

Can it be rather

if (mem)
  goto out_assign;

or so?

> +               mem =3D kzalloc(struct_size(mem, slots, nslabs), GFP_KERN=
EL);
> +               if (!mem)
> +                       return -ENOMEM;
> +
> +               set_memory_decrypted((unsigned long)phys_to_virt(rmem->ba=
se),
> +                                    rmem->size >> PAGE_SHIFT);

Below you are using a macro from pfn.h, but not here, I think it's PFN_DOWN=
().

> +               swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> +               mem->force_bounce =3D true;
> +               mem->for_alloc =3D true;
> +
> +               rmem->priv =3D mem;
> +
> +               if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> +                       mem->debugfs =3D
> +                               debugfs_create_dir(rmem->name, debugfs_di=
r);
> +                       swiotlb_create_debugfs_files(mem);
> +               }
> +       }
> +
> +       dev->dma_io_tlb_mem =3D mem;
> +
> +       return 0;
> +}
> +
> +static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
> +                                       struct device *dev)
> +{
> +       dev->dma_io_tlb_mem =3D io_tlb_default_mem;
> +}
> +
> +static const struct reserved_mem_ops rmem_swiotlb_ops =3D {
> +       .device_init =3D rmem_swiotlb_device_init,
> +       .device_release =3D rmem_swiotlb_device_release,
> +};
> +
> +static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
> +{
> +       unsigned long node =3D rmem->fdt_node;
> +
> +       if (of_get_flat_dt_prop(node, "reusable", NULL) ||
> +           of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
> +           of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
> +           of_get_flat_dt_prop(node, "no-map", NULL))
> +               return -EINVAL;
> +
> +       if (PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> +               pr_err("Restricted DMA pool must be accessible within the=
 linear mapping.");
> +               return -EINVAL;
> +       }
> +
> +       rmem->ops =3D &rmem_swiotlb_ops;
> +       pr_info("Reserved memory: created restricted DMA pool at %pa, siz=
e %ld MiB\n",
> +               &rmem->base, (unsigned long)rmem->size / SZ_1M);

Oh l=C3=A0 l=C3=A0, besides explicit casting that I believe can be avoided,=
 %ld
!=3D unsigned long. Can you check the printk-formats.rst document?

> +       return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
>  #endif /* CONFIG_DMA_RESTRICTED_POOL */

--=20
With Best Regards,
Andy Shevchenko

