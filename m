Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3540C685
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187659.336602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQV6z-0003G6-DV; Wed, 15 Sep 2021 13:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187659.336602; Wed, 15 Sep 2021 13:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQV6z-0003Dv-A6; Wed, 15 Sep 2021 13:38:05 +0000
Received: by outflank-mailman (input) for mailman id 187659;
 Wed, 15 Sep 2021 13:38:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5Hw=OF=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1mQV6y-0003Dp-5X
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:38:04 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7037a1e5-4023-4357-8c25-e3976b7ea55e;
 Wed, 15 Sep 2021 13:38:03 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b18so4958555lfb.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Sep 2021 06:38:02 -0700 (PDT)
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
X-Inumbo-ID: 7037a1e5-4023-4357-8c25-e3976b7ea55e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=90+qKy1YudQ2sg99JcqAjO4XWW79ok13oTy+0jzPIvI=;
        b=pWJY3kidUzGHksDFRIpgQnf4vUWN1vgPE+o3cbP4wXlnippo7ZiDFotxHaC8MSXaBM
         vNBrYetAgN2CPPdEzmkQctsPVj8A3iaBtpri3qDtPhHZimSdqoxIXBwHRJRDZ9vLa9+l
         6IOMYqcz7bpn5ONSY+QYxShXmQzDkPGD/T6/5/G7BXQucNCmtwZedFKEyok2o+3RtKMT
         VYwk4lsdzuny2NPeElvxKJrkxvufY7mcR/p4HOMPjET8Cod2htJk0E0BgXmrdajk70T7
         2Y4F/c8Epyv0cRuYA92V37bdauX1teip9YtlFtwxREkMZ3NCMvlGEQnEq7M+z4J3naFs
         roXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=90+qKy1YudQ2sg99JcqAjO4XWW79ok13oTy+0jzPIvI=;
        b=g19nSvOmfZ38m8sCNhx2sRMPGaFu76JP2V5AAssnxgnDinlPATn/WUYFaATvrAFMX+
         fK234wM2Qi83Jce01hhV9Or4l2HUPj8v5HpNAuqqBGqLESp5SM2/JN3hcQuiR6BE3K6b
         QyYsPnxXlP6vfHyLu9n0i1aNzfPZvVcrDakA7Rn+/ECFibWPPosblvcQbCvF7Myl1mlF
         1oZbidlJC/wp83do9Ocqcg/GbrYThDYdkJVRNeHZQMCMlX/QdVHT+6Rg+4whbT117Jeg
         CG53YSOyipLHdTlDKe9+8Fl07pl+q2u0iPe8wkNaV70BsTgpJWtviHIpbwEfweFVubRx
         P4Yg==
X-Gm-Message-State: AOAM530JrdwJVzlkDUiCJb9YCiauTzP1IwIOyrF0i6bsVZhuz/ntBSdq
	ySTV5lhH2pAu89wVQMrU31mKH3Mpq3BsJ5uzr20=
X-Google-Smtp-Source: ABdhPJzbP5i7b7U9v8l9tinl5uV6Cg0SkKCsv8bPOpIyik8V6mpJ9yfrA9+wOAMT6A3UvlVyAreBHNtPKbPaFKDmJo4=
X-Received: by 2002:a19:491a:: with SMTP id w26mr17767806lfa.588.1631713081917;
 Wed, 15 Sep 2021 06:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com> <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
In-Reply-To: <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Wed, 15 Sep 2021 16:37:50 +0300
Message-ID: <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrii Anisov <andrii_anisov@epam.com>, Roman Skakun <roman_skakun@epam.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Muchun Song <songmuchun@bytedance.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Will Deacon <will@kernel.org>, xen-devel@lists.xenproject.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-doc@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, iommu <iommu@lists.linux-foundation.org>, 
	Roman Skakun <rm.skakun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Thanks for the answer.

>> From: Roman Skakun <roman_skakun@epam.com>
>>
>> It is possible when default IO TLB size is not
>> enough to fit a long buffers as described here [1].
>>
>> This patch makes a way to set this parameter
>> using cmdline instead of recompiling a kernel.
>>
>> [1] https://www.xilinx.com/support/answers/72694.html
>
>  I'm not convinced the swiotlb use describe there falls under "intended
>  use" - mapping a 1280x720 framebuffer in a single chunk?

I had the same issue while mapping DMA chuck ~4MB for gem fb when
using xen vdispl.
I got the next log:
[ 142.030421] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
3686400 bytes), total 32768 (slots), used 32 (slots)

