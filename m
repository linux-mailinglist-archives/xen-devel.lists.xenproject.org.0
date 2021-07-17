Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34243CC20E
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jul 2021 10:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157848.290742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4frD-0007gx-Sk; Sat, 17 Jul 2021 08:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157848.290742; Sat, 17 Jul 2021 08:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4frD-0007eH-Ou; Sat, 17 Jul 2021 08:39:35 +0000
Received: by outflank-mailman (input) for mailman id 157848;
 Sat, 17 Jul 2021 08:39:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZD+=MJ=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1m4frC-0007eB-Ux
 for xen-devel@lists.xenproject.org; Sat, 17 Jul 2021 08:39:35 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e33a37c1-6687-48f5-87e7-9e916a47b639;
 Sat, 17 Jul 2021 08:39:33 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s17so6746664ljo.12
 for <xen-devel@lists.xenproject.org>; Sat, 17 Jul 2021 01:39:33 -0700 (PDT)
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
X-Inumbo-ID: e33a37c1-6687-48f5-87e7-9e916a47b639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L/Ph4KXH21cp1cKWqCha4JghboKhxeBssRdrgGEsZ/g=;
        b=NFuCS2VLQWPpHzhymx9nA39Hfr7bWiXg/IN9dUX+ZiJ4zU2AcVuWqCxkeX430TJ57H
         F1HczOYd4Fqt5nMNvkujGGhZ7a6Yt3BzgJ1mEsDSK4dbswVO6I6ycwiRkB8dzw3WSNJ8
         i1Lde1EJD5oy0SXRCDwtPzqmdw4wC5iqWY4e7hE0pfb0jE8P23WSfRDoh2xfVw+UBYfX
         Q8n8aqRkqMrt3KEqKQ7EqoWuf8IbB/rBR7xbRSZYEZ0sclhldvqqcSUFMybD15jsW8j/
         N5oJ4eBNBJV278RQOPlJ8/CGf/Slr+xDsFLGv1Dg9aP4tg4SZ3aWwWKnci15i8i7VM+u
         rb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L/Ph4KXH21cp1cKWqCha4JghboKhxeBssRdrgGEsZ/g=;
        b=C9nRcduXcpHFD9YoiM4QcY7odw2+Dkx11xyG+xabutIHeF7kK0Mg0tFjIhBXWfBCcD
         2GAkpz+yVeNSFtNNOFYLhKMawYRFu0gQO5RfrLEIz2x06FPT7+5ZZDq9LtICbZPRo0Gv
         vZJrJqlcRcQwSihj8aqcBilhUng9g9aH8sY3AKVxzi8UqqvBWmf0jh8lhWnx+3f0GEIR
         qjuKzw2Qf5NLcvUWazt15/c1aazwfn2zo5REdFVsLJj65n35eBnFereMg37zSBFpYqiP
         qUj6ESQyYmHhsRi0IRXwTXVVkr5rmA6hI6/CU4G9OP/zgL/nIf4hQiadYl7aZqHypL3r
         4XTA==
X-Gm-Message-State: AOAM532inxvmcYq0XMGDCT4uh3y04dn7NU0vYqLVdDCA06bpr2ophA6D
	eQd0wskaWNv0FH7Co6bj/0nebXZCwe4t5iE5pxw=
X-Google-Smtp-Source: ABdhPJyeRjTAQ3mrnLTYgab+MKBgvatMXBQP3Edmgnib1kkC6/oA7N1ZXSWANCX4akcXxJ45BHA43lcfioCMHsjfSIU=
X-Received: by 2002:a2e:700f:: with SMTP id l15mr12600105ljc.149.1626511172469;
 Sat, 17 Jul 2021 01:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210715170011.GA17324@lst.de> <20210716083934.154992-1-rm.skakun@gmail.com>
 <20210716093551.GA17981@lst.de> <CADu_u-OYA+Z_y-DBLxyUYGhmLVMtLggmZ_SnRiEtw9EGrO4oGg@mail.gmail.com>
 <alpine.DEB.2.21.2107160828430.3916@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2107160828430.3916@sstabellini-ThinkPad-T480s>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Sat, 17 Jul 2021 11:39:21 +0300
Message-ID: <CADu_u-Psn5QpOyZ18_NCPx14DYxmGmSqVod=_RBC3A_A93tGUw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
To: Christoph Hellwig <hch@lst.de>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Andrii Anisov <andrii_anisov@epam.com>, 
	Roman Skakun <Roman_Skakun@epam.com>, Roman Skakun <rm.skakun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> We can merge this patch and create a new one for
> xen_swiotlb_free_coherent() later.
> Yeah, no worries, I didn't know that exposing dma_common_vaddr_to_page
> was problematic.
>
> This patch is fine by me.

