Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BC3C99AC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 09:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156410.288587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3vqY-0007Nc-OH; Thu, 15 Jul 2021 07:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156410.288587; Thu, 15 Jul 2021 07:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3vqY-0007Ln-LG; Thu, 15 Jul 2021 07:31:50 +0000
Received: by outflank-mailman (input) for mailman id 156410;
 Thu, 15 Jul 2021 07:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ppgx=MH=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1m3vqX-0007Lh-1E
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 07:31:49 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b37d6901-970a-460e-bb4b-72e3eacbdba1;
 Thu, 15 Jul 2021 07:31:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a6so7397664ljq.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 00:31:47 -0700 (PDT)
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
X-Inumbo-ID: b37d6901-970a-460e-bb4b-72e3eacbdba1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K8osTs2DVP81bWLnJgqBO39HigXBsHyE99jXtdAy7Ck=;
        b=e4thDoip3So+zUGXVuZ3czCNeKnmxTKncBRIpcHknmPV8HmNATF4XWuTZzz9r2P7qj
         2EPDtObBuadoHf5lkQYiQGTjXgj9eU5PKQIwtzUmjGsNEhw2crz3FNvxzGWM36a5WFKL
         r/DC7AAvzNPsFJyaLu+Y1J3d35p96DpuLmFcLkMH4GUBDFLRaddIs+BL6WO7wkFx9wyn
         WSGHhacaCcXD8DaGVpauURNumQe/WfKvCWr7+TwOCCgTSFBzYsKuUuvDVsL39YKcsU3R
         yQIeO3QmLwxQ80Hj3WLoCcuTwEdJT+DIg4fUwqORrKuhRyP5VXsInrcgJrBaCU5wffBl
         1NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K8osTs2DVP81bWLnJgqBO39HigXBsHyE99jXtdAy7Ck=;
        b=tNqoaIpK7SVgn01J9JaR7zc9J9TH3mfRz1bHq2uYcTYlM+PdbpHrXekicUt5WxazMB
         KUGI3yohcvHZfXVcn1+spfIrSZT66ESUU0/oxBY90sfm1MqeboSbdFDGQe3fTPgPnUHy
         ChrABFhzGaspXgiKovb6/drIX1j4h2pg7KeTm3ampBb6s17gACuueMfsSmsguBSi5Eey
         OofmU6ol8JdlQj+Xb1iU+OXN3tmQkM0rdyrLMV0y6iKUBViTSVYIXKmpv7ODABldhrbW
         3g4voelxDNzaPayQVJXrCH+61x7WZQua86qhGQI7vtA1fTdBvEsIpx4UxDtbwp3LcedZ
         OHNg==
X-Gm-Message-State: AOAM533+4vLIADIfLc8QypPNUKmIiZw+yDS3rp4nG23NphKUEfYoDhPs
	drZGLBhjKu0/n1fe46c+0LV0MLpeeUYeHfuF5CE=
X-Google-Smtp-Source: ABdhPJzmxqtsUzwbzYkDtsTr2HSTMIkMdacfOEcefezuZ+ZE8STiIZEEO5Kf66+xThd7iXoX0lnDercSzytDWl7FGJY=
X-Received: by 2002:a05:651c:1587:: with SMTP id h7mr2639334ljq.285.1626334306805;
 Thu, 15 Jul 2021 00:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210616154436.GA7619@lst.de> <20210622133414.132754-1-rm.skakun@gmail.com>
 <alpine.DEB.2.21.2107131822040.23286@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2107131822040.23286@sstabellini-ThinkPad-T480s>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Thu, 15 Jul 2021 10:31:36 +0300
Message-ID: <CADu_u-MxpRVm92yL_d0mWS06KBv_dv6jJ+OHt8KdjsSup_0j5g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roman Skakun <roman_skakun@epam.com>, 
	Andrii Anisov <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Stefano!

> We have the same thing in xen_swiotlb_free_coherent. Can we find a way
> to call cpu_addr_to_page() from xen_swiotlb_free_coherent?
> Maybe we can make cpu_addr_to_page non-static?

Yes, right, If we want to reuse this helper instead of the same code
block in xen_swiotlb_free_coherent() need to make cpu_addr_to_page() as
global and add a new declaration for this helper in include/linux/dma-map-o=
ps.h.
What do you think?

Cheers!

=D1=81=D1=80, 14 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 04:23, Stefano Sta=
bellini <sstabellini@kernel.org>:
>
> On Tue, 22 Jun 2021, Roman Skakun wrote:
> > This commit is dedicated to fix incorrect conversion from
> > cpu_addr to page address in cases when we get virtual
> > address which allocated in the vmalloc range.
> > As the result, virt_to_page() cannot convert this address
> > properly and return incorrect page address.
> >
> > Need to detect such cases and obtains the page address using
> > vmalloc_to_page() instead.
> >
> > Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> > Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> > ---
> > Hey!
> > Thanks for suggestions, Christoph!
> > I updated the patch according to your advice.
> > But, I'm so surprised because nobody catches this problem
> > in the common code before. It looks a bit strange as for me.
> >
> >
> >  kernel/dma/ops_helpers.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> > index 910ae69cae77..782728d8a393 100644
> > --- a/kernel/dma/ops_helpers.c
> > +++ b/kernel/dma/ops_helpers.c
> > @@ -5,6 +5,14 @@
> >   */
> >  #include <linux/dma-map-ops.h>
> >
> > +static struct page *cpu_addr_to_page(void *cpu_addr)
> > +{
> > +     if (is_vmalloc_addr(cpu_addr))
> > +             return vmalloc_to_page(cpu_addr);
> > +     else
> > +             return virt_to_page(cpu_addr);
> > +}
>
> We have the same thing in xen_swiotlb_free_coherent. Can we find a way
> to call cpu_addr_to_page() from xen_swiotlb_free_coherent? Maybe we can
> make cpu_addr_to_page non-static? No problem if it is too much trouble.
>
>
> >  /*
> >   * Create scatter-list for the already allocated DMA buffer.
> >   */
> > @@ -12,7 +20,7 @@ int dma_common_get_sgtable(struct device *dev, struct=
 sg_table *sgt,
> >                void *cpu_addr, dma_addr_t dma_addr, size_t size,
> >                unsigned long attrs)
> >  {
> > -     struct page *page =3D virt_to_page(cpu_addr);
> > +     struct page *page =3D cpu_addr_to_page(cpu_addr);
> >       int ret;
> >
> >       ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > @@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_are=
a_struct *vma,
> >               return -ENXIO;
> >
> >       return remap_pfn_range(vma, vma->vm_start,
> > -                     page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgo=
ff,
> > +                     page_to_pfn(cpu_addr_to_page(cpu_addr)) + vma->vm=
_pgoff,
> >                       user_count << PAGE_SHIFT, vma->vm_page_prot);
> >  #else
> >       return -ENXIO;
> > --
> > 2.25.1
> >



--=20
Best Regards, Roman.

