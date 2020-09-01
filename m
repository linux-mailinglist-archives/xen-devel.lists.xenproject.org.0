Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F082E258AD3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 10:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD24M-0004Jb-Tn; Tue, 01 Sep 2020 08:55:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yLE+=CK=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kD24K-0004JW-MO
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 08:55:08 +0000
X-Inumbo-ID: d6cfda10-92d5-4a1b-884e-6258cbf3b7c6
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6cfda10-92d5-4a1b-884e-6258cbf3b7c6;
 Tue, 01 Sep 2020 08:55:07 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id w3so516782ilh.5
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2020 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d8u+bBUivnnRT/2GGOxyKpzT/GBIGvxJ27fiHGNX228=;
 b=UvpjWhd8G2kPgF5D5eQHLAN6JpOZhfKgykyurIFmDoV5ERgF9W0Ckwc3WYHkEKzYSQ
 vkCVslyOGmN71UBW9T4z16Ci5K1Vw0zdUpw1LLx8r5VFk1jwLvDiYSEORzkqIghaDEzo
 mKYNXmdw3bfEDX4ohV74UZavc3L1fAiDefptKicpEtAhJaMUfSjppTikmIgXNUk4Ymw9
 JG5JL9Zss7KqLUc4dzuyblarmK9DDR7m3DmC8m8mWncTWlXfUiXe7RRAuWRjfWWH2DJ+
 Va+YzOioYSc6Bu3sNbAJQmYTMI3GjnxUwr2tNYdYkIjbEqt9DEC8T2NxxoJU5o6H2zxP
 dlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d8u+bBUivnnRT/2GGOxyKpzT/GBIGvxJ27fiHGNX228=;
 b=al6gAn/kSti3KCR2fP9zBDfbdYV+AzGVDmIEp5zUVogHW0BbTAJV0PwjZIMrgC910K
 uGuvbHml9xLe77aL0PW2F+n2HdL33A2J9tPmk7QrhlwZvOrq3/UGpIV6GT+2IGOpuz9Y
 SSI+8ydbbPR5kVUAWjNwkBnSugyVGKZ16l04boekZ6jwiJMmQqzyq+eKLuqaNF8baRco
 Ee6/AWtU1CjFQShrVcGFPnIH2DcMd15ykATsQv0huDcgbU3O/JziCr9AXCB/l5c0HUir
 aPwBpZQeWxBf3b9kzzgllA/wR1ZW7hpvbzTQ0da/LcplANb0o0Eqr3gwaCATZl9ETfea
 V4vQ==
X-Gm-Message-State: AOAM530spVRT8bjOcBsY5EXvyezLqn6D1fXTm1gvg+8CA1N0++dq+Uxl
 YiW44lsdR6rRfl/W5NFwRaeCebe3U96Y/IiOvkM=
X-Google-Smtp-Source: ABdhPJwp0CAa160ULiz0kc7ScfoUoQdYdKQDFLFkpfbxOti5zA88kx8eDPHqu5jG5O/5yyV9mb4YsNBcg7CWHvoBz2Q=
X-Received: by 2002:a92:444c:: with SMTP id a12mr419956ilm.143.1598950507394; 
 Tue, 01 Sep 2020 01:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-3-roger.pau@citrix.com>
In-Reply-To: <20200901083326.21264-3-roger.pau@citrix.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 1 Sep 2020 10:54:56 +0200
Message-ID: <CAM9Jb+g3=CbEC1QqdZj6ZqXZ78JsnrjPPV6+ATw7ewSCfa3b4w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 "Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
 Johannes Thumshirn <jthumshirn@suse.de>,
 Logan Gunthorpe" <logang@deltatee.com>, Juergen Gross <jgross@suse.com>, 
 linux-nvdimm <linux-nvdimm@lists.01.org>, xen-devel@lists.xenproject.org, 
 Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
> being used by non DAX devices.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Johannes Thumshirn <jthumshirn@suse.de>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: linux-nvdimm@lists.01.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-mm@kvack.org
> ---
>  drivers/dax/device.c     | 2 +-
>  include/linux/memremap.h | 9 ++++-----
>  mm/memremap.c            | 2 +-
>  3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index 4c0af2eb7e19..1e89513f3c59 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -429,7 +429,7 @@ int dev_dax_probe(struct device *dev)
>                 return -EBUSY;
>         }
>
> -       dev_dax->pgmap.type =3D MEMORY_DEVICE_DEVDAX;
> +       dev_dax->pgmap.type =3D MEMORY_DEVICE_GENERIC;
>         addr =3D devm_memremap_pages(dev, &dev_dax->pgmap);
>         if (IS_ERR(addr))
>                 return PTR_ERR(addr);
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 5f5b2df06e61..e5862746751b 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -46,11 +46,10 @@ struct vmem_altmap {
>   * wakeup is used to coordinate physical address space management (ex:
>   * fs truncate/hole punch) vs pinned pages (ex: device dma).
>   *
> - * MEMORY_DEVICE_DEVDAX:
> + * MEMORY_DEVICE_GENERIC:
>   * Host memory that has similar access semantics as System RAM i.e. DMA
> - * coherent and supports page pinning. In contrast to
> - * MEMORY_DEVICE_FS_DAX, this memory is access via a device-dax
> - * character device.
> + * coherent and supports page pinning. This is for example used by DAX d=
evices
> + * that expose memory using a character device.
>   *
>   * MEMORY_DEVICE_PCI_P2PDMA:
>   * Device memory residing in a PCI BAR intended for use with Peer-to-Pee=
r
> @@ -60,7 +59,7 @@ enum memory_type {
>         /* 0 is reserved to catch uninitialized type fields */
>         MEMORY_DEVICE_PRIVATE =3D 1,
>         MEMORY_DEVICE_FS_DAX,
> -       MEMORY_DEVICE_DEVDAX,
> +       MEMORY_DEVICE_GENERIC,
>         MEMORY_DEVICE_PCI_P2PDMA,
>  };
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 03e38b7a38f1..006dace60b1a 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -216,7 +216,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int n=
id)
>                         return ERR_PTR(-EINVAL);
>                 }
>                 break;
> -       case MEMORY_DEVICE_DEVDAX:
> +       case MEMORY_DEVICE_GENERIC:
>                 need_devmap_managed =3D false;
>                 break;
>         case MEMORY_DEVICE_PCI_P2PDMA:

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