Good. I'm agreed too. Waiting for Christoph.

=D0=BF=D1=82, 16 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 18:29, Stefano Sta=
bellini <sstabellini@kernel.org>:
>
> On Fri, 16 Jul 2021, Roman Skakun wrote:
> > > Technically this looks good.  But given that exposing a helper
> > > that does either vmalloc_to_page or virt_to_page is one of the
> > > never ending MM discussions I don't want to get into that discussion
> > > and just keep it local in the DMA code.
> > >
> > > Are you fine with me applying this version?
> >
> > Looks good to me, thanks!
> > But, Stefano asked me about using created helper in the
> > xen_swiotlb_free_coherent()
> > and I created a patch according to this mention.
> >
> > We can merge this patch and create a new one for
> > xen_swiotlb_free_coherent() later.
>
> Yeah, no worries, I didn't know that exposing dma_common_vaddr_to_page
> was problematic.
>
> This patch is fine by me.
>
>
> > =D0=BF=D1=82, 16 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 12:35, Christo=
ph Hellwig <hch@lst.de>:
> > >
> > > Technically this looks good.  But given that exposing a helper
> > > that does either vmalloc_to_page or virt_to_page is one of the
> > > never ending MM discussions I don't want to get into that discussion
> > > and just keep it local in the DMA code.
> > >
> > > Are you fine with me applying this version?
> > >
> > > ---
> > > From 40ac971eab89330d6153e7721e88acd2d98833f9 Mon Sep 17 00:00:00 200=
1
> > > From: Roman Skakun <Roman_Skakun@epam.com>
> > > Date: Fri, 16 Jul 2021 11:39:34 +0300
> > > Subject: dma-mapping: handle vmalloc addresses in
> > >  dma_common_{mmap,get_sgtable}
> > >
> > > xen-swiotlb can use vmalloc backed addresses for dma coherent allocat=
ions
> > > and uses the common helpers.  Properly handle them to unbreak Xen on
> > > ARM platforms.
> > >
> > > Fixes: 1b65c4e5a9af ("swiotlb-xen: use xen_alloc/free_coherent_pages"=
)
> > > Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> > > Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> > > [hch: split the patch, renamed the helpers]
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  kernel/dma/ops_helpers.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> > > index 910ae69cae77..af4a6ef48ce0 100644
> > > --- a/kernel/dma/ops_helpers.c
> > > +++ b/kernel/dma/ops_helpers.c
> > > @@ -5,6 +5,13 @@
> > >   */
> > >  #include <linux/dma-map-ops.h>
> > >
> > > +static struct page *dma_common_vaddr_to_page(void *cpu_addr)
> > > +{
> > > +       if (is_vmalloc_addr(cpu_addr))
> > > +               return vmalloc_to_page(cpu_addr);
> > > +       return virt_to_page(cpu_addr);
> > > +}
> > > +
> > >  /*
> > >   * Create scatter-list for the already allocated DMA buffer.
> > >   */
> > > @@ -12,7 +19,7 @@ int dma_common_get_sgtable(struct device *dev, stru=
ct sg_table *sgt,
> > >                  void *cpu_addr, dma_addr_t dma_addr, size_t size,
> > >                  unsigned long attrs)
> > >  {
> > > -       struct page *page =3D virt_to_page(cpu_addr);
> > > +       struct page *page =3D dma_common_vaddr_to_page(cpu_addr);
> > >         int ret;
> > >
> > >         ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > > @@ -32,6 +39,7 @@ int dma_common_mmap(struct device *dev, struct vm_a=
rea_struct *vma,
> > >         unsigned long user_count =3D vma_pages(vma);
> > >         unsigned long count =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
> > >         unsigned long off =3D vma->vm_pgoff;
> > > +       struct page *page =3D dma_common_vaddr_to_page(cpu_addr);
> > >         int ret =3D -ENXIO;
> > >
> > >         vma->vm_page_prot =3D dma_pgprot(dev, vma->vm_page_prot, attr=
s);
> > > @@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_a=
rea_struct *vma,
> > >                 return -ENXIO;
> > >
> > >         return remap_pfn_range(vma, vma->vm_start,
> > > -                       page_to_pfn(virt_to_page(cpu_addr)) + vma->vm=
_pgoff,
> > > +                       page_to_pfn(page) + vma->vm_pgoff,
> > >                         user_count << PAGE_SHIFT, vma->vm_page_prot);
> > >  #else
> > >         return -ENXIO;
> > > --
> > > 2.30.2
> > >
> >
> >
> > --
> > Best Regards, Roman.
> >



--=20
Best Regards, Roman.

