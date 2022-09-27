Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E295EC626
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412674.656081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBcu-0005Q5-7e; Tue, 27 Sep 2022 14:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412674.656081; Tue, 27 Sep 2022 14:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBcu-0005OG-3u; Tue, 27 Sep 2022 14:32:00 +0000
Received: by outflank-mailman (input) for mailman id 412674;
 Tue, 27 Sep 2022 14:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdUW=Z6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1odBct-00058c-0B
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:31:59 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23f216da-3e71-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:31:57 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id y8so13460138edc.10
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 07:31:58 -0700 (PDT)
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
X-Inumbo-ID: 23f216da-3e71-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=00DvuJmWFLPLFHdJ5ZJ+TGf+5xWCHP9wfe9z49M2FpU=;
        b=vF6Gi35qrnfDePTtXu2iQlFSb9B64+6/0qq6HDEdBpKW2wciCLjFh59f386Pji87cn
         5RAPt5NFSL+N/tFvCddWau30INsn/4L3G7o4ItoVndU4cIHQYWtK7fxwbzxCsTUp/GT6
         lgFcp4J+GeHBrMk/Hb5+XjgEj92N8VXYmdElAlYpD6U/sLdTKxVuGCwe1BWMjQHEzH8X
         1j0vcM48UIiLs7lvh3NIh6pSbit44evq+W6MGbbAVoLnGSaykjDFkTSAvgZov9YygF37
         P3lDvwR4NqrJDylX9XWvcj5Mv4xNiNd8Z4YxsxBz7JVi6z+L2rW9tih9edGCj/k5vt2s
         6jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=00DvuJmWFLPLFHdJ5ZJ+TGf+5xWCHP9wfe9z49M2FpU=;
        b=tHM/KXGyuPfDzYW3IgTHED+HtM68spQwwtTcSN1HMteoklnnlHAITy4RwuZs2kmhAV
         yzh4O7cbwIt1tsUyI6+Z5oS4e5+8iyivwGf1eendIxggNuM+COVaf1CLqScwTzgmfZrG
         wlwEx6DrzQAbkUIcgeZqDdp3bhc+Ak7XdijU52XgDybqFtVbdty0Lb6G1PcgMs/uSAQ8
         U2fwkrnyzDa2b/c7Yep4nzrZpu9Q+pYHNeoFz2i0FHeTFw6YIVn0KwmBx6f7X43w0p+Y
         oxmz19jpmQ8AwLnGccfw8r5/lstmYvarY4wb6nuWFAyBwN2W+5/rEuOGySbbIOf1rqEb
         pPqA==
X-Gm-Message-State: ACrzQf1Irlu91hVTf8ODKBYuH+8jp+xUkHNe5k3TFtxs+X1Bxt1+biM/
	rI2a0Nu17uh1XJBa3G0Az43kDfzQJzSvycxfGIO1zw==
X-Google-Smtp-Source: AMsMyM4wUJ6LYBYgv1FWXqehgQuJ4PXMZKY5f4v6aOYxr0Wv8nQIt8BH6gy5U4+c+VqXBPwYZI5bDSt8/Jwz9ZGsteU=
X-Received: by 2002:a05:6402:2751:b0:443:d90a:43d4 with SMTP id
 z17-20020a056402275100b00443d90a43d4mr28379608edd.368.1664289117843; Tue, 27
 Sep 2022 07:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-13-carlo.nonato@minervasys.tech> <93471d92-bc61-56fd-5b52-413303d35da1@suse.com>
 <CAG+AhRVRQ9ey9NzsDo4Np+z0V=sX-uGYL_zLhJ9Z9zFb3v+Hkg@mail.gmail.com> <8ba1ede9-cd8c-01ec-939c-e0915d7c18b4@suse.com>
In-Reply-To: <8ba1ede9-cd8c-01ec-939c-e0915d7c18b4@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 27 Sep 2022 16:31:45 +0200
Message-ID: <CAG+AhRU4wn0B+Q-RJn3GS2MGvnagK+gEJ4woWkvA-JrHdJ_RTw@mail.gmail.com>
Subject: Re: [PATCH 12/12] xen/arm: add cache coloring support for Xen
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Mon, Sep 19, 2022 at 10:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.09.2022 18:07, Carlo Nonato wrote:
> > On Thu, Sep 15, 2022 at 3:25 PM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 26.08.2022 14:51, Carlo Nonato wrote:
> >>> @@ -218,6 +221,28 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
> >>>      return va;
> >>>  }
> >>>
> >>> +#ifdef CONFIG_CACHE_COLORING
> >>> +void * __vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
> >>> +                      unsigned int flags, enum vmap_region type)
> >>> +{
> >>> +    void *va = vm_alloc(nr, align, type);
> >>> +    unsigned long cur = (unsigned long)va;
> >>> +    paddr_t pa = mfn_to_maddr(*mfn);
> >>> +
> >>> +    for ( ; va && nr-- ; cur += PAGE_SIZE )
> >>> +    {
> >>> +        pa = next_xen_colored(pa);
> >>
> >> This may alter the address, yet the caller expects that the original
> >> address be mapped. I must be missing something?
> >
> > If the original address color is assigned to Xen, then next_xen_colored()
> > simply returns that address. If this isn't the case, then you're right: the
> > address changes to the correct, colored, one. The caller should expect
> > this behavior since this is the colored version of vmap, the one that takes
> > into account the Xen coloring configuration.
>
> That's (to me at least) very surprising behavior, and hence needs
> properly calling out in a code comment at the least.
>
> Personally I'm not convinced of having a function with this behavior,
> and instead I think the normal vmap() should do. As long as you're
> only allowing for order-0 allocations, that shouldn't be an issue
> anyway.

You mean creating an array of colored mfns (I mean with a colored machine
address) and passing it to vmap()? Am I understanding you correctly?
This is the only way I can see to use the original vmap() and respect
the coloring configuration at the same time. But isn't it a waste of time
and space to create this array?

> Jan

Thanks.

- Carlo Nonato