It happened when I tried to map bounce buffer, which has a large size.
The default size if 128(IO_TLB_SEGSIZE) * 2048(IO_TLB_SHIFT) =3D 262144
bytes, but we requested 3686400 bytes.
When I change IO_TLB_SEGSIZE to 2048. (2048(IO_TLB_SEGSIZE)  *
2048(IO_TLB_SHIFT) =3D 4194304bytes).
It makes possible to retrieve a bounce buffer for requested size.
After changing this value, the problem is gone.

>  the bottom of this page is also confusing, as following "Then we can
>  confirm the modified swiotlb size in the boot log:" there is a log
>  fragment showing the same original size of 64Mb.

I suspect, this is a mistake in the article.
According to https://elixir.bootlin.com/linux/v5.14.4/source/kernel/dma/swi=
otlb.c#L214
and
https://elixir.bootlin.com/linux/v5.15-rc1/source/kernel/dma/swiotlb.c#L182
The IO_TLB_SEGSIZE is not used to calculate total size of swiotlb area.
This explains why we have the same total size before and after changing of
TLB segment size.

>  In order to be sure to catch all uses like this one (including ones
>  which make it upstream in parallel to yours), I think you will want
>  to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.

I don't understand your point. Can you clarify this?

>> +     /* get max IO TLB segment size */
>> +     if (isdigit(*str)) {
>> +             tmp =3D simple_strtoul(str, &str, 0);
>> +             if (tmp)
>> +                     io_tlb_seg_size =3D ALIGN(tmp, IO_TLB_SEGSIZE);
>
> From all I can tell io_tlb_seg_size wants to be a power of 2. Merely
> aligning to a multiple of IO_TLB_SEGSIZE isn't going to be enough.

Yes, right, thanks!

Cheers,
Roman.

=D0=B2=D1=82, 14 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 18:29, Jan B=
eulich <jbeulich@suse.com>:
>
> On 14.09.2021 17:10, Roman Skakun wrote:
> > From: Roman Skakun <roman_skakun@epam.com>
> >
> > It is possible when default IO TLB size is not
> > enough to fit a long buffers as described here [1].
> >
> > This patch makes a way to set this parameter
> > using cmdline instead of recompiling a kernel.
> >
> > [1] https://www.xilinx.com/support/answers/72694.html
>
> I'm not convinced the swiotlb use describe there falls under "intended
> use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
> the bottom of this page is also confusing, as following "Then we can
> confirm the modified swiotlb size in the boot log:" there is a log
> fragment showing the same original size of 64Mb.
>
> > --- a/arch/mips/cavium-octeon/dma-octeon.c
> > +++ b/arch/mips/cavium-octeon/dma-octeon.c
> > @@ -237,7 +237,7 @@ void __init plat_swiotlb_setup(void)
> >               swiotlbsize =3D 64 * (1<<20);
> >  #endif
> >       swiotlb_nslabs =3D swiotlbsize >> IO_TLB_SHIFT;
> > -     swiotlb_nslabs =3D ALIGN(swiotlb_nslabs, IO_TLB_SEGSIZE);
> > +     swiotlb_nslabs =3D ALIGN(swiotlb_nslabs, swiotlb_io_seg_size());
>
> In order to be sure to catch all uses like this one (including ones
> which make it upstream in parallel to yours), I think you will want
> to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.
>
> > @@ -81,15 +86,30 @@ static unsigned int max_segment;
> >  static unsigned long default_nslabs =3D IO_TLB_DEFAULT_SIZE >> IO_TLB_=
SHIFT;
> >
> >  static int __init
> > -setup_io_tlb_npages(char *str)
> > +setup_io_tlb_params(char *str)
> >  {
> > +     unsigned long tmp;
> > +
> >       if (isdigit(*str)) {
> > -             /* avoid tail segment of size < IO_TLB_SEGSIZE */
> > -             default_nslabs =3D
> > -                     ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZ=
E);
> > +             default_nslabs =3D simple_strtoul(str, &str, 0);
> >       }
> >       if (*str =3D=3D ',')
> >               ++str;
> > +
> > +     /* get max IO TLB segment size */
> > +     if (isdigit(*str)) {
> > +             tmp =3D simple_strtoul(str, &str, 0);
> > +             if (tmp)
> > +                     io_tlb_seg_size =3D ALIGN(tmp, IO_TLB_SEGSIZE);
>
> From all I can tell io_tlb_seg_size wants to be a power of 2. Merely
> aligning to a multiple of IO_TLB_SEGSIZE isn't going to be enough.
>
> Jan
>


--=20
Best Regards, Roman.

